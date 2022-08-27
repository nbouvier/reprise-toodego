export const TYPE_JUSTIFICATIF_IDENTITE = {
    "Française": {
        field: "type_justificatif_identite_raw",
        values: {

            "Pièce d’identité en cours de validité": {
                insertis: {
                    value: "ValidIdentityFr",
                    fileVar: [ "credentialDocument1Id" ],
                    fileTitle: [ "Pièce d'identité" ],
                    fileName: [ "piece_identite" ],
                    dateVar: [ "credentialDocumentDate1" ]
                },
                toodego: {
                    fileVar: [ "piece_identite_valide_francaise" ],
                    dateVar: [ "date_piece_identite" ]
                }
            },

            "Pièce d’identité périmée": {
                insertis: {
                    value: "ExpiredIdentityFr",
                    fileVar: [ "credentialDocument1Id", "credentialDocument2Id" ],
                    fileTitle: [ "Pièce d'identité", "Récépissé (pièce d'identité)" ],
                    fileName: [ "piece_identite", "recepisse_demande" ],
                    dateVar: [ "credentialDocumentDate1" ]
                },
                toodego: {
                    fileVar: [ "piece_identite_perimee_francaise", "recepisse_de_la_demande_francaise" ],
                    dateVar: [ "date_piece_perimee" ]
                }
            },

            "Absence de pièces d’identité": {
                insertis: {
                    value: "NoIdentityFr",
                    fileVar: [ "credentialDocument1Id", "credentialDocument2Id" ],
                    fileTitle: [ "Autre justificatif d'identité", "Récépissé (autre justificatif d'identité)" ],
                    fileName: [ "justificatif_identite", "recepisse_demande" ]
                },
                toodego: { fileVar: [ "autre_document_justificatif_francaise", "recepisse_de_la_demande_francaise" ] }
            }

        }
    },

    "Ressortissant de l'Union Européenne": {
        field: "nationalite_raw",
        values: {

            "Ressortissant de l'Union Européenne": {
                insertis: {
                    value: "ValidIdentityEU",
                    fileVar: [ "credentialDocument1Id" ],
                    fileTitle: [ "Pièce d'identité" ],
                    fileName: [ "piece_identite" ],
                    dateVar: [ "credentialDocumentDate1" ]
                },
                toodego: {
                    fileVar: [ "justificatif_identite_ue" ],
                    dateVar: [ "date_fin_validite_CNI_ue" ]
                }
            }

        }
    },

    "Ressortissant d'un pays en dehors de l'Union Européenne": {
        field: "jeune_hors_UE_raw",
        values: {

            "Le jeune dispose d'une carte de résident ou d'un titre de séjour": {
                insertis: {
                    value: "ResidentCard",
                    fileVar: [ "credentialDocument1Id" ],
                    fileTitle: [ "Carte de résident ou titre de séjour" ],
                    fileName: [ "carte_resident_titre_sejour" ],
                    dateVar: [ "credentialDocumentDate1" ]
                },
                toodego: {
                    fileVar: [ "piece_identite_hors_ue" ],
                    dateVar: [ "date_piece_identite_hors_ue" ]
                }
            },

            "Le jeune dispose d'un récepissé de renouvellement en cours de validité": {
                insertis: {
                    value: "ValidRenewal",
                    fileVar: [ "credentialDocument1Id", "credentialDocument2Id" ],
                    fileTitle: [ "Récépissé (renouvellement de titre de séjour)", "Carte de résident ou titre de séjour" ],
                    fileName: [ "recepisse_renouvellement", "titre_sejour" ],
                    dateVar: [ "credentialDocumentDate1", "credentialDocumentDate2" ]
                },
                toodego: {
                    fileVar: [ "recipisse_renouvellement_hors_ue", "ancien_titre_sejour_hors_ue" ],
                    dateVar: [ "date_fin_validite_recipisse_renouvellement_hors_ue", "date_fin_validite_titre_de_sejour_perime_hors_ue" ]
                }
            },

            "Le jeune est ex MNA ayant bénéficié d'un Contrat de jeune Majeur de la métropole de Lyon et disposant d'un récepissé de demande": {
                insertis: {
                    value: "CJM",
                    fileVar: [ "credentialDocument1Id", "credentialDocument2Id", "credentialDocument3Id" ],
                    fileTitle: [ "Attestation de Contrat Jeune Majeur", "Récépissé (Contrat Jeune Majeur)", "Autre justificatif d'identité" ],
                    fileName: [ "attestation_CJM", "recepisse_CJM", "justificatif_identite" ],
                    dateVar: [ "credentialDocumentDate2", "credentialDocumentDate3" ]
                },
                toodego: {
                    fileVar: [ "attestation_contrat_jeune_majeur_hors_ue", "recepisse_attestation_hors_ue", "recepisse_de_la_demande_hors_ue" ],
                    dateVar: [ "date_piece_identite", "date_piece_identite" ]
                }
            },

            "Le jeune dispose d'un des documents suivants :": {
                insertis: {
                    value: "Other",
                    fileVar: [ "credentialDocument1Id", "credentialDocument2Id" ],
                    fileTitle: [ "Autre", "Autre justificatif d'identité" ],
                    fileName: [ "recepisse_attestation_decision", "justificatif_identite" ],
                    dateVar: [ "credentialDocumentDate1", "credentialDocumentDate2" ]
                },
                toodego: {
                    fileVar: [ "recepisse_attestation_hors_ue", "recepisse_de_la_demande_hors_ue" ],
                    dateVar: [ "date_piece_identite", "date_piece_identite" ]
                }
            }

        }
    }
};

export const TYPE_JUSTIFICATIF_DOMICILIATION = {
    "Hébergé chez un tiers ou un parent": {
        insertis: {
            value: "HostedByParents",
            fileVar: [ "addressDocument1Id", "addressDocument2Id" ],
            fileTitle: [ "Attestation d'hébergement", "Justificatif de domicile d'un tiers" ],
            fileName: [ "attestation_hebergement", "justificatif_domicile" ]
        },
        toodego: {
            fileVar: [ "attestation_hebergement", "justificatif_hebergement" ]
        }
    },

    "Hébergé en foyer": {
        insertis: {
            value: "HostedInFosterCare",
            fileVar: [ "addressDocument1Id", "addressDocument2Id" ],
            fileTitle: [ "Justificatif de domicile" ],
            fileName: [ "justificatif_domicile" ]
        },
        toodego: {
            fileVar: [ "attestation_hebergement_foyer" ]
        }
    },

    "Locataire": {
        insertis: {
            value: "Tenant",
            fileVar: [ "addressDocument1Id", "addressDocument2Id" ],
            fileTitle: [ "Justificatif de domicile" ],
            fileName: [ "justificatif_domicile" ]
        },
        toodego: {
            fileVar: [ "justificatif_domicile" ]
        }
    },

    "Propriétaire": {
        insertis: {
            value: "Owner",
            fileVar: [ "addressDocument1Id", "addressDocument2Id" ],
            fileTitle: [ "Justificatif de domicile" ],
            fileName: [ "justificatif_domicile" ]
        },
        toodego: {
            fileVar: [ "justificatif_domicile" ]
        }
    },

    "Sans domicile fixe": {
        insertis: {
            value: "Homeless",
            fileVar: [ "addressDocument1Id", "addressDocument2Id" ],
            fileTitle: [ "Attestation de domiciliation" ],
            fileName: [ "attestation_domiciliation" ]
        },
        toodego: {
            fileVar: [ "attestation_domiciliation" ]
        }
    }
};

export const JUSTIFICATIF_TUTELLE = {
    insertis: {
        fileVar: [ "supervisionDocument1Id", "supervisionDocument2Id" ],
        fileTitle: [ "Autre", "Autre"/* "Décision de jugement", "Autorisation tuteur / curateur" */ ],
        fileName: [ "jugement", "autorisation_tuteur" ]
    },
    toodego: {
        fileVar: [ "decision_representant_legal", "autorisation_representant_legal" ]
    }
};

export const WORKFLOW_STATUS = {
    "just_submitted": "En création", // Demande transmise
    "new": "Analyse en cours", // Analyse en cours
    "0": "Demande d'information", // Information nécessaire
    "rejected": "Refusée", // Demande refusée
    "accepted": "Acceptée", // Droit de tirage ok
    "finished": "Versement en cours", // Demande traitée (paiement actif)
    "1": "Terminée", // Suspendu / Interrompu
    // "2": "Analyse en cours", // Dossier complet
    "3": "En création", // Réactiver
    // "4": "Suspendue", // Demande interrompue depuis plus de 3 mois
    // "5": "Versement en cours", // Ajout d'un mois payé dans la fiche
    "6": "Terminée", // Droit de tirage ko
    // "7": "Refusée", // Refus pour ineligibilité
    // "8": "Refusée", // Refus pour non-respect des engagements
    // "9": "Demande de suspension", // Demande de suspension
    "10": "Demande de suspension", // Demande de suspension en instruction
    "11": "Erreur de paiement", // Demande en erreur de paiement
    // "12": "Versement en cours", // Vérification des nouveaux documents bancaires
    // "13": "Versement en cours", // Nouveaux documents bancaires validés
    "14": "Terminée", // Sortie du dispositif
    "15": "Suspendue", // Réintégration du jeune
    // "16": "Suspendue" // Abandon de la demande
};

export const MONTHS = [ "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre" ];

const mapping = { TYPE_JUSTIFICATIF_IDENTITE, TYPE_JUSTIFICATIF_DOMICILIATION, JUSTIFICATIF_TUTELLE, WORKFLOW_STATUS, MONTHS };

export default mapping;
