-- -----------------------------------------------------------------------------
-- ----- Sprint 6 --------------------------------------------------------------
-- -----------------------------------------------------------------------------

CREATE TABLE "rsj_reason"
    (
        "id" integer NOT NULL                       ,
        "label" character varying NOT NULL          ,
        CONSTRAINT "PK_RSJ_REASON" PRIMARY KEY ("id")
    )
;

CREATE TABLE "rsj_state"
    (
        "id" integer NOT NULL                      ,
        "label" character varying NOT NULL         ,
        CONSTRAINT "PK_RSJ_STATE" PRIMARY KEY ("id")
    )
;

CREATE TABLE "beneficiary_rsj"
    (
        "id" SERIAL NOT NULL                          ,
        "rsjBeginDate" date                           ,
        "rsjEndDate" date                             ,
        "stateId" integer NOT NULL                    ,
        "reasonId" integer                            ,
        "beneficiaryId" integer NOT NULL              ,
        CONSTRAINT "PK_BENEFICIARY_RSJ" PRIMARY KEY ("id")
    )
;

ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "UQ_BENEFICIARY_RSJ_BENEFICIARY" UNIQUE ("beneficiaryId");
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_STATE" FOREIGN KEY ("stateId") REFERENCES "rsj_state"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_REASON" FOREIGN KEY ("reasonId") REFERENCES "rsj_reason"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

insert into rsj_state ("id", "label")
values
    (1, 'En analyse'),
    (2, 'Droit ouvert (en attente de versement)'),
    (3, 'Droit ouvert (avec versement)'),
    (4, 'Droit ouvert (sans versement)'),
    (5, 'Clos'),
    (6, 'Refusé');

insert into rsj_reason ("id", "label")
values
    (1, 'Droits de tirage épuisés'),
    (2, '25 ans révolus'),
    (3, 'Déménagement'),
    (4, 'Décès');

-- -----------------------------------------------------------------------------
-- ----- Sprint 7 --------------------------------------------------------------
-- -----------------------------------------------------------------------------

CREATE TABLE "referent"
    (
        "id"                            SERIAL NOT NULL,
        "beginDateReferent"             date           ,
        "endDateReferent"               date           ,
        "userId"                        integer        ,
        CONSTRAINT "PK_REFERENT" PRIMARY KEY ("id")
    )
;

ALTER TABLE "beneficiary_rsj" ADD COLUMN "referentId" integer;

CREATE TABLE "beneficiary_rsj_referent_history"
    (
        "beneficiaryRsjId"      integer NOT NULL,
        "referentId"            integer NOT NULL,
        CONSTRAINT "PK_BENEFICIARY_RSJ_HISTORY" PRIMARY KEY ("beneficiaryRsjId", "referentId")
    )
;

ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_REFERENT" FOREIGN KEY ("referentId") REFERENCES "referent"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "referent" ADD CONSTRAINT "FK_REFERENT_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj_referent_history" ADD CONSTRAINT "FK_REFERENT_RSJ_REFERENT_HISTORY_REF" FOREIGN KEY ("referentId") REFERENCES "referent"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj_referent_history" ADD CONSTRAINT "FK_REFERENT_RSJ_REFERENT_HISTORY_RSJ" FOREIGN KEY ("beneficiaryRsjId") REFERENCES "beneficiary_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

CREATE OR REPLACE VIEW public.rsj_referent
 AS
 SELECT
    r."id",
    r."beginDateReferent",
    r."endDateReferent",
	r."userId",
	u."structureId",
    br."id" as "beneficiaryRsjId"
   FROM referent r
   LEFT JOIN beneficiary_rsj br ON r."id" = br."referentId"
   LEFT JOIN "user" u ON u."id" = r."userId"
   WHERE r."id" = br."referentId"
;

CREATE OR REPLACE VIEW public.rsj_referent_history
 AS
 SELECT
    brrh."referentId" as "id",
    r."beginDateReferent",
    r."endDateReferent",
	r."userId",
	u."structureId",
    brrh."beneficiaryRsjId"
   FROM beneficiary_rsj_referent_history brrh
   LEFT JOIN referent r ON r."id" = brrh."referentId"
   LEFT JOIN "user" u ON u."id" = r."userId"
;

-- INSERT INTO "clearance" VALUES ('CLR_VALIDATOR_RSJ', 'Validateur RSJ', 'CLR_CAT_VALIDATOR');
-- INSERT INTO "clearance_group" VALUES ('CLR_VALIDATOR_RSJ', 'DIRECTION+');

-- -----------------------------------------------------------------------------
-- ----- Sprint 8 --------------------------------------------------------------
-- -----------------------------------------------------------------------------

CREATE TABLE "rsj_payment_data"
    (
        "id"                             SERIAL NOT NULL,
        "beginDate"                      date NOT NULL             ,
        "endDate"                        date                      ,
        "holderFirstName"                character varying NOT NULL,
        "holderLastName"                 character varying NOT NULL,
        "bankName"                       character varying NOT NULL,
        "iban"                           character varying NOT NULL,
        "bic"                            character varying NOT NULL,
        "livretA"                        boolean NOT NULL,
        "ribId"                          integer NOT NULL,
        CONSTRAINT "PK_RSJ_PAYMENT_DATA" PRIMARY KEY ("id")
    )
;

ALTER TABLE "beneficiary_rsj" ADD COLUMN "paymentDataId" integer;
ALTER TABLE "document" ADD COLUMN "filedata" character varying;

INSERT INTO document_title values (27, 'Relevé d''identité bancaire');

CREATE TABLE "beneficiary_rsj_payment_data_history"
    (
        "beneficiaryRsjId"      integer NOT NULL,
        "rsjPaymentDataId"     integer NOT NULL,
        CONSTRAINT "PK_BENEFICIARY_RSJ_PAYMENT_DATA_HISTORY" PRIMARY KEY ("beneficiaryRsjId", "rsjPaymentDataId")
    )
;

ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_PAYMENT_DATA" FOREIGN KEY ("paymentDataId") REFERENCES "rsj_payment_data"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj_payment_data_history" ADD CONSTRAINT "FK_REFERENT_RSJ_PAYMENT_DATA_HISTORY_DATA" FOREIGN KEY ("rsjPaymentDataId") REFERENCES "rsj_payment_data"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj_payment_data_history" ADD CONSTRAINT "FK_REFERENT_RSJ_PAYMENT_DATA_HISTORY_RSJ" FOREIGN KEY ("beneficiaryRsjId") REFERENCES "beneficiary_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "rsj_payment_data" ADD CONSTRAINT "FK_RSJ_PAYMENT_DATA_DOCUMENT" FOREIGN KEY ("ribId") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- -----------------------------------------------------------------------------
-- ----- Sprint 9 --------------------------------------------------------------
-- -----------------------------------------------------------------------------

ALTER TABLE "document_title" ADD COLUMN "tag" character varying NOT NULL default 'parcours';
ALTER TABLE "document_title" ALTER COLUMN "tag" DROP DEFAULT;

INSERT INTO document_title values (28, 'Pièce d''identité', 'rsj');
INSERT INTO document_title values (29, 'Récépissé (pièce d''identité)', 'rsj');
INSERT INTO document_title values (30, 'Autre justificatif d''identité', 'rsj');
INSERT INTO document_title values (31, 'Récépissé (autre justificatif d''identité)', 'rsj');
INSERT INTO document_title values (32, 'Carte de résident ou titre de séjour', 'rsj');
INSERT INTO document_title values (33, 'Récépissé (renouvellement de titre de séjour)', 'rsj');
INSERT INTO document_title values (34, 'Rendez-vous préfecture', 'rsj');
INSERT INTO document_title values (35, 'Attestation d''hébergement', 'rsj');
INSERT INTO document_title values (36, 'Justificatif de domicile d''un tiers', 'rsj');
INSERT INTO document_title values (37, 'Justificatif de domicile', 'rsj');
INSERT INTO document_title values (38, 'Attestation CHRS', 'rsj');
INSERT INTO document_title values (39, 'Attestation de domiciliation', 'rsj');
INSERT INTO document_title values (40, 'Autre', 'rsj');
INSERT INTO document_title values (41, 'Attestation de Contrat Jeune Majeur', 'rsj');
INSERT INTO document_title values (42, 'Récépissé (Contrat Jeune Majeur)', 'rsj');

UPDATE "document_title" set "tag" = 'rsj' where "id" in(22, 23, 27);

ALTER TABLE "beneficiary_rsj" ADD COLUMN "nextPaymentId" integer;

CREATE TABLE "rsj_payment"
    (
        "id"                                    SERIAL NOT NULL,
        "paymentDataId"                         integer NOT NULL,
        "beneficiaryRsjId"                      integer NOT NULL,
        "stateDate"                             date NOT NULL,
        "stateId"                               integer NOT NULL,
        "amount"                                numeric NOT NULL,
        "paymentMonth"                          date NOT NULL,
        CONSTRAINT "PK_RSJ_PAYMENT_INFORMATION" PRIMARY KEY ("id")
    )
;

CREATE TABLE "rsj_next_payment"
    (
        "id"                                    SERIAL NOT NULL,
        "nextPayment"                           date,
        "nextAmount"                            numeric,
        "remainingPayment"                      integer NOT NULL,
        CONSTRAINT "PK_RSJ_PAYMENT"     PRIMARY KEY ("id")
    )
;

CREATE TABLE "rsj_payment_state"
    (
        "id"                                    SERIAL NOT NULL,
        "label"                                 character varying NOT NULL,
        CONSTRAINT "PK_RSJ_PAYMENT_STATE"       PRIMARY KEY ("id")
    )
;

INSERT INTO "rsj_payment_state" VALUES
    (1, 'Prévu'),
    (2, 'Réalisé'),
    (3, 'Erreur de paiement'),
    (4, 'Erreur de paiement traitée');

ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_NEXT_PAYMENT" FOREIGN KEY ("nextPaymentId") REFERENCES "rsj_next_payment"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "rsj_payment"  ADD CONSTRAINT "FK_RSJ_PAYMENT_PAYMENT_DATA" FOREIGN KEY ("paymentDataId") REFERENCES "rsj_payment_data"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "rsj_payment"  ADD CONSTRAINT "FK_RSJ_PAYMENT_STATE" FOREIGN KEY ("stateId") REFERENCES "rsj_payment_state"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "rsj_payment"  ADD CONSTRAINT "FK_RSJ_PAYMENT_BENEFICIARY_RSJ" FOREIGN KEY ("beneficiaryRsjId") REFERENCES "beneficiary_rsj"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE OR REPLACE VIEW public.document_parcours
 AS
 SELECT
    d."id",
    d."titleId",
    d."importDate",
	d."importedById",
	d."filename",
    d."beneficiaryId"
   FROM document d
   LEFT JOIN document_title dt ON dt."id" = d."titleId"
   where dt."tag" = 'parcours'
;

ALTER TABLE "instruction_rsj" ADD "surname" character varying,
    ADD "credentialType" character varying,
    ADD "credentialDocument1Id" integer,
    ADD "credentialDocumentDate1" date,
    ADD "credentialDocument2Id" integer,
    ADD "credentialDocumentDate2" date,
    ADD "credentialDocument3Id" integer,
    ADD "credentialDocumentDate3" date,
    ADD "residentialAddressId" integer,
    ADD "postalAddressId" integer,
    ADD "addressDocument1Id" integer,
    ADD "addressDocument2Id" integer;

ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_CRED_DOC_1" FOREIGN KEY ("credentialDocument1Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_CRED_DOC_2" FOREIGN KEY ("credentialDocument2Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_CRED_DOC_3" FOREIGN KEY ("credentialDocument3Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_RES_ADD" FOREIGN KEY ("residentialAddressId") REFERENCES "beneficiary_address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_POS_ADD" FOREIGN KEY ("postalAddressId") REFERENCES "beneficiary_address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_ADD_DOC_1" FOREIGN KEY ("addressDocument1Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_ADD_DOC_2" FOREIGN KEY ("addressDocument2Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE OR REPLACE FUNCTION updateInstructionRsj(OUT insert_rows int) AS $func$
DECLARE
    _ir "instruction_rsj"%rowtype;
BEGIN
    FOR _ir IN (select * from "instruction_rsj")
    LOOP
        INSERT INTO "beneficiary_address" (
            "address",
            "beginDate",
            "additionalAddress",
            "postalCode",
            "city",
            "qpvId",
            "residentialStatus")
        VALUES (
            _ir."address",
            _ir."beginDateAddress",
            _ir."additionalAddress",
            _ir."postalCode",
            _ir."city",
            _ir."qPVId",
            _ir."residentialStatus"
        );
        UPDATE "instruction_rsj" SET "residentialAddressId" = (SELECT MAX("id") FROM "beneficiary_address") WHERE "id" = _ir."id";
        INSERT INTO "beneficiary_address" (
            "address",
            "beginDate",
            "additionalAddress",
            "postalCode",
            "city")
        VALUES (
            _ir."address",
            _ir."beginDateAddress",
            _ir."additionalAddress",
            _ir."postalCode",
            _ir."city"
        );
        UPDATE "instruction_rsj" SET "postalAddressId" = (SELECT MAX("id") FROM "beneficiary_address") WHERE "id" = _ir."id";
		UPDATE "instruction_rsj" SET "surname" = "usualName" WHERE "id" = _ir."id";
    END LOOP;
    RETURN;
END
$func$
LANGUAGE 'plpgsql' ;

select updateInstructionRsj();

ALTER TABLE "instruction_rsj" ALTER COLUMN "surname" SET NOT NULL;
ALTER TABLE "instruction_rsj" ALTER COLUMN "residentialAddressId" SET NOT NULL;
ALTER TABLE "instruction_rsj" ALTER COLUMN "postalAddressId" SET NOT NULL;

DROP view rsj;
CREATE OR REPLACE VIEW rsj AS
SELECT
	i.id                ,
	i."instructionDate" ,
	i."directedByName"  ,
	i."noSupportCause"  ,
	i.age_year          ,
	i.age_month         ,
	CASE
		WHEN i.age_month > 0 THEN CONCAT(i.age_year,' ans', ' et ', i.age_month, ' mois')
		ELSE CONCAT(i.age_year,' ans')
	END AS age          ,
	i."birthDate"       ,
	i."familyQuotient"  ,
	i."otherIncomePrecision",
    (SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Professional' LIMIT 1) AS "incomeProfessional",
	(SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Replacement' LIMIT 1) AS "incomeReplacement",
	(SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Training' LIMIT 1) AS "incomeTraining",
	(SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='SocialSupport' LIMIT 1) AS "incomeSocialSupport",
	(SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Other' LIMIT 1) AS "incomeOther",
	(SELECT SUM(instruction_rsj_income."currentMonth") FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id) AS "incomeTotal",

	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Professional' LIMIT 1) AS "incomeNextMonthProfessional",
	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Replacement' LIMIT 1) AS "incomeNextMonthReplacement",
	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Training' LIMIT 1) AS "incomeNextMonthTraining",
	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='SocialSupport' LIMIT 1) AS "incomeNextMonthSocialSupport",
	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Other' LIMIT 1) AS "incomeNextMonthOther",
	(SELECT SUM(instruction_rsj_income."nextMonth") FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id) AS "incomeNextMonthTotal",
	i."socialCareInProgress",
	i."socialStructureName",
	i."aseService",
	i."aseServiceLyon",
	i."youngAdultContract",
	i."rsaSimulation",
	i."parentsOrPartnerOnRsa",
	i."complementaryHealth",
	i."givenUpCareInPast6Months",
	i."assignedDoctor",
	(SELECT ba."qpvId" FROM beneficiary_address ba LEFT JOIN instruction_rsj ir ON ir."residentialAddressId" = ba."id" WHERE ir.id = i.id) AS "qPVId",
	i."individualInternetAccess",
	i."connectedToTCLNetwork",
	i."leisureAccessInPast12Months",
	i."vacationInPast12Months",
	(SELECT ba."residentialStatus" FROM beneficiary_address ba LEFT JOIN instruction_rsj ir ON ir."residentialAddressId" = ba."id" WHERE ir.id = i.id) AS "residentialStatus",
	i."hostedFreeOfCharge",
	i."shelterRegistration",
	i."residentialSituationDuration",
	i."searchingForHousing",
    i."housingProcessStarted",
    i."housingProcessWithHelp",
    i."housingProcessWithHelpBy",
	i."peRegistration",
	i.rqth,
	i."localMission",
	i."beneficiaryId"
FROM
(SELECT
    instruction_rsj.id                                                                                  ,
    instruction_rsj."instructionDate"                                                                   ,
 	instruction_rsj."noSupportCause"																	,
    instruction_rsj."directedByName"                                                                    ,
    EXTRACT(MONTH FROM AGE(instruction_rsj."instructionDate", instruction_rsj."birthDate")) AS age_month,
 	EXTRACT(YEAR FROM AGE(instruction_rsj."instructionDate", instruction_rsj."birthDate")) AS age_year  ,
 	instruction_rsj."birthDate"                                                                         ,
 	instruction_rsj."familyQuotient",
 	instruction_rsj."otherIncomePrecision",
 	instruction_rsj."socialCareInProgress",
 	instruction_rsj."socialStructureName",
 	instruction_rsj."aseService",
	instruction_rsj."aseServiceLyon",
	instruction_rsj."youngAdultContract",
	instruction_rsj."rsaSimulation",
 	instruction_rsj."parentsOrPartnerOnRsa",
	instruction_rsj."complementaryHealth",
	instruction_rsj."givenUpCareInPast6Months",
	instruction_rsj."assignedDoctor",
	instruction_rsj."individualInternetAccess",
	instruction_rsj."connectedToTCLNetwork",
	instruction_rsj."leisureAccessInPast12Months",
	instruction_rsj."vacationInPast12Months",
	instruction_rsj."hostedFreeOfCharge",
	instruction_rsj."shelterRegistration",
	instruction_rsj."residentialSituationDuration",
    instruction_rsj."searchingForHousing",
    instruction_rsj."housingProcessStarted",
    instruction_rsj."housingProcessWithHelp",
    instruction_rsj."housingProcessWithHelpBy",
	instruction_rsj."peRegistration",
	instruction_rsj.rqth,
	instruction_rsj."localMission",
 	instruction_rsj."beneficiaryId"
FROM
    instruction_rsj) AS i
;

ALTER TABLE "instruction_rsj" DROP CONSTRAINT "FK_INSTRUCTION_RSJ_QPV";
ALTER TABLE "instruction_rsj" DROP COLUMN "beginDateAddress",
    DROP COLUMN "ccasDomiciliation",
    DROP COLUMN "qPVId",
    DROP COLUMN "residentialStatus",
    DROP COLUMN "secondName",
    DROP COLUMN "address",
    DROP COLUMN "additionalAddress",
    DROP COLUMN "city",
    DROP COLUMN "postalCode";
ALTER TABLE "instruction_rsj" ALTER COLUMN "sixMonthsResident" DROP NOT NULL;
ALTER TABLE "instruction_rsj" ALTER COLUMN "outOfEducationSystem" DROP NOT NULL;
ALTER TABLE "instruction_rsj" ALTER COLUMN "withoutSolidarityPlan" DROP NOT NULL;
ALTER TABLE "instruction_rsj" ALTER COLUMN "withoutYouthPlan" DROP NOT NULL;

-- -----------------------------------------------------------------------------
-- ----- Sprint 11 -------------------------------------------------------------
-- -----------------------------------------------------------------------------

DROP view rsj;

CREATE TABLE "instruction_rsj_non_renewal"
    (
        "id"                integer NOT NULL             ,
        "reason"            character varying NOT NULL   ,
        "detail"            character varying NOT NULL   ,
        CONSTRAINT "PK_INS_RSJ_NON_RENEWAL" PRIMARY KEY ("id")
    )
;

CREATE TABLE "instruction_rsj_use_title"
    (
        "id"                integer NOT NULL             ,
        "label"             character varying NOT NULL   ,
        CONSTRAINT "PK_INS_RSJ_USE_TITLE" PRIMARY KEY ("id")
    )
;

CREATE TABLE "instruction_rsj_other_document"
    (
        "instructionRsjId"  integer NOT NULL,
        "documentId"        integer NOT NULL,
        "comment"           character varying,
        CONSTRAINT "PK_INS_RSJ_OTHER_DOCUMENT" PRIMARY KEY ("instructionRsjId", "documentId")
    )
;

DROP TABLE "instruction_rsj_transport_mode";

ALTER TABLE "instruction_rsj" DROP CONSTRAINT "FK_INSTRUCTION_RSJ_DEGREE";

ALTER TABLE "instruction_rsj" ADD "nonRenewalId" integer,
    ADD "nonRenewalComment" character varying,
    ADD "underSupervision" boolean,
    ADD "supervisionDocument1Id" integer,
    ADD "supervisionDocument2Id" integer,
    ADD "partnerOnRsa" boolean,
    ADD "pregnancy" boolean,
    ADD "rsaSimulationComment" character varying,
    ADD "parentsOnRsa" boolean,
    ADD "taxDetachment" character varying,
    ADD "breakupComment" character varying,
    ADD "entrepreneur" character varying,
    ADD "paymentAmount" integer,
    ADD "paymentDuration" character varying,
    ADD "paymentOpinion" character varying,
    ADD "paymentComment" character varying,
    ADD "paymentCounterProposal" boolean,
    ADD "paymentCounterAmount" integer,
    ADD "paymentCounterDuration" character varying,
    ADD "paymentCounterComment" character varying,
    ADD "useTitleId" integer,
    ADD "useTitleComment" character varying;

ALTER TABLE "instruction_rsj" RENAME COLUMN "noSupportCause" TO "taxSituation";
ALTER TABLE "instruction_rsj" RENAME COLUMN "comment" TO "situationComment";

ALTER TABLE "instruction_rsj_situation" ADD "comment" character varying;

ALTER TABLE "instruction_rsj" DROP COLUMN "parentsOrPartnerOnRsa",
    DROP COLUMN "youngAdultContract",
    DROP COLUMN "assignedDoctor",
    DROP COLUMN "vacationInPast12Months",
    DROP COLUMN "degreeId",
    DROP COLUMN "highestDegree",
    DROP COLUMN "drivingLicense",
    DROP COLUMN "peRegistration",
    DROP COLUMN "rqth",
    DROP COLUMN "localMission";

ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_NON_RENEWAL" FOREIGN KEY ("nonRenewalId") REFERENCES "instruction_rsj_non_renewal"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_SUP_DOC_1" FOREIGN KEY ("supervisionDocument1Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_SUP_DOC_2" FOREIGN KEY ("supervisionDocument2Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_USE_TITLE" FOREIGN KEY ("useTitleId") REFERENCES "instruction_rsj_use_title"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "instruction_rsj_other_document" ADD CONSTRAINT "FK_INS_RSJ_OTHER_DOC_INS" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj_other_document" ADD CONSTRAINT "FK_INS_RSJ_OTHER_DOC_DOC" FOREIGN KEY ("documentId") REFERENCES "document"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

CREATE view rsj AS
SELECT
	i.id                ,
	i."instructionDate" ,
	i."directedByName"  ,
	i."taxSituation"  ,
	i.age_year          ,
	i.age_month         ,
	CASE
		WHEN i.age_month > 0 THEN CONCAT(i.age_year,' ans', ' et ', i.age_month, ' mois')
		ELSE CONCAT(i.age_year,' ans')
	END AS age          ,
	i."birthDate"       ,
	i."familyQuotient"  ,
	i."otherIncomePrecision",
    (SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Professional' LIMIT 1) AS "incomeProfessional",
	(SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Replacement' LIMIT 1) AS "incomeReplacement",
	(SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Training' LIMIT 1) AS "incomeTraining",
	(SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='SocialSupport' LIMIT 1) AS "incomeSocialSupport",
	(SELECT instruction_rsj_income."currentMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Other' LIMIT 1) AS "incomeOther",
	(SELECT SUM(instruction_rsj_income."currentMonth") FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id) AS "incomeTotal",

	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Professional' LIMIT 1) AS "incomeNextMonthProfessional",
	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Replacement' LIMIT 1) AS "incomeNextMonthReplacement",
	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Training' LIMIT 1) AS "incomeNextMonthTraining",
	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='SocialSupport' LIMIT 1) AS "incomeNextMonthSocialSupport",
	(SELECT instruction_rsj_income."nextMonth" FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id AND instruction_rsj_income.type='Other' LIMIT 1) AS "incomeNextMonthOther",
	(SELECT SUM(instruction_rsj_income."nextMonth") FROM instruction_rsj_income WHERE instruction_rsj_income."instructionRSJId" = i.id) AS "incomeNextMonthTotal",
	i."socialCareInProgress",
	i."socialStructureName",
	i."aseService",
	i."aseServiceLyon",
	i."rsaSimulation",
	i."complementaryHealth",
	i."givenUpCareInPast6Months",
	(SELECT ba."qpvId" FROM beneficiary_address ba LEFT JOIN instruction_rsj ir ON ir."residentialAddressId" = ba."id" WHERE ir.id = i.id) AS "qPVId",
	i."individualInternetAccess",
	i."connectedToTCLNetwork",
	i."leisureAccessInPast12Months",
	(SELECT ba."residentialStatus" FROM beneficiary_address ba LEFT JOIN instruction_rsj ir ON ir."residentialAddressId" = ba."id" WHERE ir.id = i.id) AS "residentialStatus",
	i."hostedFreeOfCharge",
	i."shelterRegistration",
	i."residentialSituationDuration",
	i."searchingForHousing",
    i."housingProcessStarted",
    i."housingProcessWithHelp",
    i."housingProcessWithHelpBy",
	i."beneficiaryId"
FROM
(SELECT
    instruction_rsj.id                                                                                  ,
    instruction_rsj."instructionDate"                                                                   ,
 	instruction_rsj."taxSituation"																	,
    instruction_rsj."directedByName"                                                                    ,
    EXTRACT(MONTH FROM AGE(instruction_rsj."instructionDate", instruction_rsj."birthDate")) AS age_month,
 	EXTRACT(YEAR FROM AGE(instruction_rsj."instructionDate", instruction_rsj."birthDate")) AS age_year  ,
 	instruction_rsj."birthDate"                                                                         ,
 	instruction_rsj."familyQuotient",
 	instruction_rsj."otherIncomePrecision",
 	instruction_rsj."socialCareInProgress",
 	instruction_rsj."socialStructureName",
 	instruction_rsj."aseService",
	instruction_rsj."aseServiceLyon",
	instruction_rsj."rsaSimulation",
	instruction_rsj."complementaryHealth",
	instruction_rsj."givenUpCareInPast6Months",
	instruction_rsj."individualInternetAccess",
	instruction_rsj."connectedToTCLNetwork",
	instruction_rsj."leisureAccessInPast12Months",
	instruction_rsj."hostedFreeOfCharge",
	instruction_rsj."shelterRegistration",
	instruction_rsj."residentialSituationDuration",
    instruction_rsj."searchingForHousing",
    instruction_rsj."housingProcessStarted",
    instruction_rsj."housingProcessWithHelp",
    instruction_rsj."housingProcessWithHelpBy",
 	instruction_rsj."beneficiaryId"
FROM
    instruction_rsj) AS i
;

INSERT INTO "instruction_rsj_non_renewal" VALUES (1, 'Aide sociale', 'CJM Contrat Jeune Majeur');
INSERT INTO "instruction_rsj_non_renewal" VALUES (2, 'Aide sociale', 'AAH Allocation Adulte Handicapé');
INSERT INTO "instruction_rsj_non_renewal" VALUES (3, 'Aide sociale', 'RSA Revenu  Solidarité Active');
INSERT INTO "instruction_rsj_non_renewal" VALUES (4, 'Aide sociale', 'Prime d''activité');
INSERT INTO "instruction_rsj_non_renewal" VALUES (5, 'Aide sociale', 'ARE Allocation Retour à l''Emploi');
INSERT INTO "instruction_rsj_non_renewal" VALUES (6, 'Aide sociale', 'Autres aides sociales (préciser)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (7, 'Dispositif avec allocation', 'CEJ contrat d''engagement Jeunes');
INSERT INTO "instruction_rsj_non_renewal" VALUES (8, 'Dispositif avec allocation', 'Service civique  / Service Européen');
INSERT INTO "instruction_rsj_non_renewal" VALUES (9, 'Dispositif avec allocation', 'E2C');
INSERT INTO "instruction_rsj_non_renewal" VALUES (10, 'Dispositif avec allocation', 'EPIDE');
INSERT INTO "instruction_rsj_non_renewal" VALUES (11, 'Dispositif avec allocation', 'Chantier jeune');
INSERT INTO "instruction_rsj_non_renewal" VALUES (12, 'Dispositif avec allocation', 'Autre dispositif avec allocation (préciser)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (13, 'Formation', 'Formation rémunérée - 6 mois  (dont Cared, POE, …)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (14, 'Formation', 'Formation rémunérée + 6 mois  (dont Cared, POE, …)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (15, 'Formation', 'Reprise d''études - formation initiale (statut étudiant)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (16, 'Formation', 'Autre situation de formation (préciser)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (17, 'Contrat rémunéré', 'PEC (CUI-CAE, CUI CIE)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (18, 'Contrat rémunéré', 'CDD d''Insertion (CDD I)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (19, 'Contrat rémunéré', 'Contrat d''alternance (contrat pro, contrat d''apprentissage)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (20, 'Contrat rémunéré', 'Intérim');
INSERT INTO "instruction_rsj_non_renewal" VALUES (21, 'Contrat rémunéré', 'CDD - 6 mois');
INSERT INTO "instruction_rsj_non_renewal" VALUES (22, 'Contrat rémunéré', 'CDD + 6 mois');
INSERT INTO "instruction_rsj_non_renewal" VALUES (23, 'Contrat rémunéré', 'CDI');
INSERT INTO "instruction_rsj_non_renewal" VALUES (24, 'Contrat rémunéré', 'Engagement dans l''armée');
INSERT INTO "instruction_rsj_non_renewal" VALUES (25, 'Contrat rémunéré', 'Création ou autoentrepreneur');
INSERT INTO "instruction_rsj_non_renewal" VALUES (26, 'Contrat rémunéré', 'Autre situation (préciser)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (27, 'Inéligible', 'Inéligible (document administratif)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (28, 'Inéligible', 'Inéligible (hors Métropole)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (29, 'Inéligible', 'Inéligible (ressources > 400€)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (30, 'Inéligible', 'Inéligible (critère CAF > 800)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (31, 'Inéligible', 'Inéligible (Eligible à un autre dispositif)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (32, 'Inéligible', 'Autre situation (préciser)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (33, 'Sans demande de renouvellement', 'Injoignable (plusieurs relances)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (34, 'Sans demande de renouvellement', 'Sans contact (n''a pas été contacté)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (35, 'Sans demande de renouvellement', 'Non-respect des engagements');
INSERT INTO "instruction_rsj_non_renewal" VALUES (36, 'Sans demande de renouvellement', 'Sans demande de renouvellement');
INSERT INTO "instruction_rsj_non_renewal" VALUES (37, 'Sans demande de renouvellement', 'Autre motif (préciser : absence RV, pb informatique, …)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (38, 'Sortis du dispositif', 'Age (+ 25 ans)');
INSERT INTO "instruction_rsj_non_renewal" VALUES (39, 'Sortis du dispositif', 'Décès');
INSERT INTO "instruction_rsj_non_renewal" VALUES (40, 'Sortis du dispositif', 'Déménagement définitif hors Métropole');
INSERT INTO "instruction_rsj_non_renewal" VALUES (41, 'Sortis du dispositif', 'Autre situation (préciser)');

INSERT INTO "instruction_rsj_use_title" VALUES (1, 'Mise à l''abri');
INSERT INTO "instruction_rsj_use_title" VALUES (2, 'Santé / soin / démarche');
INSERT INTO "instruction_rsj_use_title" VALUES (3, 'Définir le projet pro');
INSERT INTO "instruction_rsj_use_title" VALUES (4, 'Savoir de base');
INSERT INTO "instruction_rsj_use_title" VALUES (5, 'Projet formation / qualification');
INSERT INTO "instruction_rsj_use_title" VALUES (6, 'Poursuivre formation / étude');
INSERT INTO "instruction_rsj_use_title" VALUES (7, 'Recherche d''emploi');
INSERT INTO "instruction_rsj_use_title" VALUES (8, 'Recherche d''alternance');
INSERT INTO "instruction_rsj_use_title" VALUES (9, 'Recherche temps plein');
INSERT INTO "instruction_rsj_use_title" VALUES (10, 'Projet création d''activité');
INSERT INTO "instruction_rsj_use_title" VALUES (11, 'Vivre de son activité');
INSERT INTO "instruction_rsj_use_title" VALUES (12, 'Autre');

INSERT INTO "rsj_mobilized_plan" VALUES (14, 'CEJ');
INSERT INTO "rsj_situation" VALUES (23, 'CEJ');

-- -----------------------------------------------------------------------------
-- ----- Sprint 12 -------------------------------------------------------------
-- -----------------------------------------------------------------------------

insert into rsj_state ("id", "label") values (7, 'Non orienté');

-- -----------------------------------------------------------------------------
-- ----- Sprint 14 -------------------------------------------------------------
-- -----------------------------------------------------------------------------

ALTER TABLE "traceability" ADD COLUMN "instructionRsjId" integer;
ALTER TABLE "traceability" ADD CONSTRAINT "FK_TRACEABILITY_INS_RSJ" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE "instruction_rsj" ADD COLUMN "status" character varying;
ALTER TABLE "instruction_rsj" ADD COLUMN "statusDate" date;

UPDATE "instruction_rsj" SET "status" = 'En création', "statusDate" = "instructionDate";

ALTER TABLE "instruction_rsj" ALTER COLUMN "status" SET NOT NULL;
ALTER TABLE "instruction_rsj" ALTER COLUMN "statusDate" SET NOT NULL;

-- -----------------------------------------------------------------------------
-- ----- Sprint 16 -------------------------------------------------------------
-- -----------------------------------------------------------------------------

DELETE FROM "rsj_payment";
ALTER TABLE "rsj_payment" ADD "instructionRsjId" integer NOT NULL;
ALTER TABLE "rsj_payment" ADD CONSTRAINT "FK_RSJ_PAYMENT_INS_RSJ" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE "signature" ADD "instructionRsjId" integer;
ALTER TABLE "signature" ADD CONSTRAINT "FK_SIGNATURE_INS_RSJ" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE "instruction_rsj" ADD "structureSignatoryId" integer;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_USER_STRUCTURE" FOREIGN KEY ("structureSignatoryId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- -----------------------------------------------------------------------------
-- ----- Sprint 17 -------------------------------------------------------------
-- -----------------------------------------------------------------------------

UPDATE document_title SET "label" = 'Attestation de situation' WHERE "id" = 22;
INSERT INTO document_title values (43, 'Attestation RSJ', 'rsj');
INSERT INTO document_title values (44, 'Fin de droit (âge)', 'rsj');
INSERT INTO document_title values (45, 'Fin de droit (versement)', 'rsj');
INSERT INTO document_title values (46, 'Ouverture de droit', 'rsj');
INSERT INTO document_title values (47, 'Renouvellement après sortie', 'rsj');
INSERT INTO document_title values (48, 'Refus renouvellement', 'rsj');
INSERT INTO document_title values (49, 'Refus éligibilité', 'rsj');
INSERT INTO document_title values (50, 'Réponse suspension', 'rsj');

ALTER TABLE "beneficiary_rsj" ADD "remainingPayment" integer DEFAULT 24;
UPDATE "beneficiary_rsj" SET "remainingPayment" = (SELECT "remainingPayment" FROM "rsj_next_payment" WHERE "beneficiary_rsj"."nextPaymentId" = "rsj_next_payment"."id");
ALTER TABLE "beneficiary_rsj" DROP COLUMN "nextPaymentId";
DROP TABLE "rsj_next_payment";

ALTER TABLE "instruction_rsj" ADD "paymentDurationBis" integer;
ALTER TABLE "instruction_rsj" ADD "paymentCounterDurationBis" integer;
UPDATE "instruction_rsj" SET "paymentDurationBis" = 1 WHERE "paymentDuration" = '1 mois';
UPDATE "instruction_rsj" SET "paymentDurationBis" = 2 WHERE "paymentDuration" = '2 mois';
UPDATE "instruction_rsj" SET "paymentDurationBis" = 3 WHERE "paymentDuration" = '3 mois';
UPDATE "instruction_rsj" SET "paymentCounterDurationBis" = 1 WHERE "paymentCounterDuration" = '1 mois';
UPDATE "instruction_rsj" SET "paymentCounterDurationBis" = 2 WHERE "paymentCounterDuration" = '2 mois';
UPDATE "instruction_rsj" SET "paymentCounterDurationBis" = 3 WHERE "paymentCounterDuration" = '3 mois';
ALTER TABLE "instruction_rsj" DROP COLUMN "paymentDuration";
ALTER TABLE "instruction_rsj" DROP COLUMN "paymentCounterDuration";
ALTER TABLE "instruction_rsj" RENAME COLUMN "paymentDurationBis" TO "paymentDuration";
ALTER TABLE "instruction_rsj" RENAME COLUMN "paymentCounterDurationBis" TO "paymentCounterDuration";

-- -----------------------------------------------------------------------------
-- ----- Sprint 18 -------------------------------------------------------------
-- -----------------------------------------------------------------------------

INSERT INTO document_title values (51, 'Déclaration d''engagement', 'rsj');
INSERT INTO document_title values (52, 'Décision de jugement', 'rsj');
INSERT INTO document_title values (53, 'Autorisation tuteur / curateur', 'rsj');

UPDATE rsj_mobilized_plan SET "label" = 'Contrat d''Engagement Jeune' WHERE "id" = 14;
UPDATE rsj_situation SET "label" = 'Contrat d''Engagement Jeune' WHERE "id" = 23;
