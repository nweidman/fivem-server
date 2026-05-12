--[[
    =============================================
    OKOK BANKING V2 - LOCALES
    =============================================

    Sections:
    1. SETTINGS
    2. TEXTUI (Interaction prompts)
    3. NOTIFICATIONS (Server-side alerts)
    4. UI LOCALES (Frontend text)
    5. TRANSACTION LOCALES (Server-side transaction data)
    6. TIME/DATE LOCALES
]]

Locales['fr'] = {

    -- =============================================
    -- 1. SETTINGS
    -- =============================================

    ['ui_language'] = "fr-FR", -- Used for formatting dates in the UI

    -- =============================================
    -- 2. TEXTUI LOCALES (Interaction Prompts)
    -- =============================================

    ['open_banking'] = {
        text = '[E] Accéder à la banque',
        color = 'darkblue',
        position = 'left'
    },
    ['open_atm'] = {
        text = '[E] Accéder au guichet automatique',
        color = 'darkblue',
        position = 'left'
    },
    ['open_banking_target'] = {
        text = 'Accéder à la banque',
        color = 'darkblue',
        position = 'left'
    },
    ['open_atm_target'] = {
        text = 'Accéder au guichet automatique',
        color = 'darkblue',
        position = 'left'
    },

    -- =============================================
    -- 3. NOTIFICATIONS
    -- =============================================

    -- 3.1 Transactions
    ['success_deposit'] = {title = "Succès", text = "Dépôt réussi", time = 5000, type = "success"},
    ['success_withdraw'] = {title = "Succès", text = "Retrait réussi", time = 5000, type = "success"},
    ['success_transfer'] = {title = "Succès", text = "Transfert réussi", time = 5000, type = "success"},
    ['failed_to_withdraw'] = {title = "Erreur", text = "Échec du retrait depuis la société", time = 5000, type = "error"},
    ['failed_to_transfer'] = {title = "Erreur", text = "Échec du transfert", time = 5000, type = "error"},
    ['not_enough_money'] = {title = "Erreur", text = "Vous n'avez pas assez d'argent pour effectuer cette action", time = 5000, type = "error"},
    ['not_enough_cash'] = {title = "Erreur", text = "Vous n'avez pas assez de liquide", time = 5000, type = "error"},
    ['insufficient_funds'] = {title = "Erreur", text = "Fonds insuffisants", time = 5000, type = "error"},
    ['no_valid_recipients'] = {title = "Erreur", text = "Aucun destinataire valide trouvé pour le transfert", time = 5000, type = "error"},
    ['amount_exceeds_limit'] = {title = "Erreur", text = "Le montant dépasse la limite", time = 5000, type = "error"},
    ['daily_limit_exceeded'] = {title = "Erreur", text = "Limite quotidienne dépassée", time = 5000, type = "error"},

    -- 3.2 IBAN & PIN
    ['iban_not_found'] = {title = "Erreur", text = "IBAN introuvable", time = 5000, type = "error"},
    ['iban_updated'] = {title = "Succès", text = "IBAN mis à jour avec succès", time = 5000, type = "success"},
    ['iban_in_use'] = {title = "Erreur", text = "Cet IBAN est déjà utilisé", time = 5000, type = "error"},
    ['pin_updated'] = {title = "Succès", text = "PIN mis à jour avec succès", time = 5000, type = "success"},
    ['pin_update_failed'] = {title = "Erreur", text = "Échec de mise à jour du PIN, veuillez réessayer", time = 5000, type = "error"},
    ['error_pin_invalid_format'] = {title = "Erreur", text = "Le PIN doit être composé de 4 chiffres", time = 5000, type = "error"},
    ['daily_limit_updated'] = {title = "Succès", text = "Limite quotidienne mise à jour avec succès", time = 5000, type = "success"},
    ['daily_limit_update_failed'] = {title = "Erreur", text = "Échec de mise à jour de la limite quotidienne", time = 5000, type = "error"},

    -- 3.3 Cards
    ['success_card_created'] = {title = "Succès", text = "Carte créée avec succès", time = 5000, type = "success"},
    ['success_card_deleted'] = {title = "Succès", text = "Carte supprimée avec succès", time = 5000, type = "success"},
    ['card_managed_successfully'] = {title = "Succès", text = "Informations de la carte mises à jour", time = 5000, type = "success"},
    ['error_card_created'] = {title = "Erreur", text = "Échec de création de la carte", time = 5000, type = "error"},
    ['error_card_not_found'] = {title = "Erreur", text = "Carte introuvable", time = 5000, type = "error"},
    ['error_card_delete_failed'] = {title = "Erreur", text = "Carte introuvable ou suppression impossible", time = 5000, type = "error"},
    ['error_no_cards_found'] = {title = "Erreur", text = "Aucune carte trouvée", time = 5000, type = "error"},
    ['no_active_cards'] = {title = "Erreur", text = "Vous n'avez aucune carte active", time = 5000, type = "error"},
    ['invalid_cards_data'] = {title = "Erreur", text = "Données de carte invalides", time = 5000, type = "error"},
    ['card_number_not_found'] = {title = "Erreur", text = "Numéro de carte introuvable", time = 5000, type = "error"},
    ['max_credit_cards_reached'] = {title = "Erreur", text = "Nombre maximal de cartes de crédit atteint", time = 5000, type = "error"},
    ['max_total_credit_cards_reached'] = {title = "Erreur", text = "Nombre total maximal de cartes atteint", time = 5000, type = "error"},
    ['card_already_exists'] = {title = "Erreur", text = "Ce compte a déjà une carte", time = 5000, type = "error"},

    -- 3.4 Bills
    ['no_unpaid_bills'] = {title = "Info", text = "Toutes vos factures sont payées", time = 5000, type = "info"},
    ['no_unpaid_bills_found'] = {title = "Erreur", text = "Aucune facture impayée trouvée", time = 5000, type = "error"},
    ['success_paid_all_bills'] = {title = "Succès", text = "Toutes les factures ont été payées", time = 5000, type = "success"},
    ['bill_paid_success'] = {title = "Succès", text = "Facture payée avec succès", time = 5000, type = "success"},
    ['error_paid_all_bills'] = {title = "Erreur", text = "Impossible de payer les factures", time = 5000, type = "error"},
    ['bill_payment_failed'] = {title = "Erreur", text = "Échec du paiement de la facture", time = 5000, type = "error"},
    ['success_receipt_printed'] = {title = "Succès", text = "Reçu imprimé avec succès", time = 5000, type = "success"},
    ['failed_to_print_receipt'] = {title = "Erreur", text = "Échec de l'impression du reçu", time = 5000, type = "error"},
    ['no_reference_id'] = {title = "Erreur", text = "Aucun ID de référence fourni", time = 5000, type = "error"},
    ['already_paid'] = {title = "Erreur", text = "Cette facture a déjà été payée", time = 5000, type = "error"},

    -- 3.5 Accounts
    ['success_account_created'] = {title = "Succès", text = "Compte créé avec succès", time = 5000, type = "success"},
    ['success_account_closed'] = {title = "Succès", text = "Compte fermé avec succès", time = 5000, type = "success"},
    ['success_account_left'] = {title = "Succès", text = "Vous avez quitté le compte", time = 5000, type = "success"},
    ['success_account_name_updated'] = {title = "Succès", text = "Nom du compte mis à jour", time = 5000, type = "success"},
    ['account_not_found'] = {title = "Erreur", text = "Compte introuvable", time = 5000, type = "error"},
    ['invalid_account_name'] = {title = "Erreur", text = "Nom de compte invalide", time = 5000, type = "error"},
    ['error_account_name_empty'] = {title = "Erreur", text = "Le nom du compte ne peut pas être vide", time = 5000, type = "error"},
    ['error_account_name_length'] = {title = "Erreur", text = "Le nom du compte doit faire entre 1 et 50 caractères", time = 5000, type = "error"},
    ['error_insufficient_funds'] = {title = "Erreur", text = "Fonds insuffisants pour créer un compte", time = 5000, type = "error"},
    ['error_insufficient_funds_account_creation'] = {title = "Erreur", text = "Fonds insuffisants pour créer le compte", time = 5000, type = "error"},
    ['error_max_accounts_reached'] = {title = "Erreur", text = "Nombre maximal de comptes atteint", time = 5000, type = "error"},
    ['error_account_creation_failed'] = {title = "Erreur", text = "Échec de création du compte", time = 5000, type = "error"},
    ['error_account_update_failed'] = {title = "Erreur", text = "Échec de mise à jour du compte", time = 5000, type = "error"},
    ['error_account_deletion_failed'] = {title = "Erreur", text = "Échec de suppression du compte", time = 5000, type = "error"},
    ['error_account_has_balance'] = {title = "Erreur", text = "Impossible de fermer un compte avec un solde. Retirez tout l'argent d'abord", time = 5000, type = "error"},
    ['error_account_has_active_loans'] = {title = "Erreur", text = "Impossible de fermer/quitter un compte avec des prêts actifs", time = 5000, type = "error"},
    ['error_invalid_account_type'] = {title = "Erreur", text = "Type de compte invalide", time = 5000, type = "error"},
    ['error_invalid_custom_account_identifier'] = {title = "Erreur", text = "Identifiant de compte invalide", time = 5000, type = "error"},
    ['error_owner_cannot_leave'] = {title = "Erreur", text = "Le propriétaire ne peut pas quitter son compte. Fermez-le plutôt", time = 5000, type = "error"},
    ['error_no_access_found'] = {title = "Erreur", text = "Aucun accès trouvé pour ce compte", time = 5000, type = "error"},
    ['failed_to_access_savings_account'] = {title = "Erreur", text = "Échec d'accès au compte épargne", time = 5000, type = "error"},

    -- 3.6 Users & Permissions
    ['success_user_added'] = {title = "Succès", text = "Utilisateur ajouté avec succès", time = 5000, type = "success"},
    ['success_user_removed'] = {title = "Succès", text = "Utilisateur retiré avec succès", time = 5000, type = "success"},
    ['success_permissions_updated'] = {title = "Succès", text = "Permissions mises à jour", time = 5000, type = "success"},
    ['error_user_not_found'] = {title = "Erreur", text = "Utilisateur introuvable", time = 5000, type = "error"},
    ['error_user_add_failed'] = {title = "Erreur", text = "Échec d'ajout de l'utilisateur", time = 5000, type = "error"},
    ['error_user_already_has_access'] = {title = "Erreur", text = "Cet utilisateur a déjà accès", time = 5000, type = "error"},
    ['error_cannot_add_owner'] = {title = "Erreur", text = "Impossible d'ajouter le propriétaire du compte", time = 5000, type = "error"},
    ['error_cannot_remove_owner'] = {title = "Erreur", text = "Impossible de retirer le propriétaire du compte", time = 5000, type = "error"},
    ['error_permissions_update_failed'] = {title = "Erreur", text = "Échec de mise à jour des permissions", time = 5000, type = "error"},
    ['error_player_not_online'] = {title = "Erreur", text = "Le joueur n'est pas en ligne", time = 5000, type = "error"},
    ['player_not_found'] = {title = "Erreur", text = "Joueur introuvable", time = 5000, type = "error"},
    ['no_permission'] = {title = "Erreur", text = "Vous n'avez pas la permission d'effectuer cette action", time = 5000, type = "error"},
    ['feature_disabled'] = {title = "Erreur", text = "Cette fonctionnalité est désactivée", time = 5000, type = "error"},
    ['invalid_daily_limit'] = {title = "Erreur", text = "Valeur de limite quotidienne invalide", time = 5000, type = "error"},

    -- 3.7 Loans
    ['loan_success_created'] = {title = "Succès", text = "Prêt créé avec succès", time = 5000, type = "success"},
    ['loan_success_paid'] = {title = "Succès", text = "Prêt payé avec succès", time = 5000, type = "success"},
    ['loan_success_partial_paid'] = {title = "Succès", text = "Paiement partiel du prêt effectué", time = 5000, type = "success"},
    ['loan_not_found'] = {title = "Erreur", text = "Prêt introuvable", time = 5000, type = "error"},
    ['no_plans'] = {title = "Erreur", text = "Aucun plan de prêt disponible", time = 5000, type = "error"},
    ['unknown_plan'] = {title = "Erreur", text = "Plan de prêt invalide", time = 5000, type = "error"},
    ['plan_disabled'] = {title = "Erreur", text = "Ce plan de prêt est désactivé", time = 5000, type = "error"},
    ['invalid_amount'] = {title = "Erreur", text = "Montant invalide", time = 5000, type = "error"},
    ['invalid_term'] = {title = "Erreur", text = "Durée invalide", time = 5000, type = "error"},
    ['too_many_active_loans'] = {title = "Erreur", text = "Limite de prêts actifs atteinte", time = 5000, type = "error"},
    ['has_late_payments'] = {title = "Erreur", text = "Vous avez des paiements en retard", time = 5000, type = "error"},

    -- 3.8 Savings Goals
    ['success_goal_created'] = {title = "Succès", text = "Objectif d'épargne créé", time = 5000, type = "success"},
    ['success_goal_withdrawn'] = {title = "Succès", text = "Retrait depuis l'objectif réussi", time = 5000, type = "success"},
    ['success_goal_added'] = {title = "Succès", text = "Argent ajouté à l'objectif", time = 5000, type = "success"},
    ['goal_not_found'] = {title = "Erreur", text = "Objectif introuvable", time = 5000, type = "error"},
    ['goal_already_completed'] = {title = "Erreur", text = "Objectif déjà complété", time = 5000, type = "error"},
    ['invalid_goal_id'] = {title = "Erreur", text = "ID d'objectif invalide", time = 5000, type = "error"},
    ['invalid_goal_name'] = {title = "Erreur", text = "Nom d'objectif invalide", time = 5000, type = "error"},
    ['invalid_target_amount'] = {title = "Erreur", text = "Montant cible invalide", time = 5000, type = "error"},
    ['invalid_initial_deposit'] = {title = "Erreur", text = "Dépôt initial invalide", time = 5000, type = "error"},
    ['max_goals_reached'] = {title = "Erreur", text = "Nombre maximal d'objectifs atteint", time = 5000, type = "error"},
    ['no_funds_to_withdraw'] = {title = "Erreur", text = "Aucun fonds disponible pour le retrait", time = 5000, type = "error"},
    ['failed_to_delete_goal'] = {title = "Erreur", text = "Échec de suppression de l'objectif", time = 5000, type = "error"},
    ['failed_to_update_goal'] = {title = "Erreur", text = "Échec de mise à jour de l'objectif", time = 5000, type = "error"},

    -- 3.9 Contacts
    ['success_contact_saved'] = {title = "Succès", text = "Contact enregistré", time = 5000, type = "success"},
    ['success_contact_deleted'] = {title = "Succès", text = "Contact supprimé", time = 5000, type = "success"},
    ['success_contact_favorite_toggled'] = {title = "Succès", text = "Contact ajouté aux favoris", time = 5000, type = "success"},
    ['error_contact_save_failed'] = {title = "Erreur", text = "Échec d'enregistrement du contact", time = 5000, type = "error"},
    ['error_contact_delete_failed'] = {title = "Erreur", text = "Échec de suppression du contact", time = 5000, type = "error"},
    ['error_contact_favorite_toggle_failed'] = {title = "Erreur", text = "Échec du changement de favori", time = 5000, type = "error"},
    ['max_contacts_reached'] = {title = "Erreur", text = "Nombre maximal de contacts atteint", time = 5000, type = "error"},
    ['max_favorites_reached'] = {title = "Erreur", text = "Nombre maximal de favoris atteint", time = 5000, type = "error"},

    -- 3.10 General Errors
    ['unknown_error'] = {title = "Erreur", text = "Une erreur inconnue s'est produite", time = 5000, type = "error"},
    ['error_invalid_data'] = {title = "Erreur", text = "Données invalides", time = 5000, type = "error"},
    ['invalid_parameters'] = {title = "Erreur", text = "Paramètres invalides", time = 5000, type = "error"},
    ['database_error'] = {title = "Erreur", text = "Erreur de base de données", time = 5000, type = "error"},
    ['error_database_update_failed'] = {title = "Erreur", text = "Échec de mise à jour en base de données", time = 5000, type = "error"},
    ['db_insert_failed'] = {title = "Erreur", text = "Impossible de créer le prêt. Réessayez.", time = 5000, type = "error"},

    -- =============================================
    -- 4. UI LOCALES (Frontend)
    -- =============================================

    -- 4.1 Navigation
    ['ui_overview'] = "Aperçu",
    ['ui_transactions'] = "Transactions",
    ['ui_loans'] = "Prêts",
    ['ui_savings'] = "Épargne",
    ['ui_bills'] = "Factures",
    ['ui_cards'] = "Cartes",
    ['ui_management'] = "Gestion",
    ['ui_statistics'] = "Statistiques",
    ['ui_history'] = "Historique",

    -- 4.2 Buttons
    ['ui_view'] = "Voir",
    ['ui_view_all'] = "Voir tout",
    ['ui_edit'] = "Modifier",
    ['ui_delete'] = "Supprimer",
    ['ui_remove'] = "Retirer",
    ['ui_add'] = "Ajouter",
    ['ui_add_new'] = "Ajouter nouveau",
    ['ui_create'] = "Créer",
    ['ui_save'] = "Enregistrer",
    ['ui_save_changes'] = "Enregistrer les modifications",
    ['ui_cancel'] = "Annuler",
    ['ui_confirm'] = "Confirmer",
    ['ui_copy'] = "Copier",
    ['ui_print'] = "Imprimer",
    ['ui_show'] = "Afficher",
    ['ui_hide'] = "Cacher",
    ['ui_change'] = "Changer",
    ['ui_manage'] = "Gérer",
    ['ui_select'] = "Sélectionner",
    ['ui_selected'] = "Sélectionné",
    ['ui_search'] = "Rechercher...",
    ['ui_pay'] = "Payer",
    ['ui_pay_all'] = "Tout payer",

    -- 4.3 Labels
    ['ui_name'] = "Nom",
    ['ui_type'] = "Type",
    ['ui_status'] = "Statut",
    ['ui_date'] = "Date",
    ['ui_amount'] = "Montant",
    ['ui_price'] = "Prix",
    ['ui_balance'] = "Solde",
    ['ui_description'] = "Description",
    ['ui_actions'] = "Actions",
    ['ui_author'] = "Auteur",
    ['ui_notes'] = "Notes",
    ['ui_info'] = "Info",
    ['ui_id'] = "ID",
    ['ui_total'] = "Total",
    ['ui_to'] = "Vers",
    ['ui_from'] = "De",
    ['ui_in'] = "dans",

    -- 4.4 Status
    ['ui_new'] = "New",
    ['ui_pending'] = "En attente",
    ['ui_active'] = "Actif",
    ['ui_blocked'] = "Bloqué",
    ['ui_paid'] = "Payé",
    ['ui_unpaid'] = "Impayé",
    ['ui_completed'] = "Complété",
    ['ui_complete'] = "compléter",
    ['ui_sent'] = "Envoyé",
    ['ui_received'] = "Reçu",

    -- 4.5 Account Types
    ['ui_personal'] = "Personnel",
    ['ui_business'] = "Entreprise",
    ['ui_shared'] = "Partagé",
    ['ui_owner'] = "Propriétaire",
    ['ui_user'] = "Utilisateur",
    ['ui_personal_account'] = "Compte personnel",
    ['ui_business_account'] = "Compte entreprise",
    ['ui_savings_account'] = "Compte épargne",
    ['ui_checking_account'] = "Compte courant",
    ['ui_your_account'] = "Votre compte",
    ['ui_all_accounts'] = "Tous les comptes",
    ['ui_company'] = "Entreprise",
    ['ui_high_yield'] = "Haut rendement",
    ['ui_higher_rates'] = "Taux plus élevés",

    -- 4.6 Account Management
    ['ui_account_name'] = "Nom du compte",
    ['ui_account_type'] = "Type de compte",
    ['ui_account_status'] = "Statut du compte",
    ['ui_account_settings'] = "Paramètres du compte",
    ['ui_account_users'] = "Utilisateurs du compte",
    ['ui_opening_date'] = "Date d'ouverture",
    ['ui_create_account'] = "Créer un compte",
    ['ui_create_new_account'] = "Créer un nouveau compte",
    ['ui_add_account'] = "Ajouter un compte",
    ['ui_close_account'] = "Fermer le compte",
    ['ui_leave_account'] = "Quitter le compte",
    ['ui_change_name'] = "Changer le nom",
    ['ui_manage_account_users'] = "Gérer les utilisateurs",
    ['ui_add_new_user'] = "Ajouter un utilisateur",
    ['ui_player_id'] = "ID joueur",
    ['ui_edit_permissions'] = "Modifier les permissions",
    ['ui_remove_user'] = "Retirer l'utilisateur",
    ['ui_confirm_close_account'] = "Confirmer la fermeture",
    ['ui_confirm_leave_account'] = "Confirmer la sortie",
    ['ui_close_account_btn'] = "Je veux fermer mon compte",
    ['ui_close_account_warning'] = "La fermeture supprimera définitivement toutes les données.",
    ['ui_close_account_permanent'] = "La suppression est définitive.",
    ['ui_leave_account_warning'] = "Vous perdrez l'accès à ce compte.",
    ['ui_leave_account_warning_full'] = "Vous perdrez l'accès. Retirez l'argent avant.",
    ['ui_account_has_balance'] = "Le compte a encore un solde",
    ['ui_withdraw_before_close'] = "Veuillez retirer tous les fonds avant la fermeture.",
    ['ui_create_account_info'] = "La création d'un compte coûte",

    -- 4.7 Transactions
    ['ui_deposit'] = "Dépôt",
    ['ui_withdraw'] = "Retrait",
    ['ui_transfer'] = "Transfert",
    ['ui_deposit_money'] = "Déposer de l'argent",
    ['ui_withdraw_money'] = "Retirer de l'argent",
    ['ui_transfer_money'] = "Transférer de l'argent",
    ['ui_recent_transactions'] = "Transactions récentes",
    ['ui_total_transactions'] = "Total transactions",
    ['ui_total_received'] = "Total reçu",
    ['ui_total_sent'] = "Total envoyé",
    ['ui_net_earnings'] = "Revenu net",
    ['ui_transaction_details'] = "Détails de la transaction",
    ['ui_view_transaction'] = "Voir la transaction",
    ['ui_print_receipt'] = "Imprimer le reçu",
    ['ui_iban'] = "IBAN",
    ['ui_sender_iban'] = "IBAN expéditeur",
    ['ui_receiver_iban'] = "IBAN destinataire",
    ['ui_recipient'] = "Destinataire",
    ['ui_select_recipient'] = "Sélectionner un destinataire",
    ['ui_select_account'] = "Sélectionner un compte",
    ['ui_external_account'] = "Compte externe",
    ['ui_multiple_contacts'] = "Contacts multiples",
    ['ui_enter_amount'] = "Entrer un montant",
    ['ui_daily_limit'] = "Limite quotidienne",
    ['ui_summary'] = "Résumé",

    -- 4.8 Cards
    ['ui_card_holder'] = "Titulaire",
    ['ui_card_type'] = "Type de carte",
    ['ui_pin'] = "PIN",
    ['ui_pin_number'] = "Code PIN",
    ['ui_not_set'] = "Non défini",
    ['ui_expires'] = "Expire",
    ['ui_expiry'] = "Expiration",
    ['ui_current_expiry'] = "Expiration actuelle",
    ['ui_auto_renew'] = "Renouvellement automatique",
    ['ui_manage_card'] = "Gérer la carte",
    ['ui_create_new_card'] = "Créer une nouvelle carte",
    ['ui_select_card'] = "Sélectionner une carte",
    ['ui_delete_card'] = "Supprimer la carte",
    ['ui_delete_card_warning'] = "Action irréversible.",
    ['ui_delete_card_confirm'] = "Voulez-vous supprimer la carte ?",
    ['ui_warning'] = "Attention",
    ['ui_information'] = "Information",
    ['ui_blocking_card_warning'] = "En <span class=\"bold\">bloquant votre carte</span>, une nouvelle carte devra être <span class=\"bold\">émise</span> moyennant des frais de <span class=\"bold activation-fee\">{fee}</span>.",
    ['ui_activating_card_info'] = "L'activation de la carte entraîne des frais de <span class=\"bold activation-fee\">{fee}</span>.",

    -- 4.9 Loans
    ['ui_loan_plans'] = "Plans de prêt",
    ['ui_starter_loan'] = "Prêt débutant",
    ['ui_standard_loan'] = "Prêt standard",
    ['ui_premium_loan'] = "Prêt premium",
    ['ui_executive_loan'] = "Prêt exécutif",
    ['ui_custom_loan'] = "Prêt personnalisé",
    ['ui_personal_loan'] = "Prêt personnel",
    ['ui_car_loan'] = "Prêt auto",
    ['ui_home_loan'] = "Prêt immobilier",
    ['ui_request_loan'] = "Demander un prêt",
    ['ui_active_loans'] = "Prêts actifs",
    ['ui_no_active_loans'] = "Aucun prêt actif",
    ['ui_interest_rate'] = "Taux d'intérêt",
    ['ui_daily_payment'] = "Paiement quotidien",
    ['ui_remaining'] = "Restant",
    ['ui_term'] = "Durée",
    ['ui_select_term'] = "Sélectionner la durée",
    ['ui_plan'] = "Plan",
    ['ui_total_to_repay'] = "Total à rembourser",
    ['ui_manage_personal_loan'] = "Gérer {loan}",
    ['ui_next_payment'] = "Prochain paiement",
    ['ui_partial_payment'] = "Paiement partiel",
    ['ui_pay_off_loan'] = "Rembourser le prêt",
    ['ui_loan_overdue_warning'] = "Votre paiement de prêt est <span class=\"bold\">en retard</span>. Veuillez rembourser <span class=\"bold\">le montant dû</span> rapidement pour éviter <span class=\"bold\">des frais supplémentaires</span>.",

    -- 4.10 Credit Score
    ['ui_credit_score'] = "Score de crédit",
    ['ui_credit_score_ranks'] = "Niveaux du score",
    ['ui_credit_score_info'] = "Informations sur le score",
    ['ui_credit_score_info_text'] = "Le score influence les taux d'intérêts :",
    ['ui_higher_scores_lower_rates'] = "score élevé → taux plus bas",
    ['ui_lower_scores_increase'] = "score faible → taux plus hauts",
    ['ui_view_ranks'] = "Voir les niveaux",
    ['ui_score'] = "Score",
    ['ui_rank'] = "Rang",
    ['ui_rate'] = "Taux",
    ['ui_excellent'] = "Excellent",
    ['ui_very_good'] = "Très bon",
    ['ui_good'] = "Bon",
    ['ui_fair'] = "Passable",
    ['ui_poor'] = "Mauvais",
    ['ui_very_poor'] = "Très mauvais",

    -- 4.11 Savings Goals
    ['ui_saving_goals'] = "Objectifs d'épargne",
    ['ui_no_saving_goals'] = "Aucun objectif",
    ['ui_create_first_goal'] = "Créez votre premier objectif<br>pour commencer à suivre votre progression",
    ['ui_create_new_saving_goal'] = "Créer un nouvel objectif",
    ['ui_manage_saving_goal'] = "Gérer l'objectif",
    ['ui_manage_goal'] = "Gérer l'objectif",
    ['ui_goal'] = "Objectif",
    ['ui_goal_name'] = "Nom de l'objectif",
    ['ui_target_amount'] = "Montant cible",
    ['ui_initial_deposit'] = "Dépôt initial",
    ['ui_saved'] = "Économisé",
    ['ui_add_to_goal'] = "Ajouter",
    ['ui_withdraw_funds'] = "Retirer",
    ['ui_interest_tracker'] = "Suivi des intérêts",
    ['ui_total_interest_earned'] = "Intérêts cumulés",
    ['ui_this_week'] = "Cette semaine",
    ['ui_next_payout'] = "Prochain paiement",

    -- 4.12 Bills & Invoices
    ['ui_bills_list'] = "Liste des factures",
    ['ui_pay_bill'] = "Payer la facture",
    ['ui_pay_all_bills'] = "Tout payer",
    ['ui_view_bill'] = "Voir facture",
    ['ui_invoice'] = "Facture",
    ['ui_reference_id'] = "ID de référence",
    ['ui_subtotal'] = "Sous-total",
    ['ui_vat'] = "TVA",
    ['ui_due'] = "Échéance",
    ['ui_paid_on'] = "Payé le",

    -- 4.13 Contacts
    ['ui_contacts'] = "Contacts",
    ['ui_favorites'] = "Favoris",
    ['ui_no_contacts'] = "Aucun contact",
    ['ui_no_favorite_contacts'] = "Aucun favori",
    ['ui_save_contact'] = "Enregistrer le contact",

    -- 4.14 Modals & Dialogs
    ['ui_are_you_sure'] = "Êtes-vous sûr ?",
    ['ui_are_you_sure_iban_change'] = "Changer l'IBAN ?",
    ['ui_are_you_sure_pin_change'] = "Changer le PIN ?",
    ['ui_are_you_sure_daily_limit_change'] = "Changer la limite quotidienne ?",
    ['ui_are_you_sure_remove_user'] = "Retirer <span class=\"bold\">{user}</span> du <span class=\"bold\">{account}</span> ?",
    ['ui_are_you_sure_pay_bill'] = "Payer la facture ?",
    ['ui_are_you_sure_print_receipt'] = "Imprimer le reçu ?",
    ['ui_copy_success'] = "Copié",
    ['ui_copy_error'] = "Échec de la copie",
    ['ui_loading_data'] = "Chargement...",
    ['ui_logging_out'] = "Déconnexion...",
    ['ui_generated_automatically'] = "Généré automatiquement",

    -- 4.15 Empty States
    ['ui_no_users_yet'] = "Aucun utilisateur",
    ['ui_no_bills'] = "Aucune facture",
    ['ui_no_transactions_yet'] = "Aucune transaction",
    ['ui_no_recent_activity'] = "Aucune activité récente",
    ['ui_no_transaction_history'] = "Aucun historique",
    ['ui_transaction_history_help'] = "Votre historique de transactions s'affichera ici",
    ['ui_bills_help'] = "L'historique des factures apparaîtra ici",
    ['ui_loan_history_help'] = "L'historique des prêts apparaîtra ici",
    ['ui_savings_transactions_appear_here'] = "Les opérations d'épargne apparaîtront ici",
    ['ui_make_first_transaction'] = "Effectuez votre première transaction pour voir le graphique",

    -- 4.16 Time Labels
    ['ui_day'] = "jour",
    ['ui_days'] = "jours",
    ['ui_days_late'] = "{days} jours de retard",
    ['ui_hours_late'] = "{hours} heures de retard",
    ['ui_minutes_late'] = "{minutes} minutes de retard",
    ['ui_in_days'] = "dans {days} jours",
    ['ui_in_hours'] = "dans {hours} heures",
    ['ui_in_minutes'] = "dans {minutes} minutes",

    -- 4.17 Format Strings
    ['ui_showing_transactions'] = "Affichage %d-%d sur %d",
    ['ui_loan_term_format'] = "%s/%s • %d %s",
    ['ui_days_format'] = "%d %s",
    ['ui_users_count'] = "%d %s",

    -- =============================================
    -- 5. TRANSACTIONS
    -- =============================================

    -- 5.1 Sender/Receiver
    ['tx_wallet'] = "Portefeuille",
    ['tx_custom_account'] = "Compte personnalisé",
    ['tx_bank_loan'] = "Banque (Prêt)",
    ['tx_bank_card_purchase'] = "Banque (Achat carte)",
    ['tx_bank_card_activation'] = "Banque (Activation carte)",
    ['tx_bank_card_renewal'] = "Banque (Renouvellement carte)",
    ['tx_bank_loan_payoff'] = "Banque (Remboursement prêt)",
    ['tx_bank_iban_change'] = "Banque (Changement IBAN)",
    ['tx_bank_pin_change'] = "Banque (Changement PIN)",
    ['tx_bank_account_creation'] = "Banque (Création compte)",
    ['tx_bank_receipt_print'] = "Banque (Impression reçu)",
    ['tx_loan_payment'] = "Paiement prêt",

    -- 5.2 Deposits
    ['tx_reason_deposit_card'] = "Dépôt sur compte carte",
    ['tx_reason_deposit_business'] = "Dépôt sur compte entreprise",
    ['tx_reason_deposit_custom'] = "Dépôt sur compte personnalisé",
    ['tx_reason_deposit_savings'] = "Dépôt sur compte épargne",
    ['tx_reason_deposit_bank'] = "Dépôt sur compte bancaire",
    ['tx_reason_receipt_print'] = "Impression de reçu",

    -- 5.3 Withdrawals
    ['tx_reason_withdraw_card'] = "Retrait depuis carte",
    ['tx_reason_withdraw_business'] = "Retrait depuis compte entreprise",
    ['tx_reason_withdraw_custom'] = "Retrait depuis compte personnalisé",
    ['tx_reason_withdraw_savings'] = "Retrait depuis compte épargne",
    ['tx_reason_withdraw_bank'] = "Retrait depuis compte bancaire",

    -- 5.4 Transfers
    ['tx_reason_transfer_to'] = "Transfert vers",
    ['tx_reason_transfer_business'] = "Transfert vers entreprise",
    ['tx_reason_transfer_custom'] = "Transfert vers compte personnalisé",
    ['tx_reason_transfer_personal'] = "Transfert vers compte personnel",
    ['tx_reason_transfer_savings'] = "Transfert vers compte épargne",

    -- 5.5 Other
    ['tx_reason_card_purchase'] = "Achat carte :",
    ['tx_reason_loan_disbursement'] = "Versement prêt :",
    ['tx_reason_loan_payment'] = "Paiement prêt :",
    ['tx_reason_loan_payoff'] = "Remboursement prêt :",
    ['tx_reason_penalty'] = "Pénalité :",
    ['tx_reason_paid_bill'] = "Facture payée :",
    ['tx_reason_iban_change'] = "Frais de changement IBAN",
    ['tx_reason_pin_change'] = "Frais de changement PIN",
    ['tx_reason_account_creation'] = "Frais de création de compte",
    ['tx_reason_paycheck'] = "Salaire",
    ['tx_paycheck'] = "Salaire",

    -- =============================================
    -- 6. TIME/DATE LOCALES
    -- =============================================

    ['time_expired'] = "expiré",
    ['time_month'] = "mois",
    ['time_months'] = "mois",
    ['time_in_format'] = "dans %d %s",

    -- =============================================
    -- 7. WEBHOOK LOCALES
    -- =============================================

    -- Titles
    ['webhook_title_deposit'] = "💰 Dépôt bancaire",
    ['webhook_title_withdraw'] = "💸 Retrait bancaire",
    ['webhook_title_transfer'] = "💳 Transfert bancaire",
    ['webhook_title_savings_deposit'] = "🏦 Dépôt épargne",
    ['webhook_title_savings_withdraw'] = "🏦 Retrait épargne",
    ['webhook_title_savings_transfer'] = "🏦 Transfert épargne",
    ['webhook_title_loan_create'] = "📋 Prêt créé",
    ['webhook_title_account_create'] = "🏦 Compte créé",
    ['webhook_title_account_delete'] = "🗑️ Compte supprimé",
    ['webhook_title_account_add_user'] = "👤 Utilisateur ajouté",
    ['webhook_title_account_remove_user'] = "👤 Utilisateur retiré",
    ['webhook_title_account_change_permissions'] = "🔐 Permissions modifiées",
    ['webhook_title_default'] = "Journal bancaire",

    -- Fields
    ['webhook_field_from'] = "De",
    ['webhook_field_to'] = "À",
    ['webhook_field_amount'] = "Montant",
    ['webhook_field_reason'] = "Raison",
    ['webhook_field_account'] = "Compte",
    ['webhook_field_goal'] = "Objectif",
    ['webhook_field_loan_plan'] = "Plan de prêt",
    ['webhook_field_interest_rate'] = "Taux d'intérêt",
    ['webhook_field_duration'] = "Durée",
    ['webhook_field_borrower'] = "Emprunteur",
    ['webhook_field_account_name'] = "Nom du compte",
    ['webhook_field_iban'] = "IBAN",
    ['webhook_field_owner'] = "Propriétaire",
    ['webhook_field_final_balance'] = "Solde final",
    ['webhook_field_added_user'] = "Utilisateur ajouté",
    ['webhook_field_account_owner'] = "Propriétaire du compte",
    ['webhook_field_removed_user'] = "Utilisateur retiré",
    ['webhook_field_user'] = "Utilisateur",
    ['webhook_field_new_permissions'] = "Nouvelles permissions",
    ['webhook_field_player_source'] = "Source joueur",
    ['webhook_field_license'] = "Licence",
    ['webhook_field_discord'] = "Discord",

    -- Other
    ['webhook_reason_savings_transfer'] = "Transfert depuis Épargne (%s)",
    ['webhook_duration_months'] = "%s mois",
    ['webhook_discord_not_linked'] = "Non lié",
    ['webhook_author_suffix'] = "Logs bancaires",

    -- Labels
    ['webhook_account_personal'] = "Personnel",
    ['webhook_account_business'] = "Entreprise : %s",
    ['webhook_account_custom'] = "Personnalisé : %s",
    ['webhook_account_business_simple'] = "Entreprise",
    ['webhook_account_custom_simple'] = "Personnalisé",
    ['webhook_sender_savings_suffix'] = " (Épargne)",
    ['webhook_multiple_recipients'] = "Destinataires multiples (%s comptes)",
}
