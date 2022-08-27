CREATE OR REPLACE FUNCTION public.uuid_generate_v4(
	)
    RETURNS uuid
    LANGUAGE 'c'

    COST 1
    VOLATILE STRICT PARALLEL SAFE
AS '$libdir/uuid-ossp', 'uuid_generate_v4'
;

ALTER FUNCTION public.uuid_generate_v4()
    OWNER TO insertion;

CREATE TABLE "structure"
    (
        "id" SERIAL NOT NULL                                          ,
        "idIODAS"           character varying NOT NULL                ,
        "label"             character varying NOT NULL                ,
        "address"           character varying NOT NULL                ,
        "additionalAddress" character varying                         ,
        "postalCode"        character varying NOT NULL                ,
        "city"              character varying NOT NULL                ,
        "active"            boolean NOT NULL                          ,
        "phone"             character varying                         ,
        "SIRET"             character varying                         ,
        "logoId"            integer                                   ,
        "contactEmail"      character varying                         ,
        "website"           character varying                         ,
        "presentation"      character varying                         ,
        "geotag"            character varying                         ,
        CONSTRAINT "PK_STRUCTURE_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "support_history"
    (
        "id" SERIAL NOT NULL                 ,
        "beginDate"         date NOT NULL    ,
        "endDate"           date             ,
        "typeSupportDetail" character varying,
        "supportTypeId"     integer NOT NULL ,
        "beneficiaryId"     integer NOT NULL ,
        CONSTRAINT "PK_SUPPORT_HISTORY_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "orientation_history"
    (
        "id" SERIAL NOT NULL                       ,
        "beginDate"               date NOT NULL    ,
        "endDate"                 date             ,
        "reasonOrientationEnding" character varying,
        "structureId"             integer NOT NULL ,
        "beneficiaryId"           integer NOT NULL ,
        CONSTRAINT "PK_ORIENTATION_HISTORY_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "support_type"
    (
        "id"              integer NOT NULL ,
        "label" character varying NOT NULL ,
        CONSTRAINT "PK_SUPPORT_TYPE_ID" PRIMARY KEY ("id")
    )
;



CREATE TABLE "structure_to_area"
    (
        "cliId"        integer NOT NULL,
        "structureId"   integer NOT NULL ,
        "supportTypeId" integer NOT NULL ,
        "placesNumber"  integer NOT NULL ,
        CONSTRAINT "PK_STRUCTURE_TO_AREA" PRIMARY KEY ("cliId", "structureId", "supportTypeId")
    )
;

CREATE TABLE "cli"
    (
        "id"    integer NOT NULL          ,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_CLI" PRIMARY KEY ("id")
    )
;


CREATE TABLE "ctm"
    (
        "id"    integer NOT NULL          ,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_CTM" PRIMARY KEY ("id")
    )
;


CREATE TABLE "qpv"
    (
        "id" SERIAL NOT NULL                      ,
        "municipality" character varying NOT NULL ,
        "district"     character varying NOT NULL ,
        CONSTRAINT "PK_QPV_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "beneficiary_complement"
    (
        "id" SERIAL NOT NULL                 ,
        "childrenCount"           integer          ,
        "dependentsNumber"        integer          ,
        "healthInsuranceId"       integer          ,
        "rsaRightBeginDate"       date             ,
        "referentId"              integer          ,
        "beginDateReferent"       date             ,
        "endDateReferent"         date             ,
        "reasonOrientationEnding" character varying,
        "singleParent"            boolean          ,
        CONSTRAINT "PK_BENEFICIARY_COMPLEMENT_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "contract"
    (
        "id" SERIAL NOT NULL                          ,
        "beginDate"        date NOT NULL              ,
        "endDate"          date NOT NULL              ,
        "contractType"     character varying NOT NULL ,
        "mainPurpose"      character varying NOT NULL ,
        "project"          character varying          ,
        "actionsToPerform" character varying          ,
        "status"           character varying NOT NULL ,
        "achievement"      character varying          ,
        "statusDate"       date NOT NULL              ,
        "beneficiaryId"    integer NOT NULL           ,
        "structureSignatoryId"  integer               ,
        "directionSignatoryId"  integer               ,
        "structureId" integer                         ,
        "referentId"  integer                         ,
        "supportTypeId" integer                       ,
        CONSTRAINT "PK_CONTRACT_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "degree"
    (
        "id" integer NOT NULL             ,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_DEGREE_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "qualification_type"
    (
        "id" integer NOT NULL             ,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_QUALIFICATION_TYPE_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "employment_qualification_type"
    (
        "id" SERIAL NOT NULL                       ,
        "qualificationDate"       date NOT NULL    ,
        "qualificationTypeId"     integer NOT NULL ,
        "qualificationDesc"       character varying,
        "beneficiaryEmploymentId" integer NOT NULL ,
        CONSTRAINT "PK_EMPLOYMENT_QUALICATION_TYPE_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "barrier"
    (
        "id" integer NOT NULL             ,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_BARRIER" PRIMARY KEY ("id")
    )
;

CREATE TABLE "employment_barrier"
    (
        "id" SERIAL NOT NULL                                ,
        "description"             character varying         ,
        "barrierStatus"           character varying NOT NULL,
        "barrierId"               integer NOT NULL          ,
        "beneficiaryEmploymentId" integer NOT NULL          ,
        CONSTRAINT "PK_EMPLOYMENT_BARRIER_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "job"
    (
        "id" SERIAL NOT NULL              ,
        "label"    character varying NOT NULL,
        "codeRome" character varying,
        "domainId" integer,
        CONSTRAINT "PK_JOB_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "training_area"
    (
        "id" integer NOT NULL             ,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_TRAINING_AREA_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "transport_mode"
    (
        "id" SERIAL NOT NULL              ,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_TRANSPORT_MODE_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "employment_transport_mode"
    (
        "id" SERIAL NOT NULL                        ,
        "description"             character varying ,
        "transportModeId"         integer NOT NULL  ,
        "beneficiaryEmploymentId" integer NOT NULL  ,
        CONSTRAINT "PK_EMPLOYMENT_TRANSPORT_MODE_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "beneficiary_employment"
    (
        "id" SERIAL NOT NULL                                  ,
        "accreditationSIAE"         boolean NOT NULL          ,
        "accreditationSIAEDate"     date                      ,
        "rqth"                      boolean NOT NULL          ,
        "expiryRqthDate"            date                      ,
        "entrepreneur"              character varying NOT NULL,
        "beginDateEntrepreneurship" date                      ,
        "endDateEntrepreneurship"   date                      ,
        "sectorId"                  integer                   ,
        "degreeId"                  integer NOT NULL          ,
        "studyAbroad"               boolean NOT NULL          ,
        "wantedJobTypeId"           integer                   ,
        CONSTRAINT "PK_BENEFICIARY_EMPLOYMENT_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "asset"
    (
        "id"    integer NOT NULL          ,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_ASSET" PRIMARY KEY ("id")
    )
;

CREATE TABLE "employment_asset"
    (
        "id" SERIAL NOT NULL           ,
        "assetId"                 integer NOT NULL ,
        "description"             character varying,
        "beneficiaryEmploymentId" integer NOT NULL ,
        CONSTRAINT "PK_EMPLOYMENT_ASSET" PRIMARY KEY ("id")
    )
;

CREATE TABLE "job_type"
    (
        "id"    integer NOT NULL          ,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_JOB_TYPE" PRIMARY KEY ("id")
    )
;

CREATE TABLE "employment_training_area"
    (
        "beneficiaryEmploymentId" integer NOT NULL,
        "trainingAreaId"          integer NOT NULL,
        CONSTRAINT "PK_EMPLOYMENT_TRAINING_AREA" PRIMARY KEY ("beneficiaryEmploymentId", "trainingAreaId")
    )
;

CREATE TABLE "sector"
    (
        "id"    integer NOT NULL          ,
        "label" character varying NOT NULL,
        "codeRome" character varying,
        CONSTRAINT "PK_SECTOR_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "beneficiary"
    (
        "id" SERIAL NOT NULL                                                          ,
        "insertisId"               character varying NOT NULL                          ,
        "usualName"               character varying NOT NULL                          ,
        "surname"                 character varying                                   ,
        "firstName"               character varying NOT NULL                          ,
        "secondName"              character varying                                   ,
        "title"                   character varying NOT NULL                          ,
        "birthDate"               date                                                ,
        "nationality"             character varying NOT NULL                          ,
        "birthPostalCode"         character varying                                   ,
        "birthCity"               character varying                                   ,
        "jobCenterNumber"         character varying                                   ,
        "attachedOrganization"    character varying                                   ,
        "recipientNumber"         character varying                                   ,
        "landlineNumber"          character varying                                   ,
        "cellPhoneNumber"         character varying                                   ,
        "sms"                     boolean                                             ,
        "emailAddress"            character varying                                   ,
        "email"                   boolean                                             ,
        "beginDateSupport"        date NOT NULL                                       ,
        "lastUpdateDate"          date                                                ,
        "endDateSupport"          date                                                ,
        "typeSupportDetail"       character varying                                   ,
        "iodasNumber"             character varying                                   ,
        "idAbc"                   character varying                                   ,
        "status"                  character varying                                   ,
        "orientationBeginDate"    date                                                ,
        "orientationEndDate"      date                                                ,
        "maritalStatus"           character varying                                   ,
        "supportTypeId"           integer NOT NULL                                    ,
        "structureId"             integer                                             ,
        "beneficiaryComplementId" integer                                             ,
        "beneficiaryEmploymentId" integer                                             ,
        "residentialAddressId"    integer NOT NULL                                    ,
        "postalAddressId"         integer NOT NULL                                    ,
        CONSTRAINT "REL_BENEFICIARY_COMPLEMENT" UNIQUE ("beneficiaryComplementId")    ,
        CONSTRAINT "REL_BENEFICIARY_EMPLOYMENT" UNIQUE ("beneficiaryEmploymentId")    ,
        CONSTRAINT "PK_BENEFICIARY_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "stage_nature_type"
    (
        "id" SERIAL NOT NULL                                  ,
        "nature" character varying NOT NULL                   ,
        "type"   character varying NOT NULL                   ,
        "category" character varying NOT NULL DEFAULT 'Autres',
        CONSTRAINT "PK_STAGE_NATURE_TYPE_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "stage"
    (
        "id" SERIAL NOT NULL                          ,
        "label"                   character varying         ,
        "beginDate"               date NOT NULL             ,
        "endDate"                 date NOT NULL             ,
        "stageState"              character varying NOT NULL,
        "organization"            character varying         ,
        "comment"                 character varying         ,
        "reasonEndStage"          character varying         ,
        "beneficiaryId"           integer NOT NULL          ,
        "stageNatureTypeId"       integer NOT NULL          ,
        "structureId"             integer NOT NULL          ,
        "organizationStructureId" integer                   ,
        "enrolId"                 integer                   ,
        "duration"                integer                   ,
        "communityActionId"       integer                   ,
        CONSTRAINT "PK_STAGE_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "interview_theme"
    (
        "id" SERIAL NOT NULL               ,
        "label" character varying NOT NULL ,
        CONSTRAINT "PK_INTERVIEW_THEME_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "interview"
    (
        "id" SERIAL NOT NULL                            ,
        "interviewDate"      date NOT NULL              ,
        "beginTimeInterview" TIME NOT NULL              ,
        "endTimeInterview"   TIME                       ,
        "directedById"       integer ,
        "interviewType"      character varying          ,
        "presence"           character varying          ,
        "synthesis"          character varying          ,
        "note"               character varying          ,
        "beneficiaryId"      integer NOT NULL           ,
        "structureId"        integer NOT NULL           ,
        "interviewThemeId"   integer                    ,
        "addressId"          integer NOT NULL           ,
        CONSTRAINT "PK_INTERVIEW_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "agenda_event"
    (
        "id" SERIAL NOT NULL                       ,
        "title"         character varying          ,
        "date"          date NOT NULL              ,
        "beginTime"     TIME NOT NULL              ,
        "endTime"       TIME                       ,
        "eventType"     character varying NOT NULL ,
        "notes"         character varying          ,
        "userId"        integer NOT NULL ,
        "supportTypeId" integer NOT NULL           ,
        "convention"    boolean                    ,
        "interviewId"   integer                    ,
        "courseId"      integer                    ,
        CONSTRAINT "REL_AGENDA_EVENT_INTERVIEW" UNIQUE ("interviewId") ,
        CONSTRAINT "PK_AGENDA_EVENT_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "beneficiary_employment_jobs_job"
    (
        "beneficiaryEmploymentId" integer NOT NULL,
        "jobId"                   integer NOT NULL,
        CONSTRAINT "PK_BENEFICIARY_EMPLOYMENT_JOBS_JOB" PRIMARY KEY ("beneficiaryEmploymentId", "jobId")
    )
;

CREATE TABLE "document"
    (
        "id" SERIAL NOT NULL              ,
        "titleId"       integer NOT NULL          ,
        "importDate"    date NOT NULL             ,
        "importedById"  integer NOT NULL          ,
        "filename"      character varying NOT NULL,
        "filedata"      character varying         ,
        "beneficiaryId" integer NOT NULL          ,
        CONSTRAINT "PK_DOCUMENT" PRIMARY KEY ("id")
    )
;

CREATE TABLE "document_title"
    (
        "id" integer NOT NULL             ,
        "label" character varying NOT NULL,
        "tag"   character varying NOT NULL,
        CONSTRAINT "PK_DOCUMENT_TITLE" PRIMARY KEY ("id")
    )
;

CREATE TABLE "document_status"
    (
        "id"             character varying NOT NULL                     ,
        "documentId"     integer NOT NULL                               ,
        "deliveryStatus" character varying                              ,
        "deliveryResult" character varying                              ,
        "attempts"       integer NOT NULL DEFAULT 0                     ,
        "createdAt"      TIMESTAMP NOT NULL DEFAULT now()               ,
        CONSTRAINT "REL_DOCUMENT_STATUS_DOCUMENT" UNIQUE ("documentId") ,
        CONSTRAINT "PK_DOCUMENT_STATUS_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "user"
    (
        "id"          SERIAL NOT NULL    ,
        "email"       character varying NOT NULL    ,
        "name"        character varying NOT NULL    ,
        "firstname"   character varying NOT NULL    ,
        "lastname"    character varying NOT NULL    ,
        "structureId" integer                       ,
        "cliId"       integer                       ,
        "active"      boolean NOT NULL DEFAULT true ,
        "department"  boolean NOT NULL DEFAULT false,
        "passwordHash" character varying            ,
        "passwordSalt" character varying            ,
        "resetPasswordToken" character varying      ,
        "resetPasswordTokenExpiry" TIMESTAMP        ,
        CONSTRAINT "PK_USER" PRIMARY KEY ("id")
    )
;

CREATE TABLE "group"
    (
        "name"  character varying NOT NULL,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_GROUP" PRIMARY KEY ("name")
    )
;

CREATE TABLE "user_ctm"
    (
        "userId"    integer NOT NULL,
        "ctmId" integer NOT NULL,
        CONSTRAINT "PK_USER_CTM" PRIMARY KEY ("userId", "ctmId")
    )
;

CREATE TABLE "user_group"
    (
        "userId"    integer NOT NULL,
        "groupName" character varying NOT NULL,
        CONSTRAINT "PK_USER_GROUP" PRIMARY KEY ("userId", "groupName")
    )
;

CREATE TABLE "survey_fse"
    (
        "id"                      SERIAL NOT NULL           ,
        "beginDate"               date NOT NULL             ,
        "endDate"                 date NOT NULL             ,
        "directedById"            integer NOT NULL          ,
        "beneficiaryId"           integer NOT NULL          ,
        "structureOrganizationId" integer NOT NULL          ,
        "actionId"                integer                   ,
        "year"                    integer NOT NULL          ,
        "isAnnualMonitoring"      boolean NOT NULL          ,
        "exitQuestion1"           boolean                   ,
        "exitQuestion2"           character varying         ,
        "exitQuestion3"           character varying         ,
        "exitQuestion4"           character varying         ,
        "exitQuestion5"           character varying         ,
        "exitQuestion6"           character varying         ,
        "exitQuestion7"           character varying         ,
        "exitQuestion8"           character varying         ,
        "entryQuestion1"          character varying NOT NULL,
        "entryQuestion1e"         character varying         ,
        "entryQuestion1f"         character varying         ,
        "month"                   integer                   ,
        "entryQuestion2"          character varying NOT NULL,
        "entryQuestion3"          character varying NOT NULL,
        "entryQuestion4"          character varying NOT NULL,
        "entryQuestion5"          character varying NOT NULL,
        "entryQuestion6"          character varying NOT NULL,
        CONSTRAINT "PK_SURVEY_FSE" PRIMARY KEY ("id")
    )
;

CREATE TABLE "log"
    (
        "id" SERIAL NOT NULL                     ,
        "name"         character varying NOT NULL,
        "creationDate" TIMESTAMP NOT NULL        ,
        CONSTRAINT "PK_LOG" PRIMARY KEY ("id")
    )
;

CREATE TABLE "home"
    (
        "id" SERIAL NOT NULL                     ,
        "message"      character varying NOT NULL,
        CONSTRAINT "PK_HOME" PRIMARY KEY ("id")
    )
;


CREATE TABLE "town"
    (
        "codeInsee"    character varying NOT NULL,
        "denomination" character varying NOT NULL,
        "postalCode"   character varying NOT NULL,
        "ctmId"        integer                   ,
        CONSTRAINT "PK_TOWN" PRIMARY KEY ("codeInsee")
    )
;

CREATE TABLE "metropole_town"
    (
        "codeInsee"    character varying NOT NULL,
        "denomination" character varying NOT NULL,
        "postalCode"   character varying NOT NULL,
        "ctmId"        integer                   ,
        CONSTRAINT "PK_METROPOLE_TOWN" PRIMARY KEY ("codeInsee")
    )
;

CREATE TABLE "address"
    (
        "id"         integer NOT NULL          ,
        "main"       character varying NOT NULL,
        "complement" character varying         ,
        "postalCode" character varying NOT NULL,
        "city"       character varying NOT NULL,
        CONSTRAINT "PK_ADDRESS" PRIMARY KEY ("id")
    )
;

CREATE TABLE "logo"
    (
        "id"      SERIAL NOT NULL           ,
        "name"    character varying NOT NULL,
        "rawData" character varying NOT NULL,
        CONSTRAINT "PK_LOGO" PRIMARY KEY ("id")
    )
;

CREATE TABLE "community_action"
    (
        "id" SERIAL NOT NULL                                ,
        "structureId"       integer                         ,
        "stageNatureTypeId" integer NOT NULL                ,
        "coOrganizer"       character varying               ,
        "description"       character varying               ,
        "duration"          integer NOT NULL                ,
        "label"             character varying NOT NULL      ,
        "location"          character varying               ,
        "seatsNumber"       integer NOT NULL                ,
        "isDirection"       boolean NOT NULL DEFAULT false  ,
        "cliId"             integer                         ,
        "ctmId"             integer                         ,
        "creationDate"      TIMESTAMP NOT NULL DEFAULT now(),
        "organizationLabel" character varying NOT NULL      ,
        "isActif"           boolean NOT NULL DEFAULT true   ,
        "withSession"       boolean NOT NULL DEFAULT true   ,
        "targetedPublic"    character varying               ,
        "requirement"       character varying               ,
        "geotag"            character varying               ,
        "openAction"        boolean not null default false  ,
        CONSTRAINT "PK_COMMUNITY_ACTION" PRIMARY KEY ("id")
    )
;

CREATE TABLE "contract_ier"
    (
        "id" SERIAL NOT NULL                               ,
        "beginDate"             date NOT NULL              ,
        "endDate"               date NOT NULL              ,
        "contractType"          character varying NOT NULL ,
        "mainPurpose"           character varying NOT NULL ,
        "project"               character varying          ,
        "actionsToPerform"      character varying          ,
        "status"                character varying NOT NULL ,
        "achievement"           character varying          ,
        "statusDate"            date NOT NULL              ,
        "beneficiaryId"         integer NOT NULL           ,
        "structureSignatoryId"  integer                    ,
        "directionSignatoryId"  integer                    ,
        "structureId"           integer                    ,
        "referentId"            integer                    ,
        "supportTypeId"         integer                    ,
        CONSTRAINT "PK_CONTRACT_IER_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "children"
    (
        "id" SERIAL NOT NULL                 ,
        "childAge"        character varying NOT NULL,
        "childOccupation" character varying         ,
        "diagnosticId"    integer NOT NULL          ,
        CONSTRAINT "PK_CHILDREN_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "diagnostic_barrier"
    (
        "id" SERIAL NOT NULL                      ,
        "barrierStatus" character varying NOT NULL,
        "description"   character varying         ,
        "barrierId"     integer NOT NULL          ,
        "diagnosticId"  integer NOT NULL          ,
        CONSTRAINT "PK_DIAGNOSTIC_BARRIER" PRIMARY KEY ("id")
    )
;

CREATE TABLE "diagnostic_qualification_type"
    (
        "id" SERIAL NOT NULL                 ,
        "qualificationDate" date NOT NULL    ,
        "qualificationDesc" character varying,
        "diagnosticId"      integer NOT NULL ,
        CONSTRAINT "PK_DIAGNOSTIC_QUALIFICATION" PRIMARY KEY ("id")
    )
;

CREATE TABLE "formation"
    (
        "id" SERIAL NOT NULL             ,
        "trainingTitle"      character varying NOT NULL,
        "beginDateFormation" date                      ,
        "endDateFormation"   date                      ,
        "diagnosticId"       integer NOT NULL          ,
        CONSTRAINT "PK_FORMATION_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "diagnostic"
    (
        "id" SERIAL NOT NULL                         ,
        "beginDateOrientation"  date NOT NULL             ,
        "diagnosticStatus"      character varying NOT NULL,
        "statusDate"            date NOT NULL             ,
        "title"                 character varying NOT NULL,
        "usualName"             character varying NOT NULL,
        "firstName"             character varying NOT NULL,
        "birthDate"             date NOT NULL             ,
        "address"               character varying NOT NULL,
        "additionalAddress"     character varying         ,
        "postalCode"            character varying NOT NULL,
        "city"                  character varying NOT NULL,
        "residentialStatus"                  character varying         ,
        "residentialStatusComplement"        character varying         ,
        "maritalStatus"         character varying         ,
        "spouseAge"             character varying         ,
        "spouseOccupation"      character varying         ,
        "jobCenterRegistration" boolean NOT NULL          ,
        "RSA"                   boolean NOT NULL          ,
        "RQTH"                  boolean NOT NULL          ,
        "mission"               boolean                   ,
        "natureLastJob"         character varying         ,
        "beginDateLastJob"      date                      ,
        "endDateLastJob"        date                      ,
        "degreeId"              integer                   ,
        "highestDegree"         character varying         ,
        "drivingLicense"        boolean NOT NULL          ,
        "skills"                character varying         ,
        "structureId"           integer                   ,
        "referentId"            integer NOT NULL          ,
        "project"               character varying         ,
        "analysis1"             character varying         ,
        "analysis2"             character varying         ,
        "analysis3"             character varying         ,
        "analysis4"             character varying         ,
        "analysis5"             character varying         ,
        "analysis6"             character varying         ,
        "beneficiaryId"         integer NOT NULL          ,
        CONSTRAINT "PK_DIAGNOSTIC_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "course"
    (
        "id" SERIAL NOT NULL        ,
        "day" date NOT NULL         ,
        "beginTime" TIME NOT NULL   ,
        "endTime" TIME NOT NULL     ,
        "sessionId" integer NOT NULL,
        "eventId" integer NOT NULL  ,
        CONSTRAINT "PK_COURSE" PRIMARY KEY ("id")
    )
;

CREATE TABLE "session"
    (
        "id" SERIAL NOT NULL                  ,
        "communityActionId" integer NOT NULL  ,
        "refereeId" integer NOT NULL           ,
        "coReferee" character varying         ,
        "location" character varying NOT NULL ,
        "seatsNumber" integer NOT NULL        ,
        "extraInformation" character varying  ,
        "isIER" boolean NOT NULL DEFAULT false,
        "geotag" character varying            ,
        CONSTRAINT "PK_SESSION" PRIMARY KEY ("id")
    )
;

CREATE TABLE "enrol"
    (
        "id" SERIAL NOT NULL                          ,
        "sessionId" integer NOT NULL                  ,
        "beneficiaryId" integer NOT NULL              ,
        "stageId" integer                             ,
        "comment" character varying                   ,
        "referee" character varying NOT NULL          ,
        "status" character varying NOT NULL           ,
        "name" character varying NOT NULL             ,
        "firstname" character varying NOT NULL        ,
        "structureLabel" character varying NOT NULL   ,
        "supportType" character varying NOT NULL      ,
        CONSTRAINT "PK_ENROL" PRIMARY KEY ("id")
    )
;

CREATE TABLE "referent_history"
    (
        "id" SERIAL NOT NULL                  ,
        "beginDate"     date NOT NULL             ,
        "endDate"       date NOT NULL             ,
        "referentId"    integer NOT NULL,
        "structureId"   integer NOT NULL          ,
        "beneficiaryId" integer NOT NULL          ,
        CONSTRAINT "PK_REFERENT_HISTORY" PRIMARY KEY ("id")
    )
;

CREATE TABLE "user_address"
    (
        "id" SERIAL NOT NULL              ,
        "main" character varying NOT NULL      ,
        "complement" character varying         ,
        "postalCode" character varying NOT NULL,
        "city" character varying NOT NULL      ,
        "phone" character varying              ,
        "employeeType" character varying       ,
        "userId"    integer NOT NULL  ,
        CONSTRAINT "PK_USER_ADRESS" PRIMARY KEY ("id")
    )
;

CREATE TABLE "custom_query"
    (
        "id"        SERIAL NOT NULL                              ,
        "name"      character varying NOT NULL                   ,
        "query"     jsonb NOT NULL                               ,
        "userId"    integer NOT NULL                   ,
        "shared"    boolean NOT NULL DEFAULT false               ,
        CONSTRAINT "UQ_CUSTOM_QUERY" UNIQUE ("name", "userId"),
        CONSTRAINT "PK_CUSTOM_QUERY" PRIMARY KEY ("id")
    )
;

CREATE TABLE "instruction_rsj"
    (
        "id" SERIAL NOT NULL                                        ,
        "instructionDate"                 date NOT NULL             ,
        "directedByName"                  character varying NOT NULL,
        "directedById"                    integer                   ,
        "referentName"                    character varying NOT NULL,
        "structureLabel"                  character varying NOT NULL,
        "title"                           character varying NOT NULL,
        "surname"                         character varying NOT NULL,
        "usualName"                       character varying NOT NULL,
        "firstName"                       character varying NOT NULL,
        "birthDate"                       date NOT NULL             ,
        "nationality"                     character varying NOT NULL,
        "credentialType"                  character varying         ,
        "credentialDocument1Id"           integer                   ,
        "credentialDocumentDate1"         date                      ,
        "credentialDocument2Id"           integer                   ,
        "credentialDocumentDate2"         date                      ,
        "credentialDocument3Id"           integer                   ,
        "credentialDocumentDate3"         date                      ,
        "residentialAddressId"            integer NOT NULL          ,
        "postalAddressId"                 integer NOT NULL          ,
        "addressDocument1Id"              integer                   ,
        "addressDocument2Id"              integer                   ,
        "sixMonthsResident"               boolean                   ,
        "outOfEducationSystem"            boolean                   ,
        "taxSituation"                    character varying         ,
        "familyQuotient"                  integer                   ,
        "otherIncomePrecision"            character varying         ,
        "withoutSolidarityPlan"           boolean                   ,
        "withoutYouthPlan"                boolean                   ,
        "socialCareInProgress"            boolean                   ,
        "socialStructureName"             character varying         ,
        "aseService"                      boolean                   ,
        "aseServiceLyon"                  boolean                   ,
        "rsaSimulation"                   boolean                   ,
        "maritalStatus"                   character varying         ,
        "dependentsNumber"                integer                   ,
        "complementaryHealth"             boolean                   ,
        "givenUpCareInPast6Months"        boolean                   ,
        "individualInternetAccess"        boolean                   ,
        "connectedToTCLNetwork"           boolean                   ,
        "leisureAccessInPast12Months"     boolean                   ,
        "hostedFreeOfCharge"              boolean                   ,
        "decohabitationStatus"            character varying         ,
        "shelterRegistration"             boolean                   ,
        "residentialSituationDuration"    character varying         ,
        "searchingForHousing"             boolean                   ,
        "housingProcessStarted"           boolean                   ,
        "housingProcessWithHelp"          boolean                   ,
        "housingProcessWithHelpBy"        character varying         ,
        "structureAddress"                character varying NOT NULL,
        "structureAdditionalAddress"      character varying         ,
        "structurePostalCode"             character varying NOT NULL,
        "structureCity"                   character varying NOT NULL,
        "structurePhone"                  character varying         ,
        "referentPhone"                   character varying         ,
        "commitmentForNext3Months"        character varying         ,
        "assessment"                      character varying         ,
        "situationComment"                character varying         ,
        "beneficiaryId"                   integer                   ,
        "structureId"                     integer                   ,
        "healthInsuranceId"               integer                   ,
        "nonRenewalId"                    integer                   ,
        "nonRenewalComment"               character varying         ,
        "underSupervision"                boolean                   ,
        "supervisionDocument1Id"          integer                   ,
        "supervisionDocument2Id"          integer                   ,
        "partnerOnRsa"                    boolean                   ,
        "pregnancy"                       boolean                   ,
        "rsaSimulationComment"            character varying         ,
        "parentsOnRsa"                    boolean                   ,
        "taxDetachment"                   character varying         ,
        "breakupComment"                  character varying         ,
        "entrepreneur"                    character varying         ,
        "paymentAmount"                   integer                   ,
        "paymentDuration"                 character varying         ,
        "paymentOpinion"                  character varying         ,
        "paymentComment"                  character varying         ,
        "paymentCounterProposal"          boolean                   ,
        "paymentCounterAmount"            integer                   ,
        "paymentCounterDuration"          character varying         ,
        "paymentCounterComment"           character varying         ,
        "useTitleId"                      integer                   ,
        "useTitleComment"                 character varying         ,
        "status"                          character varying NOT NULL,
        "statusDate"                      date NOT NULL             ,
        CONSTRAINT "PK_INSTRUCTION_RSJ_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "instruction_rsj_income"
    (
        "id" SERIAL NOT NULL             ,
        "type"             character varying NOT NULL,
        "previousMonth"    integer NOT NULL          ,
        "currentMonth"     integer NOT NULL          ,
        "nextMonth"        integer NOT NULL          ,
        "nextTwoMonth"     integer NOT NULL          ,
        "nextThreeMonth"   integer NOT NULL          ,
        "instructionRSJId" integer                   ,
        CONSTRAINT "PK_INSTRUCTION_RSJ_INCOME_ID" PRIMARY KEY ("id")
    )
;

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

CREATE TABLE "health_insurance"
    (
        "id" integer NOT NULL             ,
        "label"             character varying NOT NULL,
        CONSTRAINT "PK_HEALTH_INSURANCE_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "rsj_situation"
    (
        "id" integer NOT NULL             ,
        "label"             character varying NOT NULL,
        CONSTRAINT "PK_RSJ_SITUATION_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "rsj_mobilized_plan"
    (
        "id" integer NOT NULL             ,
        "label"             character varying NOT NULL,
        CONSTRAINT "PK_RSJ_MOBILIZED_PLAN_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "instruction_rsj_situation"
    (
        "instructionRsjId" integer NOT NULL     ,
        "rsjSituationId"   integer NOT NULL     ,
        "comment"          character varying    ,
        CONSTRAINT "PK_INSTRUCTION_RSJ_ID_SITUATION_ID" PRIMARY KEY ("instructionRsjId", "rsjSituationId")
    )
;

CREATE TABLE "instruction_rsj_mobilized_plan"
    (
        "instructionRsjId"   integer NOT NULL,
        "rsjMobilizedPlanId" integer NOT NULL,
        CONSTRAINT "PK_INSTRUCTION_RSJ_ID_MOBILIZED_PLAN_ID" PRIMARY KEY ("instructionRsjId", "rsjMobilizedPlanId")
    )
;

CREATE TABLE "signature"
    (
        "id" uuid NOT NULL DEFAULT uuid_generate_v4()       ,
        "userId"        integer                             ,
        "signatureData" bytea NOT NULL                      ,
        "createdDate" TIMESTAMP NOT NULL DEFAULT now()      ,
        "updatedDate" TIMESTAMP NOT NULL DEFAULT now()      ,
        "contractId" integer                                ,
        "contractIerId" integer                             ,
        "instructionRsjId" integer                          ,
        CONSTRAINT "UQ_SIGNATURE_USER" UNIQUE ("userId"),
        CONSTRAINT "UQ_SIGNATURE_CONTRACT" UNIQUE ("contractId"),
        CONSTRAINT "UQ_SIGNATURE_CONTRACT_IER" UNIQUE ("contractIerId"),
        CONSTRAINT "UQ_SIGNATURE_INSTRUCTION_RSJ" UNIQUE ("instructionRsjId"),
        CONSTRAINT "PK_SIGNATURE" PRIMARY KEY ("id")
    )
;


CREATE TABLE "clearance_category"
    (
        "name"  character varying NOT NULL,
        "label" character varying NOT NULL,
        CONSTRAINT "PK_CLEARANCE_CATEGORY" PRIMARY KEY ("name")
    )
;

CREATE TABLE "clearance"
    (
        "name"         character varying NOT NULL,
        "label"        character varying NOT NULL,
        "categoryName" character varying NOT NULL,
        CONSTRAINT "PK_CLEARANCE" PRIMARY KEY ("name")
    )
;

CREATE TABLE "clearance_user"
    (
        "clearanceName" character varying NOT NULL,
        "userId"     integer NOT NULL,
        CONSTRAINT "PK_CLEARANCE_USER" PRIMARY KEY ("clearanceName", "userId")
    )
;

CREATE TABLE "clearance_group"
    (
        "clearanceName" character varying NOT NULL,
        "groupName"     character varying NOT NULL,
        CONSTRAINT "PK_CLEARANCE_GROUP" PRIMARY KEY ("clearanceName", "groupName")
    )
;

CREATE TABLE "access_token"
    (
        "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
        "userId" integer NOT NULL       ,
        "expires"   TIMESTAMP NOT NULL               ,
        "revoked"   boolean NOT NULL DEFAULT false   ,
        CONSTRAINT "PK_ACCESS_TOKEN" PRIMARY KEY ("id")
    )
;

CREATE TABLE "refresh_token"
    (
        "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
        "userId" integer NOT NULL       ,
        "expires"   TIMESTAMP NOT NULL               ,
        "revoked"   boolean NOT NULL DEFAULT false   ,
        CONSTRAINT "PK_REFRESH_TOKEN" PRIMARY KEY ("id")
    )
;

CREATE TABLE "traceability" (
    "id" SERIAL NOT NULL,
    "statusDate" date NOT NULL,
    "status" character varying NOT NULL,
    "comment" character varying,
    "performedBy" character varying,
    "contractId" integer,
    "contractIerId" integer,
    "instructionRsjId" integer,
    CONSTRAINT "PK_TRACEABILITY_ID" PRIMARY KEY ("id")
);

CREATE TABLE "dashboard_counter" (
	"id"     SERIAL NOT NULL           ,
	"date"   date NOT NULL             ,
    "time"   TIME NOT NULL             ,
	"user"   character varying NOT NULL,
	"profil" character varying NOT NULL,
	"type"   character varying NOT NULL,
	CONSTRAINT "PK_DASHBOARD_COUNTER" PRIMARY KEY ("id")
);

CREATE TABLE "user_notification"
    (
        "id" SERIAL NOT NULL                                              ,
        "userId"           integer NOT NULL                               ,
        "notificationDate" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
        "notificationType" integer NOT NULL                               ,
        "title"            character varying                              ,
        "message"          character varying NOT NULL                     ,
        CONSTRAINT "PK_USER_NOTIFICATION" PRIMARY KEY ("id")
    )
;

CREATE TABLE "domain"
(
    "id" SERIAL NOT NULL,
    "label" character varying NOT NULL,
    "codeRome" character varying,
    "sectorId" integer NOT NULL,
    CONSTRAINT "PK_DOMAIN" PRIMARY KEY ("id")
);

CREATE TABLE "focus_area"
    (
        "id"              integer NOT NULL ,
        "label" character varying NOT NULL ,
        CONSTRAINT "PK_FOCUS_AREA_ID" PRIMARY KEY ("id")
    )
;

CREATE TABLE "structure_focus_area"
    (
        "structureId" integer NOT NULL,
        "focusAreaId" integer NOT NULL,
        CONSTRAINT "PK_STRUCTURE_FOCUS_AREA" PRIMARY KEY ("structureId", "focusAreaId")
    )
;

CREATE TABLE "beneficiary_address"
    (
        "id"                            SERIAL NOT NULL                                     ,
        "address"                       character varying NOT NULL                          ,
        "beginDate"                     date NOT NULL                                       ,
        "endDate"                       date                                                ,
        "additionalAddress"             character varying                                   ,
        "postalCode"                    character varying NOT NULL                          ,
        "city"                          character varying NOT NULL                          ,
        "cliId"                         integer                                             ,
        "ctmId"                         integer                                             ,
        "qpvId"                         integer                                             ,
        "residentialStatus"             character varying                                   ,
        "residentialStatusComplement"   character varying                                   ,
        "domiciliationType"             character varying                                   ,
        "domiciliationTypeComplement"   character varying                                   ,
        CONSTRAINT "PK_BENEFICIARY_ADDRESS_ID" PRIMARY KEY ("id")
    )
;

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
        "referentId" integer                          ,
        "paymentDataId" integer                       ,
        "nextPaymentId" integer                ,
        CONSTRAINT "PK_BENEFICIARY_RSJ" PRIMARY KEY ("id")
    )
;

CREATE TABLE "beneficiary_residential_history"
    (
        "beneficiaryId"         integer NOT NULL,
        "beneficiaryAddressId"  integer NOT NULL,
        CONSTRAINT "PK_BENEFICIARY_RESIDENTIAL_HISTORY" PRIMARY KEY ("beneficiaryId", "beneficiaryAddressId")
    )
;

CREATE TABLE "beneficiary_postal_history"
    (
        "beneficiaryId"         integer NOT NULL,
        "beneficiaryAddressId"  integer NOT NULL,
        CONSTRAINT "PK_BENEFICIARY_POSTAL_HISTORY" PRIMARY KEY ("beneficiaryId", "beneficiaryAddressId")
    )
;

CREATE TABLE "referent"
    (
        "id"                            SERIAL NOT NULL ,
        "beginDateReferent"             date            ,
        "endDateReferent"               date            ,
        "userId"                    integer         ,
        CONSTRAINT "PK_REFERENT" PRIMARY KEY ("id")
    )
;

CREATE TABLE "beneficiary_rsj_referent_history"
    (
        "beneficiaryRsjId"      integer NOT NULL,
        "referentId"  integer NOT NULL,
        CONSTRAINT "PK_BENEFICIARY_RSJ_HISTORY" PRIMARY KEY ("beneficiaryRsjId", "referentId")
    )
;

CREATE TABLE "rsj_payment"
    (
        "id"                                    SERIAL NOT NULL,
        "paymentDataId"                         integer NOT NULL,
        "beneficiaryRsjId"                      integer NOT NULL,
        "instructionRsjId"                      integer NOT NULL,
        "stateDate"                             date NOT NULL,
        "stateId"                               integer NOT NULL,
        "amount"                                numeric NOT NULL,
        "paymentMonth"                          date NOT NULL,
        CONSTRAINT "PK_RSJ_PAYMENT" PRIMARY KEY ("id")
    )
;

CREATE TABLE "rsj_next_payment"
    (
        "id"                                    SERIAL NOT NULL,
        "nextPayment"                           date,
        "nextAmount"                            numeric,
        "remainingPayment"                      integer NOT NULL,
        CONSTRAINT "PK_RSJ_NEXT_PAYMENT"             PRIMARY KEY ("id")
    )
;

CREATE TABLE "rsj_payment_state"
    (
        "id"                                    SERIAL NOT NULL,
        "label"                                 character varying NOT NULL,
        CONSTRAINT "PK_RSJ_PAYMENT_STATE"       PRIMARY KEY ("id")
    )
;

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

CREATE TABLE "beneficiary_rsj_payment_data_history"
    (
        "beneficiaryRsjId"      integer NOT NULL,
        "rsjPaymentDataId"     integer NOT NULL,
        CONSTRAINT "PK_BENEFICIARY_RSJ_PAYMENT_DATA_HISTORY" PRIMARY KEY ("beneficiaryRsjId", "rsjPaymentDataId")
    )
;

CREATE INDEX "IDX_BENEFICIARY_EMPLOYMENT" ON "beneficiary_employment_jobs_job" ("beneficiaryEmploymentId");
CREATE INDEX "IDX_JOB" ON "beneficiary_employment_jobs_job" ("jobId");
CREATE UNIQUE INDEX "IDX_CLI_LABEL" ON "cli" ("label");
CREATE UNIQUE INDEX "IDX_CTM_LABEL" ON "ctm" ("label");
CREATE INDEX "IDX_USER_CTM_USER" ON "user_ctm" ("userId");
CREATE INDEX "IDX_USER_CTM_CTMID" ON "user_ctm" ("ctmId");
CREATE INDEX "IDX_USER_GROUP_USER" ON "user_group" ("userId");
CREATE INDEX "IDX_USER_GROUP_GROUPNAME" ON "user_group" ("groupName");
CREATE UNIQUE INDEX "IDX_INSERTIS_ID" ON "beneficiary" ("insertisId");
CREATE INDEX "IDX_INSTRUCTION_RSJ_SITUATION_INS" ON "instruction_rsj_situation" ("instructionRsjId");
CREATE INDEX "IDX_INSTRUCTION_RSJ_SITUATION_SIT" ON "instruction_rsj_situation" ("rsjSituationId");
CREATE INDEX "IDX_INSTRUCTION_RSJ_MOBILIZED_PLAN_INS" ON "instruction_rsj_mobilized_plan" ("instructionRsjId");
CREATE INDEX "IDX_INSTRUCTION_RSJ_MOBILIZED_PLAN_MOB_PLA" ON "instruction_rsj_mobilized_plan" ("rsjMobilizedPlanId");
CREATE INDEX "IDX_CLR_USER_CLEARANCE" ON "clearance_user" ("clearanceName");
CREATE INDEX "IDX_CLR_USER_USER" ON "clearance_user" ("userId");
CREATE INDEX "IDX_CLR_GROUP_CLEARANCE" ON "clearance_group" ("clearanceName");
CREATE INDEX "IDX_CLR_GROUP_GROUP" ON "clearance_group" ("groupName");
CREATE INDEX "IDX_ETA_BENEFICIARY_EMPLOYMENT_ID" ON "employment_training_area" ("beneficiaryEmploymentId");
CREATE INDEX "IDX_ETA_TRAINING_AREA_ID" ON "employment_training_area" ("trainingAreaId");
CREATE INDEX "IDX_STRUCTURE_FOCUS_AREA_STRU_ID" ON "structure_focus_area" ("structureId");
CREATE INDEX "IDX_STRUCTURE_FOCUS_AREA_AREA_ID" ON "structure_focus_area" ("focusAreaId");
CREATE INDEX "IDX_BENEFICIARY_RES_HISTORY_BEN" ON "beneficiary_residential_history" ("beneficiaryId");
CREATE INDEX "IDX_BENEFICIARY_RES_HISTORY_ADD" ON "beneficiary_residential_history" ("beneficiaryAddressId");
CREATE INDEX "IDX_BENEFICIARY_POS_HISTORY_BEN" ON "beneficiary_postal_history" ("beneficiaryId");
CREATE INDEX "IDX_BENEFICIARY_POS_HISTORY_ADD" ON "beneficiary_postal_history" ("beneficiaryAddressId");

ALTER TABLE "structure" ADD CONSTRAINT "UQ_STRUCTURE_IDIODAS" UNIQUE ("idIODAS");
ALTER TABLE "structure" ADD CONSTRAINT "UQ_STRUCTURE_LABEL" UNIQUE ("label");
ALTER TABLE "structure" ADD CONSTRAINT "UQ_STRUCTURE_LOGO" UNIQUE ("logoId");
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "UQ_BENEFICIARY_RSJ_BENEFICIARY" UNIQUE ("beneficiaryId");
ALTER TABLE "structure" ADD CONSTRAINT "FK_STRUCTURE_LOGO" FOREIGN KEY ("logoId") REFERENCES "logo"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "structure_to_area" ADD CONSTRAINT "FK_STRUTURE_TO_AREA_CLI" FOREIGN KEY ("cliId") REFERENCES "cli"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "structure_to_area" ADD CONSTRAINT "FK_STRUCTURE_TO_AREA_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "structure_to_area" ADD CONSTRAINT "FK_STRUCTURE_TO_AREA_SUPPORT_TYPE" FOREIGN KEY ("supportTypeId") REFERENCES "support_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_complement" ADD CONSTRAINT "FK_BENEFICIARY_COMPLEMENT_USER" FOREIGN KEY ("referentId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "contract" ADD CONSTRAINT "FK_CONTRACT_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "contract" ADD CONSTRAINT "FK_CONTRACT_USER_STRUCTURE" FOREIGN KEY ("structureSignatoryId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "contract" ADD CONSTRAINT "FK_CONTRACT_USER_DIRECTION" FOREIGN KEY ("directionSignatoryId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "contract" ADD CONSTRAINT "FK_CONTRACT_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "contract" ADD CONSTRAINT "FK_CONTRACT_USER" FOREIGN KEY ("referentId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "contract" ADD CONSTRAINT "FK_CONTRACT_SUPPORT_TYPE" FOREIGN KEY ("supportTypeId") REFERENCES "support_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "stage" ADD CONSTRAINT "UQ_STAGE_ENROL" UNIQUE ("enrolId");
ALTER TABLE "stage" ADD CONSTRAINT "FK_STAGE_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "stage" ADD CONSTRAINT "FK_STAGE_NATURE_TYPE" FOREIGN KEY ("stageNatureTypeId") REFERENCES "stage_nature_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "stage" ADD CONSTRAINT "FK_STAGE_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "stage" ADD CONSTRAINT "FK_STAGE_ORAGANIZATION_STRUTURE" FOREIGN KEY ("organizationStructureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "stage" ADD CONSTRAINT "FK_STAGE_ENROL" FOREIGN KEY ("enrolId") REFERENCES "enrol"("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "stage" ADD CONSTRAINT "FK_STAGE_COMMUNITYACTION" FOREIGN KEY ("communityActionId") REFERENCES "community_action"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "employment_qualification_type" ADD CONSTRAINT "FK_EMPLOYMENT_QUALIFICATION_TYPE_QUAL" FOREIGN KEY ("qualificationTypeId") REFERENCES "qualification_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "employment_qualification_type" ADD CONSTRAINT "FK_EMPLOYMENT_QUALIFICATION_TYPE_BEN_EMP" FOREIGN KEY ("beneficiaryEmploymentId") REFERENCES "beneficiary_employment"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "employment_barrier" ADD CONSTRAINT "FK_EMPLOYMENT_BARRIER_BAR" FOREIGN KEY ("barrierId") REFERENCES "barrier"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "employment_barrier" ADD CONSTRAINT "FK_EMPLOYMENT_BARRIER_BEN_EMP" FOREIGN KEY ("beneficiaryEmploymentId") REFERENCES "beneficiary_employment"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "employment_transport_mode" ADD CONSTRAINT "FK_EMPLOYMENT_TRANSPORT_MODE_BEN_EMP" FOREIGN KEY ("beneficiaryEmploymentId") REFERENCES "beneficiary_employment"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "employment_transport_mode" ADD CONSTRAINT "FK_EMPLOYMENT_TRANSPORT_MODE_TRA_MOD" FOREIGN KEY ("transportModeId") REFERENCES "transport_mode"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "domain" ADD CONSTRAINT "FK_DOMAIN_SECTOR" FOREIGN KEY ("sectorId") REFERENCES "sector"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "job" ADD CONSTRAINT "FK_JOB_DOMAIN" FOREIGN KEY ("domainId") REFERENCES "domain"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_employment" ADD CONSTRAINT "FK_BENEFICIARY_EMPLOYMENT_SECTOR" FOREIGN KEY ("sectorId") REFERENCES "sector"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_employment" ADD CONSTRAINT "FK_BENEFICIARY_EMPLOYMENT_DEGREE" FOREIGN KEY ("degreeId") REFERENCES "degree"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary" ADD CONSTRAINT "FK_BENEFICIARY_SUPPORT_TYPE" FOREIGN KEY ("supportTypeId") REFERENCES "support_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary" ADD CONSTRAINT "FK_BENEFICIARY_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary" ADD CONSTRAINT "FK_BENEFICIARY_BENEFICIARY_COMPLEMENT" FOREIGN KEY ("beneficiaryComplementId") REFERENCES "beneficiary_complement"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary" ADD CONSTRAINT "FK_BENEFICIARY_BENEFICIARY_EMPLOYMENT" FOREIGN KEY ("beneficiaryEmploymentId") REFERENCES "beneficiary_employment"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary" ADD CONSTRAINT "FK_BENEFICIARY_RESIDENTIAL_ADDRESS" FOREIGN KEY ("residentialAddressId") REFERENCES "beneficiary_address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary" ADD CONSTRAINT "FK_BENEFICIARY_POSTAL_ADDRESS" FOREIGN KEY ("postalAddressId") REFERENCES "beneficiary_address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "interview" ADD CONSTRAINT "FK_INTERVIEW_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "interview" ADD CONSTRAINT "FK_INTERVIEW_INTERVIEW_THEME" FOREIGN KEY ("interviewThemeId") REFERENCES "interview_theme"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "interview" ADD CONSTRAINT "FK_INTERVIEW_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "interview" ADD CONSTRAINT "FK_INTERVIEW_USER_ADDRESS" FOREIGN KEY ("addressId") REFERENCES "user_address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "agenda_event" ADD CONSTRAINT "FK_AGENDA_EVENT_SUPPORT_TYPE" FOREIGN KEY ("supportTypeId") REFERENCES "support_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "agenda_event" ADD CONSTRAINT "UQ_AGENDA_EVENT_COURSE" UNIQUE ("courseId");
ALTER TABLE "agenda_event" ADD CONSTRAINT "FK_AGENDA_EVENT_COURSE" FOREIGN KEY ("courseId") REFERENCES "course"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "agenda_event" ADD CONSTRAINT "FK_AGENDA_EVENT_INTERVIEW" FOREIGN KEY ("interviewId") REFERENCES "interview"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "agenda_event" ADD CONSTRAINT "FK_AGENDA_EVENT_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_employment_jobs_job" ADD CONSTRAINT "FK_BENEFICIARY_EMPLOYMENT_JOBS_JOB_BEN_EMP" FOREIGN KEY ("beneficiaryEmploymentId") REFERENCES "beneficiary_employment"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_employment_jobs_job" ADD CONSTRAINT "FK_BENEFICIARY_EMPLOYMENT_JOBS_JOB_JOB" FOREIGN KEY ("jobId") REFERENCES "job"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "document" ADD CONSTRAINT "FK_DOCUMENT_USER" FOREIGN KEY ("importedById") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "document" ADD CONSTRAINT "FK_DOCUMENT_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "document" ADD CONSTRAINT "FK_DOCUMENT_DOCUMENT_TITLE" FOREIGN KEY ("titleId") REFERENCES "document_title"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "support_history" ADD CONSTRAINT "FK_SUPPORT_HISTORY_SUPPORT_TYPE" FOREIGN KEY ("supportTypeId") REFERENCES "support_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "support_history" ADD CONSTRAINT "FK_SUPPORT_HISTORY_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "orientation_history" ADD CONSTRAINT "FK_ORIENTATION_HISTORY_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "orientation_history" ADD CONSTRAINT "FK_ORIENTATION_HISTORY_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "user" ADD CONSTRAINT "UK_USER_EMAIL" UNIQUE ("email");
ALTER TABLE "user" ADD CONSTRAINT "FK_USER_STRUCTURE_ID" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "user" ADD CONSTRAINT "FK_USER_CLI" FOREIGN KEY ("cliId") REFERENCES "cli"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "user_ctm" ADD CONSTRAINT "FK_USER_CTM_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "user_ctm" ADD CONSTRAINT "FK_USER_CTM_CTMID" FOREIGN KEY ("ctmId") REFERENCES "ctm"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "user_group" ADD CONSTRAINT "FK_USER_CTM_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "user_group" ADD CONSTRAINT "FK_USER_GROUP_GROUPNAME" FOREIGN KEY ("groupName") REFERENCES "group"("name") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "survey_fse" ADD CONSTRAINT "FK_SURVEY_FSE_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "survey_fse" ADD CONSTRAINT "FK_SURVEY_FSE_ORGANIZATION_STRUCTURE" FOREIGN KEY ("structureOrganizationId") REFERENCES "structure"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "survey_fse" ADD CONSTRAINT "FK_SURVEY_FSE_COMMUNITY_ACTION" FOREIGN KEY ("actionId") REFERENCES "community_action"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "survey_fse" ADD CONSTRAINT "FK_SURVEY_FSE_USER" FOREIGN KEY ("directedById") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "community_action" ADD CONSTRAINT "FK_COMMUNTY_ACTION_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "community_action" ADD CONSTRAINT "FK_COMMUNTY_ACTION_STAGE_NATURE_TYPE" FOREIGN KEY ("stageNatureTypeId") REFERENCES "stage_nature_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "community_action" ADD CONSTRAINT "FK_COMMUNTY_ACTION_CTM" FOREIGN KEY ("ctmId") REFERENCES "ctm"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "community_action" ADD CONSTRAINT "FK_COMMUNTY_ACTION_CLI" FOREIGN KEY ("cliId") REFERENCES "cli"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "document_status" ADD CONSTRAINT "FK_DOCUMENT_STATUS_DOCUMENT" FOREIGN KEY ("documentId") REFERENCES "document"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "contract_ier" ADD CONSTRAINT "FK_CONTRACT_IER_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "contract_ier" ADD CONSTRAINT "FK_CONTRACT_IER_USER_STRUCTURE" FOREIGN KEY ("structureSignatoryId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "contract_ier" ADD CONSTRAINT "FK_CONTRACT_IER_USER_DIRECTION" FOREIGN KEY ("directionSignatoryId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "contract_ier" ADD CONSTRAINT "FK_CONTRACT_IER_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "contract_ier" ADD CONSTRAINT "FK_CONTRACT_IER_USER" FOREIGN KEY ("referentId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "contract_ier" ADD CONSTRAINT "FK_CONTRACT_IER_SUPPORT_TYPE" FOREIGN KEY ("supportTypeId") REFERENCES "support_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "children" ADD CONSTRAINT "FK_CHILDREN_DIAGNOSTIC" FOREIGN KEY ("diagnosticId") REFERENCES "diagnostic"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "diagnostic_barrier" ADD CONSTRAINT "FK_DIAGNOSTIC_BARRIER_BARRIER" FOREIGN KEY ("barrierId") REFERENCES "barrier"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "diagnostic_barrier" ADD CONSTRAINT "FK_DIAGNOSTIC_BARRIER_DIAGNOSTIC" FOREIGN KEY ("diagnosticId") REFERENCES "diagnostic"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "diagnostic_qualification_type" ADD CONSTRAINT "FK_DIAGNOSTIC_QUALIFICATION_DIAGNOSTIC" FOREIGN KEY ("diagnosticId") REFERENCES "diagnostic"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "formation" ADD CONSTRAINT "FK_FORMATION_DIAGNOSTIC" FOREIGN KEY ("diagnosticId") REFERENCES "diagnostic"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "diagnostic" ADD CONSTRAINT "FK_DIAGNOSTIC_DEGREE" FOREIGN KEY ("degreeId") REFERENCES "degree"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "diagnostic" ADD CONSTRAINT "FK_DIAGNOSTIC_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "diagnostic" ADD CONSTRAINT "FK_DIAGNOSTIC_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "diagnostic" ADD CONSTRAINT "FK_DIAGNOSTIC_USER" FOREIGN KEY ("referentId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "course" ADD CONSTRAINT "UQ_COURSE_AGENDA_EVENT" UNIQUE ("eventId");
ALTER TABLE "course" ADD CONSTRAINT "FK_SESSION_COURSE" FOREIGN KEY ("sessionId") REFERENCES "session"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "course" ADD CONSTRAINT "FK_COURSE_AGENDA_EVENT" FOREIGN KEY ("eventId") REFERENCES "agenda_event"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "session" ADD CONSTRAINT "FK_COMMUNITY_ACTION_SESSION" FOREIGN KEY ("communityActionId") REFERENCES "community_action"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "enrol" ADD CONSTRAINT "UQ_ENROL_STAGE" UNIQUE ("stageId");
ALTER TABLE "enrol" ADD CONSTRAINT "FK_ENROL_SESSION" FOREIGN KEY ("sessionId") REFERENCES "session"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "enrol" ADD CONSTRAINT "FK_ENROL_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "enrol" ADD CONSTRAINT "FK_ENROL_STAGE" FOREIGN KEY ("stageId") REFERENCES "stage"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "referent_history" ADD CONSTRAINT "FK_REFERENT_HISTORY_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "referent_history" ADD CONSTRAINT "FK_REFERENT_HISTORY_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "referent_history" ADD CONSTRAINT "FK_REFERENT_HISTORY_USER" FOREIGN KEY ("referentId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "user_address" ADD CONSTRAINT "FK_USER_ADDRESS_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "custom_query" ADD CONSTRAINT "FK_CUSTOM_QUERY_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INSTRUCTION_RSJ_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INSTRUCTION_RSJ_STRUCTURE" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj_income" ADD CONSTRAINT "FK_INSTRUCTION_RSJ_INCOME_INSTRUCTION_RSJ" FOREIGN KEY ("instructionRSJId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_complement" ADD CONSTRAINT "FK_BENEFICIARY_COMPLEMENT_HEALTH_INSURANCE" FOREIGN KEY ("healthInsuranceId") REFERENCES "health_insurance"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INSTRUCTION_RSJ_HEALTH_INSURANCE" FOREIGN KEY ("healthInsuranceId") REFERENCES "health_insurance"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_CRED_DOC_1" FOREIGN KEY ("credentialDocument1Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_CRED_DOC_2" FOREIGN KEY ("credentialDocument2Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_CRED_DOC_3" FOREIGN KEY ("credentialDocument3Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_RES_ADD" FOREIGN KEY ("residentialAddressId") REFERENCES "beneficiary_address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_POS_ADD" FOREIGN KEY ("postalAddressId") REFERENCES "beneficiary_address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_ADD_DOC_1" FOREIGN KEY ("addressDocument1Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_ADD_DOC_2" FOREIGN KEY ("addressDocument2Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_NON_RENEWAL" FOREIGN KEY ("nonRenewalId") REFERENCES "instruction_rsj_non_renewal"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_SUP_DOC_1" FOREIGN KEY ("supervisionDocument1Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_SUP_DOC_2" FOREIGN KEY ("supervisionDocument2Id") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INS_RSJ_USE_TITLE" FOREIGN KEY ("useTitleId") REFERENCES "instruction_rsj_use_title"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj_other_document" ADD CONSTRAINT "FK_INS_RSJ_OTHER_DOC_INS" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj_other_document" ADD CONSTRAINT "FK_INS_RSJ_OTHER_DOC_DOC" FOREIGN KEY ("documentId") REFERENCES "document"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj_situation" ADD CONSTRAINT "FK_INSTRUCTION_RSJ_SITUATION_INS" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj_situation" ADD CONSTRAINT "FK_INSTRUCTION_RSJ_SITUATION_SIT" FOREIGN KEY ("rsjSituationId") REFERENCES "rsj_situation"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj_mobilized_plan" ADD CONSTRAINT "FK_INSTRUCTION_RSJ_MOBILIZED_PLAN_INS" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj_mobilized_plan" ADD CONSTRAINT "FK_INSTRUCTION_RSJ_MOBILIZED_PLAN_MOB_PLA" FOREIGN KEY ("rsjMobilizedPlanId") REFERENCES "rsj_mobilized_plan"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "instruction_rsj" ADD CONSTRAINT "FK_INSTRUCTION_RSJ_USER" FOREIGN KEY ("directedById") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "signature" ADD CONSTRAINT "FK_SIGNATURE_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "signature" ADD CONSTRAINT "FK_SIGNATURE_CONTRACT" FOREIGN KEY ("contractId") REFERENCES "contract"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "signature" ADD CONSTRAINT "FK_SIGNATURE_CONTRACT_IER" FOREIGN KEY ("contractIerId") REFERENCES "contract_ier"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "signature" ADD CONSTRAINT "FK_SIGNATURE_INS_RSJ" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "clearance" ADD CONSTRAINT "FK_CLEARANCE_CATEGORY" FOREIGN KEY ("categoryName") REFERENCES "clearance_category"("name") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "clearance_user" ADD CONSTRAINT "FK_CLR_USER_CLEARANCE" FOREIGN KEY ("clearanceName") REFERENCES "clearance"("name") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "clearance_user" ADD CONSTRAINT "FK_CLR_USER_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "clearance_group" ADD CONSTRAINT "FK_CLR_GROUP_CLEARANCE" FOREIGN KEY ("clearanceName") REFERENCES "clearance"("name") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "clearance_group" ADD CONSTRAINT "FK_CLR_GROUP_GROUP" FOREIGN KEY ("groupName") REFERENCES "group"("name") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "interview" ADD CONSTRAINT "FK_INTERVIEW_USER" FOREIGN KEY ("directedById") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "access_token" ADD CONSTRAINT "FK_ACCESS_TOKEN_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "refresh_token" ADD CONSTRAINT "FK_REFRESH_TOKEN_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "traceability" ADD CONSTRAINT "FK_TRACEABILITY_CONTRACT" FOREIGN KEY ("contractId") REFERENCES "contract"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "traceability" ADD CONSTRAINT "FK_TRACEABILITY_CONTRACT_IER" FOREIGN KEY ("contractIerId") REFERENCES "contract_ier"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "traceability" ADD CONSTRAINT "FK_TRACEABILITY_INS_RSJ" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "employment_asset" ADD CONSTRAINT "FK_EA_ASSET_ID" FOREIGN KEY ("assetId") REFERENCES "asset"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "employment_asset" ADD CONSTRAINT "FK_EA_BENEFICIARY_EMPLOYMENT_ID" FOREIGN KEY ("beneficiaryEmploymentId") REFERENCES "beneficiary_employment"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_employment" ADD CONSTRAINT "FK_BE_WANTED_JOB_TYPE_ID" FOREIGN KEY ("wantedJobTypeId") REFERENCES "job_type"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "employment_training_area" ADD CONSTRAINT "FK_ETA_BENEFICIARY_EMPLOYMENT_ID" FOREIGN KEY ("beneficiaryEmploymentId") REFERENCES "beneficiary_employment"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "employment_training_area" ADD CONSTRAINT "FK_ETA_TRAINING_AREA_ID" FOREIGN KEY ("trainingAreaId") REFERENCES "training_area"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "user_notification" ADD CONSTRAINT "FK_USER_NOTIFICATION_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "structure_focus_area" ADD CONSTRAINT "FK_STRUCTURE_FOCUS_AREA_STRU" FOREIGN KEY ("structureId") REFERENCES "structure"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "structure_focus_area" ADD CONSTRAINT "FK_STRUCTURE_FOCUS_AREA_AREA" FOREIGN KEY ("focusAreaId") REFERENCES "focus_area"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_address" ADD CONSTRAINT "FK_BENEFICIARY_ADDRESS_CLI" FOREIGN KEY ("cliId") REFERENCES "cli"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_address" ADD CONSTRAINT "FK_BENEFICIARY_ADDRESS_CTM" FOREIGN KEY ("ctmId") REFERENCES "ctm"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_address" ADD CONSTRAINT "FK_BENEFICIARY_ADDRESS_QPV" FOREIGN KEY ("qpvId") REFERENCES "qpv"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_STATE" FOREIGN KEY ("stateId") REFERENCES "rsj_state"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_REASON" FOREIGN KEY ("reasonId") REFERENCES "rsj_reason"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_BENEFICIARY" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_REFERENT" FOREIGN KEY ("referentId") REFERENCES "referent"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_PAYMENT_DATA" FOREIGN KEY ("paymentDataId") REFERENCES "rsj_payment_data"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "referent" ADD CONSTRAINT "FK_REFERENT_USER" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj" ADD CONSTRAINT "FK_BENEFICIARY_RSJ_NEXT_PAYMENT" FOREIGN KEY ("nextPaymentId") REFERENCES "rsj_next_payment"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "rsj_payment"  ADD CONSTRAINT "FK_RSJ_PAYMENT_PAYMENT_DATA" FOREIGN KEY ("paymentDataId") REFERENCES "rsj_payment_data"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "rsj_payment"  ADD CONSTRAINT "FK_RSJ_PAYMENT_INS_RSJ" FOREIGN KEY ("instructionRsjId") REFERENCES "instruction_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "rsj_payment"  ADD CONSTRAINT "FK_RSJ_PAYMENT_BENEFICIARY_RSJ" FOREIGN KEY ("beneficiaryRsjId") REFERENCES "beneficiary_rsj"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "rsj_payment"  ADD CONSTRAINT "FK_RSJ_PAYMENT_STATE" FOREIGN KEY ("stateId") REFERENCES "rsj_payment_state"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "rsj_payment_data" ADD CONSTRAINT "FK_RSJ_PAYMENT_DATA_DOCUMENT" FOREIGN KEY ("ribId") REFERENCES "document"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj_referent_history" ADD CONSTRAINT "FK_REFERENT_RSJ_REFERENT_HISTORY_REF" FOREIGN KEY ("referentId") REFERENCES "referent"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj_referent_history" ADD CONSTRAINT "FK_REFERENT_RSJ_REFERENT_HISTORY_RSJ" FOREIGN KEY ("beneficiaryRsjId") REFERENCES "beneficiary_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj_payment_data_history" ADD CONSTRAINT "FK_REFERENT_RSJ_PAYMENT_DATA_HISTORY_DATA" FOREIGN KEY ("rsjPaymentDataId") REFERENCES "rsj_payment_data"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_rsj_payment_data_history" ADD CONSTRAINT "FK_REFERENT_RSJ_PAYMENT_DATA_HISTORY_RSJ" FOREIGN KEY ("beneficiaryRsjId") REFERENCES "beneficiary_rsj"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_residential_history" ADD CONSTRAINT "FK_BENEFICIARY_RES_HISTORY_BEN" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_residential_history" ADD CONSTRAINT "FK_BENEFICIARY_RES_HISTORY_ADD" FOREIGN KEY ("beneficiaryAddressId") REFERENCES "beneficiary_address"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_postal_history" ADD CONSTRAINT "FK_BENEFICIARY_POS_HISTORY_BEN" FOREIGN KEY ("beneficiaryId") REFERENCES "beneficiary"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "beneficiary_postal_history" ADD CONSTRAINT "FK_BENEFICIARY_POS_HISTORY_ADD" FOREIGN KEY ("beneficiaryAddressId") REFERENCES "beneficiary_address"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

CREATE OR REPLACE VIEW public.aggregate_support_type
 AS
 SELECT b.id AS "beneficiaryId",
    b."supportTypeId",
    b."beginDateSupport" AS "beginDate",
    b."endDateSupport" AS "endDate",
	b."typeSupportDetail"
   FROM beneficiary b
UNION
 SELECT sh."beneficiaryId",
    sh."supportTypeId",
    sh."beginDate",
    sh."endDate",
	sh."typeSupportDetail"
   FROM support_history sh
;

CREATE OR REPLACE VIEW public.aggregate_orientation
 AS
 SELECT b.id AS "beneficiaryId",
    b."structureId",
    b."orientationBeginDate" AS "beginDate",
    b."orientationEndDate" AS "endDate",
    bc."reasonOrientationEnding"
   FROM beneficiary b
     LEFT JOIN beneficiary_complement bc ON bc.id = b."beneficiaryComplementId"
UNION
 SELECT oh."beneficiaryId",
    oh."structureId",
    oh."beginDate",
    oh."endDate",
    oh."reasonOrientationEnding"
   FROM orientation_history oh
;

CREATE OR REPLACE VIEW public.aggregate_residential_address
 AS
 SELECT b.id AS "beneficiaryId",
    ba."beginDate",
    ba."endDate",
	ba."address",
	ba."additionalAddress",
	ba."postalCode",
	ba."city",
	ba."cliId",
	ba."ctmId",
	ba."qpvId",
    ba."residentialStatus",
    ba."residentialStatusComplement"
   FROM beneficiary b
   LEFT JOIN beneficiary_address ba ON ba.id = b."residentialAddressId"
UNION
 SELECT b."beneficiaryId",
    ba."beginDate",
    ba."endDate",
	ba."address",
	ba."additionalAddress",
	ba."postalCode",
	ba."city",
	ba."cliId",
	ba."ctmId",
	ba."qpvId",
    ba."residentialStatus",
    ba."residentialStatusComplement"
   FROM beneficiary_residential_history b
   LEFT JOIN beneficiary_address ba ON ba.id = b."beneficiaryAddressId"
;

CREATE OR REPLACE VIEW public.aggregate_referent
 AS
 SELECT b.id AS "beneficiaryId",
    bc."beginDateReferent" AS "beginDate",
    bc."endDateReferent" AS "endDate",
	bc."referentId",
	b."structureId"
   FROM beneficiary b
   LEFT JOIN beneficiary_complement bc ON bc.id = b."beneficiaryComplementId"
UNION
 SELECT rh."beneficiaryId",
    rh."beginDate",
    rh."endDate",
	rh."referentId",
	rh."structureId"
   FROM referent_history rh
;

CREATE OR REPLACE VIEW public.stage_support_type
 AS
SELECT
	s.id,
    s.label,
    s."beginDate",
    s."endDate",
    s."stageState",
    s.organization,
    s.comment,
    s."reasonEndStage",
    s."beneficiaryId",
    s."stageNatureTypeId",
    s."structureId",
    s."organizationStructureId",
    s."enrolId",
    s.duration,
    s."communityActionId",
	ast."supportTypeId"
FROM stage s
LEFT JOIN aggregate_support_type AS ast ON s."beneficiaryId" = ast."beneficiaryId"
AND (
	s."beginDate" BETWEEN ast."beginDate" AND ast."endDate"
	OR s."endDate" BETWEEN ast."beginDate" AND ast."endDate"
	OR (ast."endDate" IS null AND ast."beginDate" <= s."beginDate")
);

CREATE OR REPLACE VIEW public.interview_support_type
 AS
 SELECT i.id,
    i."interviewDate",
    i."beginTimeInterview",
    i."endTimeInterview",
    EXTRACT(EPOCH FROM(i."endTimeInterview" - i."beginTimeInterview")) / 60 AS "durationInterview",
    i."directedById",
    i."interviewType",
    i.presence,
    i.synthesis,
    i.note,
    i."beneficiaryId",
    i."structureId",
    i."interviewThemeId",
    i."addressId",
    ast."supportTypeId"
FROM interview i
LEFT JOIN aggregate_support_type AS ast ON i."beneficiaryId" = ast."beneficiaryId"
AND (
    ast."endDate" IS NOT null AND i."interviewDate" BETWEEN ast."beginDate" AND ast."endDate"
    OR (ast."endDate" IS null AND ast."beginDate" <= i."interviewDate")
);

CREATE OR REPLACE VIEW public.beneficiary_orientation_support_type
AS
 SELECT ao."beneficiaryId",
    ao."beginDate" AS "orientationBeginDate",
    ao."endDate" AS "orientationEndDate",
    ast."beginDate" AS "supportBeginDate",
    ast."endDate" AS "supportEndDate",
    ao."structureId",
    ast."supportTypeId",
    ast."typeSupportDetail" AS "supportTypeDetail",
    ao."reasonOrientationEnding"
   FROM public.aggregate_orientation ao
	left join public.aggregate_support_type ast on ao."beneficiaryId" = ast."beneficiaryId"
	AND
		(
			(
				ao."beginDate" BETWEEN ast."beginDate" AND ast."endDate"
				OR ao."endDate" BETWEEN ast."beginDate" AND ast."endDate"
				OR ast."beginDate" <= ao."beginDate" AND (ast."endDate" >= ao."endDate" OR ast."endDate" is null)
			)
			OR
			(
				ast."beginDate" BETWEEN ao."beginDate" AND ao."endDate"
				OR ast."endDate" BETWEEN ao."beginDate" AND ao."endDate"
				OR ao."beginDate" <= ast."beginDate" AND (ao."endDate" >= ast."endDate" OR ao."endDate" is null)
			)
			OR (ast."endDate" is null AND ao."endDate" is null)
		)
;

CREATE OR REPLACE VIEW public.beneficiary_orientation_address
 AS
 SELECT ao."beneficiaryId",
    ao."beginDate" AS "orientationBeginDate",
    ao."endDate" AS "orientationEndDate",
    aa."beginDate" AS "addressBeginDate",
    aa."endDate" AS "addressEndDate",
    aa.address,
    aa."additionalAddress",
    aa."postalCode",
    aa.city,
    ao."structureId",
    aa."cliId",
    aa."ctmId",
    aa."qpvId",
    ao."reasonOrientationEnding"
   FROM public.aggregate_orientation ao
	left join public.aggregate_residential_address aa on ao."beneficiaryId" = aa."beneficiaryId"
	AND
		(
			(
				ao."beginDate" BETWEEN aa."beginDate" AND aa."endDate"
				OR ao."endDate" BETWEEN aa."beginDate" AND aa."endDate"
				OR aa."beginDate" <= ao."beginDate" AND (aa."endDate" >= ao."endDate" OR aa."endDate" is null)
			)
			OR
			(
				aa."beginDate" BETWEEN ao."beginDate" AND ao."endDate"
				OR aa."endDate" BETWEEN ao."beginDate" AND ao."endDate"
				OR ao."beginDate" <= aa."beginDate" AND (ao."endDate" >= aa."endDate" OR ao."endDate" is null)
			)
			OR (aa."endDate" is null AND ao."endDate" is null)
		)
;

CREATE OR REPLACE VIEW public.beneficiary_orientation_referent
 AS
 SELECT ao."beneficiaryId",
    ao."beginDate" AS "orientationBeginDate",
    ao."endDate" AS "orientationEndDate",
    ar."beginDate" AS "referentBeginDate",
    ar."endDate" AS "referentEndDate",
    ar."structureId",
    ar."referentId",
    ao."reasonOrientationEnding"
   FROM public.aggregate_orientation ao
	left join public.aggregate_referent ar on ao."beneficiaryId" = ar."beneficiaryId"
	AND
		(
			(
				ao."beginDate" BETWEEN ar."beginDate" AND ar."endDate"
				OR ao."endDate" BETWEEN ar."beginDate" AND ar."endDate"
				OR ar."beginDate" <= ao."beginDate" AND (ar."endDate" >= ao."endDate" OR ar."endDate" is null)
			)
			OR
			(
				ar."beginDate" BETWEEN ao."beginDate" AND ao."endDate"
				OR ar."endDate" BETWEEN ao."beginDate" AND ao."endDate"
				OR ao."beginDate" <= ar."beginDate" AND (ao."endDate" >= ar."endDate" OR ao."endDate" is null)
			)
			OR (ar."endDate" is null AND ao."endDate" is null)
		)
;

CREATE OR REPLACE VIEW labeled_survey_fse AS
SELECT
    survey_fse.id,
    CASE survey_fse."isAnnualMonitoring"
        WHEN TRUE
            THEN 'Suivi annuel'
        WHEN FALSE
            THEN community_action.label
    END AS label             ,
    survey_fse."beginDate"              ,
    survey_fse."endDate"                ,
    survey_fse."structureOrganizationId",
    survey_fse."year"                   ,
    survey_fse."directedById"             ,
    survey_fse."isAnnualMonitoring"     ,
    survey_fse."beneficiaryId"
FROM
    survey_fse
    LEFT JOIN
        community_action
        ON
            community_action.id = survey_fse."actionId"
;

CREATE OR REPLACE VIEW rsj AS
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

CREATE OR REPLACE VIEW public.residential_address
 AS
 SELECT b.id AS "beneficiaryId",
    ba."id",
    ba."beginDate",
    ba."endDate",
	ba."address",
	ba."additionalAddress",
	ba."postalCode",
	ba."city",
	ba."cliId",
	ba."ctmId",
	ba."qpvId",
    ba."residentialStatus",
    ba."residentialStatusComplement"
   FROM beneficiary b
   LEFT JOIN beneficiary_address ba ON ba.id = b."residentialAddressId";

CREATE OR REPLACE VIEW public.residential_address_history
 AS
 SELECT b."beneficiaryId",
    ba."id",
    ba."beginDate",
    ba."endDate",
	ba."address",
	ba."additionalAddress",
	ba."postalCode",
	ba."city",
	ba."cliId",
	ba."ctmId",
	ba."qpvId",
    ba."residentialStatus",
    ba."residentialStatusComplement"
   FROM beneficiary_residential_history b
   LEFT JOIN beneficiary_address ba ON ba.id = b."beneficiaryAddressId";

CREATE OR REPLACE VIEW public.postal_address
 AS
 SELECT b.id AS "beneficiaryId",
    ba."id",
    ba."beginDate",
    ba."endDate",
	ba."address",
	ba."additionalAddress",
	ba."postalCode",
	ba."city",
    ba."domiciliationType",
    ba."domiciliationTypeComplement"
   FROM beneficiary b
   LEFT JOIN beneficiary_address ba ON ba.id = b."postalAddressId";

CREATE OR REPLACE VIEW public.postal_address_history
 AS
 SELECT b."beneficiaryId",
    ba."id",
    ba."beginDate",
    ba."endDate",
	ba."address",
	ba."additionalAddress",
	ba."postalCode",
	ba."city",
    ba."domiciliationType",
    ba."domiciliationTypeComplement"
   FROM beneficiary_postal_history b
   LEFT JOIN beneficiary_address ba ON ba.id = b."beneficiaryAddressId";

CREATE FUNCTION employment_training_area_stamp() RETURNS trigger AS $employment_training_area_stamp$
    BEGIN
        IF NEW."beneficiaryEmploymentId" IS NULL THEN
            RETURN NULL;
        END IF;
        IF NEW."trainingAreaId" IS NULL THEN
            RETURN NULL;
        END IF;
        RETURN NEW;
    END;
$employment_training_area_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER employment_training_area_stamp BEFORE INSERT OR UPDATE ON employment_training_area
    FOR EACH ROW EXECUTE PROCEDURE employment_training_area_stamp();

CREATE EXTENSION unaccent;

CREATE OR REPLACE FUNCTION public.immutable_unaccent(regdictionary, text)
  RETURNS text LANGUAGE c IMMUTABLE STRICT AS '$libdir/unaccent', 'unaccent_dict';

CREATE OR REPLACE FUNCTION public.f_unaccent(text)
  RETURNS text LANGUAGE sql IMMUTABLE STRICT AS
$func$
SELECT regexp_replace(public.immutable_unaccent(regdictionary 'public.unaccent', LOWER($1)), '[^[:alnum:]]', '', 'g')
$func$;

CREATE INDEX beneficiary_unaccent_usualName_idx ON beneficiary(public.f_unaccent("usualName"));
CREATE INDEX beneficiary_unaccent_firstName_idx ON beneficiary(public.f_unaccent("firstName"));

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
