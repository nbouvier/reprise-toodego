-- Requêtes de contrôle post reprise de données Toodego

-- Bénéficiaires avec instructions à la même date
-- => 1 résultat = 1 référent qui a fait n'importe quoi avec la duplication d'instruction
-- => Supprimer les instructions inutiles
SELECT "beneficiaryId", "instructionDate", COUNT(*) AS "numberOfInstructions"
FROM "instruction_rsj"
GROUP BY "beneficiaryId", "instructionDate"
HAVING COUNT(*) > 1;

-- Instructions avec conclusion de paiement manquante (hors instruction En création)
-- => Chercher dans les logs d'erreurs les échecs de reprise de conclusion de paiement ou dans les données Toodego
WITH "instruction_state" AS (
	SELECT DISTINCT ON ("instructionRsjId") "instructionRsjId", "status"
	FROM "traceability"
	WHERE "instructionRsjId" IS NOT null
	ORDER BY "instructionRsjId", "statusDate" DESC, "id" DESC
)
SELECT i."beneficiaryId", i."id" AS "instructionRsjId", s."status", i."paymentAmount", i."paymentDuration", i."paymentCounterProposal", i."paymentCounterAmount", i."paymentCounterDuration"
FROM "instruction_rsj" i
LEFT JOIN "instruction_state" s ON s."instructionRsjId" = i."id"
WHERE i."paymentAmount" IS null AND s."status" <> 'En création';

-- Instructions avec mauvaise décision de paiement
-- => Des instructions ont dues être supprimées, vérifier les données Toodego
WITH "expected_payment_decision" AS (
	SELECT
		"id" AS "instructionRsjId",
		SUBSTRING("useTitleComment" from '%: #"% mois#"%' for '#') AS "expectedDuration",
		SUBSTRING("useTitleComment" from '%, #"%#"€%' for '#')::INTEGER AS "expectedAmount"
	FROM "instruction_rsj"
	WHERE "useTitleComment" IS NOT null
),
"payment_decision" AS (
	SELECT "id" AS "instructionRsjId", CASE
		WHEN "paymentCounterProposal" = false THEN "paymentDuration"
		WHEN "paymentCounterProposal" = true THEN "paymentCounterDuration"
	END AS "duration",
	CASE
		WHEN "paymentCounterProposal" = false THEN "paymentAmount"
		WHEN "paymentCounterProposal" = true THEN "paymentCounterAmount"
	END AS "amount"
	FROM "instruction_rsj"
	WHERE "paymentCounterProposal" IS NOT null
)
SELECT pd."instructionRsjId", pd."duration", pd."amount", epd."expectedDuration", epd."expectedAmount"
FROM "payment_decision" pd
JOIN "expected_payment_decision" epd ON epd."instructionRsjId" = pd."instructionRsjId"
WHERE epd."expectedDuration" <> pd."duration" OR epd."expectedAmount" <> pd."amount";

-- Instructions avec contre-proposition renseignée mais non prise en compte
-- => Mettre instruction_rsj.paymentCounterProposal = true
SELECT "beneficiaryId", "id" AS "instructionRsjId", "paymentCounterProposal", "paymentCounterAmount", "paymentCounterDuration"
FROM "instruction_rsj"
WHERE ("paymentCounterProposal" = false OR "paymentCounterProposal" IS null) AND "paymentCounterAmount" IS NOT null;

-- Instructions avec un nombre de paiements associés incorrects (hors instruction Suspendue car leurs paiements non réalisés sont supprimés)
-- => Si l'instruction est terminée, vérifier que les paiements n'aient pas été mis sur une autre instruction du bénéficiaire + vérifier dans les données Toodego
-- => Si l'instruction est en cours, ce sont sûrement des paiements Prévu qu'il faut créer en bdd
WITH "instruction_expected_payments" AS (
	SELECT "id" AS "instructionRsjId", CASE
		WHEN "paymentCounterProposal" = false THEN SUBSTRING("paymentDuration" FROM 1 FOR 1)::INTEGER
		WHEN "paymentCounterProposal" = true THEN SUBSTRING("paymentCounterDuration" FROM 1 FOR 1)::INTEGER
	END AS "expectedNumberOfPayments"
	FROM "instruction_rsj"
	WHERE "paymentCounterProposal" IS NOT null
), "instruction_payments" AS (
	SELECT "instructionRsjId", COUNT(*) AS "numberOfPayments"
	FROM "rsj_payment"
	GROUP BY "instructionRsjId"
), "instruction_state" AS (
	SELECT DISTINCT ON ("instructionRsjId") "instructionRsjId", "status"
	FROM "traceability"
	WHERE "instructionRsjId" IS NOT null
	ORDER BY "instructionRsjId", "statusDate" DESC, "id" DESC
)
SELECT i."beneficiaryId", i."id" AS "instructionRsjId", s."status", ep."expectedNumberOfPayments", p."numberOfPayments"
FROM "instruction_rsj" i
JOIN "instruction_expected_payments" ep ON ep."instructionRsjId" = i."id"
LEFT JOIN "instruction_payments" p ON p."instructionRsjId" = i."id"
LEFT JOIN "instruction_state" s ON s."instructionRsjId" = i."id"
WHERE ep."expectedNumberOfPayments" <> p."numberOfPayments" AND s."status" <> 'Suspendue';

-- Instructions avec paiement lié de la mauvaise somme
-- => Il y a sûrement eu un soucis lors de la phase de lien des paiements aux instructions, les paiements sont sûrement sur la mauvaise instruction
WITH "instruction_expected_payments" AS (
	SELECT "id" AS "instructionRsjId", CASE
		WHEN "paymentCounterProposal" = false THEN "paymentAmount"
		WHEN "paymentCounterProposal" = true THEN "paymentCounterAmount"
	END AS "expectedPaymentAmount"
	FROM "instruction_rsj"
	WHERE "paymentCounterProposal" IS NOT null
)
SELECT i."beneficiaryId", i."id" AS "instructionRsjId", ep."expectedPaymentAmount", p."amount" AS "paymentAmount", p."id" AS "paymentId"
FROM "instruction_rsj" i
JOIN "rsj_payment" p ON p."instructionRsjId" = i."id"
JOIN "instruction_expected_payments" ep ON ep."instructionRsjId" = i."id"
WHERE ep."expectedPaymentAmount" <> p."amount";

-- Instruction sans état
-- => Il y a sûrement eu un soucis lors de la phase de lien des états, les états sont sûrement sur la mauvaise instruction
-- => Si les états ne sont sur aucune autre instruction, vérifier les données Toodego
SELECT "beneficiaryId", "id" AS "instructionId"
FROM "instruction_rsj"
WHERE "id" NOT IN (
	SELECT DISTINCT "instructionRsjId"
	FROM "traceability"
	WHERE "instructionRsjId" IS NOT null
);

-- Instruction sans état En création
-- => Éventuellement créer un état En création en bdd, en vrai on s'en fiche un peu, sauf si l'instruction n'a pas d'autre état
-- => Attention, il doit avoir un id inférieur aux autres états de l'instruction
SELECT "beneficiaryId", "id" AS "instructionRsjId"
FROM "instruction_rsj"
WHERE "id" NOT IN (
	SELECT DISTINCT "instructionRsjId"
	FROM "traceability"
	WHERE "instructionRsjId" IS NOT null AND "status" = 'En création'
);

-- Instruction avec plusieurs fois l'état Acceptée
-- => Il y a sûrement eu un soucis lors de la phase de lien des états, les états sont sûrement sur la mauvaise instruction
SELECT i."beneficiaryId", i."id" AS "instructionId"
FROM "instruction_rsj" i
JOIN "traceability" t ON t."instructionRsjId" = i."id"
WHERE t."status" = 'Acceptée'
GROUP BY i."beneficiaryId", i."id"
HAVING COUNT(*) > 1;

-- Bénéficiaires avec mauvais état du dossier
-- => Corriger l'état en bdd selon l'état des instructions
-- Âge >= 25 => Clos
-- Nombre de paiement >= 24 => Clos
-- Paiements prévus > 0 => Droit ouvert (avec versement)
-- Paiements réalisés > 0 => Droit ouvert (sans versement)
-- Paiements = 0 && dernier état = Analyse en cours / Demande d'information => En analyse
-- Paiements = 0 && dernier état = Refusée => Refusée
-- Sinon => Non orienté
WITH "beneficiary_payments" AS (
	SELECT p."beneficiaryRsjId",
		COUNT(*) FILTER (WHERE ps."label" IN ('Réalisé', 'Erreur de paiement', 'Erreur de paiement traitée')) AS "completedPayments",
		COUNT(*) FILTER (WHERE ps."label" = 'Prévu') AS "plannedPayments",
		COUNT(*) AS "allPayments"
	FROM "rsj_payment" p
	JOIN "rsj_payment_state" ps ON ps."id" = p."stateId"
	GROUP BY p."beneficiaryRsjId"
), "beneficiary_last_state" AS (
	SELECT DISTINCT ON (i."beneficiaryId") i."beneficiaryId", t."status"
	FROM "instruction_rsj" i
	JOIN "traceability" t ON t."instructionRsjId" = i."id"
	WHERE t."status" <> 'En création'
	ORDER BY i."beneficiaryId", t."statusDate" DESC
),
"beneficiary_expected_status" AS (
	SELECT br."beneficiaryId", CASE
		WHEN AGE(CURRENT_DATE, b."birthDate") >= INTERVAL '25 YEARS' THEN 'Clos'
		WHEN bp."allPayments" >= 24 THEN 'Clos'
		WHEN bp."plannedPayments" > 0 THEN 'Droit ouvert (avec versement)'
		WHEN bp."completedPayments" > 0 THEN 'Droit ouvert (sans versement)'
		WHEN bp."allPayments" IS null AND bls."status" IN ('Analyse en cours', 'Demande d''information') THEN 'En analyse'
		WHEN bp."allPayments" IS null AND bls."status" = 'Refusée' THEN 'Refusé'
		ELSE 'Non orienté'
	END AS "rsjExpectedStatus"
	FROM "beneficiary_rsj" br
	JOIN "beneficiary" b ON b."id" = br."beneficiaryId"
	LEFT JOIN "beneficiary_last_state" bls ON bls."beneficiaryId" = br."beneficiaryId"
	LEFT JOIN "beneficiary_payments" bp ON bp."beneficiaryRsjId" = br."id"
)
SELECT br."beneficiaryId", bes."rsjExpectedStatus", rs."label" AS "rsjStatus", AGE(CURRENT_DATE, b."birthDate") AS "age", bls."status" AS "lastInstructionStatus", bp."completedPayments", bp."plannedPayments"
FROM "beneficiary_rsj" br
JOIN "beneficiary" b ON b."id" = br."beneficiaryId"
JOIN "rsj_state" rs ON rs."id" = br."stateId"
LEFT JOIN "beneficiary_last_state" bls ON bls."beneficiaryId" = br."beneficiaryId"
LEFT JOIN "beneficiary_payments" bp ON bp."beneficiaryRsjId" = br."id"
JOIN "beneficiary_expected_status" bes ON bes."beneficiaryId" = br."beneficiaryId"
WHERE rs."label" <> bes."rsjExpectedStatus";

-- Bénéficiaire avec dossier RSJ initialisé et sans instruction
-- => Vérifier que le jeune n'a pas de dossier dans les données Toodego
SELECT b_rsj."beneficiaryId", s_rsj."label"
FROM "beneficiary_rsj" b_rsj
JOIN "rsj_state" s_rsj ON s_rsj."id" = b_rsj."stateId"
WHERE b_rsj."beneficiaryId" NOT IN (
	SELECT DISTINCT "beneficiaryId"
	FROM "instruction_rsj"
) AND s_rsj."label" <> 'Non orienté';

-- Bénéficiaire avec dossier RSJ ouvert sans date d'ouverture de droit
-- => Vérifier la première instruction pour mettre la date d'ouverture de droit
SELECT br."beneficiaryId", rs."label" AS "status", br."rsjBeginDate"
FROM "beneficiary_rsj" br
JOIN "rsj_state" rs ON rs."id" = br."stateId"
WHERE rs."label" IN ('Droit ouvert (en attente de versement)', 'Droit ouvert (avec versement)', 'Droit ouvert (sans versement)', 'Clos') AND br."rsjBeginDate" IS null;

-- Bénéficiaire avec dossier RSJ Clos sans date de clôture
-- => Vérifier son âge
SELECT br."beneficiaryId", rs."label" AS "status", br."rsjBeginDate", br."rsjEndDate"
FROM "beneficiary_rsj" br
JOIN "rsj_state" rs ON rs."id" = br."stateId"
WHERE rs."label" = 'Clos' AND br."rsjEndDate" IS null;
