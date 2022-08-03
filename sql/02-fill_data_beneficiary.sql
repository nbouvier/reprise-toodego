-- Thomas MARQUIS
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2000-02-02', 'Reorientation');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2009-06-06', false, null, 'No', null, null, null, 2, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus", "qpvId")
VALUES
	('42 rue victor hugo', '2000-05-01', 'Etage 2', '69002', 'Lyon', 'Tenant', 1);
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "typeSupportDetail", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "endDateSupport", "lastUpdateDate", "insertisId")
VALUES
	('MARQUIS', null, 'Thomas', 'Litod', 'Mister', '1988-06-06', 'French', 'Lyon', '63254127', 'CAF',
		'1421542154', true, 'thomas-lito@yahoo.fr', true, 'Porteur de handicap', 1, 1, '14214511', 'InProgress',
		'2009-06-06', '2020-06-06', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='ADIE'), '0665585921', '0415121415', 'Single', 1, 1, '2010-02-02', '2015-02-02', '2016-02-02', '21N000001');

-- Jean-Luc ASSEC
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2009-10-01', 'CompensationRunsOut');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', true, '2025-01-01', 'No', null, null, null, 3, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('221 Rue Du Puits Vieux', '2000-05-01', 'Les hirondelles', '69800', 'ST PRIEST', 'Owner');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('ASSEC', null, 'Jean-Luc', 'Yves', 'Mister', '1982-08-02', 'French', 'Lyon', '7197699A', 'CAF',
		'87654321', true, 'Jean-Luc.assec@monadresse.com', true, 2, 2, 1234567, 'ToGuide',
		'2016-11-01', '2018-10-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='ADIE'), '0610203040', '0404040404', 'Single', 2, 2, '2010-02-02', '21N000002');


-- Louis-Ferdinand CELINE
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2017-11-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 4, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('214 Rue Francis de Pressensé', '2000-05-01', null, '69100', 'VILLEURBANNE', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('CELINE', null, 'Louis-Ferdinand', 'Edgar', 'Mister', '1987-03-09', 'European', 'Rodez', '1659213B', 'CAF',
		'87654322', true, 'Louis-Ferdinand.celine@monadresse.com', true, 3, 3, 1234568, 'Closed',
		'2018-10-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='ADL (DEVELOPPEMENT LOCAL)'), '0611223344', '0505050505', 'Divorced', 3, 3, '2010-02-02', '21N000003');


-- Gustave DEKERVERNE
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 1, '2009-10-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2026-02-01', 'No', null, null, null, 5, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('240 Avenue Auguste Blanqui', '2000-05-01', null, '69100', 'VILLEURBANNE', 'HostedByAThird');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('DEKERVERNE', null, 'Gustave', 'Benoit', 'Mister', '1956-06-01', 'NotEuropean', 'Rio', '1551943C', 'CAF',
		'87654323', true, 'Gustave.dekerverne@monadresse.com', false, 4, 4, 1234569, 'Waiting',
		'2015-06-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé Hors RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='ADL (DEVELOPPEMENT LOCAL)'), '0611232425', '0906060609', 'Married', 4, 4, '2010-02-02', '21N000004');


-- Harry POTTER
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2018-01-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 6, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('167 Avenue Lacassagne', '2000-05-01', null, '69003', 'LYON 3EME', 'HostedInFosterCare');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('POTTER', null, 'Harry', 'Louis', 'Mister', '1969-06-09', 'French', 'Londres', '2336391D', 'CAF',
		'87654324', true, 'Harry.potter@monadresse.com', true, 5, 5, 1234570, 'InProgress',
		'2018-06-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='AIDEN CHANTIERS'), '0612141715', '0101010101', 'Widowed', 5, 5, '2010-02-02', '21N000005');


-- Homer SIMPSON
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2016-12-01', 'MovingOut');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', false, null, 'No', null, null, null, 7, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('213 Rue DU BACON', '2000-05-01', null, '69250', 'MONTANAY', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('SIMPSON', null, 'Homer', 'Bruce', 'Mister', '1987-05-07', 'European', 'Vesoul', '6016250E', 'MSA',
		'87654325', true, 'Homer.simpson@monadresse.com', true, 6, 6, 1234571, 'InProgress',
		'2018-02-01', '2018-12-31', (SELECT id
		FROM support_type
		WHERE label='Autre'), (SELECT id
		FROM STRUCTURE
		WHERE label='AIDEN CHANTIERS'), '0632313635', '0202020202', 'Single', 6, 6, '2010-02-02', '21N000006');


-- Hannibal LECTER 
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 2, '2014-08-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 8, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('672 Rue des Trois Passages', '2000-05-01', null, '69002', 'LYON 2EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('LECTER', null, 'Hannibal', 'Alexandre', 'Mister', '1957-04-17', 'NotEuropean', 'Moscou', '9164889F', 'CAF',
		'87654326', true, 'Hannibal.lecter@monadresse.com', true, 7, 7, 1234572, 'ToGuide',
		'2016-12-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='AJ2 - PERMANENCE EMPLOI'), '0658050204', '0303030303', 'Divorced', 7, 7, '2010-02-02', '21N000007');


-- Fox MULDER
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2017-11-01', 'Reorientation');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, null, 'No', null, null, null, 9, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('14 Rue De La Commune De Paris', '2000-05-01', 'LOGEMENT A010 VENISSIEUX LES CEDRES', '69200', 'VENISSIEUX', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('MULDER', null, 'Fox', 'Loup', 'Mister', '1990-01-25', 'French', 'Villeurbanne', '7831682G', 'CAF',
		'87654327', false, 'Fox.mulder@monadresse.com', false, 8, 8, 1234573, 'Closed',
		'2017-10-01', '2018-12-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='ALIS'), '0632458547', '0475010101', 'Married', 8, 8, '2010-02-02', '21N000008');


-- Bridget JONES 
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2011-07-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2027-02-01', 'No', null, null, null, 10, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('214 Rue Beethoven', '2000-05-01', null, '69200', 'VENISSIEUX', 'Homeless');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('JONES', 'Coomes', 'Bridget', 'Raymonde', 'Madam', '1976-07-03', 'European', 'Le Cap', '5144536A', 'CAF',
		'87654328', false, 'Bridget.jones@monadresse.com', true, 9, 9, 1234574, 'Waiting',
		'2016-03-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='ALIZES FORMATION'), '0745464142', '0475020202', 'Widowed', 9, 9, '2010-02-02', '21N000009');


-- Lara CROFT
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 1, '2018-11-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', false, null, 'No', null, null, null, 1, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('267 Boulevard Du 11 Novembre 12167', '2000-05-01', null, '69100', 'VILLEURBANNE', 'Owner');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('CROFT', 'Teasdale', 'Lara', 'Sylvie', 'Madam', '1991-09-30', 'NotEuropean', 'Moscou', '7464046Z', 'CAF',
		'87654329', true, 'Lara.croft@monadresse.com', true, 10, 10, 1234575, 'InProgress',
		'2018-05-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé Hors RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='ALYNEA'), '0747484950', '0475030303', 'Single', 10, 10, '2010-02-02', '21N000010');

-- Ally MCBEAL
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(3, 2, '2015-01-01', 'OtherSocialRight');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2019-07-01', 'No', null, null, null, 2, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('1212 Avenue du 121ème Corps', '2000-05-01', null, '06000', 'NICE', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('MCBEAL', 'Duras', 'Ally', 'Louise', 'Madam', '1989-12-06', 'French', 'Rodez', '2953602E', 'MSA',
		'87654330', true, 'Ally.mcbeal@monadresse.com', true, 11, 11, 1234576, 'InProgress',
		'2018-06-01', '2018-11-30', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='ALYNEA'), '0645418489', '0475040404', 'Divorced', 11, 11, '2010-02-02', '21N000011');

-- Austin POWERS
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2014-09-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 3, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('6721 Allée Marcel Achard', '2000-05-01', null, '69100', 'VILLEURBANNE', 'HostedByAThird');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('POWERS', null, 'Austin', 'Bellino', 'Mister', '1988-05-27', 'French', 'Paris', '6607442R', 'CAF',
		'87654331', true, 'Austin.powers@monadresse.com', false, 12, 12, 1234577, 'ToGuide',
		'2018-07-01', null, (SELECT id
		FROM support_type
		WHERE label='Autre'), (SELECT id
		FROM STRUCTURE
		WHERE label='ALYNEA'), '0642418479', null, 'Married', 12, 12, '2010-02-02', '21N000012');

-- Forrest GUMP
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 2, '2009-06-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 4, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('244 Rue Jean Voillot', '2000-05-01', null, '69100', 'VILLEURBANNE', 'HostedInFosterCare');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('GUMP', null, 'Forrest', 'Salvatore', 'Mister', '1970-10-19', 'French', 'Londres', '9697526T', 'CAF',
		'87654332', true, 'Forrest.gump@monadresse.com', true, 13, 13, 1234578, 'Closed',
		'2009-06-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='ARTAG'), '0642414348', null, 'Widowed', 13, 13, '2010-02-02', '21N000013');

-- Sarah CONNOR
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2009-06-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', false, null, 'No', null, null, null, 5, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('23 Rue Jean Voillot', '2000-05-01', null, '69100', 'VILLEURBANNE', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('CONNOR', 'Ruffinoni', 'Sarah', 'Joséphine', 'Madam', '1981-06-04', 'French', 'Vesoul', '5470575Y', 'CAF',
		'87654333', true, 'Sarah.connor@monadresse.com', true, 14, 14, 1234579, 'Waiting',
		'2011-04-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='ARTAG'), '0798979495', null, 'Single', 14, 14, '2010-02-02', '21N000014');

-- Jack BAUER
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2009-11-01', 'Death');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, null, 'No', null, null, null, 6, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('1121 Rue Jean Voillot', '2000-05-01', null, '69613', 'VILLEURBANNE', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('BAUER', null, 'Jack', 'Axel', 'Mister', '1958-04-19', 'French', 'Vierzon', '2328288U', 'CAF',
		'87654334', true, 'Jack.bauer@monadresse.com', true, 15, 15, 1234580, 'InProgress',
		'2017-10-01', '2019-01-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='ARTAG'), '0689989889', null, 'Divorced', 15, 15, '2010-02-02', '21N000015');

-- Edward CULLEN
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 2, '2015-06-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2018-01-01', 'No', null, null, null, 7, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('41 E Rue Des Vignettes', '2000-05-01', null, '69320', 'FEYZIN', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('CULLEN', null, 'Edward', 'Firmin', 'Mister', '1975-09-09', 'French', 'Villeurbanne', '3272516I', 'MSA',
		'87654335', false, 'Edward.cullen@monadresse.com', false, 16, 16, 1234581, 'InProgress',
		'2015-11-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé Hors RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='ASPIE ST PRIEST'), '0663633636', null, 'Married', 16, 16, '2010-02-02', '21N000016');

-- Miranda PRIESTLY
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2017-01-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 8, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('3467 Rue Paul Pic', '2000-05-01', null, '69500', 'BRON', 'Homeless');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('PRIESTLY', 'Giedré', 'Miranda', 'Apolline', 'Madam', '1991-01-09', 'French', 'Le Cap', '7171178O', 'CAF',
		'87654336', false, 'Miranda.priestly@monadresse.com', true, 17, 17, 1234582, 'ToGuide',
		'2018-04-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='CEFI'), '0645544545', null, 'Widowed', 17, 17, '2010-02-02', '21N000017');

-- Robert BARATHEON
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2017-09-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', true, '2025-01-01', 'No', null, null, null, 9, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('21 Chemin Du Mont Pilat', '2000-05-01', null, '69120', 'VAULX EN VELIN', 'Owner');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('BARATHEON', null, 'Robert', 'Régis', 'Mister', '1986-04-07', 'French', 'Lyon', '7935606P', 'CAF',
		'87654337', true, 'Robert.baratheon@monadresse.com', true, 18, 18, 1234583, 'Closed',
		'2017-11-01', null, (SELECT id
		FROM support_type
		WHERE label='Autre'), (SELECT id
		FROM STRUCTURE
		WHERE label='CERTA'), '0636633665', null, 'Single', 18, 18, '2010-02-02', '20N000017');

-- John SNOW
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2017-12-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 10, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('1367 Avenue De La Constellation', '2000-05-01', null, '69160', 'TASSIN LA DEMI LUNE', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('SNOW', null, 'John', 'Henri', 'Mister', '1975-02-20', 'French', 'Rodez', '1816932M', 'CAF',
		'87654338', true, 'John.snow@monadresse.com', true, 19, 19, 1234584, 'Waiting',
		'2018-03-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='CIDFF DU RHONE'), '0658588585', null, 'Divorced', 19, 19, '2010-02-02', '21N000018');

-- Arya STARK
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2017-06-01', 'Incarceration');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 1, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('43 Rue Du Repos', '2000-05-01', null, '69007', 'LYON 1EME', 'HostedByAThird');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('STARK', 'Demy', 'Arya', 'Eglantine', 'Madam', '1991-11-26', 'French', 'Paris', '1068152L', 'CAF',
		'87654339', true, 'Arya.stark@monadresse.com', false, 20, 20, 1234585, 'InProgress',
		'2017-09-01', '2018-12-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='CTP'), '0712211221', null, 'Married', 20, 20, '2010-02-02', '21N000019');

-- Tyrion LANNISTER
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 2, '2016-07-01', 'Hospitalisation');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 2, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('4 Rue Jean Jaures', '2000-05-01', null, '69100', 'VILLEURBANNE', 'HostedInFosterCare');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('LANNISTER', null, 'Tyrion', 'Johnattan', 'Mister', '1987-09-12', 'French', 'Besançon', '5860536K', 'MSA',
		'87654340', true, 'Tyrion.lannister@monadresse.com', true, 21, 21, 1234586, 'InProgress',
		'2016-12-01', '2018-12-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='CTP'), '0635355352', null, 'Widowed', 21, 21, '2010-02-02', '21N000020');

-- Cersei LANNISTER
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2015-10-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', true, null, 'No', null, null, null, 3, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('4 Rue De La Commune De Paris', '2000-05-01', null, '69190', 'ST FONS', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('LANNISTER', 'Varda', 'Cersei', 'Noemie', 'Madam', '1978-11-04', 'French', 'Vesoul', '8683075J', 'CAF',
		'87654341', true, 'Cersei.lannister@monadresse.com', true, 22, 22, 1234587, 'ToGuide',
		'2016-07-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé Hors RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='ESTIME'), '0637733773', null, 'Single', 22, 22, '2010-02-02', '21N000021');

-- Gregor CLEGANE
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2016-11-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2021-05-01', 'No', null, null, null, 4, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('2 Rue Croix Barret', '2000-05-01', null, '69007', 'LYON 1EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('CLEGANE', null, 'Gregor', 'Alexandre', 'Mister', '1984-05-25', 'French', 'Vierzon', '8729066H', 'CAF',
		'87654342', true, 'Gregor.clegane@monadresse.com', true, 23, 23, 1234588, 'Closed',
		'2017-02-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='FC2E FORMATION'), '0606788774', null, 'Single', 23, 23, '2010-02-02', '21N000022');

-- Sansa STARK
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 2, '2010-06-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 5, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('2167 Boulevard Pinel', '2000-05-01', null, '69008', 'LYON 67EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('STARK', null, 'Sansa', 'Johnny', 'Mister', '1966-11-20', 'French', 'Villeurbanne', '2372673G', 'CAF',
		'87654343', false, 'Sansa.stark@monadresse.com', false, 24, 24, 1234589, 'Waiting',
		'2016-02-01', null, (SELECT id
		FROM support_type
		WHERE label='Autre'), (SELECT id
		FROM STRUCTURE
		WHERE label='FC2E FORMATION'), '0707070707', null, 'Divorced', 24, 24, '2010-02-02', '21N000023');

-- Daenerys TARGARYEN
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2018-07-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2030-06-01', 'No', null, null, null, 6, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('121 Rue De Bourgogne', '2000-05-01', 'Bat. C', '69009', 'LYON 2EME', 'Homeless');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('TARGARYEN', 'Fontaine', 'Daenerys', 'Céline', 'Madam', '1993-04-21', 'French', 'Le Cap', '9789445F', 'CAF',
		'87654344', false, 'Daenerys.targaryen@monadresse.com', true, 25, 25, 1234590, 'InProgress',
		'2018-09-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='FORUM REFUGIES - COSI - ANDATU'), '0665655656', null, 'Married', 25, 25, '2010-02-02', '21N000024');

-- James BOND
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2018-06-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', false, null, 'No', null, null, null, 7, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('12 Rue De La Baisse', '2000-05-01', 'CS 202 44', '69612', 'VILLEURBANNE', 'Owner');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('BOND', null, 'James', 'Hubert', 'Mister', '1992-05-24', 'NotEuropean', 'Lyon', '7944665D', 'MSA',
		'87654345', true, 'James.bond@monadresse.com', true, 26, 26, 1234591, 'InProgress',
		'2018-09-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='FORUM REFUGIES - COSI'), '0725282729', null, 'Widowed', 26, 26, '2010-02-02', '21N000025');

-- Hercule POIROT
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2012-08-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 8, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('34 Rue De Bourgogne', '2000-05-01', null, '69009', 'LYON 2EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('POIROT', null, 'Hercule', 'Léo', 'Mister', '1980-05-16', 'NotEuropean', 'Rodez', '5381876S', 'CAF',
		'87654346', true, 'Hercule.poirot@monadresse.com', true, 27, 27, 1234592, 'ToGuide',
		'2018-01-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='GREP'), '0654144721', null, 'Single', 27, 27, '2010-02-02', '21N000026');

-- Sherlock HOLMES
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2011-11-01', 'Other');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 9, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('102 Avenue Paul Santy', '2000-05-01', null, '69008', 'LYON 7EME', 'HostedByAThird');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('HOLMES', null, 'Sherlock', 'Adam', 'Mister', '1986-08-29', 'NotEuropean', 'Paris', '3333742Q', 'CAF',
		'87654347', true, 'Sherlock.holmes@monadresse.com', false, 28, 28, 1234593, 'Closed',
		'2017-05-01', '2019-02-28', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé Hors RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='IDEO'), '0663604472', null, 'Divorced', 28, 28, '2010-02-02', '21N000027');

-- Patrick JANE
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2016-07-01', 'MovingOut');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, null, 'No', null, null, null, 10, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('11 Place Abbé Pierre', '2000-05-01', null, '69009', 'LYON 2EME', 'HostedInFosterCare');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('JANE', null, 'Patrick', 'Thibaut', 'Mister', '1990-08-30', 'NotEuropean', 'Londres', '4831866W', 'CAF',
		'87654348', true, 'Patrick.jane@monadresse.com', true, 29, 29, 1234594, 'Waiting',
		'2017-05-01', '2019-01-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='IDEO'), '0663602514', null, 'Married', 29, 29, '2010-02-02', '21N000028');

-- Gregory HOUSE
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 2, '2015-08-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', true, '2019-08-04', 'No', null, null, null, 1, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('67 Impasse Du Presbytere', '2000-05-01', null, '69008', 'LYON 6EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('HOUSE', null, 'Gregory', 'Belisére', 'Mister', '1982-01-07', 'NotEuropean', 'Vesoul', '6517974X', 'CAF',
		'87654349', true, 'Gregory.house@monadresse.com', true, 30, 30, 1234595, 'InProgress',
		'2017-08-01', null, (SELECT id
		FROM support_type
		WHERE label='Autre'), (SELECT id
		FROM STRUCTURE
		WHERE label='IFRA'), '0685546362', null, 'Widowed', 30, 30, '2010-02-02', '21N000029');

-- Walter WHITE
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(3, 3, '2017-04-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 2, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('1 Rue Marechal Leclerc', '2000-05-01', null, '69800', 'ST PRIEST', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('WHITE', null, 'Walter', 'Gérard', 'Mister', '1961-07-12', 'NotEuropean', 'Vierzon', '4778832C', 'MSA',
		'87654350', true, 'Walter.white@monadresse.com', true, 31, 31, 1234596, 'InProgress',
		'2014-10-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='IFRA'), '0736353437', null, 'Single', 31, 31, '2010-02-02', '21N000030');

-- Sheldon COOPER
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 0, '2018-04-01', 'Reorientation');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2099-01-01', 'No', null, null, null, 3, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('44 B Rue Pierre Baizet', '2000-05-01', null, '69009', 'LYON 2EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('COOPER', 'Vargas', 'Sheldon', 'Maelys', 'Madam', '1992-05-23', 'European', 'Villeurbanne', '7337639V', 'CAF',
		'87654351', false, 'Sheldon.cooper@monadresse.com', false, 32, 32, 1234597, 'ToGuide',
		'2018-10-01', '2018-10-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='IFRA'), '0745235857', null, 'Divorced', 32, 32, '2010-02-02', '21N000031');

-- Jules MAIGRET
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2017-05-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 4, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('43 Avenue Georges Rouge', '2000-05-01', null, '69120', 'VAULX EN VELIN', 'Homeless');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('MAIGRET', null, 'Jules', 'Gudule', 'Mister', '1977-10-30', 'NotEuropean', 'Le Cap', '6159153B', 'CAF',
		'87654352', false, 'Jules.maigret@monadresse.com', true, 33, 33, 1234598, 'Closed',
		'2013-08-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='IFRA'), '0645454545', null, 'Married', 33, 33, '2010-02-02', '21N000032');

-- Erika TODA
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 2, '2018-06-01', 'CompensationRunsOut');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', false, null, 'No', null, null, null, 5, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('40 Rue Leo Lagrange', '2000-05-01', null, '69200', 'VENISSIEUX', 'Owner');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('TODA', 'Christie', 'Erika', 'Gueniévre', 'Madam', '1980-09-16', 'European', 'Lyon', '1653012N', 'CAF',
		'87654353', true, 'Erika.toda@monadresse.com', true, 34, 34, 1234599, 'Waiting',
		'2018-06-01', '2018-10-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé Hors RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='INNOVATION DEVELOPPEMENT PSY'), '0698989898', null, 'Widowed', 34, 34, '2010-02-02', '21N000033');

-- Mickael SCOFIELD
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(2, 2, '2009-06-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 6, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('123 F  Rue Antoine Charial', '2000-05-01', null, '69003', 'LYON 3EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('SCOFIELD', null, 'Mickael', 'Boris', 'Mister', '1957-12-06', 'NotEuropean', 'Rodez', '2161932H', 'CAF',
		'87654354', true, 'Mickael.scofield@monadresse.com', true, 35, 35, 1234600, 'InProgress',
		'2014-03-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='LE TREMPLIN ANEPA'), '0745424178', null, 'Single', 35, 35, '2010-02-02', '21N000034');

-- Lincoln BURROWS
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2014-07-01', 'OtherSocialRight');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, null, 'No', null, null, null, 7, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('4 Rue D''Ypres', '2000-05-01', null, '69004', 'LYON 4EME', 'HostedByAThird');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('BURROWS', null, 'Lincoln', 'Renaud', 'Mister', '1975-08-26', 'NotEuropean', 'Paris', '9762123J', 'MSA',
		'87654355', true, 'Lincoln.burrows@monadresse.com', false, 36, 36, 1234601, 'InProgress',
		'2016-06-01', '2019-01-31', (SELECT id FROM support_type WHERE label='Autre'), (SELECT id FROM STRUCTURE WHERE label='LE TREMPLIN ANEPA'),
		'0790909090', null, 'Divorced', 36, 36, '2010-02-02', '21N000035');
-- Peter BISHOP
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2014-04-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2023-09-01', 'No', null, null, null, 8, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('11 Rue Rhonat', '2000-05-01', null, '69100', 'VILLEURBANNE', 'HostedInFosterCare');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('BISHOP', null, 'Peter', 'Georges', 'Mister', '1959-07-08', 'NotEuropean', 'Londres', '3570958U', 'CAF',
		'87654356', true, 'Peter.bishop@monadresse.com', true, 37, 37, 1234602, 'ToGuide',
		'2018-04-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='MAISON SOCIALE DE CYPRIAN'), '0658326507', null, 'Married', 37, 37, '2010-02-02', '21N000036');

-- Dexter MORGAN
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(3, 1, '2018-01-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', false, null, 'No', null, null, null, 9, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('321 Cours Andre Philip', '2000-05-01', null, '69100', 'VILLEURBANNE', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('MORGAN', null, 'Dexter', 'Jean-Luc', 'Mister', '1964-01-01', 'NotEuropean', 'Vesoul', '4964684Y', 'CAF',
		'87654357', true, 'Dexter.morgan@monadresse.com', true, 38, 38, 1234603, 'Closed',
		'2018-09-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='MEDIALYS'), '0798959693', null, 'Widowed', 38, 38, '2010-02-02', '21N000037');

-- Indiana JONES
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2015-12-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2024-05-01', 'No', null, null, null, 10, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('20 Rue Mathieu Dussurgey', '2000-05-01', null, '69190', 'ST FONS', null);
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('JONES', null, 'Indiana', 'Tom', 'Mister', '1987-10-04', 'NotEuropean', 'Vierzon', '2670119T', 'CAF',
		'87654358', true, 'Indiana.jones@monadresse.com', true, 39, 39, 1234604, 'Waiting',
		'2018-07-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='MEDIALYS'), '0745434247', null, 'Single', 39, 39, '2010-02-02', '21N000038');

-- Han SOLO
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2017-11-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 1, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('41 Avenue Du Point Du Jour', '2000-05-01', null, '69005', 'LYON 2EME', null);
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('SOLO', null, 'Han', 'Jean-Patrick', 'Mister', '1980-01-22', 'NotEuropean', 'Villeurbanne', '2436310G', 'CAF',
		'87654359', false, 'Han.solo@monadresse.com', false, 40, 40, 1234605, 'InProgress',
		'2018-10-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé Hors RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='MEDIALYS'), '0658878985', null, 'Divorced', 40, 40, '2010-02-02', '21N000039');

-- John MCCLANE
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2009-06-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 2, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('67  Rue Juiverie', '2000-05-01', null, '69005', 'LYON 2EME', 'Homeless');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('MCCLANE', null, 'John', 'Renaud', 'Mister', '1964-08-16', 'European', 'Le Cap', '7637572F', 'MSA',
		'87654360', false, 'John.mcclane@monadresse.com', true, 41, 41, 1234606, 'InProgress',
		'2009-06-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='AJD - MIRLY'), '0745566321', null, 'Married', 41, 41, '2010-02-02', '21N000040');

-- Dark VADOR
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2013-07-01', 'Death');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', false, null, 'No', null, null, null, 3, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('22 Rue Saint Philippe', '2000-05-01', null, '69003', 'LYON 3EME', 'Owner');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('VADOR', null, 'Dark', 'Luc', 'Mister', '1983-03-17', 'European', 'Lyon', '3778579R', 'CAF',
		'87654361', true, 'Dark.vador@monadresse.com', true, 42, 42, 1234607, 'ToGuide',
		'2014-02-01', '2019-03-31', (SELECT id
		FROM support_type
		WHERE label='Autre'), (SELECT id
		FROM STRUCTURE
		WHERE label='REN - RHONE ALPES EMPLOIS NOUVEAUX'), '0689878485', null, 'Widowed', 42, 42, '2010-02-02', '21N000041');

-- Marty MCFLY
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2017-09-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, null, 'No', null, null, null, 4, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('1 Rue Du Chapeau Rouge', '2000-05-01', null, '69009', 'LYON 2EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('MCFLY', null, 'Marty', 'Donald', 'Mister', '1979-09-05', 'European', 'Rodez', '5913879E', 'CAF',
		'87654362', true, 'Marty.mcfly@monadresse.com', true, 43, 43, 1234608, 'Closed',
		'2018-01-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='REN - RHONE ALPES EMPLOIS NOUVEAUX'), '0636353458', null, 'Single', 43, 43, '2010-02-02', '21N000042');

-- Iron MAN
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2009-06-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2012-01-01', 'No', null, null, null, 5, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('2 Rue Burdeau', '2000-05-01','Bat. A', '69001', 'LYON 1ER', 'HostedByAThird');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('MAN', null, 'Iron', 'Ray', 'Mister', '1971-02-08', 'European', 'Paris', '6116330D', 'CAF',
		'87654363', true, 'Iron.man@monadresse.com', false, 44, 44, 1234609, 'Waiting',
		'2009-06-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='SOLID''ARTE'), '0689877456', null, 'Single', 44, 44, '2010-02-02', '21N000043');

-- Jack SPARROW
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2017-06-01', 'Hospitalisation');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 6, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('367 Rue De La Tete D''Or', '2000-05-01', null, '69006', 'LYON 4EME', 'HostedInFosterCare');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('SPARROW', null, 'Jack', 'Ladislas', 'Mister', '1986-10-21', 'European', 'Londres', '5535286S', 'CAF',
		'87654364', true, 'Jack.sparrow@monadresse.com', true, 45, 45, 1234610, 'InProgress',
		'2018-01-01', '2019-04-30', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='UFCS'), '0698784158', null, 'Divorced', 45, 45, '2010-02-02', '21N000044');

-- Rocky BALBOA
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2018-03-01', 'Other');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', true, '2022-01-01', 'No', null, null, null, 7, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('211 Rue Deleuvre', '2000-05-01', null, '69004', 'LYON 4EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('BALBOA', null, 'Rocky', 'Charles', 'Mister', '1984-02-26', 'European', 'Vesoul', '7769420Z', 'MSA',
		'87654365', true, 'Rocky.balboa@monadresse.com', true, 46, 46, 1234611, 'InProgress',
		'2018-06-01', '2019-04-30', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé Hors RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='UFCS'), '0685828464', null, 'Married', 46, 46, '2010-02-02', '21N000045');

-- Captain AMERICA
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2014-12-01', 'CompensationRunsOut');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 8, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('43 Rue D'' Inkermann', '2000-05-01', null, '69006', 'LYON 4EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('AMERICA', null, 'Captain', 'Paul', 'Mister', '1983-07-29', 'European', 'Vierzon', '2301655A', 'CAF',
		'87654366', true, 'Captain.america@monadresse.com', true, 47, 47, 1234612, 'ToGuide',
		'2017-03-01', '2019-01-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='UNIS VERS L''EMPLOI'), '0689878485', null, 'Widowed', 47, 47, '2010-02-02', '21N000046');

-- Luke SKYWALKER
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2016-12-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 9, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('43 Rue Moliere', '2000-05-01', null, '69006', 'LYON 4EME', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('SKYWALKER', null, 'Luke', 'Magid', 'Mister', '1991-10-04', 'European', 'Villeurbanne', '3613160Q', 'CAF',
		'87654367', false, 'Luke.skywalker@monadresse.com', false, 48, 48, 1234613, 'Closed',
		'2017-03-01', null, (SELECT id
		FROM support_type
		WHERE label='Autre'), (SELECT id
		FROM STRUCTURE
		WHERE label='UNIS VERS L''EMPLOI'), '0690874525', null, 'Single', 48, 48, '2010-02-02', '21N000047');

-- Obi-Wan KENOBI
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2016-12-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 10, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('11 Avenue General Leclerc', '2000-05-01', null, '69140', 'RILLIEUX LA PAPE', 'Homeless');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('KENOBI', null, 'Obi-Wan', 'Mohamed', 'Mister', '1972-02-02', 'European', 'Le Cap', '7385275S', 'CAF',
		'87654368', false, 'Obi-Wan.kenobi@monadresse.com', true, 49, 49, 1234614, 'Waiting',
		'2015-09-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='CCAS DE RILLIEUX LA PAPE'), '0689582136', null, 'Divorced', 49, 49, '2010-02-02', '21N000048');

-- Amélie POULAIN
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2013-11-01', 'MovingOut');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', true, null, 'No', null, null, null, 1, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('32 Rue Jules Michelet', '2000-05-01', null, '69140', 'RILLIEUX LA PAPE', 'Owner');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('POULAIN', 'De Mesmacker', 'Amélie', 'Amélie', 'Madam', '1973-06-26', 'European', 'Lyon', '2154080D', 'CAF',
		'87654369', true, 'Amelie.poulain@monadresse.com', true, 50, 50, 1234615, 'InProgress',
		'2017-02-01', '2019-01-31', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Diversifié'), (SELECT id
		FROM STRUCTURE
		WHERE label='CCAS DE RILLIEUX LA PAPE'), '0748525654', null, 'Married', 50, 50, '2010-02-02', '21N000049');

-- Axel FOLEY
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(0, 0, '2018-08-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2023-01-01', 'No', null, null, null, 2, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('10 Avenue Du Mont Blanc', '2000-05-01', 'Lieu dit le Marais', '69140', 'RILLIEUX LA PAPE', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('FOLEY', null, 'Axel', 'Lucio', 'Mister', '1970-08-05', 'European', 'Rodez', '2402848F', 'MSA',
		'87654370', true, 'Axel.foley@monadresse.com', true, 51, 51, 1234616, 'InProgress',
		'2016-12-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='CCAS DE RILLIEUX LA PAPE'), '0789969358', null, 'Widowed', 51, 51, '2010-02-02', '21N000050');

-- Katniss EVERDEEN
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2017-08-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, false, null, 'No', null, null, null, 3, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('44 Rue Florian', '2000-05-01', null, '69100', 'VILLEURBANNE', 'HostedByAThird');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('EVERDEEN', 'Kahlo', 'Katniss', 'Annie', 'Madam', '1980-11-23', 'French', 'Belfort', '8604423G', 'CAF',
		'87654371', true, 'Katniss.everdeen@monadresse.com', false, 52, 52, 1234617, 'ToGuide',
		'2018-04-01', null, (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Renforcé Hors RSA'), (SELECT id
		FROM STRUCTURE
		WHERE label='Centre d''animation SAINT JEAN'), '0689858286', null, 'Single', 52, 52, '2010-02-02', '21N000051');

-- Sarah CONNOR
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2013-05-01', 'Reorientation');
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(false, null, true, '2024-01-01', 'No', null, null, null, 4, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('4 Avenue De La Division Leclerc', '2000-05-01', null, '69200', 'VENISSIEUX', 'HostedInFosterCare');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('CONNOR', 'Bausch', 'Sarah', 'Célia', 'Madam', '1971-04-05', 'NotEuropean', 'Londres', '9907392H', 'CAF',
		'87654372', true, 'Sarah.connor@monadresse.com', true, 53, 53, 1234618, 'Closed',
		'2014-11-01', '2018-11-30', (SELECT id
		FROM support_type
		WHERE label='Itinéraire emploi Innovant'), (SELECT id
		FROM STRUCTURE
		WHERE label='SAFORE'), '0695742125', null, 'Divorced', 53, 53, '2010-02-02', '21N000052');

-- Ethan HUNT
INSERT INTO beneficiary_complement
	("childrenCount", "dependentsNumber", "rsaRightBeginDate", "reasonOrientationEnding")
VALUES
	(1, 1, '2009-06-01', null);
INSERT INTO beneficiary_employment
	("accreditationSIAE", "accreditationSIAEDate", "rqth", "expiryRqthDate", "entrepreneur", "beginDateEntrepreneurship", "endDateEntrepreneurship", "sectorId", "degreeId", "studyAbroad")
VALUES
	(true, '2018-10-01', false, null, 'No', null, null, null, 5, false);
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city", "residentialStatus")
VALUES
	('24 Rue Robert Reynier', '2000-05-01', null, '69190', 'ST FONS', 'Tenant');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('HUNT', null, 'Ethan', 'Henri', 'Mister', '1971-08-17', 'European', 'Vienne', '1765668H', 'CAF',
		'87654373', true, 'Ethan.hunt@monadresse.com', true, 54, 54, 1234619, 'Waiting',
		'2017-04-01', null, (SELECT id
		FROM support_type
		WHERE label='Autre'), (SELECT id
		FROM STRUCTURE
		WHERE label='ELANTIEL'), '0605848656', null, 'Married', 54, 54, '2010-02-02', '21N000053');

-- Sacha Salazard /!\ Incomplet
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city")
VALUES
	('4 rue de la Paix', '2000-05-01', null, '37400', 'Amboise');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('SALAZARD', null, 'Sacha', null, 'Mister', '1984-06-20', 'French', null, null, null,
		null, null, null, null, 55, 55, null, null,
		null, null, (SELECT id
		FROM support_type
		WHERE label='Autre'), null, null, null, null, null, null, '2010-02-02', '21N000054');

-- Samuel Salazard /!\ Incomplet
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city")
VALUES
	('7 rue de la Paix', '2000-05-01', null, '37400', 'Amboise');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('SALAZARD', null, 'Samuel', null, 'Mister', '1984-06-20', 'French', null, null, null,
		null, null, null, null, 56, 56, null, null,
		null, null, (SELECT id
		FROM support_type
		WHERE label='Autre'), null, null, null, null, null, null, '2010-02-02', '21N000055');

-- Sarah Salazard /!\ Incomplet
INSERT INTO beneficiary_address
	("address", "beginDate", "additionalAddress", "postalCode", "city")
VALUES
	('9 rue de la Paix', '2000-05-01', null, '37400', 'Amboise');
INSERT INTO beneficiary
	("usualName", "surname", "firstName", "secondName", "title", "birthDate", "nationality", "birthCity", "jobCenterNumber", "attachedOrganization",
	"recipientNumber", "sms", "emailAddress", "email", "residentialAddressId", "postalAddressId", "iodasNumber", "status",
	"orientationBeginDate", "orientationEndDate", "supportTypeId", "structureId", "cellPhoneNumber", "landlineNumber", "maritalStatus", "beneficiaryComplementId",
	"beneficiaryEmploymentId", "beginDateSupport", "insertisId")
VALUES
	('SALAZARD', null, 'Sarah', null, 'Mister', '1984-06-20', 'French', null, null, null,
		null, null, null, null, 57, 57, null, null,
		null, null, (SELECT id
		FROM support_type
		WHERE label='Autre'), null, null, null, null, null, null, '2010-02-02', '21N000056');
