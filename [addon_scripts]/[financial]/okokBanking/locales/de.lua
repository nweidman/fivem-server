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

Locales['de'] = {

    -- =============================================
    -- 1. SETTINGS
    -- =============================================

    ['ui_language'] = "de-DE", -- Wird für Datumsformatierung im UI verwendet

    -- =============================================
    -- 2. TEXTUI LOCALES (Interaction Prompts)
    -- =============================================

    ['open_banking'] = {
        text = '[E] Bank öffnen',
        color = 'darkblue',
        position = 'left'
    },
    ['open_atm'] = {
        text = '[E] Geldautomat benutzen',
        color = 'darkblue',
        position = 'left'
    },
    ['open_banking_target'] = {
        text = 'Bank öffnen',
        color = 'darkblue',
        position = 'left'
    },
    ['open_atm_target'] = {
        text = 'Geldautomat benutzen',
        color = 'darkblue',
        position = 'left'
    },

    -- =============================================
    -- 3. NOTIFICATIONS
    -- =============================================

    -- 3.1 Transactions (Deposit, Withdraw, Transfer)
    ['success_deposit'] = {title = "Erfolg", text = "Einzahlung erfolgreich", time = 5000, type = "success"},
    ['success_withdraw'] = {title = "Erfolg", text = "Auszahlung erfolgreich", time = 5000, type = "success"},
    ['success_transfer'] = {title = "Erfolg", text = "Überweisung erfolgreich", time = 5000, type = "success"},
    ['failed_to_withdraw'] = {title = "Fehler", text = "Auszahlung vom Firmenkonto fehlgeschlagen", time = 5000, type = "error"},
    ['failed_to_transfer'] = {title = "Fehler", text = "Überweisung fehlgeschlagen", time = 5000, type = "error"},
    ['not_enough_money'] = {title = "Fehler", text = "Du hast nicht genug Geld für diese Aktion", time = 5000, type = "error"},
    ['not_enough_cash'] = {title = "Fehler", text = "Du hast nicht genug Bargeld", time = 5000, type = "error"},
    ['insufficient_funds'] = {title = "Fehler", text = "Unzureichende Kontodeckung", time = 5000, type = "error"},
    ['no_valid_recipients'] = {title = "Fehler", text = "Keine gültigen Empfänger für die Überweisung gefunden", time = 5000, type = "error"},
    ['amount_exceeds_limit'] = {title = "Fehler", text = "Betrag überschreitet das Limit", time = 5000, type = "error"},
    ['daily_limit_exceeded'] = {title = "Fehler", text = "Tageslimit überschritten", time = 5000, type = "error"},

    -- 3.2 IBAN & PIN
    ['iban_not_found'] = {title = "Fehler", text = "IBAN nicht gefunden", time = 5000, type = "error"},
    ['iban_updated'] = {title = "Erfolg", text = "Deine IBAN wurde erfolgreich aktualisiert", time = 5000, type = "success"},
    ['iban_in_use'] = {title = "Fehler", text = "Diese IBAN wird bereits verwendet", time = 5000, type = "error"},
    ['pin_updated'] = {title = "Erfolg", text = "Deine PIN wurde erfolgreich aktualisiert", time = 5000, type = "success"},
    ['pin_update_failed'] = {title = "Fehler", text = "PIN konnte nicht aktualisiert werden, bitte versuche es erneut", time = 5000, type = "error"},
    ['error_pin_invalid_format'] = {title = "Fehler", text = "PIN muss eine 4-stellige Zahl sein", time = 5000, type = "error"},
    ['daily_limit_updated'] = {title = "Erfolg", text = "Tageslimit erfolgreich aktualisiert", time = 5000, type = "success"},
    ['daily_limit_update_failed'] = {title = "Fehler", text = "Tageslimit konnte nicht aktualisiert werden, bitte versuche es erneut", time = 5000, type = "error"},

    -- 3.3 Cards
    ['success_card_created'] = {title = "Erfolg", text = "Karte erfolgreich erstellt", time = 5000, type = "success"},
    ['success_card_deleted'] = {title = "Erfolg", text = "Karte erfolgreich gelöscht", time = 5000, type = "success"},
    ['card_managed_successfully'] = {title = "Erfolg", text = "Kartendaten erfolgreich aktualisiert", time = 5000, type = "success"},
    ['error_card_created'] = {title = "Fehler", text = "Karte konnte nicht erstellt werden, bitte versuche es erneut", time = 5000, type = "error"},
    ['error_card_not_found'] = {title = "Fehler", text = "Karte nicht gefunden", time = 5000, type = "error"},
    ['error_card_delete_failed'] = {title = "Fehler", text = "Karte nicht gefunden oder konnte nicht gelöscht werden", time = 5000, type = "error"},
    ['error_no_cards_found'] = {title = "Fehler", text = "Keine Karten gefunden", time = 5000, type = "error"},
    ['no_active_cards'] = {title = "Fehler", text = "Du hast keine aktiven Karten", time = 5000, type = "error"},
    ['invalid_cards_data'] = {title = "Fehler", text = "Ungültige Kartendaten", time = 5000, type = "error"},
    ['card_number_not_found'] = {title = "Fehler", text = "Kartennummer nicht gefunden", time = 5000, type = "error"},
    ['max_credit_cards_reached'] = {title = "Fehler", text = "Du hast die maximale Anzahl an Kreditkarten erreicht", time = 5000, type = "error"},
    ['max_total_credit_cards_reached'] = {title = "Fehler", text = "Du hast die maximale Gesamtanzahl an Kreditkarten erreicht", time = 5000, type = "error"},
    ['card_already_exists'] = {title = "Fehler", text = "Für dieses Konto existiert bereits eine Karte", time = 5000, type = "error"},

    -- 3.4 Bills
    ['no_unpaid_bills'] = {title = "Info", text = "Alle deine Rechnungen sind bezahlt", time = 5000, type = "info"},
    ['no_unpaid_bills_found'] = {title = "Fehler", text = "Keine offenen Rechnungen gefunden", time = 5000, type = "error"},
    ['success_paid_all_bills'] = {title = "Erfolg", text = "Alle Rechnungen erfolgreich bezahlt", time = 5000, type = "success"},
    ['bill_paid_success'] = {title = "Erfolg", text = "Rechnung erfolgreich bezahlt", time = 5000, type = "success"},
    ['error_paid_all_bills'] = {title = "Fehler", text = "Rechnungen konnten nicht bezahlt werden, bitte versuche es erneut", time = 5000, type = "error"},
    ['bill_payment_failed'] = {title = "Fehler", text = "Rechnung konnte nicht bezahlt werden, bitte versuche es erneut", time = 5000, type = "error"},
    ['success_receipt_printed'] = {title = "Erfolg", text = "Beleg erfolgreich gedruckt", time = 5000, type = "success"},
    ['failed_to_print_receipt'] = {title = "Fehler", text = "Beleg konnte nicht gedruckt werden, bitte versuche es erneut", time = 5000, type = "error"},
    ['no_reference_id'] = {title = "Fehler", text = "Keine Referenz-ID angegeben", time = 5000, type = "error"},
    ['already_paid'] = {title = "Fehler", text = "Dies wurde bereits bezahlt", time = 5000, type = "error"},

    -- 3.5 Accounts
    ['success_account_created'] = {title = "Erfolg", text = "Neues Konto erfolgreich erstellt", time = 5000, type = "success"},
    ['success_account_closed'] = {title = "Erfolg", text = "Konto erfolgreich geschlossen", time = 5000, type = "success"},
    ['success_account_left'] = {title = "Erfolg", text = "Du hast das Konto erfolgreich verlassen", time = 5000, type = "success"},
    ['success_account_name_updated'] = {title = "Erfolg", text = "Kontoname erfolgreich aktualisiert", time = 5000, type = "success"},
    ['account_not_found'] = {title = "Fehler", text = "Konto nicht gefunden", time = 5000, type = "error"},
    ['invalid_account_name'] = {title = "Fehler", text = "Ungültiger Kontoname", time = 5000, type = "error"},
    ['error_account_name_empty'] = {title = "Fehler", text = "Kontoname darf nicht leer sein", time = 5000, type = "error"},
    ['error_account_name_length'] = {title = "Fehler", text = "Kontoname muss zwischen 1 und 50 Zeichen lang sein", time = 5000, type = "error"},
    ['error_insufficient_funds'] = {title = "Fehler", text = "Du hast nicht genug Geld, um ein Konto zu erstellen", time = 5000, type = "error"},
    ['error_insufficient_funds_account_creation'] = {title = "Fehler", text = "Unzureichende Mittel, um ein Konto zu erstellen", time = 5000, type = "error"},
    ['error_max_accounts_reached'] = {title = "Fehler", text = "Du hast die maximale Anzahl an Konten erreicht", time = 5000, type = "error"},
    ['error_account_creation_failed'] = {title = "Fehler", text = "Konto konnte nicht erstellt werden. Bitte versuche es erneut", time = 5000, type = "error"},
    ['error_account_update_failed'] = {title = "Fehler", text = "Konto konnte nicht aktualisiert werden", time = 5000, type = "error"},
    ['error_account_deletion_failed'] = {title = "Fehler", text = "Konto konnte nicht gelöscht werden. Bitte versuche es erneut", time = 5000, type = "error"},
    ['error_account_has_balance'] = {title = "Fehler", text = "Konto mit Restguthaben kann nicht geschlossen werden. Bitte hebe zuerst alles ab", time = 5000, type = "error"},
    ['error_account_has_active_loans'] = {title = "Fehler", text = "Konto mit aktiven Krediten kann nicht geschlossen/verlassen werden. Bitte tilge zuerst alle Kredite", time = 5000, type = "error"},
    ['error_invalid_account_type'] = {title = "Fehler", text = "Ungültiger Kontotyp", time = 5000, type = "error"},
    ['error_invalid_custom_account_identifier'] = {title = "Fehler", text = "Ungültiger Konto-Identifier", time = 5000, type = "error"},
    ['error_owner_cannot_leave'] = {title = "Fehler", text = "Kontoinhaber können ihr Konto nicht verlassen. Bitte schließe das Konto stattdessen", time = 5000, type = "error"},
    ['error_no_access_found'] = {title = "Fehler", text = "Kein Zugriff auf dieses Konto gefunden", time = 5000, type = "error"},
    ['failed_to_access_savings_account'] = {title = "Fehler", text = "Zugriff auf Sparkonto fehlgeschlagen", time = 5000, type = "error"},

    -- 3.6 Users & Permissions
    ['success_user_added'] = {title = "Erfolg", text = "Benutzer erfolgreich hinzugefügt", time = 5000, type = "success"},
    ['success_user_removed'] = {title = "Erfolg", text = "Benutzer erfolgreich entfernt", time = 5000, type = "success"},
    ['success_permissions_updated'] = {title = "Erfolg", text = "Berechtigungen erfolgreich aktualisiert", time = 5000, type = "success"},
    ['error_user_not_found'] = {title = "Fehler", text = "Benutzer nicht gefunden", time = 5000, type = "error"},
    ['error_user_add_failed'] = {title = "Fehler", text = "Benutzer konnte nicht hinzugefügt werden", time = 5000, type = "error"},
    ['error_user_already_has_access'] = {title = "Fehler", text = "Benutzer hat bereits Zugriff auf dieses Konto", time = 5000, type = "error"},
    ['error_cannot_add_owner'] = {title = "Fehler", text = "Kontoinhaber kann nicht hinzugefügt werden", time = 5000, type = "error"},
    ['error_cannot_remove_owner'] = {title = "Fehler", text = "Kontoinhaber kann nicht entfernt werden", time = 5000, type = "error"},
    ['error_permissions_update_failed'] = {title = "Fehler", text = "Berechtigungen konnten nicht aktualisiert werden", time = 5000, type = "error"},
    ['error_player_not_online'] = {title = "Fehler", text = "Spieler ist nicht online", time = 5000, type = "error"},
    ['player_not_found'] = {title = "Fehler", text = "Spieler nicht gefunden", time = 5000, type = "error"},
    ['no_permission'] = {title = "Fehler", text = "Du hast keine Berechtigung für diese Aktion", time = 5000, type = "error"},
    ['feature_disabled'] = {title = "Fehler", text = "Dieses Feature ist derzeit deaktiviert", time = 5000, type = "error"},
    ['invalid_daily_limit'] = {title = "Fehler", text = "Ungültiges Tageslimit", time = 5000, type = "error"},

    -- 3.7 Loans
    ['loan_success_created'] = {title = "Erfolg", text = "Kredit erfolgreich erstellt!", time = 5000, type = "success"},
    ['loan_success_paid'] = {title = "Erfolg", text = "Kredit erfolgreich bezahlt", time = 5000, type = "success"},
    ['loan_success_partial_paid'] = {title = "Erfolg", text = "Teilzahlung des Kredits erfolgreich", time = 5000, type = "success"},
    ['loan_not_found'] = {title = "Fehler", text = "Kredit nicht gefunden", time = 5000, type = "error"},
    ['no_plans'] = {title = "Fehler", text = "Keine Kreditpläne verfügbar.", time = 5000, type = "error"},
    ['unknown_plan'] = {title = "Fehler", text = "Ausgewählter Kreditplan ist ungültig.", time = 5000, type = "error"},
    ['plan_disabled'] = {title = "Fehler", text = "Dieser Kreditplan ist derzeit deaktiviert.", time = 5000, type = "error"},
    ['invalid_amount'] = {title = "Fehler", text = "Ungültiger Betrag.", time = 5000, type = "error"},
    ['invalid_term'] = {title = "Fehler", text = "Ungültige Laufzeit ausgewählt.", time = 5000, type = "error"},
    ['too_many_active_loans'] = {title = "Fehler", text = "Du hast die maximale Anzahl an aktiven Krediten erreicht.", time = 5000, type = "error"},
    ['has_late_payments'] = {title = "Fehler", text = "Du hast überfällige Zahlungen. Bitte begleiche diese, bevor du einen neuen Kredit beantragst.", time = 5000, type = "error"},

    -- 3.8 Savings Goals
    ['success_goal_created'] = {title = "Erfolg", text = "Sparziel erfolgreich erstellt", time = 5000, type = "success"},
    ['success_goal_withdrawn'] = {title = "Erfolg", text = "Sparziel-Guthaben erfolgreich abgehoben", time = 5000, type = "success"},
    ['success_goal_added'] = {title = "Erfolg", text = "Geld erfolgreich zum Sparziel hinzugefügt", time = 5000, type = "success"},
    ['goal_not_found'] = {title = "Fehler", text = "Ziel nicht gefunden", time = 5000, type = "error"},
    ['goal_already_completed'] = {title = "Fehler", text = "Ziel ist bereits abgeschlossen", time = 5000, type = "error"},
    ['invalid_goal_id'] = {title = "Fehler", text = "Ungültige Ziel-ID", time = 5000, type = "error"},
    ['invalid_goal_name'] = {title = "Fehler", text = "Ungültiger Zielname", time = 5000, type = "error"},
    ['invalid_target_amount'] = {title = "Fehler", text = "Ungültiger Zielbetrag", time = 5000, type = "error"},
    ['invalid_initial_deposit'] = {title = "Fehler", text = "Ungültige Anfangseinzahlung", time = 5000, type = "error"},
    ['max_goals_reached'] = {title = "Fehler", text = "Du hast die maximale Anzahl an Sparzielen erreicht", time = 5000, type = "error"},
    ['no_funds_to_withdraw'] = {title = "Fehler", text = "Keine Mittel zum Abheben aus diesem Ziel vorhanden", time = 5000, type = "error"},
    ['failed_to_delete_goal'] = {title = "Fehler", text = "Ziel konnte nicht gelöscht werden", time = 5000, type = "error"},
    ['failed_to_update_goal'] = {title = "Fehler", text = "Ziel konnte nicht aktualisiert werden", time = 5000, type = "error"},

    -- 3.9 Contacts
    ['success_contact_saved'] = {title = "Erfolg", text = "Kontakt erfolgreich gespeichert", time = 5000, type = "success"},
    ['success_contact_deleted'] = {title = "Erfolg", text = "Kontakt erfolgreich gelöscht", time = 5000, type = "success"},
    ['success_contact_favorite_toggled'] = {title = "Erfolg", text = "Kontakt erfolgreich zu Favoriten hinzugefügt", time = 5000, type = "success"},
    ['error_contact_save_failed'] = {title = "Fehler", text = "Kontakt konnte nicht gespeichert werden", time = 5000, type = "error"},
    ['error_contact_delete_failed'] = {title = "Fehler", text = "Kontakt konnte nicht gelöscht werden", time = 5000, type = "error"},
    ['error_contact_favorite_toggle_failed'] = {title = "Fehler", text = "Kontakt konnte nicht als Favorit geändert werden", time = 5000, type = "error"},
    ['max_contacts_reached'] = {title = "Fehler", text = "Du hast die maximale Anzahl an Kontakten erreicht", time = 5000, type = "error"},
    ['max_favorites_reached'] = {title = "Fehler", text = "Du hast die maximale Anzahl an Favoriten erreicht", time = 5000, type = "error"},

    -- 3.10 General Errors
    ['unknown_error'] = {title = "Fehler", text = "Ein unbekannter Fehler ist aufgetreten", time = 5000, type = "error"},
    ['error_invalid_data'] = {title = "Fehler", text = "Ungültige Daten übermittelt", time = 5000, type = "error"},
    ['invalid_parameters'] = {title = "Fehler", text = "Ungültige Parameter", time = 5000, type = "error"},
    ['database_error'] = {title = "Fehler", text = "Datenbankfehler aufgetreten", time = 5000, type = "error"},
    ['error_database_update_failed'] = {title = "Fehler", text = "Datenbankaktualisierung fehlgeschlagen", time = 5000, type = "error"},
    ['db_insert_failed'] = {title = "Fehler", text = "Kredit konnte nicht erstellt werden. Bitte versuche es erneut.", time = 5000, type = "error"},

    -- =============================================
    -- 4. UI LOCALES
    -- =============================================

    -- 4.1 Navigation & Sections
    ['ui_overview'] = "Übersicht",
    ['ui_transactions'] = "Transaktionen",
    ['ui_loans'] = "Kredite",
    ['ui_savings'] = "Sparen",
    ['ui_bills'] = "Rechnungen",
    ['ui_cards'] = "Karten",
    ['ui_management'] = "Verwaltung",
    ['ui_statistics'] = "Statistiken",
    ['ui_history'] = "Verlauf",

    -- 4.2 Common Actions & Buttons
    ['ui_view'] = "Ansehen",
    ['ui_view_all'] = "Alle anzeigen",
    ['ui_edit'] = "Bearbeiten",
    ['ui_delete'] = "Löschen",
    ['ui_remove'] = "Entfernen",
    ['ui_add'] = "Hinzufügen",
    ['ui_add_new'] = "Neu hinzufügen",
    ['ui_create'] = "Erstellen",
    ['ui_save'] = "Speichern",
    ['ui_save_changes'] = "Änderungen speichern",
    ['ui_cancel'] = "Abbrechen",
    ['ui_confirm'] = "Bestätigen",
    ['ui_copy'] = "Kopieren",
    ['ui_print'] = "Drucken",
    ['ui_show'] = "Anzeigen",
    ['ui_hide'] = "Ausblenden",
    ['ui_change'] = "Ändern",
    ['ui_manage'] = "Verwalten",
    ['ui_select'] = "Auswählen",
    ['ui_selected'] = "Ausgewählt",
    ['ui_search'] = "Suchen...",
    ['ui_pay'] = "Bezahlen",
    ['ui_pay_all'] = "Alle bezahlen",

    -- 4.3 Common Labels
    ['ui_name'] = "Name",
    ['ui_type'] = "Typ",
    ['ui_status'] = "Status",
    ['ui_date'] = "Datum",
    ['ui_amount'] = "Betrag",
    ['ui_price'] = "Preis",
    ['ui_balance'] = "Kontostand",
    ['ui_description'] = "Beschreibung",
    ['ui_actions'] = "Aktionen",
    ['ui_author'] = "Ersteller",
    ['ui_notes'] = "Notizen",
    ['ui_info'] = "Info",
    ['ui_id'] = "ID",
    ['ui_total'] = "Gesamt",
    ['ui_to'] = "An",
    ['ui_from'] = "Von",
    ['ui_in'] = "in",

    -- 4.4 Status Labels
    ['ui_new'] = "Neu",
    ['ui_pending'] = "Ausstehend",
    ['ui_active'] = "Aktiv",
    ['ui_blocked'] = "Blockiert",
    ['ui_paid'] = "Bezahlt",
    ['ui_unpaid'] = "Unbezahlt",
    ['ui_completed'] = "Abgeschlossen",
    ['ui_complete'] = "abgeschlossen",
    ['ui_sent'] = "Gesendet",
    ['ui_received'] = "Empfangen",

    -- 4.5 Account Types & Labels
    ['ui_personal'] = "Privat",
    ['ui_business'] = "Firma",
    ['ui_shared'] = "Geteilt",
    ['ui_owner'] = "Inhaber",
    ['ui_user'] = "Benutzer",
    ['ui_personal_account'] = "Privatkonto",
    ['ui_business_account'] = "Firmenkonto",
    ['ui_savings_account'] = "Sparkonto",
    ['ui_checking_account'] = "Girokonto",
    ['ui_your_account'] = "Dein Konto",
    ['ui_all_accounts'] = "Alle Konten",
    ['ui_company'] = "Firma",
    ['ui_high_yield'] = "Hohe Rendite",
    ['ui_higher_rates'] = "Höhere Zinsen",

    -- 4.6 Account Management
    ['ui_account_name'] = "Kontoname",
    ['ui_account_type'] = "Kontotyp",
    ['ui_account_status'] = "Kontostatus",
    ['ui_account_settings'] = "Kontoeinstellungen",
    ['ui_account_users'] = "Kontobenutzer",
    ['ui_opening_date'] = "Eröffnungsdatum",
    ['ui_create_account'] = "Konto erstellen",
    ['ui_create_new_account'] = "Neues Konto erstellen",
    ['ui_add_account'] = "Konto hinzufügen",
    ['ui_close_account'] = "Konto schließen",
    ['ui_leave_account'] = "Konto verlassen",
    ['ui_change_name'] = "Namen ändern",
    ['ui_manage_account_users'] = "Kontobenutzer verwalten",
    ['ui_add_new_user'] = "Neuen Benutzer hinzufügen",
    ['ui_player_id'] = "Spieler-ID",
    ['ui_edit_permissions'] = "Berechtigungen bearbeiten",
    ['ui_remove_user'] = "Benutzer entfernen",
    ['ui_confirm_close_account'] = "Kontoschließung bestätigen",
    ['ui_confirm_leave_account'] = "Verlassen des Kontos bestätigen",
    ['ui_close_account_btn'] = "Ich möchte mein Konto schließen",
    ['ui_close_account_warning'] = "Das Schließen deines Kontos löscht alle Daten dauerhaft und kann nicht rückgängig gemacht werden. Alle Gelder müssen vorher abgehoben werden.",
    ['ui_close_account_permanent'] = "Die Kontoschließung löscht alle Daten dauerhaft und kann nicht rückgängig gemacht werden.",
    ['ui_leave_account_warning'] = "Du verlierst den Zugriff auf dieses Konto.",
    ['ui_leave_account_warning_full'] = "Du verlierst den Zugriff auf dieses Konto. Stelle sicher, dass alle Gelder abgehoben sind, bevor du es verlässt.",
    ['ui_account_has_balance'] = "Konto hat Restguthaben",
    ['ui_withdraw_before_close'] = "Stelle sicher, dass alle Gelder abgehoben sind, bevor du das Konto schließt.",
    ['ui_create_account_info'] = "Für das Erstellen eines neuen Kontos fällt eine Gebühr an in Höhe von",

    -- 4.7 Transactions
    ['ui_deposit'] = "Einzahlen",
    ['ui_withdraw'] = "Auszahlen",
    ['ui_transfer'] = "Überweisen",
    ['ui_deposit_money'] = "Geld einzahlen",
    ['ui_withdraw_money'] = "Geld auszahlen",
    ['ui_transfer_money'] = "Geld überweisen",
    ['ui_recent_transactions'] = "Letzte Transaktionen",
    ['ui_total_transactions'] = "Transaktionen insgesamt",
    ['ui_total_received'] = "Insgesamt erhalten",
    ['ui_total_sent'] = "Insgesamt gesendet",
    ['ui_net_earnings'] = "Nettoeinnahmen",
    ['ui_transaction_details'] = "Transaktionsdetails",
    ['ui_view_transaction'] = "Transaktion anzeigen",
    ['ui_print_receipt'] = "Beleg drucken",
    ['ui_iban'] = "IBAN",
    ['ui_sender_iban'] = "IBAN des Senders",
    ['ui_receiver_iban'] = "IBAN des Empfängers",
    ['ui_recipient'] = "Empfänger",
    ['ui_select_recipient'] = "Empfänger auswählen",
    ['ui_select_account'] = "Konto auswählen",
    ['ui_external_account'] = "Externes Konto",
    ['ui_multiple_contacts'] = "Mehrere Kontakte",
    ['ui_enter_amount'] = "Betrag eingeben",
    ['ui_daily_limit'] = "Tageslimit",
    ['ui_summary'] = "Übersicht",

    -- 4.8 Cards
    ['ui_card_holder'] = "Karteninhaber",
    ['ui_card_type'] = "Kartentyp",
    ['ui_pin'] = "PIN",
    ['ui_pin_number'] = "PIN-Nummer",
    ['ui_not_set'] = "Nicht gesetzt",
    ['ui_expires'] = "Läuft ab",
    ['ui_expiry'] = "Ablaufdatum",
    ['ui_current_expiry'] = "Aktuelles Ablaufdatum",
    ['ui_auto_renew'] = "Automatisch verlängern",
    ['ui_manage_card'] = "Karte verwalten",
    ['ui_create_new_card'] = "Neue Karte erstellen",
    ['ui_select_card'] = "Karte auswählen",
    ['ui_delete_card'] = "Karte löschen",
    ['ui_delete_card_warning'] = "Diese Aktion kann nicht rückgängig gemacht werden.",
    ['ui_delete_card_confirm'] = "Bist du sicher, dass du deine Karte löschen möchtest?",
    ['ui_warning'] = "Warnung",
    ['ui_information'] = "Information",
    ['ui_blocking_card_warning'] = "Wenn du <span class=\"bold\">deine Bankkarte sperrst</span>, beachte bitte, dass zur Reaktivierung <span class=\"bold\">eine neue Karte ausgestellt werden muss</span>. Dieser Vorgang verursacht eine Ersatzgebühr von <span class=\"bold activation-fee\">{fee}</span>.",
    ['ui_activating_card_info'] = "Bitte beachte, dass die Aktivierung deiner Bankkarte eine Servicegebühr von <span class=\"bold activation-fee\">{fee}</span> erfordert.",

    -- 4.9 Loans
    ['ui_loan_plans'] = "Kreditpläne",
    ['ui_starter_loan'] = "Starterkredit",
    ['ui_standard_loan'] = "Standardkredit",
    ['ui_premium_loan'] = "Premiumkredit",
    ['ui_executive_loan'] = "Exklusivkredit",
    ['ui_custom_loan'] = "Benutzerdefinierter Kredit",
    ['ui_personal_loan'] = "Privatkredit",
    ['ui_car_loan'] = "Autokredit",
    ['ui_home_loan'] = "Hauskredit",
    ['ui_request_loan'] = "Kredit beantragen",
    ['ui_active_loans'] = "Aktive Kredite",
    ['ui_no_active_loans'] = "Keine aktiven Kredite",
    ['ui_interest_rate'] = "Zinssatz",
    ['ui_daily_payment'] = "Tägliche Zahlung",
    ['ui_remaining'] = "Verbleibend",
    ['ui_term'] = "Laufzeit",
    ['ui_select_term'] = "Laufzeit auswählen",
    ['ui_plan'] = "Plan",
    ['ui_total_to_repay'] = "Gesamtsumme zur Rückzahlung",
    ['ui_manage_personal_loan'] = "{loan} verwalten",
    ['ui_next_payment'] = "Nächste Zahlung",
    ['ui_partial_payment'] = "Teilzahlung",
    ['ui_pay_off_loan'] = "Kredit vollständig ablösen",
    ['ui_loan_overdue_warning'] = "Deine Kreditrate ist <span class=\"bold\">überfällig</span>. Bitte zahle den <span class=\"bold\">ausstehenden Betrag</span> so schnell wie möglich, um <span class=\"bold\">zusätzliche Gebühren oder Strafen</span> zu vermeiden.",

    -- 4.10 Credit Score
    ['ui_credit_score'] = "Bonität",
    ['ui_credit_score_ranks'] = "Bonitätsstufen",
    ['ui_credit_score_info'] = "Bonitätsinformationen",
    ['ui_credit_score_info_text'] = "Deine Bonität beeinflusst die Zinssätze:",
    ['ui_higher_scores_lower_rates'] = "höhere Werte senken die Zinsen",
    ['ui_lower_scores_increase'] = "niedrigere Werte erhöhen sie",
    ['ui_view_ranks'] = "Stufen anzeigen",
    ['ui_score'] = "Punktzahl",
    ['ui_rank'] = "Stufe",
    ['ui_rate'] = "Satz",
    ['ui_excellent'] = "Exzellent",
    ['ui_very_good'] = "Sehr gut",
    ['ui_good'] = "Gut",
    ['ui_fair'] = "Ausreichend",
    ['ui_poor'] = "Schlecht",
    ['ui_very_poor'] = "Sehr schlecht",

    -- 4.11 Savings Goals
    ['ui_saving_goals'] = "Sparziele",
    ['ui_no_saving_goals'] = "Keine Sparziele",
    ['ui_create_first_goal'] = "Erstelle dein erstes Sparziel,<br>um deinen Fortschritt zu verfolgen",
    ['ui_create_new_saving_goal'] = "Neues Sparziel erstellen",
    ['ui_manage_saving_goal'] = "Sparziel verwalten",
    ['ui_manage_goal'] = "Ziel verwalten",
    ['ui_goal'] = "Ziel",
    ['ui_goal_name'] = "Zielname",
    ['ui_target_amount'] = "Zielbetrag",
    ['ui_initial_deposit'] = "Anfangseinzahlung",
    ['ui_saved'] = "Gespart",
    ['ui_add_to_goal'] = "Zum Ziel hinzufügen",
    ['ui_withdraw_funds'] = "Guthaben abheben",
    ['ui_interest_tracker'] = "Zins-Tracker",
    ['ui_total_interest_earned'] = "Gesamtverdiente Zinsen",
    ['ui_this_week'] = "Diese Woche",
    ['ui_next_payout'] = "Nächste Auszahlung",

    -- 4.12 Bills & Invoices
    ['ui_bills_list'] = "Rechnungsliste",
    ['ui_pay_bill'] = "Rechnung bezahlen",
    ['ui_pay_all_bills'] = "Alle Rechnungen bezahlen",
    ['ui_view_bill'] = "Rechnung anzeigen",
    ['ui_invoice'] = "Rechnung",
    ['ui_reference_id'] = "Referenz-ID",
    ['ui_subtotal'] = "Zwischensumme",
    ['ui_vat'] = "MwSt.",
    ['ui_due'] = "Fällig",
    ['ui_paid_on'] = "Bezahlt am",

    -- 4.13 Contacts
    ['ui_contacts'] = "Kontakte",
    ['ui_favorites'] = "Favoriten",
    ['ui_no_contacts'] = "Keine Kontakte",
    ['ui_no_favorite_contacts'] = "Keine Favoriten",
    ['ui_save_contact'] = "Kontakt speichern",

    -- 4.14 Modals & Dialogs
    ['ui_are_you_sure'] = "Bist du sicher?",
    ['ui_are_you_sure_iban_change'] = "Bist du sicher, dass du deine IBAN ändern möchtest?",
    ['ui_are_you_sure_pin_change'] = "Bist du sicher, dass du deine PIN ändern möchtest?",
    ['ui_are_you_sure_daily_limit_change'] = "Bist du sicher, dass du dein Tageslimit ändern möchtest?",
    ['ui_are_you_sure_remove_user'] = "Bist du sicher, dass du <span class=\"bold\">{user}</span> vom Konto <span class=\"bold\">{account}</span> entfernen möchtest?",
    ['ui_are_you_sure_pay_bill'] = "Bist du sicher, dass du diese Rechnung bezahlen möchtest?",
    ['ui_are_you_sure_print_receipt'] = "Bist du sicher, dass du den Beleg drucken möchtest?",
    ['ui_copy_success'] = "In die Zwischenablage kopiert",
    ['ui_copy_error'] = "Kopieren fehlgeschlagen",
    ['ui_loading_data'] = "Daten werden geladen...",
    ['ui_logging_out'] = "Abmeldung...",
    ['ui_generated_automatically'] = "Automatisch vom System erzeugt",

    -- 4.15 Empty States & Placeholders
    ['ui_no_users_yet'] = "Noch keine Benutzer",
    ['ui_no_bills'] = "Noch keine Rechnungen",
    ['ui_no_transactions_yet'] = "Noch keine Transaktionen",
    ['ui_no_recent_activity'] = "Keine aktuellen Aktivitäten",
    ['ui_no_transaction_history'] = "Noch kein Transaktionsverlauf",
    ['ui_transaction_history_help'] = "Dein Transaktionsverlauf wird hier angezeigt",
    ['ui_bills_help'] = "Dein Rechnungverlauf wird hier angezeigt",
    ['ui_loan_history_help'] = "Dein Kreditverlauf wird hier angezeigt",
    ['ui_savings_transactions_appear_here'] = "Deine Spar-Transaktionen werden hier angezeigt",
    ['ui_make_first_transaction'] = "Tätige deine erste Transaktion, um das Diagramm zu sehen",

    -- 4.16 Time Labels
    ['ui_day'] = "Tag",
    ['ui_days'] = "Tage",
    ['ui_days_late'] = "{days} Tage im Verzug",
    ['ui_hours_late'] = "{hours} Stunden im Verzug",
    ['ui_minutes_late'] = "{minutes} Minuten im Verzug",
    ['ui_in_days'] = "in {days} Tagen",
    ['ui_in_hours'] = "in {hours} Stunden",
    ['ui_in_minutes'] = "in {minutes} Minuten",

    -- 4.17 Format Strings (used with string.format or template literals)
    ['ui_showing_transactions'] = "Zeige %d-%d von %d",
    ['ui_loan_term_format'] = "%s/%s • %d %s",
    ['ui_days_format'] = "%d %s",
    ['ui_users_count'] = "%d %s",

    -- =============================================
    -- 5. TRANSACTION LOCALES (Server-side)
    -- =============================================

    -- 5.1 Sender/Receiver Names
    ['tx_wallet'] = "Geldbörse",
    ['tx_custom_account'] = "Benutzerkonto",
    ['tx_bank_loan'] = "Bank (Kredit)",
    ['tx_bank_card_purchase'] = "Bank (Kartenkauf)",
    ['tx_bank_card_activation'] = "Bank (Kartenaktivierung)",
    ['tx_bank_card_renewal'] = "Bank (Kartenerneuerung)",
    ['tx_bank_loan_payoff'] = "Bank (Kreditablösung)",
    ['tx_bank_iban_change'] = "Bank (IBAN-Änderung)",
    ['tx_bank_pin_change'] = "Bank (PIN-Änderung)",
    ['tx_bank_account_creation'] = "Bank (Kontoerstellung)",
    ['tx_bank_receipt_print'] = "Bank (Belegdruck)",
    ['tx_loan_payment'] = "Kreditzahlung",

    -- 5.2 Transaction Reasons - Deposits
    ['tx_reason_deposit_card'] = "Einzahlung auf Kartenkonto",
    ['tx_reason_deposit_business'] = "Einzahlung auf Firmenkonto",
    ['tx_reason_deposit_custom'] = "Einzahlung auf benutzerdefiniertes Konto",
    ['tx_reason_deposit_savings'] = "Einzahlung auf Sparkonto",
    ['tx_reason_deposit_bank'] = "Einzahlung auf Bankkonto",
    ['tx_reason_receipt_print'] = "Belegdruck",

    -- 5.3 Transaction Reasons - Withdrawals
    ['tx_reason_withdraw_card'] = "Auszahlung vom Kartenkonto",
    ['tx_reason_withdraw_business'] = "Auszahlung vom Firmenkonto",
    ['tx_reason_withdraw_custom'] = "Auszahlung vom benutzerdefinierten Konto",
    ['tx_reason_withdraw_savings'] = "Auszahlung vom Sparkonto",
    ['tx_reason_withdraw_bank'] = "Auszahlung vom Bankkonto",

    -- 5.4 Transaction Reasons - Transfers
    ['tx_reason_transfer_to'] = "Überweisung an",
    ['tx_reason_transfer_business'] = "Überweisung an Firmenkonto",
    ['tx_reason_transfer_custom'] = "Überweisung an benutzerdefiniertes Konto",
    ['tx_reason_transfer_personal'] = "Überweisung an Privatkonto",
    ['tx_reason_transfer_savings'] = "Überweisung an Sparkonto",

    -- 5.5 Transaction Reasons - Other
    ['tx_reason_card_purchase'] = "Kartenkauf:",
    ['tx_reason_loan_disbursement'] = "Kreditauszahlung:",
    ['tx_reason_loan_payment'] = "Kreditzahlung:",
    ['tx_reason_loan_payoff'] = "Kreditablösung:",
    ['tx_reason_penalty'] = "Strafe:",
    ['tx_reason_paid_bill'] = "Bezahlte Rechnung:",
    ['tx_reason_iban_change'] = "Gebühr für IBAN-Änderung",
    ['tx_reason_pin_change'] = "Gebühr für PIN-Änderung",
    ['tx_reason_account_creation'] = "Gebühr für Kontoerstellung",
    ['tx_reason_paycheck'] = "Gehalt",
    ['tx_paycheck'] = "Gehalt",

    -- =============================================
    -- 6. TIME/DATE LOCALES
    -- =============================================

    ['time_expired'] = "abgelaufen",
    ['time_month'] = "Monat",
    ['time_months'] = "Monate",
    ['time_in_format'] = "in %d %s",

    -- =============================================
    -- 7. WEBHOOK LOCALES
    -- =============================================

    -- 7.1 Webhook Titles
    ['webhook_title_deposit'] = "💰 Bankeinzahlung",
    ['webhook_title_withdraw'] = "💸 Bankauszahlung",
    ['webhook_title_transfer'] = "💳 Banküberweisung",
    ['webhook_title_savings_deposit'] = "🏦 Spar-Einzahlung",
    ['webhook_title_savings_withdraw'] = "🏦 Spar-Auszahlung",
    ['webhook_title_savings_transfer'] = "🏦 Spar-Überweisung",
    ['webhook_title_loan_create'] = "📋 Kredit erstellt",
    ['webhook_title_account_create'] = "🏦 Konto erstellt",
    ['webhook_title_account_delete'] = "🗑️ Konto gelöscht",
    ['webhook_title_account_add_user'] = "👤 Benutzer zum Konto hinzugefügt",
    ['webhook_title_account_remove_user'] = "👤 Benutzer vom Konto entfernt",
    ['webhook_title_account_change_permissions'] = "🔐 Kontoberechtigungen geändert",
    ['webhook_title_default'] = "Banking-Log",

    -- 7.2 Webhook Field Names
    ['webhook_field_from'] = "Von",
    ['webhook_field_to'] = "An",
    ['webhook_field_amount'] = "Betrag",
    ['webhook_field_reason'] = "Grund",
    ['webhook_field_account'] = "Konto",
    ['webhook_field_goal'] = "Ziel",
    ['webhook_field_loan_plan'] = "Kreditplan",
    ['webhook_field_interest_rate'] = "Zinssatz",
    ['webhook_field_duration'] = "Dauer",
    ['webhook_field_borrower'] = "Kreditnehmer",
    ['webhook_field_account_name'] = "Kontoname",
    ['webhook_field_iban'] = "IBAN",
    ['webhook_field_owner'] = "Inhaber",
    ['webhook_field_final_balance'] = "Endkontostand",
    ['webhook_field_added_user'] = "Hinzugefügter Benutzer",
    ['webhook_field_account_owner'] = "Kontoinhaber",
    ['webhook_field_removed_user'] = "Entfernter Benutzer",
    ['webhook_field_user'] = "Benutzer",
    ['webhook_field_new_permissions'] = "Neue Berechtigungen",
    ['webhook_field_player_source'] = "Spieler-Quelle",
    ['webhook_field_license'] = "Lizenz",
    ['webhook_field_discord'] = "Discord",

    -- 7.3 Webhook Other Text
    ['webhook_reason_savings_transfer'] = "Überweisung vom Sparen (%s)",
    ['webhook_duration_months'] = "%s Monate",
    ['webhook_discord_not_linked'] = "Nicht verknüpft",
    ['webhook_author_suffix'] = "Banking-Logs",

    -- 7.4 Webhook Account Type Labels
    ['webhook_account_personal'] = "Privat",
    ['webhook_account_business'] = "Firma: %s",
    ['webhook_account_custom'] = "Benutzerdefiniert: %s",
    ['webhook_account_business_simple'] = "Firma",
    ['webhook_account_custom_simple'] = "Benutzerdefiniert",
    ['webhook_sender_savings_suffix'] = " (Sparen)",
    ['webhook_multiple_recipients'] = "Mehrere Empfänger (%s Konten)",
}
