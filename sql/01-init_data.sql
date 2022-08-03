-- Support types
INSERT INTO support_type VALUES (1, 'Itinéraire activité');
INSERT INTO support_type VALUES (2, 'Itinéraire emploi Diversifié');
INSERT INTO support_type VALUES (3, 'Itinéraire emploi Renforcé RSA');
INSERT INTO support_type VALUES (4, 'Itinéraire emploi Renforcé Hors RSA');
INSERT INTO support_type VALUES (5, 'Itinéraire emploi Innovant');
INSERT INTO support_type VALUES (6, 'Autre');
INSERT INTO support_type VALUES (7, 'PLIE');
INSERT INTO support_type VALUES (8, 'RSJ');
INSERT INTO support_type VALUES (9, 'Itinéraire emploi Renforcé RSJ');
INSERT INTO support_type VALUES (10, 'Itinéraire emploi Innovant - Acq compétences');
INSERT INTO support_type VALUES (11, 'Itinéraire emploi Innovant - Autre');
INSERT INTO support_type VALUES (12, 'Itinéraire emploi Innovant - Garde d''enfant');
INSERT INTO support_type VALUES (13, 'Itinéraire emploi Innovant - Job coaching');
INSERT INTO support_type VALUES (14, 'Itinéraire emploi Innovant - PSP');
INSERT INTO support_type VALUES (15, 'Itinéraire emploi Innovant - Remobilisation');
INSERT INTO support_type VALUES (16, 'Itinéraire emploi Diversifié - Entrepreneurs');

-- Interview theme
INSERT INTO interview_theme
    (label)
VALUES
    ('Premier entretien');
INSERT INTO interview_theme
    (label)
VALUES
    ('Point d''étape');
INSERT INTO interview_theme
    (label)
VALUES
    ('Diagnostic');
INSERT INTO interview_theme
    (label)
VALUES
    ('Définition projet');
INSERT INTO interview_theme
    (label)
VALUES
    ('Bilan accompagnement');
INSERT INTO interview_theme
    (label)
VALUES
    ('Accés aux droits');
INSERT INTO interview_theme
    (label)
VALUES
    ('Rendez-vous de suivi');
INSERT INTO interview_theme
    (label)
VALUES
    ('Élaboration contrat');
INSERT INTO interview_theme
    (label)
VALUES
    ('Demande administative');
INSERT INTO interview_theme
    (label)
VALUES
    ('Mise en relation offre d''emploi');
INSERT INTO interview_theme
    (label)
VALUES
    ('Préparation entretien recrutement');
INSERT INTO interview_theme
    (label)
VALUES
    ('Première demande RSJ');
INSERT INTO interview_theme
    (label)
VALUES
    ('Renouvellement RSJ');
INSERT INTO interview_theme
    (label)
VALUES
    ('Autre');

-- Domaines d'intervention
INSERT INTO "focus_area" values (1, 'Accompagnement bénéficiaires');
INSERT INTO "focus_area" values (2, 'Accompagnement à l''emploi/compétences clés');
INSERT INTO "focus_area" values (3, 'Aide à la mobilité');
INSERT INTO "focus_area" values (4, 'Apprentissage de la langue française');
INSERT INTO "focus_area" values (5, 'Inclusion numérique');
INSERT INTO "focus_area" values (6, 'Socialisation/Remobilisation');
INSERT INTO "focus_area" values (7, 'Santé');
INSERT INTO "focus_area" values (8, 'Ateliers et chantiers d''insertion');
INSERT INTO "focus_area" values (9, 'Entreprise d''insertion');

-- Structure
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (3, '069ASSOCAD', 'ADIE', '2 Avenue Leclerc', NULL, '69007', 'Lyon', '{"lon":4.833647,"lat":45.74744}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (4, '069ASSOADL', 'ADL (DEVELOPPEMENT LOCAL)', '13 Rue Docteur Ollier', NULL, '69100', 'Villeurbanne', '{"lon":4.882968,"lat":45.767794}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (5, 'INS001ALJ', 'Aide au Logement des Jeunes', '23 Rue Gabriel Péri', NULL, '69100', 'Villeurbanne', '{"lon":4.864143,"lat":45.771244}', true, NULL, '41143717100043', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (7, '3487458780', 'AIDEN CHANTIERS (EX-ADN)', '454 Avenue de la Sauvegarde', NULL, '69009', 'Lyon', '{"lon":4.790169,"lat":45.787432}', true, NULL, '81516960200019', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (8, '069ASSOAJ2', 'AJ2 - PERMANENCE EMPLOI', '41 Rue Smith', NULL, '69002', 'Lyon', '{"lon":4.823626,"lat":45.744068}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (9, '069ASSOMIR', 'AJD - MIRLY', '18 Rue des Deux Amants', NULL, '69009', 'Lyon', '{"lon":4.795077,"lat":45.769061}', true, NULL, '52247989800010', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (11, '069ASSOAL*', 'ALIZES FORMATION', '65 Boulevard Laurent Gérin', NULL, '69200', 'Vénissieux', '{"lon":4.883819,"lat":45.700775}', true, NULL, '38915768600020', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (12, '069ASSOALP', 'ALPES', '13 Rue Delandine', NULL, '69002', 'Lyon', '{"lon":4.827544,"lat":45.746986}', true, NULL, '32512320600048', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (13, '478501605', 'ALYNEA', '53 Rue Dubois Crance', NULL, '69600', 'Oullins', '{"lon":4.817617,"lat":45.713368}', true, NULL, '30136563100037', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (14, '069ASSOAMI', 'AMIS DE LA RUE', '28bis Rue d’Alsace', NULL, '69100', 'Villeurbanne', '{"lon":4.869841,"lat":45.769049}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (16, '37987393', 'ARTAG', '185 Rue Jean Voillot', 'CS 700 27', '69100', 'Villeurbanne', '{"lon":4.91148,"lat":45.752659}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (18, '069ASSOCAS', 'ASPIE ST PRIEST', '20 Rue Bel Air', NULL, '69800', 'Saint-Priest', '{"lon":4.946911,"lat":45.691694}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (20, 'INS002ALIES', 'Association Lyonnaise pour L''Insertion Economique et Sociale', '24 Rue Etienne Rognon', NULL, '69007', 'Lyon', '{"lon":4.83572,"lat":45.74616}', true, NULL, '40540488000040', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (21, 'INS003APCN', 'Association pépinière Cap Nord', '28 Avenue Général Leclerc', NULL, '69140', 'Rillieux-la-Pape', '{"lon":4.904354,"lat":45.814555}', true, NULL, '49966754100019', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (23, '319529994', 'Association pour l''Insertion des Jeunes par l''Economique - Hommes et environnement', '15 Avenue de la Division Leclerc', 'AIJE espaces verts', '69200', 'Vénissieux', '{"lon":4.869605,"lat":45.69482}', true, NULL, '34422913300022', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (24, 'INS005ATIS', 'Association Recherche Handicap et santé Mentale - Centre Atis', '290 Route de Vienne', NULL, '69008', 'Lyon', '{"lon":4.853871,"lat":45.724656}', true, NULL, '77986872800634', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (25, 'INS006LYADE', 'Association Recherche Handicap et santé Mentale - Pôle Lyade', '31 Rue de l’Abondance', NULL, '69003', 'Lyon', '{"lon":4.85252,"lat":45.753666}', true, NULL, '77986872800634', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (26, '4026367570', 'CAP SERVICES', '11 Rue Duphot', NULL, '69003', 'Lyon', '{"lon":4.843804,"lat":45.757467}', true, NULL, '40263675700039', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (43, '6914', 'CCAS D''ECULLY', 'Place de la Libération', NULL, '69130', 'Écully', '{"lon":4.778249,"lat":45.775762}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (28, '069CCAS3', 'CCAS DE CALUIRE ET CUIRE', 'Place du Docteur Frédéric Dugoujon', 'BP 79', '69300', 'Caluire-et-Cuire', '{"lon":4.842175,"lat":45.796526}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (29, '69271', 'CCAS DE CHASSIEU', '8 Rue Louis Pergaud', 'BP 59', '69680', 'Chassieu', '{"lon":4.971188,"lat":45.739275}', true, NULL, '26690065300012', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (30, '069CCAS5', 'CCAS DE CRAPONNE', '1 Place Charles de Gaulle', NULL, '69290', 'Craponne', '{"lon":4.723235,"lat":45.7434}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (31, 'DARDILLY', 'CCAS DE DARDILLY', '6 Chemin de la Grabottière', NULL, '69570', 'Dardilly', '{"lon":4.753221,"lat":45.80593}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (33, '069CCAS089', 'CCAS DE FRANCHEVILLE', '1 Rue du Temps des Cerises', NULL, '69340', 'Francheville', '{"lon":4.777172,"lat":45.738844}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (34, '6936', 'CCAS DE LA MULATIERE', '1 Place Jean Moulin', NULL, '69350', 'La Mulatière', '{"lon":4.809697,"lat":45.728654}', true, NULL, '26691009000023', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (35, '6924', 'CCAS DE MEYZIEU', 'Place de l’Europe', 'Hôtel de Ville - BP 122', '69330', 'Meyzieu', '{"lon":5.004835,"lat":45.765618}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (37, '2669103300', 'CCAS DE RILLIEUX LA PAPE', '165 Rue Ampère', 'BP 111', '69140', 'Rillieux-la-Pape', '{"lon":4.899909,"lat":45.818686}', true, NULL, '26691033000015', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (38, '3029316700', 'CCAS DE ST FONS', 'Place Roger Salengro', 'BP 100', '69190', 'Saint-Fons', '{"lon":4.852529,"lat":45.708789}', true, NULL, '26691024900017', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (39, '6931', 'CCAS DE ST GENIS LAVAL', '106 Avenue Georges Clémenceau', NULL, '69230', 'Saint-Genis-Laval', '{"lon":4.794667,"lat":45.698447}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (41, '69362', 'CCAS DE STE FOY LES LYON', '10 Rue Deshay', NULL, '69110', 'Sainte-Foy-lès-Lyon', '{"lon":4.800144,"lat":45.73634}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (42, '2169025690', 'CCAS DE VAULX EN VELIN', 'Place de la Nation', 'CS 40002', '69120', 'Vaulx-en-Velin', '{"lon":4.921221,"lat":45.778049}', true, NULL, '26691025600079', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (44, '069ASSOCEF', 'CEFI', '11 Rue Alsace-Lorraine', NULL, '69500', 'Bron', '{"lon":4.912066,"lat":45.734074}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (46, 'INS007CPCT', 'Centre Psychanalytique de Consultation et de Traitement', '84 Rue de Marseille', NULL, '69007', 'Lyon', '{"lon":4.838217,"lat":45.749031}', true, NULL, '49919778800031', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (47, '690798939', 'Centre Social de Cusset', '89 Rue Pierre Voyant', NULL, '69100', 'Villeurbanne', '{"lon":4.900419,"lat":45.767632}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (48, '690793088', 'Centre Social des Buers', '17 Rue Pierre-Joseph Proudhon', NULL, '69100', 'Villeurbanne', '{"lon":4.89107,"lat":45.774285}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (49, 'CENGER', 'Centre social et culturel Gérard Philipe', '11 Rue Gérard Philipe', NULL, '69500', 'Bron', '{"lon":4.918315,"lat":45.742014}', true, NULL, '77966837500024', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (51, '690796172', 'Centre Social TASSIN LA DEMI LUNE', '29 Avenue du 11 Novembre 1918', NULL, '69160', 'Tassin-la-Demi-Lune', '{"lon":4.766495,"lat":45.763445}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (19, 'CENLAV', 'Centres sociaux de Rillieux-la-Pape', '85 Avenue de l’Europe', 'BP 18', '69140', 'Rillieux-la-Pape', '{"lon":4.904968,"lat":45.818791}', true, NULL, '77980397200016', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (52, '069ASSOCER', 'CERTA', '3 Rue de la Démocratie', NULL, '69200', 'Vénissieux', '{"lon":4.881763,"lat":45.694668}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (53, '186920013', 'Chambre de Métiers et de l''Artisanat 69', '10 Rue Paul Montrochet', NULL, '69002', 'Lyon', '{"lon":4.81743,"lat":45.740004}', true, NULL, '18692001300080', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (55, 'MNEUVI', 'Commune de Neuville sur Saone', 'Place du 8 Mai 1945', NULL, '69250', 'Neuville-sur-Saône', '{"lon":4.840432,"lat":45.877617}', true, NULL, '21690143900010', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (56, '3891430090', 'Confédération des petites et moyennes entreprises', '55 Rue Sergent Michel Berthet', NULL, '69009', 'Lyon', '{"lon":4.805552,"lat":45.7666}', true, NULL, '31680936700055', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (57, '069ASSOCTP', 'CTP', '25 Rue des Fossés de Trion', 'Espace Benoist-Mary', '69005', 'Lyon', '{"lon":4.812195,"lat":45.755946}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (59, '069ASSOREC', 'ELANTIEL', '158 Avenue Francis de Pressensé', NULL, '69200', 'Vénissieux', '{"lon":4.8675,"lat":45.72047}', true, NULL, '49308598900017', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (60, 'INS009ELITS', 'Elits propreté', '13bis Rue Girié', NULL, '69003', 'Lyon', '{"lon":4.875718,"lat":45.753681}', true, NULL, '45038562000023', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (61, 'INS010ECFAP', 'EMMAUS CONNECT FONDATEUR ABBE PIERRE', '71 Rue Archereau', NULL, '75019', 'Paris', '{"lon":2.376365,"lat":48.893271}', true, NULL, '79227291600026', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (62, '69107705', 'ENTRAIDE PIERRE VALDO - CPH', '142 Rue Joliot Curie', NULL, '69160', 'Tassin-la-Demi-Lune', '{"lon":4.774921,"lat":45.753508}', true, NULL, '43980837900085', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (63, '691000003', 'Envie Rhône', '12 Rue de Cronstadt', NULL, '69007', 'Lyon', '{"lon":4.850131,"lat":45.740811}', true, NULL, '38367939600028', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (66, '3527517470', 'ESTIME', '3 Allée du Merle Rouge', NULL, '69190', 'Saint-Fons', '{"lon":4.852393,"lat":45.70783}', true, NULL, '35275174700044', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (67, '069ASSOFC2', 'FC2E FORMATION', '132 Avenue Franklin Roosevelt', 'BP 94', '69500', 'Bron', '{"lon":4.907374,"lat":45.733891}', true, NULL, '43964064000025', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (68, '794239236Z', 'Fondation d''Auteuil - CFC Rhône Alpes-AMEJ', '76 Rue Bellecombe', NULL, '69006', 'Lyon', '{"lon":4.863523,"lat":45.764823}', true, NULL, '77568879901829', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (70, 'FORUMRECPH', 'FORUM REFUGIES - COSI', '4 Rue de Narvik', NULL, '69008', 'Lyon', '{"lon":4.882615,"lat":45.730159}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (71, 'FORUMREF', 'FORUM REFUGIES - COSI - ANDATU', '28 Rue de la Baïsse', 'CS 71054', '69100', 'Villeurbanne', '{"lon":4.893067,"lat":45.763356}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (72, '690016', 'FOYER NOTRE DAME DES SANS ABRI', 'Rue Père Chevrier', NULL, '69007', 'Lyon', '{"lon":4.843777,"lat":45.748951}', true, NULL, '77564967600019', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (73, '069ASSOCCE', 'FRANCE HORIZON', 'Chemin Champ Perrier', 'CS 36008', '69320', 'Feyzin', '{"lon":4.862788,"lat":45.683083}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (75, '3348202300', 'GREP', '63 Rue André Bollier', NULL, '69007', 'Lyon', '{"lon":4.831798,"lat":45.734577}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (76, '691139', 'HABITAT ET HUMANISME', '9 Rue Mathieu Varille', NULL, '69007', 'Lyon', '{"lon":4.826592,"lat":45.732821}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (78, '069ASSOHUI', 'HUITIEME DIMENSION', '154 Rue Professeur Beauvisage', NULL, '69008', 'Lyon', '{"lon":4.864651,"lat":45.728775}', true, NULL, '39760428100014', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (79, '4280863261', 'ICARE - INSERTION', '33 Chemin de Bellissen', 'Parc du CHATER Bat E3', '69340', 'Francheville', '{"lon":4.773158,"lat":45.749963}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (80, '069ASSOPAR', 'IDEO', '14bis Rue de Narvik', NULL, '69008', 'Lyon', '{"lon":4.883468,"lat":45.729768}', true, NULL, '50217567200018', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (81, '069ASSOIFR', 'IFRA', '66 Cours Tolstoï', NULL, '69100', 'Villeurbanne', '{"lon":4.875963,"lat":45.763122}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (83, '069ASSO', 'INNOVATION ET DEVELOPPEMENT PSY', '3 Allée du Merle Rouge', NULL, '69190', 'Saint-Fons', '{"lon":4.852393,"lat":45.70783}', true, NULL, '40205047000028', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (84, '4113060870', 'INSERTION EMPLOIS SERVICE', '100 Cours Docteur Long', NULL, '69003', 'Lyon', '{"lon":4.88934,"lat":45.751021}', true, NULL, '41130608700023', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (85, 'INS011ITEM', 'Insertion Travail Emplois Multiservices (ITEM)', '6 Rue de la Liberté', NULL, '69160', 'Tassin-la-Demi-Lune', '{"lon":4.779217,"lat":45.764383}', true, NULL, '43893389700011', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (86, '4844954780', 'Jardins d''avenir', 'Chemin du Colombier', NULL, '69850', 'Saint-Martin-en-Haut', '{"lon":4.576108,"lat":45.672031}', true, NULL, '48449547800022', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (87, '691008246', 'LA CHARADE - HOTEL SOCIAL', '259 Rue Paul Bert', NULL, '69003', 'Lyon', '{"lon":4.86773,"lat":45.756729}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (88, 'INS012LCS', 'La Cravate solidaire', '5 Chemin de Montlouis', NULL, '69600', 'Oullins', '{"lon":4.78939,"lat":45.715421}', true, NULL, '82008123000014', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (89, '3029374208', 'LAHSO - LE GRENIER', '259 Rue Paul Bert', NULL, '69003', 'Lyon', '{"lon":4.86773,"lat":45.756729}', true, NULL, '30293742000156', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (90, '3029374200', 'LAHSO - POINT ACCUEIL', '66 Rue Etienne Richerand', NULL, '69003', 'Lyon', '{"lon":4.865944,"lat":45.758784}', true, NULL, '30293742000081', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (92, 'INS013LPJ', 'Le passe-jardins', '131 Rue Challemel Lacour', NULL, '69008', 'Lyon', '{"lon":4.85116,"lat":45.729828}', true, NULL, '42195987500020', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (93, '069ASSOTRE', 'LE TREMPLIN ANEPA', '13 Rue des Augustins', NULL, '69001', 'Lyon', '{"lon":4.831184,"lat":45.767771}', true, NULL, '31247738300045', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (94, 'INS014LV', 'Le Valdocco', '20 Chemin de la Poterie', NULL, '69340', 'Francheville', '{"lon":4.759631,"lat":45.747925}', true, NULL, '40394455600014', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (97, '433528312', 'Les jardins de Lucie', '69 Chemin du Tram', NULL, '69360', 'Communay', '{"lon":4.82887,"lat":45.593722}', true, NULL, '43352831200021', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (98, 'INS015LVE', 'Les vitaminés de l''emploi ', '16 Rue Branly', NULL, '69100', 'Villeurbanne', '{"lon":4.881511,"lat":45.770456}', true, NULL, '83518267600014', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (99, 'INS016MAIA', 'Maia', '6 Rue de la Liberté', NULL, '69160', 'Tassin-la-Demi-Lune', '{"lon":4.779217,"lat":45.764383}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (101, '691004415', 'MAISON SOCIALE DE CYPRIAN', '4 Rue Jules Guesde', NULL, '69100', 'Villeurbanne', '{"lon":4.903015,"lat":45.755262}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (102, '4899175670', 'MEDIALYS', '27 Rue d’Alsace', NULL, '69100', 'Villeurbanne', '{"lon":4.869994,"lat":45.767756}', true, NULL, '48991756700047', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (103, '069MLBRODM', 'MISSION LOCALE BRON DECINES MEYZIEU', '11 Avenue Jean Jaurès', NULL, '69150', 'Décines-Charpieu', '{"lon":4.937999,"lat":45.768497}', true, NULL, '38175165000023', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (105, '069MLVAULX', 'MISSION LOCALE VAULX EN VELIN', '3 Avenue Georges Dimitrov', NULL, '69120', 'Vaulx-en-Velin', '{"lon":4.921733,"lat":45.776739}', true, NULL, '32866815700014', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (106, 'INS019MER', 'Mode d''emploi Rhône', '60 Avenue Jean Mermoz', NULL, '69008', 'Lyon', '{"lon":4.877513,"lat":45.733643}', true, NULL, '43520499500011', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (107, '3486187100', 'MULTI SERVICES DEVELOPPEMENT', 'Place Henri Barbusse', NULL, '69150', 'Décines-Charpieu', '{"lon":4.96515,"lat":45.762987}', true, NULL, '34861871100041', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (108, '069ASSOOPE', 'OBJECTIF POUR L''EMPLOI', 'Rue de la Cité', NULL, '69003', 'Lyon', '{"lon":4.872415,"lat":45.759947}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (109, '434304960', 'OFELIA', '1 Cours Albert Thomas', NULL, '69003', 'Lyon', '{"lon":4.860816,"lat":45.749313}', true, NULL, '43430496000033', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (111, 'INS021OIM', 'Osons ici et maintenant ', '2 Rue Professeur Zimmermann', NULL, '69007', 'Lyon', '{"lon":4.836502,"lat":45.745744}', true, NULL, '81016086100029', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (112, '691030146', 'PENICHE ACCUEIL', '37 Quai Docteur Gailleton', 'Péniche le Balajo', '69002', 'Lyon', '{"lon":4.832282,"lat":45.751387}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (113, 'INS022PC', 'PEPINIERE CARCO', '24 Rue Robert Desnos', NULL, '69120', 'Vaulx-en-Velin', '{"lon":4.928064,"lat":45.775165}', true, NULL, '43968211300014', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (114, 'INS023PLM', 'PIMMS LYON METROPOLE', '5 Place Dumas de Loire', NULL, '69009', 'Lyon', '{"lon":4.805198,"lat":45.77267}', true, NULL, '40036201800030', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (115, '4028236940', 'Plan d''Action sur Site', '61 Cours de la Liberté', NULL, '69003', 'Lyon', '{"lon":4.842866,"lat":45.757366}', true, NULL, '40282369400045', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (117, '4043451340', 'POTAGERS DU GARON', '46 Rue de Pressensé', NULL, '69520', 'Grigny', '{"lon":4.774634,"lat":45.601251}', true, NULL, '40434513400021', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (118, '433335171', 'Prestal SARL', '10 Rue Louis Duclos', NULL, '69120', 'Vaulx-en-Velin', '{"lon":4.925854,"lat":45.786932}', true, NULL, '43333517100016', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (119, '690162000', 'REED', '130 Rue de Sèze', NULL, '69006', 'Lyon', '{"lon":4.857489,"lat":45.769073}', true, NULL, '32695540800033', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (120, '3847795400', 'REED - RHONE EMPLOIS DEVELOPPEMENTS', '42 Grande Rue de Vaise', NULL, '69009', 'Lyon', '{"lon":4.808289,"lat":45.773875}', true, NULL, '38479954000032', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (121, '3913196700', 'Régie de quartier Amir', '1 Rue Boileau', NULL, '69140', 'Rillieux-la-Pape', '{"lon":4.889218,"lat":45.812863}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (123, '3896691280', 'Régie de Quartiers EUREQUA', '2 Rue Joseph Chalier', NULL, '69008', 'Lyon', '{"lon":4.883391,"lat":45.729339}', true, NULL, '38966912800065', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (124, '069ASSOREN', 'REN - RHONE ALPES EMPLOIS NOUVEAUX', '38 Grande Rue de Vaise', NULL, '69009', 'Lyon', '{"lon":4.808096,"lat":45.773965}', true, NULL, '42412249700029', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (125, 'INS024RM', 'Repères Métropole', '43 Allée du Mens', NULL, '69100', 'Villeurbanne', '{"lon":4.906171,"lat":45.780382}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (126, '069ASSORES', 'RESSORT', '11 Rue Général Plessier', NULL, '69002', 'Lyon', '{"lon":4.826068,"lat":45.751322}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (129, '069ASSORIB', 'RIB - REUSSIR L''INSERTION BRON', '102 Avenue Saint-Exupéry', NULL, '69500', 'Bron', '{"lon":4.902585,"lat":45.72799}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (6, '3439547800', 'AIDEN CHANTIERS', '454 Avenue de la Sauvegarde', NULL, '69009', 'Lyon', '{"lon":4.790169,"lat":45.787432}', true, NULL, '81516960200027', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (10, '691048370', 'ALIS', '2 Petite Rue des Feuillants', NULL, '69001', 'Lyon', '{"lon":4.836383,"lat":45.769214}', true, NULL, '44096648900013', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (15, '069ASSOARA', 'ARALIS', '16 Rue Jean Desparmet', 'CS 21002', '69008', 'Lyon', '{"lon":4.877737,"lat":45.735844}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (2, '441024718', 'Acta Vista', 'Boulevard Charles Livon', NULL, '13007', 'Marseille', '{"lon":5.357764,"lat":43.291894}', true, '0606060606', NULL, 'test@grandlyon.com', 'https://grandlyon.com', NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (17, '069ASSOASP', 'ASPIE MIONS-CATEM', '57 Rue des Brosses', NULL, '69780', 'Mions', '{"lon":4.948365,"lat":45.6754}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (22, 'INS004AESE', 'Association pour l''emploi et la sauvegarde de l''environnement', '15 Rue Léon Blum', NULL, '69320', 'Feyzin', '{"lon":4.856319,"lat":45.680077}', true, NULL, '39819974500033', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (27, '2169002900', 'CCAS DE BRON', 'Place de Weingarten', 'Mairie de Bron', '69500', 'Bron', '{"lon":4.909219,"lat":45.73366}', true, NULL, '26691023100015', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (32, '6910', 'CCAS DE DECINES CHARPIEU', 'Place Roger Salengro', 'BP 175', '69150', 'Décines-Charpieu', '{"lon":4.957309,"lat":45.769195}', true, NULL, '26691020700015', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (36, '6928', 'CCAS DE OULLINS', 'Place Kellermann', NULL, '69600', 'Oullins', '{"lon":4.819061,"lat":45.716318}', true, NULL, '26691011600018', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (40, '2669102150', 'CCAS DE ST PRIEST', '14 Place de l’Hôtel de Ville Charles Ottina', 'BP 110', '69800', 'Saint-Priest', '{"lon":4.935636,"lat":45.694399}', true, NULL, '26691021500018', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (45, '690793146', 'Centre d''animation SAINT JEAN', 'Petite Rue du Roulet', 'BP 71618', '69100', 'Villeurbanne', '{"lon":4.901967,"lat":45.778486}', true, NULL, '31512638300027', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (50, 'TAILLIS', 'Centre social et socioculturel Les Taillis', '20 Rue Villard', NULL, '69500', 'Bron', '{"lon":4.908153,"lat":45.73231}', true, NULL, '77966857300024', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (54, '069ASSOCIF', 'CIDFF DU RHONE', '18 Place Tolozan', NULL, '69001', 'Lyon', '{"lon":4.837535,"lat":45.769657}', true, NULL, '30593351700032', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (58, 'INS008E2C', 'Ecoles de la 2e Chance Rhone Lyon Métropole', '3 Avenue Maurice Thorez', NULL, '69120', 'Vaulx-en-Velin', '{"lon":4.914162,"lat":45.780049}', true, NULL, '51478978300016', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (64, '4806081160', 'Envie Sud-Est', '43 Allée du Mens', NULL, '69100', 'Villeurbanne', '{"lon":4.906171,"lat":45.780382}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (65, '069ASSOESP', 'ESPACE CREATEUR DE SOLIDARITES', 'Place Roger Salengro', 'BP 100', '69190', 'Saint-Fons', '{"lon":4.852529,"lat":45.708789}', true, NULL, '34228879200019', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (69, '431968601', 'Fondation de l''Armée du Salut', '131 Avenue Thiers', NULL, '69006', 'Lyon', '{"lon":4.861908,"lat":45.768892}', true, NULL, '43196860100275', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (74, '4114297150', 'France Humanitaire', 'Rue Cavenne', NULL, '69007', 'Lyon', '{"lon":4.838856,"lat":45.753056}', true, NULL, '41142971500039', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (77, '069ASSOOHE', 'HANDI LYON RHONE - CAP EMPLOI', '213 Rue de Gerland', 'Les Jardins de l''Entreprise - Batiment F', '69007', 'Lyon', '{"lon":4.837876,"lat":45.726931}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (82, '069ASSOINN', 'INNOVATION ET DEVELOPPEMENT', '3 Allée du Merle Rouge', NULL, '69190', 'Saint-Fons', '{"lon":4.852393,"lat":45.70783}', true, NULL, '40205047000028', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (95, '691041982', 'L''Entreprise Ecole', 'Rue Marcellin Berthelot', NULL, '69190', 'Saint-Fons', '{"lon":4.856239,"lat":45.707627}', true, NULL, '41946979600025', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (91, '69124174', 'LE MAS - RESIDENCE', '30 Rue Pré Gaudry', NULL, '69007', 'Lyon', '{"lon":4.835314,"lat":45.739901}', true, NULL, '77564867800156', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (96, 'ASSATPR', 'Les ateliers du présent', '65 Rue Voltaire', NULL, '69003', 'Lyon', '{"lon":4.849096,"lat":45.756538}', true, NULL, '41147366300028', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (100, 'INS017MMIE', 'MAISON METROPOLITAINE INSERTION EMPLOI', '24 Rue Etienne Rognon', NULL, '69007', 'Lyon', '{"lon":4.83572,"lat":45.74616}', true, NULL, '13000354400033', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (104, 'INS018MLRSE', 'Mission Locale Rhône Sud Est', 'Place de l’Hôtel de Ville Charles Ottina', NULL, '69800', 'Saint-Priest', '{"lon":4.935444,"lat":45.694202}', true, NULL, '39425293600080', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (110, 'INS020OPP', 'Oppelia Association Rhône-Alpes d''Insertion et d''Addictologie Centre de Soins d''Accompagnement et de Prévention en Addictologie', '7 Place du Griffon', NULL, '69001', 'Lyon', '{"lon":4.835921,"lat":45.769303}', true, NULL, '32602117700257', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (116, '4003620180', 'Point Information Médiation Multiservices Lyon Métropole', '2 Place André Latarjet', NULL, '69008', 'Lyon', '{"lon":4.885073,"lat":45.729867}', true, NULL, '40036201800089', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (122, '2222222225', 'Régie de quartier Armstrong', '2 Rue Gabriel Bourdarias', NULL, '69200', 'Vénissieux', '{"lon":4.871761,"lat":45.692271}', true, NULL, '37860030800050', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (127, '4218045190', 'Restaurants du coeur', '58 Cours Albert Thomas', NULL, '69008', 'Lyon', '{"lon":4.866074,"lat":45.747206}', true, NULL, '42180451900021', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (128, '3949757670', 'Rhône Développement Initiative', '2 Place André Latarjet', NULL, '69008', 'Lyon', '{"lon":4.885073,"lat":45.729867}', true, NULL, '39497576700069', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (130, '387761899', 'SAFORE', '49bis Rue Léo Lagrange', NULL, '69200', 'Vénissieux', '{"lon":4.875756,"lat":45.698564}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (131, '347832305', 'SAINT GENIS EMPLOI', 'Place des Collonges', NULL, '69230', 'Saint-Genis-Laval', '{"lon":4.804933,"lat":45.692893}', true, NULL, '34783230500036', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (132, '334119815', 'SAMATH AFRD', 'Rue Pierre Baizet', NULL, '69009', 'Lyon', '{"lon":4.815511,"lat":45.794751}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (133, '069ASSOSOL', 'SOLID''ARTE', '41 Rue Pierre Dupont', NULL, '69001', 'Lyon', '{"lon":4.82227,"lat":45.771857}', true, NULL, '39248626200026', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (134, 'INS000005', 'Sud Ouest Emploi', 'Avenue Maréchal Foch', NULL, '69230', 'Saint-Genis-Laval', '{"lon":4.788278,"lat":45.689758}', true, NULL, '44023823600028', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (135, 'INS025S', 'Synapse', '167 Cours Lafayette', NULL, '69006', 'Lyon', '{"lon":4.85579,"lat":45.763758}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (136, 'INS026S69', 'Synerg''iae 69', '10 Avenue des Canuts', NULL, '69120', 'Vaulx-en-Velin', '{"lon":4.922318,"lat":45.760806}', true, NULL, '82465281200010', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (137, 'INS000001', 'TECHLID', '411 Allée des Noisetiers', NULL, '69760', 'Limonest', '{"lon":4.773899,"lat":45.815168}', true, NULL, '38158300400050', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (138, '069ASSOUFC', 'UFCS', '11 Rue Auguste Lacroix', NULL, '69003', 'Lyon', '{"lon":4.845112,"lat":45.755132}', true, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (139, '493441653', 'UNIS VERS L''EMPLOI', '17 Rue Jean Bourgey', NULL, '69100', 'Villeurbanne', '{"lon":4.880471,"lat":45.770761}', true, NULL, '49344165300018', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (140, '8297094500', 'YOON', '18 Rue Roger Salengro', NULL, '69009', 'Lyon', '{"lon":4.806289,"lat":45.777815}', true, NULL, '82970945000011', NULL, NULL, NULL, NULL);
INSERT INTO public.structure (id, "idIODAS", label, address, "additionalAddress", "postalCode", city, geotag, active, phone, "SIRET", "contactEmail", website, presentation, "logoId") VALUES (1, '477 856 95', '124 Services', '20 Rue Ornano', NULL, '69001', 'Lyon', '{"lon":4.825668,"lat":45.77149}', true, NULL, '47785695900010', NULL, 'https://grandlyon.com', 'Super présentation de la structure <b>124 service</b>', NULL);

INSERT INTO "structure_focus_area" SELECT id, 1 FROM "structure";

-- Areas
INSERT INTO cli (id, label) VALUES (1, 'CLI 1');
INSERT INTO cli (id, label) VALUES (2, 'CLI 2');
INSERT INTO cli (id, label) VALUES (3, 'CLI 3');
INSERT INTO cli (id, label) VALUES (4, 'CLI 4');
INSERT INTO cli (id, label) VALUES (5, 'CLI 5');
INSERT INTO cli (id, label) VALUES (6, 'CLI 6');
INSERT INTO cli (id, label) VALUES (7, 'CLI 7');
INSERT INTO cli (id, label) VALUES (8, 'CLI 8');
INSERT INTO cli (id, label) VALUES (9, 'CLI 9');
INSERT INTO cli (id, label) VALUES (10, 'CLI 10');
INSERT INTO cli (id, label) VALUES (11, 'CLI 11');
INSERT INTO cli (id, label) VALUES (12, 'METROPOLITAINE');

INSERT INTO ctm (id, label) VALUES (13, 'LYON');
INSERT INTO ctm (id, label) VALUES (14, 'VAL DE SAONE');
INSERT INTO ctm (id, label) VALUES (15, 'PORTE DES ALPES');
INSERT INTO ctm (id, label) VALUES (16, 'PLATEAU NORD');
INSERT INTO ctm (id, label) VALUES (17, 'OUEST NORD');
INSERT INTO ctm (id, label) VALUES (18, 'VAL D''YZERON');
INSERT INTO ctm (id, label) VALUES (19, 'LÔNES ET COTEAUX DU RHÔNE');
INSERT INTO ctm (id, label) VALUES (20, 'LES PORTES DU SUD');
INSERT INTO ctm (id, label) VALUES (21, 'RHÔNE AMONT');
INSERT INTO ctm (id, label) VALUES (22, 'VILLEURBANNE');

-- Groups
INSERT INTO "group" ("name","label") 
VALUES
('ADMIN','Administrateur'),
('DIRECTION', 'Direction'),
('MMIE','MMIE'),
('STRUCTURE','Structure'),
('TERRITORY', 'Territoire'),
('DIRECTION+', 'Direction +');

-- QPV
insert into qpv ("municipality", "district") values     ('Bron', 'Parilly');
insert into qpv ("municipality", "district") values ('Bron / Vaulx-en-Velin', 'Terraillon / Chenier');
insert into qpv ("municipality", "district") values ('Décines-Charpieu', 'Prainet');
insert into qpv ("municipality", "district") values ('Givors', 'Les Vernes');
insert into qpv ("municipality", "district") values ('Givors', 'Centre');
insert into qpv ("municipality", "district") values ('Givors', 'Les plaines');
insert into qpv ("municipality", "district") values ('Grigny', 'Vallon');
insert into qpv ("municipality", "district") values ('Lyon 3', 'Moncey');
insert into qpv ("municipality", "district") values ('Lyon 5', 'Sœurs Janin');
insert into qpv ("municipality", "district") values ('Lyon 7', 'Cités sociales Gerland');
insert into qpv ("municipality", "district") values ('Lyon 8 / Vénissieux', 'Etats-Unis / Langlet Santy');
insert into qpv ("municipality", "district") values ('Lyon 8', 'Mermoz');
insert into qpv ("municipality", "district") values ('Lyon 8', 'Moulin à vent');
insert into qpv ("municipality", "district") values ('Lyon 9', 'Le Vergoin');
insert into qpv ("municipality", "district") values ('Lyon 9', 'Loucheur / Gorge de Loup');
insert into qpv ("municipality", "district") values ('Lyon 9', 'Duchère');
insert into qpv ("municipality", "district") values ('Meyzieu', 'Le Mathiolan');
insert into qpv ("municipality", "district") values ('Meyzieu', 'Les Plantées');
insert into qpv ("municipality", "district") values ('Neuville-sur-Saône', 'La Source');
insert into qpv ("municipality", "district") values ('Oullins / La Mulatière', 'La Saulaie');
insert into qpv ("municipality", "district") values ('Pierre Bénite', 'Hautes Roches');
insert into qpv ("municipality", "district") values ('Rillieux-la-Pape', 'Ville nouvelle');
insert into qpv ("municipality", "district") values ('Saint-Fons', 'Arsenal / Carnot-Parmentier');
insert into qpv ("municipality", "district") values ('Saint Genis Laval', 'Les Collonges');
insert into qpv ("municipality", "district") values ('Saint-Priest', 'Bellevue');
insert into qpv ("municipality", "district") values ('Saint-Priest', 'Bel air');
insert into qpv ("municipality", "district") values ('Saint-Priest', 'Garibaldi');
insert into qpv ("municipality", "district") values ('Vaulx-en-Velin', 'Sud');
insert into qpv ("municipality", "district") values ('Vaulx-en-Velin', 'Grande Ile');
insert into qpv ("municipality", "district") values ('Vénissieux', 'Duclos / Barel');
insert into qpv ("municipality", "district") values ('Vénissieux / Saint-Fons', 'Minguettes / Clochettes');
insert into qpv ("municipality", "district") values ('Villeurbanne', 'Bel Air / les Brosses');
insert into qpv ("municipality", "district") values ('Villeurbanne', 'Monod');
insert into qpv ("municipality", "district") values ('Villeurbanne', 'Saint-Jean');
insert into qpv ("municipality", "district") values ('Villeurbanne', 'Les Buers nord');
insert into qpv ("municipality", "district") values ('Villeurbanne', 'Les Buers sud');
insert into qpv ("municipality", "district") values ('Villeurbanne', 'Tonkin');
insert into qpv ("municipality", "district") values ('Caluire-et-Cuire', 'Cuire-le-Bas (QVA)');
insert into qpv ("municipality", "district") values ('Caluire-et-Cuire', 'Montessuy (QVA)');
insert into qpv ("municipality", "district") values ('Caluire-et-Cuire', 'Saint-Clair (QVA)');
insert into qpv ("municipality", "district") values ('Décines-Charpieu', 'Berthaudière (QVA)');
insert into qpv ("municipality", "district") values ('Décines-Charpieu', 'La Soie/Montaberlet (QVA)');
insert into qpv ("municipality", "district") values ('Ecully', 'Les Sources/Pérollier (QVA)');
insert into qpv ("municipality", "district") values ('Feyzin', 'Les Razes (QVA)');
insert into qpv ("municipality", "district") values ('Feyzin', 'Vignettes/Figuières (QVA)');
insert into qpv ("municipality", "district") values ('Fontaines-sur-Saône', 'La Norenchal (QVA)');
insert into qpv ("municipality", "district") values ('Irigny', 'Yvours (QVA)');
insert into qpv ("municipality", "district") values ('La Mulatière', 'Le Confluent (QVA)');
insert into qpv ("municipality", "district") values ('La Mulatière', 'Le Roule/Le Bocage (QVA)');
insert into qpv ("municipality", "district") values ('Lyon 7', 'Guillotiere (Extension ZUS) (QVA)');
insert into qpv ("municipality", "district") values ('Lyon 9', 'Vaise (QVA)');
insert into qpv ("municipality", "district") values ('Meyzieu', 'Les Plantées (Extension ZUS) (QVA)');
insert into qpv ("municipality", "district") values ('Mions', 'Joliot Curie (QVA)');
insert into qpv ("municipality", "district") values ('Oullins', 'Ampère (QVA)');
insert into qpv ("municipality", "district") values ('Rillieux-la-Pape', 'La Roue (QVA)');
insert into qpv ("municipality", "district") values ('Saint-Genis-Laval', 'Basses Barolles (QVA)');
insert into qpv ("municipality", "district") values ('Saint-Priest', 'Beauséjour (QVA)');
insert into qpv ("municipality", "district") values ('Vénissieux', 'Les Minguettes (Extension ZUS) (QVA)');
insert into qpv ("municipality", "district") values ('Vernaison', 'Le Péronnet (QVA)');

-- Degree
insert into degree ("id", "label") values (1, 'Illettré, analphabète, non scolarisé');
insert into degree ("id", "label") values (2, 'Sans diplôme');
insert into degree ("id", "label") values (3, 'Niv. 3 (CAP, BEP)');
insert into degree ("id", "label") values (4, 'Niv. 4 (BAC)');
insert into degree ("id", "label") values (5, 'Niv. 5 (BAC+2)');
insert into degree ("id", "label") values (6, 'Niv. 6 (BAC+3, +4)');
insert into degree ("id", "label") values (7, 'Niv. 7 (BAC+5 à +7)');
insert into degree ("id", "label") values (8, 'Niv. 8 (BAC+8 et au-delà)');
insert into degree ("id", "label") values (9, 'Diplôme non reconnu en France');
insert into degree ("id", "label") values (10, 'Inconnu');

-- Training Area
insert into training_area ("id", "label") values (1, 'Formation générale, lettres et langues');
insert into training_area ("id", "label") values (2, 'Sciences humaines, économie, droit');
insert into training_area ("id", "label") values (3, 'Sciences');
insert into training_area ("id", "label") values (4, 'Arts');
insert into training_area ("id", "label") values (5, 'Production industrielle');
insert into training_area ("id", "label") values (6, 'Agriculture et pêche');
insert into training_area ("id", "label") values (7, 'Transformation');
insert into training_area ("id", "label") values (8, 'Génie civil, construction, bois');
insert into training_area ("id", "label") values (9, 'Mécanique, métallurgie');
insert into training_area ("id", "label") values (10, 'Électricité-électronique');
insert into training_area ("id", "label") values (11, 'Échange et gestion');
insert into training_area ("id", "label") values (12, 'Information communication');
insert into training_area ("id", "label") values (13, 'Services aux personnes');
insert into training_area ("id", "label") values (14, 'Services à la collectivité');
insert into training_area ("id", "label") values (15, 'Inconnu');

-- Qualification Type
insert into qualification_type ("id", "label") values (1, 'Permis de conduire');
insert into qualification_type ("id", "label") values (2, 'CACES');
insert into qualification_type ("id", "label") values (3, 'Habilitation électrique');
insert into qualification_type ("id", "label") values (4, 'PSC1');
insert into qualification_type ("id", "label") values (5, 'BAFA');
insert into qualification_type ("id", "label") values (6, 'Autre habilitation');
insert into qualification_type ("id", "label") values (7, 'Autre qualification');
insert into qualification_type ("id", "label") values (8, 'Autre permis de conduire');

-- Transport Mode
insert into transport_mode ("id", "label") values (1, 'Aucun');
insert into transport_mode ("id", "label") values (2, 'Auto');
insert into transport_mode ("id", "label") values (3, 'Moto');
insert into transport_mode ("id", "label") values (4, 'Transport en commun');
insert into transport_mode ("id", "label") values (5, 'Train');
insert into transport_mode ("id", "label") values (6, 'Cyclomoteur');
insert into transport_mode ("id", "label") values (7, 'Vélo');
insert into transport_mode ("id", "label") values (8, 'autre');

-- Barrier
insert into barrier ("id", "label") values (1, 'Mobilité géographique');
insert into barrier ("id", "label") values (2, 'Garde d''enfants / ascendants');
insert into barrier ("id", "label") values (3, 'Santé');
insert into barrier ("id", "label") values (4, 'Maîtrise savoir de bases');
insert into barrier ("id", "label") values (5, 'Manque d''expérience');
insert into barrier ("id", "label") values (6, 'Qualifications');
insert into barrier ("id", "label") values (7, 'Problème administratif');
insert into barrier ("id", "label") values (8, 'Logement');
insert into barrier ("id", "label") values (9, 'Savoir Être');
insert into barrier ("id", "label") values (10, 'Problèmes familliaux');
insert into barrier ("id", "label") values (11, 'Manque d''emploi dans le domaine recherché');
insert into barrier ("id", "label") values (12, 'Définition du projet');
insert into barrier ("id", "label") values (13, 'Maîtrise du numérique');
insert into barrier ("id", "label") values (14, 'Autre');


-- Sector
insert into sector ("id", "label", "codeRome") values (1, 'Agriculture et Pêche, Espaces naturels et Espaces verts, Soins aux animaux', 'A');
insert into sector ("id", "label", "codeRome") values (2, 'Arts et Façonnage d''ouvrages d''art', 'B');
insert into sector ("id", "label", "codeRome") values (3, 'Banque, Assurance, Immobilier', 'C');
insert into sector ("id", "label", "codeRome") values (4, 'Commerce, Vente et Grande distribution', 'D');
insert into sector ("id", "label", "codeRome") values (5, 'Communication, Média et Multimédia', 'E');
insert into sector ("id", "label", "codeRome") values (6, 'Construction, Bâtiment et Travaux publics', 'F');
insert into sector ("id", "label", "codeRome") values (7, 'Hôtellerie-Restauration, Tourisme, Loisirs et Animation', 'G');
insert into sector ("id", "label", "codeRome") values (8, 'Industrie', 'H');
insert into sector ("id", "label", "codeRome") values (9, 'Installation et Maintenance', 'I');
insert into sector ("id", "label", "codeRome") values (10, 'Santé', 'J');
insert into sector ("id", "label", "codeRome") values (11, 'Services à la personne et à la collectivité', 'K');
insert into sector ("id", "label", "codeRome") values (12, 'Spectacle', 'L');
insert into sector ("id", "label", "codeRome") values (13, 'Support à l''entreprise', 'M');
insert into sector ("id", "label", "codeRome") values (14, 'Transport et Logistique', 'N');

-- domaine
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (1,'À préciser', 'A10', 1);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (2,'Engins agricoles et forestiers', 'A11', 1);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (3,'Espaces naturels et espaces verts', 'A12', 1);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (4,'Etudes et assistance technique', 'A13', 1);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (5,'Production', 'A14', 1);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (6,'Soins aux animaux', 'A15', 1);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (7,'À préciser', 'B10', 2);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (8,'Arts plastiques', 'B11', 2);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (9,'Céramique', 'B12', 2);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (10,'Décoration', 'B13', 2);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (11,'Fibres et papier', 'B14', 2);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (12,'Instruments de musique', 'B15', 2);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (13,'Métal, verre, bijouterie et horlogerie', 'B16', 2);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (14,'Taxidermie', 'B17', 2);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (15,'Tissu et cuirs', 'B18', 2);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (16,'À préciser', 'C10', 3);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (17,'Assurance', 'C11', 3);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (18,'Banque', 'C12', 3);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (19,'Finance', 'C13', 3);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (20,'Gestion administrative banque et assurances', 'C14', 3);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (21,'Immobilier', 'C15', 3);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (22,'À préciser', 'D10', 4);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (23,'Commerce alimentaire et métiers de bouche', 'D11', 4);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (24,'Commerce non alimentaire et de prestations de confort', 'D12', 4);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (25,'Direction de magasin de détail', 'D13', 4);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (26,'Force de vente', 'D14', 4);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (27,'Grande distribution', 'D15', 4);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (28,'À préciser', 'E10', 5);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (29,'Edition et communication', 'E11', 5);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (30,'Images et sons', 'E12', 5);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (31,'Industries graphiques', 'E13', 5);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (32,'Publicité', 'E14', 5);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (33,'À préciser', 'F10', 6);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (34,'Conception et études', 'F11', 6);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (35,'Conduite et encadrement de chantier - travaux', 'F12', 6);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (36,'Engins de chantier', 'F13', 6);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (37,'Extraction', 'F14', 6);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (38,'Montage de structures', 'F15', 6);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (39,'Second oeuvre', 'F16', 6);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (40,'Travaux et gros oeuvre', 'F17', 6);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (41,'À préciser', 'G10', 7);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (42,'Accueil et promotion touristique', 'G11', 7);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (43,'Animation d''activités de loisirs', 'G12', 7);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (44,'Conception, commercialisation et vente de produits touristiques', 'G13', 7);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (45,'Gestion et direction', 'G14', 7);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (46,'Personnel d''étage en hôtellerie', 'G15', 7);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (47,'Production culinaire', 'G16', 7);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (48,'Accueil en hôtellerie', 'G17', 7);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (49,'Service', 'G18', 7);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (50,'À préciser', 'H10', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (51,'Affaires et support technique client', 'H11', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (52,'Conception, recherche, études et développement', 'H12', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (53,'Hygiène Sécurité Environnement -HSE- industriels', 'H13', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (54,'Méthodes et gestion industrielles', 'H14', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (55,'Qualité et analyses industrielles', 'H15', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (56,'Alimentaire', 'H21', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (57,'Bois', 'H22', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (58,'Chimie et pharmacie', 'H23', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (59,'Cuir et textile', 'H24', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (60,'Direction, encadrement et pilotage de fabrication et production industrielles', 'H25', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (61,'Electronique et électricité', 'H26', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (62,'Energie', 'H27', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (63,'Matériaux de construction, céramique et verre', 'H28', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (64,'Mécanique, travail des métaux et outillage', 'H29', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (65,'Papier et carton', 'H31', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (66,'Plastique, caoutchouc', 'H32', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (67,'Préparation et conditionnement', 'H33', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (68,'Traitements thermiques et traitements de surfaces', 'H34', 8);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (69,'À préciser', 'I10', 9);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (70,'Encadrement', 'I11', 9);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (71,'Entretien technique', 'I12', 9);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (72,'Equipements de production, équipements collectifs', 'I13', 9);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (73,'Equipements domestiques et informatique', 'I14', 9);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (74,'Travaux d''accès difficile', 'I15', 9);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (75,'Véhicules, engins, aéronefs', 'I16', 9);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (76,'À préciser', 'J10', 10);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (77,'Praticiens médicaux', 'J11', 10);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (78,'Praticiens médico-techniques', 'J12', 10);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (79,'Professionnels médico-techniques', 'J13', 10);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (80,'Rééducation et appareillage', 'J14', 10);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (81,'Soins paramédicaux', 'J15', 10);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (82,'À préciser', 'K10', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (83,'Accompagnement de la personne', 'K11', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (84,'Action sociale, socio-éducative et socio-culturelle', 'K12', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (85,'Aide à la vie quotidienne', 'K13', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (86,'Conception et mise en oeuvre des politiques publiques', 'K14', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (87,'Contrôle public', 'K15', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (88,'Culture et gestion documentaire', 'K16', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (89,'Défense, sécurité publique et secours', 'K17', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (90,'Développement territorial et emploi', 'K18', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (91,'Droit', 'K19', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (92,'Formation initiale et continue', 'K21', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (93,'Nettoyage et propreté industriels', 'K22', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (94,'Propreté et environnement urbain', 'K23', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (95,'Recherche', 'K24', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (96,'Sécurité privée', 'K25', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (97,'Services funéraires', 'K26', 11);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (98,'À préciser', 'L10', 12);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (99,'Animation de spectacles', 'L11', 12);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (100,'Artistes - interprètes du spectacle', 'L12', 12);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (101,'Conception et production de spectacles', 'L13', 12);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (102,'Sport professionnel', 'L14', 12);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (103,'Techniciens du spectacle', 'L15', 12);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (104,'À préciser', 'M10', 13);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (105,'Achats', 'M11', 13);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (106,'Comptabilité et gestion', 'M12', 13);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (107,'Direction d''entreprise', 'M13', 13);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (108,'Organisation et études', 'M14', 13);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (109,'Ressources humaines', 'M15', 13);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (110,'Secrétariat et assistance', 'M16', 13);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (111,'Stratégie commerciale, marketing et supervision des ventes', 'M17', 13);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (112,'Systèmes d''information et de télécommunication', 'M18', 13);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (113,'À préciser', 'N10', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (114,'Magasinage, manutention des charges et déménagement', 'N11', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (115,'Organisation de la circulation des marchandises', 'N12', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (116,'Personnel d''encadrement de la logistique', 'N13', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (117,'Personnel navigant du transport aérien', 'N21', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (118,'Personnel sédentaire du transport aérien', 'N22', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (119,'Personnel navigant du transport maritime et fluvial', 'N31', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (120,'Personnel sédentaire du transport maritime et fluvial', 'N32', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (121,'Personnel de conduite du transport routier', 'N41', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (122,'Personnel d''encadrement du transport routier', 'N42', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (123,'Personnel navigant du transport terrestre', 'N43', 14);
INSERT INTO "domain" ("id", "label", "codeRome", "sectorId") values (124,'Personnel sédentaire du transport ferroviaire et réseau filo guidé', 'N44', 14);

-- Job
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (1, 'À préciser', 'A1001', 1);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (2, 'Conduite d''engins agricoles et forestiers', 'A1101', 2);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (3, 'Bûcheronnage et élagage', 'A1201', 3);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (4, 'Entretien des espaces naturels', 'A1202', 3);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (5, 'Aménagement et entretien des espaces verts', 'A1203', 3);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (6, 'Protection du patrimoine naturel', 'A1204', 3);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (7, 'Sylviculture', 'A1205', 3);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (8, 'Conseil et assistance technique en agriculture et environnement naturel', 'A1301', 4);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (9, 'Contrôle et diagnostic technique en agriculture', 'A1302', 4);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (10, 'Ingénierie en agriculture et environnement naturel', 'A1303', 4);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (11, 'Aide agricole de production fruitière ou viticole', 'A1401', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (12, 'Aide agricole de production légumière ou végétale', 'A1402', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (13, 'Aide d''élevage agricole et aquacole', 'A1403', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (14, 'Aquaculture', 'A1404', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (15, 'Arboriculture et viticulture', 'A1405', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (16, 'Encadrement équipage de la pêche', 'A1406', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (17, 'Élevage bovin ou équin', 'A1407', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (18, 'Élevage d''animaux sauvages ou de compagnie', 'A1408', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (19, 'Élevage de lapins et volailles', 'A1409', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (20, 'Élevage ovin ou caprin', 'A1410', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (21, 'Élevage porcin', 'A1411', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (22, 'Fabrication et affinage de fromages', 'A1412', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (23, 'Fermentation de boissons alcoolisées', 'A1413', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (24, 'Horticulture et maraîchage', 'A1414', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (25, 'Équipage de la pêche', 'A1415', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (26, 'Polyculture, élevage', 'A1416', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (27, 'Saliculture', 'A1417', 5);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (28, 'Aide aux soins animaux', 'A1501', 6);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (29, 'Podologie animale', 'A1502', 6);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (30, 'Toilettage des animaux', 'A1503', 6);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (31, 'Santé animale', 'A1504', 6);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (32, 'À préciser', 'B1001', 7);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (33, 'Création en arts plastiques', 'B1101', 8);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (34, 'Réalisation d''objets décoratifs et utilitaires en céramique et matériaux de synthèse', 'B1201', 9);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (35, 'Décoration d''espaces de vente et d''exposition', 'B1301', 10);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (36, 'Décoration d''objets d''art et artisanaux', 'B1302', 10);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (37, 'Gravure - ciselure', 'B1303', 10);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (38, 'Réalisation d''objets en lianes, fibres et brins végétaux', 'B1401', 11);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (39, 'Reliure et restauration de livres et archives', 'B1402', 11);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (40, 'Fabrication et réparation d''instruments de musique', 'B1501', 12);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (41, 'Métallerie d''art', 'B1601', 13);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (42, 'Réalisation d''objets artistiques et fonctionnels en verre', 'B1602', 13);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (43, 'Réalisation d''ouvrages en bijouterie, joaillerie et orfèvrerie', 'B1603', 13);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (44, 'Réparation - montage en systèmes horlogers', 'B1604', 13);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (45, 'Conservation et reconstitution d''espèces animales', 'B1701', 14);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (46, 'Réalisation d''articles de chapellerie', 'B1801', 15);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (47, 'Réalisation d''articles en cuir et matériaux souples (hors vêtement)', 'B1802', 15);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (48, 'Réalisation de vêtements sur mesure ou en petite série', 'B1803', 15);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (49, 'Réalisation d''ouvrages d''art en fils', 'B1804', 15);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (50, 'Stylisme', 'B1805', 15);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (51, 'Tapisserie - décoration en ameublement', 'B1806', 15);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (52, 'À préciser', 'C1001', 16);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (53, 'Conception - développement produits d''assurances', 'C1101', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (54, 'Conseil clientèle en assurances', 'C1102', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (55, 'Courtage en assurances', 'C1103', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (56, 'Direction d''exploitation en assurances', 'C1104', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (57, 'Études actuarielles en assurances', 'C1105', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (58, 'Expertise risques en assurances', 'C1106', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (59, 'Indemnisations en assurances', 'C1107', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (60, 'Management de groupe et de service en assurances', 'C1108', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (61, 'Rédaction et gestion en assurances', 'C1109', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (62, 'Souscription d''assurances', 'C1110', 17);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (63, 'Accueil et services bancaires', 'C1201', 18);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (64, 'Analyse de crédits et risques bancaires', 'C1202', 18);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (65, 'Relation clients banque/finance', 'C1203', 18);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (66, 'Conception et expertise produits bancaires et financiers', 'C1204', 18);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (67, 'Conseil en gestion de patrimoine financier', 'C1205', 18);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (68, 'Gestion de clientèle bancaire', 'C1206', 18);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (69, 'Management en exploitation bancaire', 'C1207', 18);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (70, 'Front office marchés financiers', 'C1301', 19);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (71, 'Gestion back et middle-office marchés financiers', 'C1302', 19);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (72, 'Gestion de portefeuilles sur les marchés financiers', 'C1303', 19);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (73, 'Gestion en banque et assurance', 'C1401', 20);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (74, 'Gérance immobilière', 'C1501', 21);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (75, 'Gestion locative immobilière', 'C1502', 21);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (76, 'Management de projet immobilier', 'C1503', 21);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (77, 'Transaction immobilière', 'C1504', 21);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (78, 'À préciser', 'D1001', 22);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (79, 'Boucherie', 'D1101', 23);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (80, 'Boulangerie - viennoiserie', 'D1102', 23);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (81, 'Charcuterie - traiteur', 'D1103', 23);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (82, 'Pâtisserie, confiserie, chocolaterie et glacerie', 'D1104', 23);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (83, 'Poissonnerie', 'D1105', 23);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (84, 'Vente en alimentation', 'D1106', 23);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (85, 'Vente en gros de produits frais', 'D1107', 23);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (86, 'Achat vente d''objets d''art, anciens ou d''occasion', 'D1201', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (87, 'Coiffure', 'D1202', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (88, 'Hydrothérapie', 'D1203', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (89, 'Location de véhicules ou de matériel de loisirs', 'D1204', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (90, 'Nettoyage d''articles textiles ou cuirs', 'D1205', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (91, 'Réparation d''articles en cuir et matériaux souples', 'D1206', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (92, 'Retouches en habillement', 'D1207', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (93, 'Soins esthétiques et corporels', 'D1208', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (94, 'Vente de végétaux', 'D1209', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (95, 'Vente en animalerie', 'D1210', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (96, 'Vente en articles de sport et loisirs', 'D1211', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (97, 'Vente en décoration et équipement du foyer', 'D1212', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (98, 'Vente en gros de matériel et équipement', 'D1213', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (99, 'Vente en habillement et accessoires de la personne', 'D1214', 24);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (100, 'Management de magasin de détail', 'D1301', 25);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (101, 'Assistanat commercial', 'D1401', 26);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (102, 'Relation commerciale grands comptes et entreprises', 'D1402', 26);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (103, 'Relation commerciale auprès de particuliers', 'D1403', 26);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (104, 'Relation commerciale en vente de véhicules', 'D1404', 26);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (105, 'Conseil en information médicale', 'D1405', 26);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (106, 'Management en force de vente', 'D1406', 26);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (107, 'Relation technico-commerciale', 'D1407', 26);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (108, 'Téléconseil et télévente', 'D1408', 26);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (109, 'Animation de vente', 'D1501', 27);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (110, 'Management/gestion de rayon produits alimentaires', 'D1502', 27);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (111, 'Management/gestion de rayon produits non alimentaires', 'D1503', 27);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (112, 'Direction de magasin de grande distribution', 'D1504', 27);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (113, 'Personnel de caisse', 'D1505', 27);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (114, 'Marchandisage', 'D1506', 27);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (115, 'Mise en rayon libre-service', 'D1507', 27);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (116, 'Encadrement du personnel de caisses', 'D1508', 27);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (117, 'Management de département en grande distribution', 'D1509', 27);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (118, 'À préciser', 'E1001', 28);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (119, 'Animation de site multimédia', 'E1101', 29);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (120, 'Écriture d''ouvrages, de livres', 'E1102', 29);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (121, 'Communication', 'E1103', 29);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (122, 'Conception de contenus multimédias', 'E1104', 29);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (123, 'Coordination d''édition', 'E1105', 29);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (124, 'Journalisme et information média', 'E1106', 29);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (125, 'Organisation d''évènementiel', 'E1107', 29);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (126, 'Traduction, interprétariat', 'E1108', 29);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (127, 'Photographie', 'E1201', 30);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (128, 'Production en laboratoire cinématographique', 'E1202', 30);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (129, 'Production en laboratoire photographique', 'E1203', 30);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (130, 'Projection cinéma', 'E1204', 30);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (131, 'Réalisation de contenus multimédias', 'E1205', 30);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (132, 'Conduite de machines d''impression', 'E1301', 31);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (133, 'Conduite de machines de façonnage routage', 'E1302', 31);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (134, 'Encadrement des industries graphiques', 'E1303', 31);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (135, 'Façonnage et routage', 'E1304', 31);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (136, 'Préparation et correction en édition et presse', 'E1305', 31);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (137, 'Prépresse', 'E1306', 31);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (138, 'Reprographie', 'E1307', 31);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (139, 'Intervention technique en industrie graphique', 'E1308', 31);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (140, 'Développement et promotion publicitaire', 'E1401', 32);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (141, 'Élaboration de plan média', 'E1402', 32);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (142, 'À préciser', 'F1001', 33);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (143, 'Architecture du BTP et du paysage', 'F1101', 34);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (144, 'Conception - aménagement d''espaces intérieurs', 'F1102', 34);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (145, 'Contrôle et diagnostic technique du bâtiment', 'F1103', 34);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (146, 'Dessin BTP et paysage', 'F1104', 34);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (147, 'Études géologiques', 'F1105', 34);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (148, 'Ingénierie et études du BTP', 'F1106', 34);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (149, 'Mesures topographiques', 'F1107', 34);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (150, 'Métré de la construction', 'F1108', 34);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (151, 'Conduite de travaux du BTP et de travaux paysagers', 'F1201', 35);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (152, 'Direction de chantier du BTP', 'F1202', 35);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (153, 'Direction et ingénierie d''exploitation de gisements et de carrières', 'F1203', 35);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (154, 'Qualité Sécurité Environnement et protection santé du BTP', 'F1204', 35);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (155, 'Conduite de grue', 'F1301', 36);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (156, 'Conduite d''engins de terrassement et de carrière', 'F1302', 36);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (157, 'Extraction liquide et gazeuse', 'F1401', 37);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (158, 'Extraction solide', 'F1402', 37);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (159, 'Montage de structures et de charpentes bois', 'F1501', 38);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (160, 'Montage de structures métalliques', 'F1502', 38);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (161, 'Réalisation - installation d''ossatures bois', 'F1503', 38);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (162, 'Application et décoration en plâtre, stuc et staff', 'F1601', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (163, 'Électricité bâtiment', 'F1602', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (164, 'Installation d''équipements sanitaires et thermiques', 'F1603', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (165, 'Montage d''agencements', 'F1604', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (166, 'Montage de réseaux électriques et télécoms', 'F1605', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (167, 'Peinture en bâtiment', 'F1606', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (168, 'Pose de fermetures menuisées', 'F1607', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (169, 'Pose de revêtements rigides', 'F1608', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (170, 'Pose de revêtements souples', 'F1609', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (171, 'Pose et restauration de couvertures', 'F1610', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (172, 'Réalisation et restauration de façades', 'F1611', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (173, 'Taille et décoration de pierres', 'F1612', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (174, 'Travaux d''étanchéité et d''isolation', 'F1613', 39);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (175, 'Construction en béton', 'F1701', 40);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (176, 'Construction de routes et voies', 'F1702', 40);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (177, 'Maçonnerie', 'F1703', 40);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (178, 'Préparation du gros oeuvre et des travaux publics', 'F1704', 40);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (179, 'Pose de canalisations', 'F1705', 40);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (180, 'Préfabrication en béton industriel', 'F1706', 40);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (181, 'À préciser', 'G1001', 41);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (182, 'Accueil touristique', 'G1101', 42);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (183, 'Promotion du tourisme local', 'G1102', 42);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (184, 'Accompagnement de voyages, d''activités culturelles ou sportives', 'G1201', 43);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (185, 'Animation d''activités culturelles ou ludiques', 'G1202', 43);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (186, 'Animation de loisirs auprès d''enfants ou d''adolescents', 'G1203', 43);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (187, 'Éducation en activités sportives', 'G1204', 43);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (188, 'Personnel d''attractions ou de structures de loisirs', 'G1205', 43);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (189, 'Personnel technique des jeux', 'G1206', 43);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (190, 'Conception de produits touristiques', 'G1301', 44);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (191, 'Optimisation de produits touristiques', 'G1302', 44);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (192, 'Vente de voyages', 'G1303', 44);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (193, 'Assistance de direction d''hôtel-restaurant', 'G1401', 45);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (194, 'Management d''hôtel-restaurant', 'G1402', 45);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (195, 'Gestion de structure de loisirs ou d''hébergement touristique', 'G1403', 45);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (196, 'Management d''établissement de restauration collective', 'G1404', 45);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (197, 'Personnel d''étage', 'G1501', 46);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (198, 'Personnel polyvalent d''hôtellerie', 'G1502', 46);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (199, 'Management du personnel d''étage', 'G1503', 46);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (200, 'Management du personnel de cuisine', 'G1601', 47);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (201, 'Personnel de cuisine', 'G1602', 47);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (202, 'Personnel polyvalent en restauration', 'G1603', 47);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (203, 'Fabrication de crêpes ou pizzas', 'G1604', 47);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (204, 'Plonge en restauration', 'G1605', 47);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (205, 'Conciergerie en hôtellerie', 'G1701', 48);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (206, 'Personnel du hall', 'G1702', 48);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (207, 'Réception en hôtellerie', 'G1703', 48);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (208, 'Café, bar brasserie', 'G1801', 49);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (209, 'Management du service en restauration', 'G1802', 49);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (210, 'Service en restauration', 'G1803', 49);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (211, 'Sommellerie', 'G1804', 49);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (470, 'À préciser', 'H1001', 50);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (471, 'Assistance et support technique client', 'H1101', 51);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (472, 'Management et ingénierie d''affaires', 'H1102', 51);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (473, 'Expertise technique couleur en industrie', 'H1201', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (474, 'Conception et dessin de produits électriques et électroniques', 'H1202', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (475, 'Conception et dessin produits mécaniques', 'H1203', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (476, 'Design industriel', 'H1204', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (477, 'Études - modèles en industrie des matériaux souples', 'H1205', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (478, 'Management et ingénierie études, recherche et développement industriel', 'H1206', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (479, 'Rédaction technique', 'H1207', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (480, 'Intervention technique en études et conception en automatisme', 'H1208', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (481, 'Intervention technique en études et développement électronique', 'H1209', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (482, 'Intervention technique en études, recherche et développement', 'H1210', 52);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (483, 'Inspection de conformité', 'H1301', 53);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (484, 'Management et ingénierie Hygiène Sécurité Environnement -HSE- industriels', 'H1302', 53);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (485, 'Intervention technique en Hygiène Sécurité Environnement -HSE- industriel', 'H1303', 53);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (486, 'Management et ingénierie gestion industrielle et logistique', 'H1401', 54);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (487, 'Management et ingénierie méthodes et industrialisation', 'H1402', 54);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (488, 'Intervention technique en gestion industrielle et logistique', 'H1403', 54);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (489, 'Intervention technique en méthodes et industrialisation', 'H1404', 54);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (490, 'Direction de laboratoire d''analyse industrielle', 'H1501', 55);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (491, 'Management et ingénierie qualité industrielle', 'H1502', 55);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (492, 'Intervention technique en laboratoire d''analyse industrielle', 'H1503', 55);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (493, 'Intervention technique en contrôle essai qualité en électricité et électronique', 'H1504', 55);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (494, 'Intervention technique en formulation et analyse sensorielle', 'H1505', 55);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (495, 'Intervention technique qualité en mécanique et travail des métaux', 'H1506', 55);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (496, 'Abattage et découpe des viandes', 'H2101', 56);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (497, 'Conduite d''équipement de production alimentaire', 'H2102', 56);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (498, 'Assemblage d''ouvrages en bois', 'H2201', 57);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (499, 'Conduite d''équipement de fabrication de l''ameublement et du bois', 'H2202', 57);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (500, 'Conduite d''installation de production de panneaux bois', 'H2203', 57);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (501, 'Encadrement des industries de l''ameublement et du bois', 'H2204', 57);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (502, 'Première transformation de bois d''oeuvre', 'H2205', 57);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (503, 'Réalisation de menuiserie bois et tonnellerie', 'H2206', 57);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (504, 'Réalisation de meubles en bois', 'H2207', 57);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (505, 'Réalisation d''ouvrages décoratifs en bois', 'H2208', 57);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (506, 'Intervention technique en ameublement et bois', 'H2209', 57);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (507, 'Conduite d''équipement de production chimique ou pharmaceutique', 'H2301', 58);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (508, 'Assemblage - montage d''articles en cuirs, peaux', 'H2401', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (509, 'Assemblage - montage de vêtements et produits textiles', 'H2402', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (510, 'Conduite de machine de fabrication de produits textiles', 'H2403', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (511, 'Conduite de machine de production et transformation des fils', 'H2404', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (512, 'Conduite de machine de textiles nontissés', 'H2405', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (513, 'Conduite de machine de traitement textile', 'H2406', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (514, 'Conduite de machine de transformation et de finition des cuirs et peaux', 'H2407', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (515, 'Conduite de machine d''impression textile', 'H2408', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (516, 'Coupe cuir, textile et matériaux souples', 'H2409', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (517, 'Mise en forme, repassage et finitions en industrie textile', 'H2410', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (518, 'Montage de prototype cuir et matériaux souples', 'H2411', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (519, 'Patronnage - gradation', 'H2412', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (520, 'Préparation de fils, montage de métiers textiles', 'H2413', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (521, 'Préparation et finition d''articles en cuir et matériaux souples', 'H2414', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (522, 'Contrôle en industrie du cuir et du textile', 'H2415', 59);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (523, 'Encadrement de production de matériel électrique et électronique', 'H2501', 60);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (524, 'Management et ingénierie de production', 'H2502', 60);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (525, 'Pilotage d''unité élémentaire de production mécanique ou de travail des métaux', 'H2503', 60);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (526, 'Encadrement d''équipe en industrie de transformation', 'H2504', 60);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (527, 'Encadrement d''équipe ou d''atelier en matériaux souples', 'H2505', 60);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (528, 'Bobinage électrique', 'H2601', 61);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (529, 'Câblage électrique et électromécanique', 'H2602', 61);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (530, 'Conduite d''installation automatisée de production électrique, électronique et microélectronique', 'H2603', 61);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (531, 'Montage de produits électriques et électroniques', 'H2604', 61);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (532, 'Montage et câblage électronique', 'H2605', 61);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (533, 'Pilotage d''installation énergétique et pétrochimique', 'H2701', 62);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (534, 'Conduite d''équipement de transformation du verre', 'H2801', 63);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (535, 'Conduite d''installation de production de matériaux de construction', 'H2802', 63);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (536, 'Façonnage et émaillage en industrie céramique', 'H2803', 63);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (537, 'Pilotage de centrale à béton prêt à l''emploi, ciment, enrobés et granulats', 'H2804', 63);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (538, 'Pilotage d''installation de production verrière', 'H2805', 63);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (539, 'Ajustement et montage de fabrication', 'H2901', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (540, 'Chaudronnerie - tôlerie', 'H2902', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (541, 'Conduite d''équipement d''usinage', 'H2903', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (542, 'Conduite d''équipement de déformation des métaux', 'H2904', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (543, 'Conduite d''équipement de formage et découpage des matériaux', 'H2905', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (544, 'Conduite d''installation automatisée ou robotisée de fabrication mécanique', 'H2906', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (545, 'Conduite d''installation de production des métaux', 'H2907', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (546, 'Modelage de matériaux non métalliques', 'H2908', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (547, 'Montage-assemblage mécanique', 'H2909', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (548, 'Moulage sable', 'H2910', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (549, 'Réalisation de structures métalliques', 'H2911', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (550, 'Réglage d''équipement de production industrielle', 'H2912', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (551, 'Soudage manuel', 'H2913', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (552, 'Réalisation et montage en tuyauterie', 'H2914', 64);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (553, 'Conduite d''équipement de fabrication de papier ou de carton', 'H3101', 65);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (554, 'Conduite d''installation de pâte à papier', 'H3102', 65);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (555, 'Conduite d''équipement de formage des plastiques et caoutchoucs', 'H3201', 66);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (556, 'Réglage d''équipement de formage des plastiques et caoutchoucs', 'H3202', 66);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (557, 'Fabrication de pièces en matériaux composites', 'H3203', 66);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (558, 'Conduite d''équipement de conditionnement', 'H3301', 67);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (559, 'Opérations manuelles d''assemblage, tri ou emballage', 'H3302', 67);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (560, 'Préparation de matières et produits industriels (broyage, mélange, ...)', 'H3303', 67);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (561, 'Conduite de traitement d''abrasion de surface', 'H3401', 68);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (562, 'Conduite de traitement par dépôt de surface', 'H3402', 68);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (563, 'Conduite de traitement thermique', 'H3403', 68);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (564, 'Peinture industrielle', 'H3404', 68);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (230, 'À préciser', 'I1001', 69);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (231, 'Direction et ingénierie en entretien infrastructure et bâti', 'I1101', 70);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (232, 'Management et ingénierie de maintenance industrielle', 'I1102', 70);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (233, 'Supervision d''entretien et gestion de véhicules', 'I1103', 70);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (234, 'Entretien d''affichage et mobilier urbain', 'I1201', 71);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (235, 'Entretien et surveillance du tracé routier', 'I1202', 71);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (236, 'Maintenance des bâtiments et des locaux', 'I1203', 71);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (237, 'Installation et maintenance d''ascenseurs', 'I1301', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (238, 'Installation et maintenance d''automatismes', 'I1302', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (239, 'Installation et maintenance de distributeurs automatiques', 'I1303', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (240, 'Installation et maintenance d''équipements industriels et d''exploitation', 'I1304', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (241, 'Installation et maintenance électronique', 'I1305', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (242, 'Installation et maintenance en froid, conditionnement d''air', 'I1306', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (243, 'Installation et maintenance télécoms et courants faibles', 'I1307', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (244, 'Maintenance d''installation de chauffage', 'I1308', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (245, 'Maintenance électrique', 'I1309', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (246, 'Maintenance mécanique industrielle', 'I1310', 72);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (247, 'Maintenance informatique et bureautique', 'I1401', 73);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (248, 'Réparation de biens électrodomestiques et multimédia', 'I1402', 73);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (249, 'Intervention en grande hauteur', 'I1501', 74);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (250, 'Intervention en milieu subaquatique', 'I1502', 74);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (251, 'Intervention en milieux et produits nocifs', 'I1503', 74);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (252, 'Installation et maintenance en nautisme', 'I1601', 75);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (253, 'Maintenance d''aéronefs', 'I1602', 75);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (254, 'Maintenance d''engins de chantier, levage, manutention et de machines agricoles', 'I1603', 75);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (255, 'Mécanique automobile et entretien de véhicules', 'I1604', 75);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (256, 'Mécanique de marine', 'I1605', 75);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (257, 'Réparation de carrosserie', 'I1606', 75);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (258, 'Réparation de cycles, motocycles et motoculteurs de loisirs', 'I1607', 75);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (259, 'À préciser', 'J1001', 76);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (260, 'Médecine de prévention', 'J1101', 77);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (261, 'Médecine généraliste et spécialisée', 'J1102', 77);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (262, 'Médecine dentaire', 'J1103', 77);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (263, 'Suivi de la grossesse et de l''accouchement', 'J1104', 77);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (264, 'Biologie médicale', 'J1201', 78);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (265, 'Pharmacie', 'J1202', 78);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (266, 'Personnel polyvalent des services hospitaliers', 'J1301', 79);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (267, 'Analyses médicales', 'J1302', 79);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (268, 'Assistance médico-technique', 'J1303', 79);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (269, 'Aide en puériculture', 'J1304', 79);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (270, 'Conduite de véhicules sanitaires', 'J1305', 79);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (271, 'Imagerie médicale', 'J1306', 79);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (272, 'Préparation en pharmacie', 'J1307', 79);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (273, 'Audioprothèses', 'J1401', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (274, 'Diététique', 'J1402', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (275, 'Ergothérapie', 'J1403', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (276, 'Kinésithérapie', 'J1404', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (277, 'Optique - lunetterie', 'J1405', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (278, 'Orthophonie', 'J1406', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (279, 'Orthoptique', 'J1407', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (280, 'Ostéopathie et chiropraxie', 'J1408', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (281, 'Pédicurie et podologie', 'J1409', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (282, 'Prothèses dentaires', 'J1410', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (283, 'Prothèses et orthèses', 'J1411', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (284, 'Rééducation en psychomotricité', 'J1412', 80);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (285, 'Soins d''hygiène, de confort du patient', 'J1501', 81);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (286, 'Coordination de services médicaux ou paramédicaux', 'J1502', 81);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (287, 'Soins infirmiers spécialisés en anesthésie', 'J1503', 81);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (288, 'Soins infirmiers spécialisés en bloc opératoire', 'J1504', 81);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (289, 'Soins infirmiers spécialisés en prévention', 'J1505', 81);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (290, 'Soins infirmiers généralistes', 'J1506', 81);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (291, 'Soins infirmiers spécialisés en puériculture', 'J1507', 81);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (292, 'À préciser', 'K1001', 82);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (293, 'Accompagnement et médiation familiale', 'K1101', 83);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (294, 'Aide aux bénéficiaires d''une mesure de protection juridique', 'K1102', 83);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (295, 'Développement personnel et bien-être de la personne', 'K1103', 83);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (296, 'Psychologie', 'K1104', 83);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (297, 'Action sociale', 'K1201', 84);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (298, 'Éducation de jeunes enfants', 'K1202', 84);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (299, 'Encadrement technique en insertion professionnelle', 'K1203', 84);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (300, 'Médiation sociale et facilitation de la vie en société', 'K1204', 84);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (301, 'Information sociale', 'K1205', 84);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (302, 'Intervention socioculturelle', 'K1206', 84);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (303, 'Intervention socioéducative', 'K1207', 84);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (304, 'Accompagnement médicosocial', 'K1301', 85);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (305, 'Assistance auprès d''adultes', 'K1302', 85);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (306, 'Assistance auprès d''enfants', 'K1303', 85);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (307, 'Services domestiques', 'K1304', 85);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (308, 'Intervention sociale et familiale', 'K1305', 85);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (309, 'Conception et pilotage de la politique des pouvoirs publics', 'K1401', 86);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (310, 'Conseil en Santé Publique', 'K1402', 86);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (311, 'Management de structure de santé, sociale ou pénitentiaire', 'K1403', 86);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (312, 'Mise en oeuvre et pilotage de la politique des pouvoirs publics', 'K1404', 86);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (313, 'Représentation de l''État sur le territoire national ou international', 'K1405', 86);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (314, 'Application des règles financières publiques', 'K1501', 87);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (315, 'Contrôle et inspection des Affaires Sociales', 'K1502', 87);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (316, 'Contrôle et inspection des impôts', 'K1503', 87);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (317, 'Contrôle et inspection du Trésor Public', 'K1504', 87);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (318, 'Protection des consommateurs et contrôle des échanges commerciaux', 'K1505', 87);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (319, 'Gestion de l''information et de la documentation', 'K1601', 88);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (320, 'Gestion de patrimoine culturel', 'K1602', 88);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (321, 'Personnel de la Défense', 'K1701', 89);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (322, 'Direction de la sécurité civile et des secours', 'K1702', 89);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (323, 'Direction opérationnelle de la défense', 'K1703', 89);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (324, 'Management de la sécurité publique', 'K1704', 89);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (325, 'Sécurité civile et secours', 'K1705', 89);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (326, 'Sécurité publique', 'K1706', 89);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (327, 'Surveillance municipale', 'K1707', 89);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (328, 'Conseil en emploi et insertion socioprofessionnelle', 'K1801', 90);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (329, 'Développement local', 'K1802', 90);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (330, 'Aide et médiation judiciaire', 'K1901', 91);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (331, 'Collaboration juridique', 'K1902', 91);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (332, 'Défense et conseil juridique', 'K1903', 91);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (333, 'Magistrature', 'K1904', 91);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (334, 'Conseil en formation', 'K2101', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (335, 'Coordination pédagogique', 'K2102', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (336, 'Direction d''établissement et d''enseignement', 'K2103', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (337, 'Éducation et surveillance au sein d''établissements d''enseignement', 'K2104', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (338, 'Enseignement artistique', 'K2105', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (339, 'Enseignement des écoles', 'K2106', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (340, 'Enseignement général du second degré', 'K2107', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (341, 'Enseignement supérieur', 'K2108', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (342, 'Enseignement technique et professionnel', 'K2109', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (343, 'Formation en conduite de véhicules', 'K2110', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (344, 'Formation professionnelle', 'K2111', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (345, 'Orientation scolaire et professionnelle', 'K2112', 92);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (346, 'Blanchisserie industrielle', 'K2201', 93);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (347, 'Lavage de vitres', 'K2202', 93);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (348, 'Management et inspection en propreté de locaux', 'K2203', 93);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (349, 'Nettoyage de locaux', 'K2204', 93);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (350, 'Distribution et assainissement d''eau', 'K2301', 94);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (351, 'Management et inspection en environnement urbain', 'K2302', 94);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (352, 'Nettoyage des espaces urbains', 'K2303', 94);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (353, 'Revalorisation de produits industriels', 'K2304', 94);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (354, 'Salubrité et traitement de nuisibles', 'K2305', 94);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (355, 'Supervision d''exploitation éco-industrielle', 'K2306', 94);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (356, 'Recherche en sciences de l''homme et de la société', 'K2401', 95);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (357, 'Recherche en sciences de l''univers, de la matière et du vivant', 'K2402', 95);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (358, 'Gardiennage de locaux', 'K2501', 96);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (359, 'Management de sécurité privée', 'K2502', 96);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (360, 'Sécurité et surveillance privées', 'K2503', 96);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (361, 'Conduite d''opérations funéraires', 'K2601', 97);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (362, 'Conseil en services funéraires', 'K2602', 97);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (363, 'Thanatopraxie', 'K2603', 97);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (364, 'À préciser', 'L1001', 98);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (365, 'Animation musicale et scénique', 'L1101', 99);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (366, 'Mannequinat et pose artistique', 'L1102', 99);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (367, 'Présentation de spectacles ou d''émissions', 'L1103', 99);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (368, 'Danse', 'L1201', 100);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (369, 'Musique et chant', 'L1202', 100);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (370, 'Art dramatique', 'L1203', 100);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (371, 'Arts du cirque et arts visuels', 'L1204', 100);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (372, 'Mise en scène de spectacles vivants', 'L1301', 101);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (373, 'Production et administration spectacle, cinéma et audiovisuel', 'L1302', 101);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (374, 'Promotion d''artistes et de spectacles', 'L1303', 101);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (375, 'Réalisation cinématographique et audiovisuelle', 'L1304', 101);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (376, 'Sportif professionnel', 'L1401', 102);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (377, 'Coiffure et maquillage spectacle', 'L1501', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (378, 'Costume et habillage spectacle', 'L1502', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (379, 'Décor et accessoires spectacle', 'L1503', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (380, 'Éclairage spectacle', 'L1504', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (381, 'Image cinématographique et télévisuelle', 'L1505', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (382, 'Machinerie spectacle', 'L1506', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (383, 'Montage audiovisuel et post-production', 'L1507', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (384, 'Prise de son et sonorisation', 'L1508', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (385, 'Régie générale', 'L1509', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (386, 'Films d''animation et effets spéciaux', 'L1510', 103);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (387, 'À préciser', 'M1001', 104);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (388, 'Achats', 'M1101', 105);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (389, 'Direction des achats', 'M1102', 105);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (390, 'Analyse et ingénierie financière', 'M1201', 106);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (391, 'Audit et contrôle comptables et financiers', 'M1202', 106);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (392, 'Comptabilité', 'M1203', 106);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (393, 'Contrôle de gestion', 'M1204', 106);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (394, 'Direction administrative et financière', 'M1205', 106);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (395, 'Management de groupe ou de service comptable', 'M1206', 106);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (396, 'Trésorerie et financement', 'M1207', 106);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (397, 'Direction de grande entreprise ou d''établissement public', 'M1301', 107);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (398, 'Direction de petite ou moyenne entreprise', 'M1302', 107);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (399, 'Conduite d''enquêtes', 'M1401', 108);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (400, 'Conseil en organisation et management d''entreprise', 'M1402', 108);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (401, 'Études et prospectives socio-économiques', 'M1403', 108);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (402, 'Management et gestion d''enquêtes', 'M1404', 108);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (403, 'Assistanat en ressources humaines', 'M1501', 109);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (404, 'Développement des ressources humaines', 'M1502', 109);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (405, 'Management des ressources humaines', 'M1503', 109);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (406, 'Accueil et renseignements', 'M1601', 110);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (407, 'Opérations administratives', 'M1602', 110);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (408, 'Distribution de documents', 'M1603', 110);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (409, 'Assistanat de direction', 'M1604', 110);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (410, 'Assistanat technique et administratif', 'M1605', 110);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (411, 'Saisie de données', 'M1606', 110);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (412, 'Secrétariat', 'M1607', 110);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (413, 'Secrétariat comptable', 'M1608', 110);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (414, 'Secrétariat et assistanat médical ou médico-social', 'M1609', 110);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (415, 'Administration des ventes', 'M1701', 111);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (416, 'Analyse de tendance', 'M1702', 111);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (417, 'Management et gestion de produit', 'M1703', 111);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (418, 'Management relation clientèle', 'M1704', 111);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (419, 'Marketing', 'M1705', 111);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (420, 'Promotion des ventes', 'M1706', 111);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (421, 'Stratégie commerciale', 'M1707', 111);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (422, 'Administration de systèmes d''information', 'M1801', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (423, 'Expertise et support en systèmes d''information', 'M1802', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (424, 'Direction des systèmes d''information', 'M1803', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (425, 'Études et développement de réseaux de télécoms', 'M1804', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (426, 'Études et développement informatique', 'M1805', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (427, 'Conseil et maîtrise d''ouvrage en systèmes d''information', 'M1806', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (428, 'Exploitation de systèmes de communication et de commandement', 'M1807', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (429, 'Information géographique', 'M1808', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (430, 'Information météorologique', 'M1809', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (431, 'Production et exploitation de systèmes d''information', 'M1810', 112);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (432, 'À préciser', 'N1001', 113);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (433, 'Conduite d''engins de déplacement des charges', 'N1101', 114);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (434, 'Déménagement', 'N1102', 114);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (435, 'Magasinage et préparation de commandes', 'N1103', 114);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (436, 'Manoeuvre et conduite d''engins lourds de manutention', 'N1104', 114);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (437, 'Manutention manuelle de charges', 'N1105', 114);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (438, 'Affrètement transport', 'N1201', 115);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (439, 'Gestion des opérations de circulation internationale des marchandises', 'N1202', 115);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (440, 'Conception et organisation de la chaîne logistique', 'N1301', 116);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (441, 'Direction de site logistique', 'N1302', 116);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (442, 'Intervention technique d''exploitation logistique', 'N1303', 116);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (443, 'Navigation commerciale aérienne', 'N2101', 117);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (444, 'Pilotage et navigation technique aérienne', 'N2102', 117);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (445, 'Personnel d''escale aéroportuaire', 'N2201', 118);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (446, 'Contrôle de la navigation aérienne', 'N2202', 118);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (447, 'Exploitation des pistes aéroportuaires', 'N2203', 118);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (448, 'Préparation des vols', 'N2204', 118);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (449, 'Direction d''escale et exploitation aéroportuaire', 'N2205', 118);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (450, 'Encadrement de la navigation maritime', 'N3101', 119);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (451, 'Équipage de la navigation maritime', 'N3102', 119);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (452, 'Navigation fluviale', 'N3103', 119);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (453, 'Exploitation des opérations portuaires et du transport maritime', 'N3201', 120);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (454, 'Exploitation du transport fluvial', 'N3202', 120);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (455, 'Manutention portuaire', 'N3203', 120);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (456, 'Conduite de transport de marchandises sur longue distance', 'N4101', 121);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (457, 'Conduite de transport de particuliers', 'N4102', 121);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (458, 'Conduite de transport en commun sur route', 'N4103', 121);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (459, 'Courses et livraisons express', 'N4104', 121);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (460, 'Conduite et livraison par tournées sur courte distance', 'N4105', 121);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (461, 'Direction d''exploitation des transports routiers de marchandises', 'N4201', 122);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (462, 'Direction d''exploitation des transports routiers de personnes', 'N4202', 122);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (463, 'Intervention technique d''exploitation des transports routiers de marchandises', 'N4203', 122);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (464, 'Intervention technique d''exploitation des transports routiers de personnes', 'N4204', 122);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (465, 'Conduite sur rails', 'N4301', 123);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (466, 'Contrôle des transports en commun', 'N4302', 123);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (467, 'Circulation du réseau ferré', 'N4401', 124);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (468, 'Exploitation et manoeuvre des remontées mécaniques', 'N4402', 124);
INSERT INTO "job" ("id", "label", "codeRome", "domainId") values (469, 'Manoeuvre du réseau ferré', 'N4403', 124);
INSERT INTO "job" ("id", "label",  "domainId") values (565, 'À préciser', 2);
INSERT INTO "job" ("id", "label",  "domainId") values (566, 'À préciser', 3);
INSERT INTO "job" ("id", "label",  "domainId") values (567, 'À préciser', 4);
INSERT INTO "job" ("id", "label",  "domainId") values (568, 'À préciser', 5);
INSERT INTO "job" ("id", "label",  "domainId") values (569, 'À préciser', 6);
INSERT INTO "job" ("id", "label",  "domainId") values (570, 'À préciser', 7);
INSERT INTO "job" ("id", "label",  "domainId") values (571, 'À préciser', 8);
INSERT INTO "job" ("id", "label",  "domainId") values (572, 'À préciser', 9);
INSERT INTO "job" ("id", "label",  "domainId") values (573, 'À préciser', 10);
INSERT INTO "job" ("id", "label",  "domainId") values (574, 'À préciser', 11);
INSERT INTO "job" ("id", "label",  "domainId") values (575, 'À préciser', 12);
INSERT INTO "job" ("id", "label",  "domainId") values (576, 'À préciser', 13);
INSERT INTO "job" ("id", "label",  "domainId") values (577, 'À préciser', 14);
INSERT INTO "job" ("id", "label",  "domainId") values (578, 'À préciser', 15);
INSERT INTO "job" ("id", "label",  "domainId") values (579, 'À préciser', 17);
INSERT INTO "job" ("id", "label",  "domainId") values (580, 'À préciser', 18);
INSERT INTO "job" ("id", "label",  "domainId") values (581, 'À préciser', 19);
INSERT INTO "job" ("id", "label",  "domainId") values (582, 'À préciser', 20);
INSERT INTO "job" ("id", "label",  "domainId") values (583, 'À préciser', 21);
INSERT INTO "job" ("id", "label",  "domainId") values (584, 'À préciser', 23);
INSERT INTO "job" ("id", "label",  "domainId") values (585, 'À préciser', 24);
INSERT INTO "job" ("id", "label",  "domainId") values (586, 'À préciser', 25);
INSERT INTO "job" ("id", "label",  "domainId") values (587, 'À préciser', 26);
INSERT INTO "job" ("id", "label",  "domainId") values (588, 'À préciser', 27);
INSERT INTO "job" ("id", "label",  "domainId") values (589, 'À préciser', 29);
INSERT INTO "job" ("id", "label",  "domainId") values (590, 'À préciser', 30);
INSERT INTO "job" ("id", "label",  "domainId") values (591, 'À préciser', 31);
INSERT INTO "job" ("id", "label",  "domainId") values (592, 'À préciser', 32);
INSERT INTO "job" ("id", "label",  "domainId") values (593, 'À préciser', 34);
INSERT INTO "job" ("id", "label",  "domainId") values (594, 'À préciser', 35);
INSERT INTO "job" ("id", "label",  "domainId") values (595, 'À préciser', 36);
INSERT INTO "job" ("id", "label",  "domainId") values (596, 'À préciser', 37);
INSERT INTO "job" ("id", "label",  "domainId") values (597, 'À préciser', 38);
INSERT INTO "job" ("id", "label",  "domainId") values (598, 'À préciser', 39);
INSERT INTO "job" ("id", "label",  "domainId") values (599, 'À préciser', 40);
INSERT INTO "job" ("id", "label",  "domainId") values (600, 'À préciser', 42);
INSERT INTO "job" ("id", "label",  "domainId") values (601, 'À préciser', 43);
INSERT INTO "job" ("id", "label",  "domainId") values (602, 'À préciser', 44);
INSERT INTO "job" ("id", "label",  "domainId") values (603, 'À préciser', 45);
INSERT INTO "job" ("id", "label",  "domainId") values (604, 'À préciser', 46);
INSERT INTO "job" ("id", "label",  "domainId") values (605, 'À préciser', 47);
INSERT INTO "job" ("id", "label",  "domainId") values (606, 'À préciser', 48);
INSERT INTO "job" ("id", "label",  "domainId") values (607, 'À préciser', 49);
INSERT INTO "job" ("id", "label",  "domainId") values (608, 'À préciser', 51);
INSERT INTO "job" ("id", "label",  "domainId") values (609, 'À préciser', 52);
INSERT INTO "job" ("id", "label",  "domainId") values (610, 'À préciser', 53);
INSERT INTO "job" ("id", "label",  "domainId") values (611, 'À préciser', 54);
INSERT INTO "job" ("id", "label",  "domainId") values (612, 'À préciser', 55);
INSERT INTO "job" ("id", "label",  "domainId") values (613, 'À préciser', 56);
INSERT INTO "job" ("id", "label",  "domainId") values (614, 'À préciser', 57);
INSERT INTO "job" ("id", "label",  "domainId") values (615, 'À préciser', 58);
INSERT INTO "job" ("id", "label",  "domainId") values (616, 'À préciser', 59);
INSERT INTO "job" ("id", "label",  "domainId") values (617, 'À préciser', 60);
INSERT INTO "job" ("id", "label",  "domainId") values (618, 'À préciser', 61);
INSERT INTO "job" ("id", "label",  "domainId") values (619, 'À préciser', 62);
INSERT INTO "job" ("id", "label",  "domainId") values (620, 'À préciser', 63);
INSERT INTO "job" ("id", "label",  "domainId") values (621, 'À préciser', 64);
INSERT INTO "job" ("id", "label",  "domainId") values (622, 'À préciser', 65);
INSERT INTO "job" ("id", "label",  "domainId") values (623, 'À préciser', 66);
INSERT INTO "job" ("id", "label",  "domainId") values (624, 'À préciser', 67);
INSERT INTO "job" ("id", "label",  "domainId") values (625, 'À préciser', 68);
INSERT INTO "job" ("id", "label",  "domainId") values (626, 'À préciser', 70);
INSERT INTO "job" ("id", "label",  "domainId") values (627, 'À préciser', 71);
INSERT INTO "job" ("id", "label",  "domainId") values (628, 'À préciser', 72);
INSERT INTO "job" ("id", "label",  "domainId") values (629, 'À préciser', 73);
INSERT INTO "job" ("id", "label",  "domainId") values (630, 'À préciser', 74);
INSERT INTO "job" ("id", "label",  "domainId") values (631, 'À préciser', 75);
INSERT INTO "job" ("id", "label",  "domainId") values (632, 'À préciser', 77);
INSERT INTO "job" ("id", "label",  "domainId") values (633, 'À préciser', 78);
INSERT INTO "job" ("id", "label",  "domainId") values (634, 'À préciser', 79);
INSERT INTO "job" ("id", "label",  "domainId") values (635, 'À préciser', 80);
INSERT INTO "job" ("id", "label",  "domainId") values (636, 'À préciser', 81);
INSERT INTO "job" ("id", "label",  "domainId") values (637, 'À préciser', 83);
INSERT INTO "job" ("id", "label",  "domainId") values (638, 'À préciser', 84);
INSERT INTO "job" ("id", "label",  "domainId") values (639, 'À préciser', 85);
INSERT INTO "job" ("id", "label",  "domainId") values (640, 'À préciser', 86);
INSERT INTO "job" ("id", "label",  "domainId") values (641, 'À préciser', 87);
INSERT INTO "job" ("id", "label",  "domainId") values (642, 'À préciser', 88);
INSERT INTO "job" ("id", "label",  "domainId") values (643, 'À préciser', 89);
INSERT INTO "job" ("id", "label",  "domainId") values (644, 'À préciser', 90);
INSERT INTO "job" ("id", "label",  "domainId") values (645, 'À préciser', 91);
INSERT INTO "job" ("id", "label",  "domainId") values (646, 'À préciser', 92);
INSERT INTO "job" ("id", "label",  "domainId") values (647, 'À préciser', 93);
INSERT INTO "job" ("id", "label",  "domainId") values (648, 'À préciser', 94);
INSERT INTO "job" ("id", "label",  "domainId") values (649, 'À préciser', 95);
INSERT INTO "job" ("id", "label",  "domainId") values (650, 'À préciser', 96);
INSERT INTO "job" ("id", "label",  "domainId") values (651, 'À préciser', 97);
INSERT INTO "job" ("id", "label",  "domainId") values (652, 'À préciser', 99);
INSERT INTO "job" ("id", "label",  "domainId") values (653, 'À préciser', 100);
INSERT INTO "job" ("id", "label",  "domainId") values (654, 'À préciser', 101);
INSERT INTO "job" ("id", "label",  "domainId") values (655, 'À préciser', 102);
INSERT INTO "job" ("id", "label",  "domainId") values (656, 'À préciser', 103);
INSERT INTO "job" ("id", "label",  "domainId") values (657, 'À préciser', 105);
INSERT INTO "job" ("id", "label",  "domainId") values (658, 'À préciser', 106);
INSERT INTO "job" ("id", "label",  "domainId") values (659, 'À préciser', 107);
INSERT INTO "job" ("id", "label",  "domainId") values (660, 'À préciser', 108);
INSERT INTO "job" ("id", "label",  "domainId") values (661, 'À préciser', 109);
INSERT INTO "job" ("id", "label",  "domainId") values (662, 'À préciser', 110);
INSERT INTO "job" ("id", "label",  "domainId") values (663, 'À préciser', 111);
INSERT INTO "job" ("id", "label",  "domainId") values (664, 'À préciser', 112);
INSERT INTO "job" ("id", "label",  "domainId") values (665, 'À préciser', 114);
INSERT INTO "job" ("id", "label",  "domainId") values (666, 'À préciser', 115);
INSERT INTO "job" ("id", "label",  "domainId") values (667, 'À préciser', 116);
INSERT INTO "job" ("id", "label",  "domainId") values (668, 'À préciser', 117);
INSERT INTO "job" ("id", "label",  "domainId") values (669, 'À préciser', 118);
INSERT INTO "job" ("id", "label",  "domainId") values (670, 'À préciser', 119);
INSERT INTO "job" ("id", "label",  "domainId") values (671, 'À préciser', 120);
INSERT INTO "job" ("id", "label",  "domainId") values (672, 'À préciser', 121);
INSERT INTO "job" ("id", "label",  "domainId") values (673, 'À préciser', 122);
INSERT INTO "job" ("id", "label",  "domainId") values (674, 'À préciser', 123);
INSERT INTO "job" ("id", "label",  "domainId") values (675, 'À préciser', 124);

-- Stage Natures Types 
insert into stage_nature_type ("id", "nature", "type") values (1, 'Période d''emploi', 'CDI = ou + mi-temps');
insert into stage_nature_type ("id", "nature", "type") values (2, 'Période d''emploi', 'CDI - mi-temps');
insert into stage_nature_type ("id", "nature", "type") values (3, 'Période d''emploi', 'CDD + 6 mois');
insert into stage_nature_type ("id", "nature", "type") values (4, 'Période d''emploi', 'Contrat aidé en CDI');
insert into stage_nature_type ("id", "nature", "type") values (5, 'Période d''emploi', 'Création ou reprise d''entreprise effective');
insert into stage_nature_type ("id", "nature", "type") values (6, 'Période d''emploi', 'Intégration dans la fonction publique');
insert into stage_nature_type ("id", "nature", "type") values (7, 'Période d''emploi', 'CDD - de 6 mois et intérim');
insert into stage_nature_type ("id", "nature", "type") values (8, 'Période d''emploi', 'Contrat aidé en CDD');
insert into stage_nature_type ("id", "nature", "type") values (9, 'Période d''emploi', 'Emploi en SIAE (CDDI) ACI');
insert into stage_nature_type ("id", "nature", "type") values (10, 'Période d''emploi', 'Emploi en SIAE (CDDI) AI');
insert into stage_nature_type ("id", "nature", "type") values (11, 'Période d''emploi', 'Emploi en SIAE (CDDI) EI');
insert into stage_nature_type ("id", "nature", "type") values (12, 'Période d''emploi', 'Emploi en SIAE (CDDI) ETTI');
insert into stage_nature_type ("id", "nature", "type") values (13, 'Période d''emploi', 'Autres : préciser');

insert into stage_nature_type ("id", "nature", "type") values (14, 'Formation', 'Formation qualifiante ou cerfifiante (préciser durée)');
insert into stage_nature_type ("id", "nature", "type") values (15, 'Formation', 'Formation professionalisante (préciser la durée)');
insert into stage_nature_type ("id", "nature", "type") values (16, 'Formation', 'Autres : préciser');

insert into stage_nature_type ("id", "nature", "type") values (17, 'Accès à l''emploi', 'Prestations Pôle Emploi hors formation');
insert into stage_nature_type ("id", "nature", "type") values (18, 'Accès à l''emploi', 'Bénévolat');
insert into stage_nature_type ("id", "nature", "type") values (19, 'Accès à l''emploi', 'Mise en situation de travail (PMSMP stages)');
insert into stage_nature_type ("id", "nature", "type") values (20, 'Accès à l''emploi', 'Redynamisation');
insert into stage_nature_type ("id", "nature", "type") values (21, 'Accès à l''emploi', 'Bilan diagnostic');
insert into stage_nature_type ("id", "nature", "type") values (22, 'Accès à l''emploi', 'TRE, ARE, actions ou ateliers de techniques de recherche d''emploi');
insert into stage_nature_type ("id", "nature", "type") values (23, 'Accès à l''emploi', 'Français Langue étrangère');
insert into stage_nature_type ("id", "nature", "type") values (24, 'Accès à l''emploi', 'Informatique Inclusion numérique');
insert into stage_nature_type ("id", "nature", "type") values (25, 'Accès à l''emploi', 'Savoirs généraux hors FLE et informatique');
insert into stage_nature_type ("id", "nature", "type") values (62, 'Accès à l''emploi', 'Entretien d''embauche');
insert into stage_nature_type ("id", "nature", "type") values (63, 'Accès à l''emploi', 'Test préalable à l''embauche');
insert into stage_nature_type ("id", "nature", "type") values (26, 'Accès à l''emploi', 'Autres : préciser');

insert into stage_nature_type ("id", "nature", "type") values (27, '(Re) Mobilisation', 'Accès ou maintien aux soins et à la santé');
insert into stage_nature_type ("id", "nature", "type") values (28, '(Re) Mobilisation', 'Accès ou maintien au logement');
insert into stage_nature_type ("id", "nature", "type") values (29, '(Re) Mobilisation', 'Accès ou maintien des droits');
insert into stage_nature_type ("id", "nature", "type") values (30, '(Re) Mobilisation', 'Accès à la mobilité');
insert into stage_nature_type ("id", "nature", "type") values (31, '(Re) Mobilisation', 'Autonomie sociale, citoyenneté (dont bénévolat)');
insert into stage_nature_type ("id", "nature", "type") values (32, '(Re) Mobilisation', 'Autres : préciser');

insert into stage_nature_type ("id", "nature", "type", "category") values (33, 'Atelier collectif', 'TRE, ARE, actions ou ateliers de techniques de recherche d''emploi', 'Atelier collectif');
insert into stage_nature_type ("id", "nature", "type", "category") values (34, 'Atelier collectif', 'Resocialisation', 'Atelier collectif');
insert into stage_nature_type ("id", "nature", "type", "category") values (35, 'Atelier collectif', 'Organisation de projet', 'Atelier collectif');
insert into stage_nature_type ("id", "nature", "type", "category") values (36, 'Atelier collectif', 'Participation au GEPI', 'Atelier collectif');
insert into stage_nature_type ("id", "nature", "type", "category") values (37, 'Atelier collectif', 'Autres : préciser', 'Atelier collectif');

insert into stage_nature_type ("id", "nature", "type", "category") values (52, 'Action sur prescription', 'Accompagnement à l''emploi/compétences clés', 'Action sur prescription');
insert into stage_nature_type ("id", "nature", "type", "category") values (53, 'Action sur prescription', 'Aide à la mobilité', 'Action sur prescription');
insert into stage_nature_type ("id", "nature", "type", "category") values (54, 'Action sur prescription', 'Apprentissage de la langue française', 'Action sur prescription');
insert into stage_nature_type ("id", "nature", "type", "category") values (55, 'Action sur prescription', 'Inclusion numérique', 'Action sur prescription');
insert into stage_nature_type ("id", "nature", "type", "category") values (56, 'Action sur prescription', 'Santé', 'Action sur prescription');
insert into stage_nature_type ("id", "nature", "type", "category") values (57, 'Action sur prescription', 'Socialisation/Remobilisation', 'Action sur prescription');
insert into stage_nature_type ("id", "nature", "type", "category") values (58, 'Action sur prescription', 'SIAE (CDDI) ACI', 'Action sur prescription');
insert into stage_nature_type ("id", "nature", "type", "category") values (59, 'Action sur prescription', 'SIAE (CDDI) AI', 'Action sur prescription');
insert into stage_nature_type ("id", "nature", "type", "category") values (60, 'Action sur prescription', 'SIAE (CDDI) EI', 'Action sur prescription');
insert into stage_nature_type ("id", "nature", "type", "category") values (61, 'Action sur prescription', 'SIAE (CDDI) ETTI', 'Action sur prescription');

--  Document Title
insert into document_title values (1, 'CV', 'parcours');
insert into document_title values (2, 'Convocation initiale', 'parcours');
insert into document_title values (3, 'Convocation accompagnement', 'parcours');
insert into document_title values (4, 'Convocation suite absence', 'parcours');
insert into document_title values (5, 'Convocation avant signalement', 'parcours');
insert into document_title values (6, 'Fiche de liaison', 'parcours');
insert into document_title values (7, 'CER', 'parcours');
insert into document_title values (8, 'Contrat entrée IER', 'parcours');
insert into document_title values (9, 'Diagnostic entrée IER', 'parcours');
insert into document_title values (10, 'Annexe V', 'parcours');
insert into document_title values (11, 'Lettre de motivation', 'parcours');
insert into document_title values (12, 'Demande de fin de mission', 'parcours');
insert into document_title values (13, 'Fin de mission', 'parcours');
insert into document_title values (14, 'Bilan', 'parcours');
insert into document_title values (15, 'Autre', 'parcours');
insert into document_title values (16, 'eMail', 'parcours');
insert into document_title values (17, 'SMS', 'parcours');
insert into document_title values (18, 'Convocation IER', 'parcours');
insert into document_title values (19, 'Lettre de désignation', 'parcours');
insert into document_title values (20, 'Attestation Pôle Emploi', 'parcours');
insert into document_title values (21, 'Contrat de travail', 'parcours');
insert into document_title values (22, 'Attestation RSJ', 'rsj');
insert into document_title values (23, 'Convocation renouvellement RSJ', 'rsj');
insert into document_title values (24, 'Fiche récapitulative', 'parcours');
insert into document_title values (25, 'Justificatif RQTH', 'parcours');
insert into document_title values (26, 'Attestation Mission Locale', 'parcours');
insert into document_title values (27, 'Relevé d''identité bancaire', 'rsj');
insert into document_title values (28, 'Pièce d''identité', 'rsj');
insert into document_title values (29, 'Récépissé (pièce d''identité)', 'rsj');
insert into document_title values (30, 'Autre justificatif d''identité', 'rsj');
insert into document_title values (31, 'Récépissé (autre justificatif d''identité)', 'rsj');
insert into document_title values (32, 'Carte de résident ou titre de séjour', 'rsj');
insert into document_title values (33, 'Récépissé (renouvellement de titre de séjour)', 'rsj');
insert into document_title values (34, 'Rendez-vous préfecture', 'rsj');
insert into document_title values (35, 'Attestation d''hébergement', 'rsj');
insert into document_title values (36, 'Justificatif de domicile d''un tiers', 'rsj');
insert into document_title values (37, 'Justificatif de domicile', 'rsj');
insert into document_title values (38, 'Attestation CHRS', 'rsj');
insert into document_title values (39, 'Attestation de domiciliation', 'rsj');
insert into document_title values (40, 'Autre', 'rsj');
INSERT INTO document_title values (41, 'Attestation de Contrat Jeune Majeur', 'rsj');
INSERT INTO document_title values (42, 'Récépissé (Contrat Jeune Majeur)', 'rsj');

--  users
insert into "user"
    ("id", "email", "name", "firstname", "lastname")
values(1, 'nruffinoni@grandlyon.com', 'Nathalie Ruffinoni', 'Nathalie', 'Ruffinoni');
insert into "user"
    ("id", "email", "name", "firstname", "lastname")
values(2, 'jean-michel.frecinat@open-groupe.com', 'Jean-Michel Frecinat', 'Jean-Michel', 'Frecinat');
insert into "user"
    ("id", "email", "name", "firstname", "lastname")
values(3, 'mathieu.rondot@open-groupe.com', 'Mathieu Rondot', 'Mathieu', 'Rondot');
insert into "user"
    ("id", "email", "name", "firstname", "lastname", "passwordHash", "passwordSalt")
values(4, 'admin@open-groupe.com', 'Administrateur', 'Administrateur', 'Administrateur',
'QSBojwDU9rQebT3tewdgNKmy62t42Pw1CW0zfTMzgjohqKsw2jH58yxeeIIlgKrgzm4eMdz2d99pUvY7jSNN4w==',
'U2FsdGVkX19bGSFtuUA6BCwFsZCy4ai8as14WCfV5eBEkk5bKQWEX9HuC1G7s9EQkrIfLpdGJ70If58gJzqAffbGWcwwHm2gQeQQoSRW5/0KF4uGaY1iFD624TI3YSOs0Pq5F2EaD/I+a0WL8XdwRdudxtm5Qm78BuLgks4s8hKlxEejrz7lEl4Iy6ppB14/FNRfHLYva0Xhu7ugX7vIOQ==');
insert into "user"
    ("id", "email", "name", "firstname", "lastname", "passwordHash", "passwordSalt")
values(5, 'structure@open-groupe.com', 'Structure', 'Structure', 'Structure',
'ZxR1fAo4r0N79YUoZcmLQSXcolsQ9bYHuz2YVOXBIZeLlyrkSR/EtqauSF3R0ftcm9VyuorSh3dpAeK/C/iLRg==',
'U2FsdGVkX18rMoeyyrkZni5xucJHSHaDfLnfK4OnfYzHxcRW0LzS4gn7Te5I+b0rnpPEn3cYQf+KeD1QoisPyEyaQgn+Pre081qjx03thi/v0X2H8fQIXeULdlyvQR5hngBhpgcz9BgOf5u+nDh9/HI+03RBFBjQ7db650aGJfj0hrRvYicHi9yASut+Q6RWJv+H5Nxa9865UDw/umn5pQ==');
insert into "user"
    ("id", "email", "name", "firstname", "lastname", "passwordHash", "passwordSalt")
values(6, 'territoire@open-groupe.com', 'Territoire', 'Territoire', 'Territoire',
'AVwU81WSC5kGILGqyfUlUi1U3TXb8LOuxGyItpw4GyYyY+D9h+4AM0CCCqUHdTTgINQexY+0Uo9ZHCGZOlOUrw==',
'U2FsdGVkX1+0ntNbvrrDHZHg4EqeZdBnZLQHe71yZPi8ZN+Hn4DwTwKU+XjQ+Hhhnjn/pa9qnI4Z8Gn3T7boEz2h4YG8diR3G3N7dg2bVIHTvtQD7kQHoXocuJaHOY+OKl+QImHVUhBb9J5tluGOgDipr4c48LMqGoUlPLFJDLjqW0g50N4hchK/QCoejhqxCBMEjjpApAo76O37o7M0DQ==');
insert into "user"
    ("id", "email", "name", "firstname", "lastname", "passwordHash", "passwordSalt")
values(7, 'direction@open-groupe.com', 'Direction', 'Direction', 'Direction',
'Rm+L1giHqZj8U7A7y/4qOLqFEmcR39FjqzHu8M0W+tQP8pQ7kPleSXPuEBf97wd4mefUrrK+cu/2WnIOGzz4AQ==',
'U2FsdGVkX1+IXjSt5fnOKJg+WBvTUS4oI/45qdZ95SBsSFEwfvYi4ulJiWWs8fFgSq6FOQdB6eDn2Z0V3nGKnwsa7RGN7koNYUaUg03DWgu6uAd7qbJE9MJLb01jRXCZPw5QSqrLZ3frOcWmcB/Qa6jf8qDgx13TAQRtwMpE3AQaUm7qZS/NG7n894wxSyseavd6b2L7PvA7TCqp2242RA==');
insert into "user"
    ("id", "email", "name", "firstname", "lastname", "passwordHash", "passwordSalt")
values(8, 'direction.plus@open-groupe.com', ' Direction Direction+', 'Direction', 'Direction+',
'Toia1TGlXRUgAxWNitPfgyAKwmVvqtvGHy4QDlLPtUKZXHNOJnaREaniOpRnGyOTE1mF4ShopZm0Khoos78EwA==',
'U2FsdGVkX18S6vzGyEaPmS/WKf5DAPv+Gx5DbKB4cZV7HI+S8HMl3ph7YtUuZ3Ypvzy/a3mG2qPyXpNMF5Liyqr/N8rV2f71NapCzGzcfdYPpoQ0G9bxmKccgdCOBnyUjnyvFtGiXJbCHZN3kfdoZvQHVKbig+kk2ERTQP6AkBa5o+bCq2ET4DGs4v6/KHWp/kKffUWuOXdPaLK/2xeyPg==');
insert into "user"
    ("id", "email", "name", "firstname", "lastname", "passwordHash", "passwordSalt")
values(9, 'mmie@open-groupe.com', 'Maison Metropolitaine de l''Insertion pour l''Emploi', 'MMIE', 'MMIE',
'QNDUW1uEp4PchPT66XWC1OjTi5L/6EAHurvgEpe+fYTzYK8pGhv6l6MoAUs3TANrwQ/4XXQPvjy1Ev8IgO0WNw==',
'U2FsdGVkX19SqSv4eLpEyhPZLV14oOYtgiImN8dOX9LIgUuSLlPvO3dFWM+k6GhDKId5rRvOxWuVI67wKl3Pi8XIcugYO3jTaav+ve0hmgGxC4McYQy4/jUOJnXprr7RVFH/teH5898YEydxIHVy4EPQDXg5JdlGezASciQ/uXi8YAFCXcQUQ+MGZcfu4pYxbZYjGLKpxh4D3Gh4bjqisA==');
insert into "user"
    ("id", "email", "name", "firstname", "lastname", "passwordHash", "passwordSalt")
values(10, 'territoire.bis@open-groupe.com', 'Territoire Bis', 'Territoire', 'Bis',
'AVwU81WSC5kGILGqyfUlUi1U3TXb8LOuxGyItpw4GyYyY+D9h+4AM0CCCqUHdTTgINQexY+0Uo9ZHCGZOlOUrw==',
'U2FsdGVkX1+0ntNbvrrDHZHg4EqeZdBnZLQHe71yZPi8ZN+Hn4DwTwKU+XjQ+Hhhnjn/pa9qnI4Z8Gn3T7boEz2h4YG8diR3G3N7dg2bVIHTvtQD7kQHoXocuJaHOY+OKl+QImHVUhBb9J5tluGOgDipr4c48LMqGoUlPLFJDLjqW0g50N4hchK/QCoejhqxCBMEjjpApAo76O37o7M0DQ==');
insert into "user"
    ("id", "email", "name", "firstname", "lastname", "passwordHash", "passwordSalt")
values(11, 'structure.bis@open-groupe.com', 'Structure Bis', 'Structure', 'Bis',
'ZxR1fAo4r0N79YUoZcmLQSXcolsQ9bYHuz2YVOXBIZeLlyrkSR/EtqauSF3R0ftcm9VyuorSh3dpAeK/C/iLRg==',
'U2FsdGVkX18rMoeyyrkZni5xucJHSHaDfLnfK4OnfYzHxcRW0LzS4gn7Te5I+b0rnpPEn3cYQf+KeD1QoisPyEyaQgn+Pre081qjx03thi/v0X2H8fQIXeULdlyvQR5hngBhpgcz9BgOf5u+nDh9/HI+03RBFBjQ7db650aGJfj0hrRvYicHi9yASut+Q6RWJv+H5Nxa9865UDw/umn5pQ==');
insert into "user"
    ("id", "email", "name", "firstname", "lastname", "passwordHash", "passwordSalt")
values(12, 'mmie.bis@open-groupe.com', 'Maison Metropolitaine de l''Insertion pour l''Emploi Bis', 'Bis', 'MMIE',
'QNDUW1uEp4PchPT66XWC1OjTi5L/6EAHurvgEpe+fYTzYK8pGhv6l6MoAUs3TANrwQ/4XXQPvjy1Ev8IgO0WNw==',
'U2FsdGVkX19SqSv4eLpEyhPZLV14oOYtgiImN8dOX9LIgUuSLlPvO3dFWM+k6GhDKId5rRvOxWuVI67wKl3Pi8XIcugYO3jTaav+ve0hmgGxC4McYQy4/jUOJnXprr7RVFH/teH5898YEydxIHVy4EPQDXg5JdlGezASciQ/uXi8YAFCXcQUQ+MGZcfu4pYxbZYjGLKpxh4D3Gh4bjqisA==');
insert into "user"
    ("id", "email", "name", "firstname", "lastname")
values(13, 'tabitha.reynolds@open-groupe.com', 'Tabitha Reynolds', 'Tabitha', 'Reynolds');
insert into "user"
    ("id", "email", "name", "firstname", "lastname")
values(14, 'maxim.lapierre@open-groupe.com', 'Maxim Lapierre', 'Maxim', 'Lapierre');
insert into "user"
    ("id", "email", "name", "firstname", "lastname")
values(15, 'peter.bondra@open-groupe.com', 'Peter Bondra', 'Peter', 'Bondra');
insert into "user"
    ("id", "email", "name", "firstname", "lastname")
values(16, 'mwillmann@grandlyon.com', 'Matilde Willmann', 'Matilde','Willmann');

-- user group
insert into "user_group" values (1, 'ADMIN' );
insert into "user_group" values (2, 'ADMIN' );
insert into "user_group" values (3, 'ADMIN' );
insert into "user_group" values (4, 'ADMIN' );
insert into "user_group" values (5, 'STRUCTURE' );
insert into "user_group" values (6, 'TERRITORY' );
insert into "user_group" values (7, 'DIRECTION' );
insert into "user_group" values (8, 'DIRECTION+' );
insert into "user_group" values (9, 'MMIE' );
insert into "user_group" values (10, 'TERRITORY' );
insert into "user_group" values (11, 'STRUCTURE' );
insert into "user_group" values (12, 'MMIE' );
insert into "user_group" values (13, 'STRUCTURE' );
insert into "user_group" values (14, 'STRUCTURE' );
insert into "user_group" values (15, 'STRUCTURE' );
insert into "user_group" values (16, 'ADMIN' );

-- Adresses de la Métropole de LYON
INSERT INTO "address"(
	"id", "main", "complement", "postalCode", "city")
	VALUES (1, '20, rue du LAC', null, '69003', 'LYON');
INSERT INTO "address"(
	"id", "main", "complement", "postalCode", "city")
	VALUES (2, '24, rue Étienne ROGNON', null, '69007', 'LYON');

-- Couvertures Santé
INSERT INTO health_insurance ("id", "label") values 
    (1, 'Sans couverture'),
    (3, 'PUMa'),
    (4, 'Ayant droit sécurité sociale'),
    (5, 'Affilié sécurité sociale'),
    (6, 'CSS');
    
-- Situations au moment de la demande de RSJ
INSERT INTO rsj_situation ("id", "label") VALUES
    (1, 'Ni en emploi ni en formation'),
    (2, 'EPIDE'),
    (3, 'E2C'),
    (4, 'Garantie Jeune'),
    (5, 'PACEA'),
    (6, 'AIJ'),
    (7, 'IER'),
    (8, 'Stagiaire de la formation professionnelle'),
    (9, 'Intérim'),
    (10, 'CDD temps partiel'),
    (11, 'CDI temps partiel'),
    (12, 'Formation initiale'),
    (13, 'CDDI'),
    (14, 'Apprentissage'),
    (15, 'Contrat de professionnalisation'),
    (16, 'CDD temps plein'),
    (17, 'CDI temps plein'),
    (18, 'Service Civique'),
    (19, 'CARED/POE'),
    (20, 'Contrat aidé'),
    (21, 'RSA'),
    (22, 'Autre'),
    (23, 'CEJ');

-- Dispositifs mobilisés la demande de RSJ
INSERT INTO rsj_mobilized_plan ("id", "label") VALUES
    (1, 'EPIDE'),
    (2, 'E2C'),
    (3, 'Garantie Jeune'),
    (4, 'PACEA'),
    (5, 'AIJ'),
    (6, 'IER'),
    (7, 'Service Civique'),
    (8, 'CDDI'),
    (9, 'Contrat aidé'),
    (10, 'RSA'),
    (11, 'Contrat jeune majeur'),
    (12, 'Autre'),
    (13, 'Aucun'),
    (14, 'CEJ');

-- Catégories d'habilitations
INSERT INTO "clearance_category" ("name","label") VALUES 
    ('CLR_CAT_VALIDATOR', 'Validateurs'),
    ('CLR_CAT_SIGNATORY', 'Signataires');

-- Habilitations
INSERT INTO "clearance" ("name", "label", "categoryName") VALUES
    ('CLR_VALIDATOR_IER', 'Validateur IER', 'CLR_CAT_VALIDATOR'),
    ('CLR_VALIDATOR_RSJ', 'Validateur RSJ', 'CLR_CAT_VALIDATOR'),
    ('CLR_SIGNATORY_IER', 'Signataire IER', 'CLR_CAT_SIGNATORY');

-- Liens habilitations / groupes
INSERT INTO "clearance_group"("clearanceName", "groupName") VALUES
    ('CLR_VALIDATOR_IER', 'DIRECTION+'),
    ('CLR_VALIDATOR_RSJ', 'DIRECTION+'),
    ('CLR_SIGNATORY_IER', 'DIRECTION+');

-- Villes de la metropole
INSERT INTO "metropole_town" VALUES ('69003', 'ALBIGNY SUR SAONE', '69250', 16);
INSERT INTO "metropole_town" VALUES ('69029', 'BRON', '69500', 17);
INSERT INTO "metropole_town" VALUES ('69033', 'CAILLOUX SUR FONTAINES', '69270', 18);
INSERT INTO "metropole_town" VALUES ('69034', 'CALUIRE ET CUIRE', '69300', 19);
INSERT INTO "metropole_town" VALUES ('69040', 'CHAMPAGNE AU MONT D OR', '69410', 15);
INSERT INTO "metropole_town" VALUES ('69044', 'CHARBONNIERES LES BAINS', '69260', 14);
INSERT INTO "metropole_town" VALUES ('69046', 'CHARLY', '69390', 20);
INSERT INTO "metropole_town" VALUES ('69271', 'CHASSIEU', '69680', 14);
INSERT INTO "metropole_town" VALUES ('69063', 'COLLONGES AU MONT D OR', '69660', 20);
INSERT INTO "metropole_town" VALUES ('69273', 'CORBAS', '69960', 14);
INSERT INTO "metropole_town" VALUES ('69068', 'COUZON AU MONT D OR', '69270', 14);
INSERT INTO "metropole_town" VALUES ('69069', 'CRAPONNE', '69290', 18);
INSERT INTO "metropole_town" VALUES ('69071', 'CURIS AU MONT D OR', '69250', 14);
INSERT INTO "metropole_town" VALUES ('69072', 'DARDILLY', '69570', 17);
INSERT INTO "metropole_town" VALUES ('69275', 'DECINES CHARPIEU', '69150', 21);
INSERT INTO "metropole_town" VALUES ('69081', 'ECULLY', '69130', 17);
INSERT INTO "metropole_town" VALUES ('69276', 'FEYZIN', '69320', 20);
INSERT INTO "metropole_town" VALUES ('69085', 'FLEURIEU SUR SAONE', '69250', 14);
INSERT INTO "metropole_town" VALUES ('69087', 'FONTAINES ST MARTIN', '69270', 14);
INSERT INTO "metropole_town" VALUES ('69008', 'FONTAINES SUR SAONE', '69270', 14);
INSERT INTO "metropole_town" VALUES ('69089', 'FRANCHEVILLE', '69340', 18);
INSERT INTO "metropole_town" VALUES ('69278', 'GENAY', '69730', 14);
INSERT INTO "metropole_town" VALUES ('69091', 'GIVORS', '69700', 19);
INSERT INTO "metropole_town" VALUES ('69096', 'GRIGNY', '69520', 19);
INSERT INTO "metropole_town" VALUES ('69100', 'IRIGNY', '69540', 19);
INSERT INTO "metropole_town" VALUES ('69279', 'JONAGE', '69330', 21);
INSERT INTO "metropole_town" VALUES ('69142', 'LA MULATIERE', '69350', 19);
INSERT INTO "metropole_town" VALUES ('69250', 'LA TOUR DE SALVAGNY', '69890', 17);
INSERT INTO "metropole_town" VALUES ('69116', 'LIMONEST', '69760', 18);
INSERT INTO "metropole_town" VALUES ('69117', 'LISSIEU', '69380', 17);
INSERT INTO "metropole_town" VALUES ('69381', 'LYON', '69001', 13);
INSERT INTO "metropole_town" VALUES ('69382', 'LYON', '69002', 13);
INSERT INTO "metropole_town" VALUES ('69383', 'LYON', '69003', 13);
INSERT INTO "metropole_town" VALUES ('69384', 'LYON', '69004', 13);
INSERT INTO "metropole_town" VALUES ('69385', 'LYON', '69005', 13);
INSERT INTO "metropole_town" VALUES ('69386', 'LYON', '69006', 13);
INSERT INTO "metropole_town" VALUES ('69387', 'LYON', '69007', 13);
INSERT INTO "metropole_town" VALUES ('69388', 'LYON', '69008', 13);
INSERT INTO "metropole_town" VALUES ('69389', 'LYON', '69009', 13);
INSERT INTO "metropole_town" VALUES ('69127', 'MARCY L ETOILE', '69280', 18);
INSERT INTO "metropole_town" VALUES ('69282', 'MEYZIEU', '69330', 21);
INSERT INTO "metropole_town" VALUES ('69283', 'MIONS', '69780', 15);
INSERT INTO "metropole_town" VALUES ('69284', 'MONTANAY', '69250', 14);
INSERT INTO "metropole_town" VALUES ('69143', 'NEUVILLE SUR SAONE', '69250', 14);
INSERT INTO "metropole_town" VALUES ('69149', 'OULLINS', '69600', 19);
INSERT INTO "metropole_town" VALUES ('69152', 'PIERRE BENITE', '69310', 19);
INSERT INTO "metropole_town" VALUES ('69153', 'POLEYMIEUX AU MONT D OR', '69250', 14);
INSERT INTO "metropole_town" VALUES ('69163', 'QUINCIEUX', '69650', 14);
INSERT INTO "metropole_town" VALUES ('69286', 'RILLIEUX LA PAPE', '69140', 16);
INSERT INTO "metropole_town" VALUES ('69168', 'ROCHETAILLEE SUR SAONE', '69270', 14);
INSERT INTO "metropole_town" VALUES ('69191', 'ST CYR AU MONT D OR', '69450', 17);
INSERT INTO "metropole_town" VALUES ('69194', 'ST DIDIER AU MONT D OR', '69370', 17);
INSERT INTO "metropole_town" VALUES ('69199', 'ST FONS', '69190', 20);
INSERT INTO "metropole_town" VALUES ('69204', 'ST GENIS LAVAL', '69230', 19);
INSERT INTO "metropole_town" VALUES ('69205', 'ST GENIS LES OLLIERES', '69290', 18);
INSERT INTO "metropole_town" VALUES ('69207', 'ST GERMAIN AU MONT D OR', '69650', 14);
INSERT INTO "metropole_town" VALUES ('69290', 'ST PRIEST', '69800', 15);
INSERT INTO "metropole_town" VALUES ('69233', 'ST ROMAIN AU MONT D OR', '69270', 14);
INSERT INTO "metropole_town" VALUES ('69202', 'STE FOY LES LYON', '69110', 18);
INSERT INTO "metropole_town" VALUES ('69292', 'SATHONAY CAMP', '69580', 16);
INSERT INTO "metropole_town" VALUES ('69293', 'SATHONAY VILLAGE', '69580', 14);
INSERT INTO "metropole_town" VALUES ('69296', 'SOLAIZE', '69360', 20);
INSERT INTO "metropole_town" VALUES ('69244', 'TASSIN LA DEMI LUNE', '69160', 18);
INSERT INTO "metropole_town" VALUES ('69256', 'VAULX EN VELIN', '69120', 21);
INSERT INTO "metropole_town" VALUES ('69259', 'VENISSIEUX', '69200', 20);
INSERT INTO "metropole_town" VALUES ('69260', 'VERNAISON', '69390', 19);
INSERT INTO "metropole_town" VALUES ('69266', 'VILLEURBANNE', '69100', 22);

-- WANTED JOB TYPES
INSERT INTO job_type ("id","label")
VALUES
	(1, 'Emploi droit commun'), 
	(2, 'Emploi aidé'),
	(3, 'Emploi d''insertion'),
	(4, 'Auto-entrepreneur'), 
	(5, 'Formation'),
	(6, 'Elaboration d''un projet professionnel'),
	(7, 'Resocialisation');

-- ASSETS
INSERT INTO asset ("id", "label")
VALUES
	(1, 'Connaissance'),
	(2, 'Compétence'),
	(3, 'Centre d''intérêt'),
	(4, 'Valeur'),
	(5, 'Ressources personnelles'), 
	(6, 'Savoir-être'), 
	(7, 'Savoir-faire');

-- RSJ REFERENTIAL DATA
-- RSJ STATE
insert into rsj_state ("id", "label")
values
    (1, 'En analyse'),
    (2, 'Droit ouvert (en attente de versement)'),
    (3, 'Droit ouvert (avec versement)'),
    (4, 'Droit ouvert (sans versement)'),
    (5, 'Clos'),
    (6, 'Refusé'),
    (7, 'Non orienté');

-- RSJ REASON
insert into rsj_reason ("id", "label")
values
    (1, 'Droits de tirage épuisés'),
    (2, '25 ans révolus'),
    (3, 'Déménagement'),
    (4, 'Décès');

-- RSJ State
INSERT INTO rsj_payment_state ("id", "label") 
VALUES 
    (1, 'Prévu'), 
    (2, 'Réalisé'), 
    (3, 'Erreur de paiement'), 
    (4, 'Erreur de paiement traitée');

-- Instruction RSJ non renewal reasons
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

-- Instruction RSJ use titles
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