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

Locales['hu'] = {

  -- =============================================
  -- 1. SETTINGS
  -- =============================================

  ['ui_language'] = "hu-HU",   -- Used for formatting dates in the UI

  -- =============================================
  -- 2. TEXTUI LOCALES (Interaction Prompts)
  -- =============================================

  ['open_banking'] = {
    text = '[E] Bank megnyitása',
    color = 'darkblue',
    position = 'left'
  },
  ['open_atm'] = {
    text = '[E] ATM használata',
    color = 'darkblue',
    position = 'left'
  },
  ['open_banking_target'] = {
    text = 'Bank megnyitása',
    color = 'darkblue',
    position = 'left'
  },
  ['open_atm_target'] = {
    text = 'ATM használata',
    color = 'darkblue',
    position = 'left'
  },

  -- =============================================
  -- 3. ÉRTESÍTÉSEK
  -- =============================================

  -- 3.1 Tranzakciók (Befizetés, Kivétel, Átutalás)
  ['success_deposit'] = { title = "Siker", text = "Sikeres befizetés", time = 5000, type = "success" },
  ['success_withdraw'] = { title = "Siker", text = "Sikeres pénzfelvétel", time = 5000, type = "success" },
  ['success_transfer'] = { title = "Siker", text = "Sikeres átutalás", time = 5000, type = "success" },
  ['failed_to_withdraw'] = { title = "Hiba", text = "Nem sikerült a pénzfelvétel a szervezeti számláról", time = 5000, type = "error" },
  ['failed_to_transfer'] = { title = "Hiba", text = "Az átutalás nem sikerült", time = 5000, type = "error" },
  ['not_enough_money'] = { title = "Hiba", text = "Nincs elegendő pénzed a művelet végrehajtásához", time = 5000, type = "error" },
  ['not_enough_cash'] = { title = "Hiba", text = "Nincs elegendő készpénzed", time = 5000, type = "error" },
  ['insufficient_funds'] = { title = "Hiba", text = "Nincs elegendő fedezet", time = 5000, type = "error" },
  ['no_valid_recipients'] = { title = "Hiba", text = "Nem található érvényes címzett az átutaláshoz", time = 5000, type = "error" },
  ['amount_exceeds_limit'] = { title = "Hiba", text = "Az összeg meghaladja a limitet", time = 5000, type = "error" },
  ['daily_limit_exceeded'] = { title = "Hiba", text = "A napi limit túllépve", time = 5000, type = "error" },

  -- 3.2 IBAN & PIN
  ['iban_not_found'] = { title = "Hiba", text = "Az IBAN nem található", time = 5000, type = "error" },
  ['iban_updated'] = { title = "Siker", text = "Az IBAN sikeresen frissítve lett", time = 5000, type = "success" },
  ['iban_in_use'] = { title = "Hiba", text = "Ez az IBAN már használatban van", time = 5000, type = "error" },
  ['pin_updated'] = { title = "Siker", text = "A PIN kód sikeresen frissítve lett", time = 5000, type = "success" },
  ['pin_update_failed'] = { title = "Hiba", text = "Nem sikerült frissíteni a PIN kódot, próbáld újra", time = 5000, type = "error" },
  ['error_pin_invalid_format'] = { title = "Hiba", text = "A PIN kódnak 4 számjegyűnek kell lennie", time = 5000, type = "error" },
  ['daily_limit_updated'] = { title = "Siker", text = "A napi limit sikeresen frissítve lett", time = 5000, type = "success" },
  ['daily_limit_update_failed'] = { title = "Hiba", text = "Nem sikerült frissíteni a napi limitet, próbáld újra", time = 5000, type = "error" },

  -- 3.3 Bankkártyák
  ['success_card_created'] = { title = "Siker", text = "A bankkártya sikeresen létrehozva", time = 5000, type = "success" },
  ['success_card_deleted'] = { title = "Siker", text = "A bankkártya sikeresen törölve", time = 5000, type = "success" },
  ['card_managed_successfully'] = { title = "Siker", text = "A kártya adatai sikeresen frissítve", time = 5000, type = "success" },
  ['error_card_created'] = { title = "Hiba", text = "Nem sikerült létrehozni a kártyát, próbáld újra", time = 5000, type = "error" },
  ['error_card_not_found'] = { title = "Hiba", text = "A bankkártya nem található", time = 5000, type = "error" },
  ['error_card_delete_failed'] = { title = "Hiba", text = "A bankkártya nem található vagy nem törölhető", time = 5000, type = "error" },
  ['error_no_cards_found'] = { title = "Hiba", text = "Nem található bankkártya", time = 5000, type = "error" },
  ['no_active_cards'] = { title = "Hiba", text = "Nincs aktív bankkártyád", time = 5000, type = "error" },
  ['invalid_cards_data'] = { title = "Hiba", text = "Érvénytelen kártyaadatok", time = 5000, type = "error" },
  ['card_number_not_found'] = { title = "Hiba", text = "A kártyaszám nem található", time = 5000, type = "error" },
  ['max_credit_cards_reached'] = { title = "Hiba", text = "Elérted a maximális számú hitelkártyát", time = 5000, type = "error" },
  ['max_total_credit_cards_reached'] = { title = "Hiba", text = "Elérted a maximálisan engedélyezett kártyaszámot", time = 5000, type = "error" },
  ['card_already_exists'] = { title = "Hiba", text = "Ehhez a számlához már tartozik bankkártya", time = 5000, type = "error" },

  -- 3.4 Számlák / Csekkek
  ['no_unpaid_bills'] = { title = "Információ", text = "Minden számlád ki van fizetve", time = 5000, type = "info" },
  ['no_unpaid_bills_found'] = { title = "Hiba", text = "Nem található kifizetetlen számla", time = 5000, type = "error" },
  ['success_paid_all_bills'] = { title = "Siker", text = "Az összes számla sikeresen kifizetve", time = 5000, type = "success" },
  ['bill_paid_success'] = { title = "Siker", text = "A számla sikeresen kifizetve", time = 5000, type = "success" },
  ['error_paid_all_bills'] = { title = "Hiba", text = "Nem sikerült kifizetni a számlákat, próbáld újra", time = 5000, type = "error" },
  ['bill_payment_failed'] = { title = "Hiba", text = "A számla kifizetése nem sikerült, próbáld újra", time = 5000, type = "error" },
  ['success_receipt_printed'] = { title = "Siker", text = "A nyugta sikeresen kinyomtatva", time = 5000, type = "success" },
  ['failed_to_print_receipt'] = { title = "Hiba", text = "Nem sikerült kinyomtatni a nyugtát, próbáld újra", time = 5000, type = "error" },
  ['no_reference_id'] = { title = "Hiba", text = "Nincs megadva hivatkozási azonosító", time = 5000, type = "error" },
  ['already_paid'] = { title = "Hiba", text = "Ez a számla már ki lett fizetve", time = 5000, type = "error" },

  -- 3.5 Számlák (Accounts)
  ['success_account_created'] = { title = "Siker", text = "Az új számla sikeresen létrehozva", time = 5000, type = "success" },
  ['success_account_closed'] = { title = "Siker", text = "A számla sikeresen lezárva", time = 5000, type = "success" },
  ['success_account_left'] = { title = "Siker", text = "Sikeresen kiléptél a számláról", time = 5000, type = "success" },
  ['success_account_name_updated'] = { title = "Siker", text = "A számla neve sikeresen frissítve", time = 5000, type = "success" },
  ['account_not_found'] = { title = "Hiba", text = "A számla nem található", time = 5000, type = "error" },
  ['invalid_account_name'] = { title = "Hiba", text = "Érvénytelen számlanév", time = 5000, type = "error" },
  ['error_account_name_empty'] = { title = "Hiba", text = "A számla neve nem lehet üres", time = 5000, type = "error" },
  ['error_account_name_length'] = { title = "Hiba", text = "A számla neve 1 és 50 karakter között kell legyen", time = 5000, type = "error" },
  ['error_insufficient_funds'] = { title = "Hiba", text = "Nincs elegendő pénzed a számla létrehozásához", time = 5000, type = "error" },
  ['error_insufficient_funds_account_creation'] = { title = "Hiba", text = "Nincs elegendő fedezet a számla létrehozásához", time = 5000, type = "error" },
  ['error_max_accounts_reached'] = { title = "Hiba", text = "Elérted a maximálisan létrehozható számlák számát", time = 5000, type = "error" },
  ['error_account_creation_failed'] = { title = "Hiba", text = "Nem sikerült létrehozni a számlát. Próbáld újra", time = 5000, type = "error" },
  ['error_account_update_failed'] = { title = "Hiba", text = "Nem sikerült frissíteni a számlát", time = 5000, type = "error" },
  ['error_account_deletion_failed'] = { title = "Hiba", text = "Nem sikerült törölni a számlát. Próbáld újra", time = 5000, type = "error" },
  ['error_account_has_balance'] = { title = "Hiba", text = "Nem zárható le olyan számla, amelyen még van egyenleg. Előbb vedd fel az összeget", time = 5000, type = "error" },
  ['error_account_has_active_loans'] = { title = "Hiba", text = "Nem zárható le / nem hagyható el olyan számla, amelyhez aktív hitel tartozik. Előbb fizesd ki a hiteleket", time = 5000, type = "error" },
  ['error_invalid_account_type'] = { title = "Hiba", text = "Érvénytelen számlatípus", time = 5000, type = "error" },
  ['error_invalid_custom_account_identifier'] = { title = "Hiba", text = "Érvénytelen számlaazonosító", time = 5000, type = "error" },
  ['error_owner_cannot_leave'] = { title = "Hiba", text = "A számla tulajdonosa nem léphet ki a számláról. Zárd le inkább", time = 5000, type = "error" },
  ['error_no_access_found'] = { title = "Hiba", text = "Nincs jogosultságod ehhez a számlához", time = 5000, type = "error" },
  ['failed_to_access_savings_account'] = { title = "Hiba", text = "Nem sikerült elérni a megtakarítási számlát", time = 5000, type = "error" },

  -- 3.6 Felhasználók és jogosultságok
  ['success_user_added'] = { title = "Siker", text = "Felhasználó sikeresen hozzáadva", time = 5000, type = "success" },
  ['success_user_removed'] = { title = "Siker", text = "Felhasználó sikeresen eltávolítva", time = 5000, type = "success" },
  ['success_permissions_updated'] = { title = "Siker", text = "Jogosultságok sikeresen frissítve", time = 5000, type = "success" },
  ['error_user_not_found'] = { title = "Hiba", text = "Felhasználó nem található", time = 5000, type = "error" },
  ['error_user_add_failed'] = { title = "Hiba", text = "Nem sikerült hozzáadni a felhasználót", time = 5000, type = "error" },
  ['error_user_already_has_access'] = { title = "Hiba", text = "A felhasználónak már van hozzáférése ehhez a számlához", time = 5000, type = "error" },
  ['error_cannot_add_owner'] = { title = "Hiba", text = "A számla tulajdonosa nem adható hozzá", time = 5000, type = "error" },
  ['error_cannot_remove_owner'] = { title = "Hiba", text = "A számla tulajdonosa nem távolítható el", time = 5000, type = "error" },
  ['error_permissions_update_failed'] = { title = "Hiba", text = "Nem sikerült frissíteni a jogosultságokat", time = 5000, type = "error" },
  ['error_player_not_online'] = { title = "Hiba", text = "A játékos nincs online", time = 5000, type = "error" },
  ['player_not_found'] = { title = "Hiba", text = "A játékos nem található", time = 5000, type = "error" },
  ['no_permission'] = { title = "Hiba", text = "Nincs jogosultságod a művelet végrehajtásához", time = 5000, type = "error" },
  ['feature_disabled'] = { title = "Hiba", text = "Ez a funkció jelenleg le van tiltva", time = 5000, type = "error" },
  ['invalid_daily_limit'] = { title = "Hiba", text = "Érvénytelen napi limit érték", time = 5000, type = "error" },

  -- 3.7 Hitelek
  ['loan_success_created'] = { title = "Siker", text = "A hitel sikeresen létrehozva!", time = 5000, type = "success" },
  ['loan_success_paid'] = { title = "Siker", text = "A hitel sikeresen kifizetve", time = 5000, type = "success" },
  ['loan_success_partial_paid'] = { title = "Siker", text = "A hitel részleges törlesztése sikeres", time = 5000, type = "success" },
  ['loan_not_found'] = { title = "Hiba", text = "A hitel nem található", time = 5000, type = "error" },
  ['no_plans'] = { title = "Hiba", text = "Nem érhetők el hitelcsomagok", time = 5000, type = "error" },
  ['unknown_plan'] = { title = "Hiba", text = "A kiválasztott hitelcsomag érvénytelen", time = 5000, type = "error" },
  ['plan_disabled'] = { title = "Hiba", text = "Ez a hitelcsomag jelenleg le van tiltva", time = 5000, type = "error" },
  ['invalid_amount'] = { title = "Hiba", text = "Érvénytelen összeg", time = 5000, type = "error" },
  ['invalid_term'] = { title = "Hiba", text = "Érvénytelen futamidő lett kiválasztva", time = 5000, type = "error" },
  ['too_many_active_loans'] = { title = "Hiba", text = "Elérted az aktív hitelek maximális számát", time = 5000, type = "error" },
  ['has_late_payments'] = { title = "Hiba", text = "Lejárt tartozásaid vannak. Új hitel igénylése előtt rendezd őket", time = 5000, type = "error" },

  -- 3.8 Megtakarítási célok
  ['success_goal_created'] = { title = "Siker", text = "A megtakarítási cél sikeresen létrehozva", time = 5000, type = "success" },
  ['success_goal_withdrawn'] = { title = "Siker", text = "A megtakarítási cél sikeresen felvéve", time = 5000, type = "success" },
  ['success_goal_added'] = { title = "Siker", text = "Az összeg sikeresen hozzáadva a megtakarítási célhoz", time = 5000, type = "success" },
  ['goal_not_found'] = { title = "Hiba", text = "A cél nem található", time = 5000, type = "error" },
  ['goal_already_completed'] = { title = "Hiba", text = "Ez a cél már teljesítve van", time = 5000, type = "error" },
  ['invalid_goal_id'] = { title = "Hiba", text = "Érvénytelen cél azonosító", time = 5000, type = "error" },
  ['invalid_goal_name'] = { title = "Hiba", text = "Érvénytelen cél név", time = 5000, type = "error" },
  ['invalid_target_amount'] = { title = "Hiba", text = "Érvénytelen célösszeg", time = 5000, type = "error" },
  ['invalid_initial_deposit'] = { title = "Hiba", text = "Érvénytelen kezdő befizetés", time = 5000, type = "error" },
  ['max_goals_reached'] = { title = "Hiba", text = "Elérted a maximálisan létrehozható megtakarítási célok számát", time = 5000, type = "error" },
  ['no_funds_to_withdraw'] = { title = "Hiba", text = "Nincs felvehető összeg a megtakarítási célban", time = 5000, type = "error" },
  ['failed_to_delete_goal'] = { title = "Hiba", text = "Nem sikerült törölni a célt", time = 5000, type = "error" },
  ['failed_to_update_goal'] = { title = "Hiba", text = "Nem sikerült frissíteni a célt", time = 5000, type = "error" },

  -- 3.9 Kapcsolatok
  ['success_contact_saved'] = { title = "Siker", text = "A kapcsolat sikeresen elmentve", time = 5000, type = "success" },
  ['success_contact_deleted'] = { title = "Siker", text = "A kapcsolat sikeresen törölve", time = 5000, type = "success" },
  ['success_contact_favorite_toggled'] = { title = "Siker", text = "A kapcsolat sikeresen hozzáadva a kedvencekhez", time = 5000, type = "success" },
  ['error_contact_save_failed'] = { title = "Hiba", text = "Nem sikerült elmenteni a kapcsolatot", time = 5000, type = "error" },
  ['error_contact_delete_failed'] = { title = "Hiba", text = "Nem sikerült törölni a kapcsolatot", time = 5000, type = "error" },
  ['error_contact_favorite_toggle_failed'] = { title = "Hiba", text = "Nem sikerült módosítani a kedvenc státuszt", time = 5000, type = "error" },
  ['max_contacts_reached'] = { title = "Hiba", text = "Elérted a maximálisan menthető kapcsolatok számát", time = 5000, type = "error" },
  ['max_favorites_reached'] = { title = "Hiba", text = "Elérted a maximális kedvenc kapcsolatok számát", time = 5000, type = "error" },

  -- 3.10 Általános hibák
  ['unknown_error'] = { title = "Hiba", text = "Ismeretlen hiba történt", time = 5000, type = "error" },
  ['error_invalid_data'] = { title = "Hiba", text = "Érvénytelen adatok lettek megadva", time = 5000, type = "error" },
  ['invalid_parameters'] = { title = "Hiba", text = "Érvénytelen paraméterek", time = 5000, type = "error" },
  ['database_error'] = { title = "Hiba", text = "Adatbázis hiba történt", time = 5000, type = "error" },
  ['error_database_update_failed'] = { title = "Hiba", text = "Az adatbázis frissítése nem sikerült", time = 5000, type = "error" },
  ['db_insert_failed'] = { title = "Hiba", text = "Nem sikerült létrehozni a hitelt. Kérlek próbáld újra", time = 5000, type = "error" },

  -- =============================================
  -- 4. UI FELIRATOK
  -- =============================================

  -- 4.1 Navigáció és szekciók
  ['ui_overview'] = "Áttekintés",
  ['ui_transactions'] = "Tranzakciók",
  ['ui_loans'] = "Hitelek",
  ['ui_savings'] = "Megtakarítások",
  ['ui_bills'] = "Számlák",
  ['ui_cards'] = "Kártyák",
  ['ui_management'] = "Kezelés",
  ['ui_statistics'] = "Statisztikák",
  ['ui_history'] = "Előzmények",

  -- 4.2 Gyakori műveletek és gombok
  ['ui_view'] = "Megtekintés",
  ['ui_view_all'] = "Összes",
  ['ui_edit'] = "Szerkesztés",
  ['ui_delete'] = "Törlés",
  ['ui_remove'] = "Eltávolítás",
  ['ui_add'] = "Hozzáadás",
  ['ui_add_new'] = "Új hozzáadása",
  ['ui_create'] = "Létrehozás",
  ['ui_save'] = "Mentés",
  ['ui_save_changes'] = "Változtatások mentése",
  ['ui_cancel'] = "Mégse",
  ['ui_confirm'] = "Megerősítés",
  ['ui_copy'] = "Másolás",
  ['ui_print'] = "Nyomtatás",
  ['ui_show'] = "Megjelenítés",
  ['ui_hide'] = "Elrejtés",
  ['ui_change'] = "Módosítás",
  ['ui_manage'] = "Kezelés",
  ['ui_select'] = "Kiválasztás",
  ['ui_selected'] = "Kiválasztva",
  ['ui_search'] = "Keresés...",
  ['ui_pay'] = "Fizetés",
  ['ui_pay_all'] = "Összes kifizetése",

  -- 4.3 Általános címkék
  ['ui_name'] = "Név",
  ['ui_type'] = "Típus",
  ['ui_status'] = "Állapot",
  ['ui_date'] = "Dátum",
  ['ui_amount'] = "Összeg",
  ['ui_price'] = "Ár",
  ['ui_balance'] = "Egyenleg",
  ['ui_description'] = "Leírás",
  ['ui_actions'] = "Műveletek",
  ['ui_author'] = "Készítő",
  ['ui_notes'] = "Megjegyzések",
  ['ui_info'] = "Információ",
  ['ui_id'] = "Azonosító",
  ['ui_total'] = "Összesen",
  ['ui_to'] = "Ide",
  ['ui_from'] = "Innen",
  ['ui_in'] = "itt",

  -- 4.4 Állapot megjelölések
  ['ui_new'] = "Új",
  ['ui_pending'] = "Függőben",
  ['ui_active'] = "Aktív",
  ['ui_blocked'] = "Tiltva",
  ['ui_paid'] = "Kifizetve",
  ['ui_unpaid'] = "Kifizetetlen",
  ['ui_completed'] = "Teljesítve",
  ['ui_complete'] = "teljesítve",
  ['ui_sent'] = "Elküldve",
  ['ui_received'] = "Beérkezett",

  -- 4.5 Számlatípusok és megnevezések
  ['ui_personal'] = "Személyes",
  ['ui_business'] = "Üzleti",
  ['ui_shared'] = "Megosztott",
  ['ui_owner'] = "Tulajdonos",
  ['ui_user'] = "Felhasználó",
  ['ui_personal_account'] = "Személyes számla",
  ['ui_business_account'] = "Üzleti számla",
  ['ui_savings_account'] = "Megtakarítási számla",
  ['ui_checking_account'] = "Folyószámla",
  ['ui_your_account'] = "Saját számlád",
  ['ui_all_accounts'] = "Összes számla",
  ['ui_company'] = "Cég",
  ['ui_high_yield'] = "Magas hozam",
  ['ui_higher_rates'] = "Magasabb kamat",

  -- 4.6 Számlakezelés
  ['ui_account_name'] = "Számla neve",
  ['ui_account_type'] = "Számlatípus",
  ['ui_account_status'] = "Számla állapota",
  ['ui_account_settings'] = "Számla beállításai",
  ['ui_account_users'] = "Számla felhasználói",
  ['ui_opening_date'] = "Megnyitás dátuma",
  ['ui_create_account'] = "Számla létrehozása",
  ['ui_create_new_account'] = "Új számla létrehozása",
  ['ui_add_account'] = "Számla hozzáadása",
  ['ui_close_account'] = "Számla lezárása",
  ['ui_leave_account'] = "Kilépés a számlából",
  ['ui_change_name'] = "Név módosítása",
  ['ui_manage_account_users'] = "Számla felhasználóinak kezelése",
  ['ui_add_new_user'] = "Új felhasználó hozzáadása",
  ['ui_player_id'] = "Játékos ID",
  ['ui_edit_permissions'] = "Jogosultságok szerkesztése",
  ['ui_remove_user'] = "Felhasználó eltávolítása",
  ['ui_confirm_close_account'] = "Számla lezárásának megerősítése",
  ['ui_confirm_leave_account'] = "Kilépés megerősítése",
  ['ui_close_account_btn'] = "Szeretném lezárni a számlámat",
  ['ui_close_account_warning'] =
  "A számla lezárása véglegesen törli az összes adatot, és nem visszavonható. A lezárás előtt minden egyenleget ki kell venni.",
  ['ui_close_account_permanent'] = "A számla lezárása véglegesen törli az összes adatot, és nem visszavonható.",
  ['ui_leave_account_warning'] = "Elveszíted a hozzáférést ehhez a számlához.",
  ['ui_leave_account_warning_full'] =
  "Elveszíted a hozzáférést ehhez a számlához. Kilépés előtt győződj meg róla, hogy minden egyenleg ki van véve.",
  ['ui_account_has_balance'] = "A számlán még van egyenleg",
  ['ui_withdraw_before_close'] = "A lezárás előtt vedd ki az összes pénzt.",
  ['ui_create_account_info'] = "Új számla létrehozásakor díj kerül levonásra:",

  -- 4.7 Tranzakciók
  ['ui_deposit'] = "Befizetés",
  ['ui_withdraw'] = "Kifizetés",
  ['ui_transfer'] = "Átutalás",
  ['ui_deposit_money'] = "Pénz befizetése",
  ['ui_withdraw_money'] = "Pénz kifizetése",
  ['ui_transfer_money'] = "Pénz átutalása",
  ['ui_recent_transactions'] = "Legutóbbi tranzakciók",
  ['ui_total_transactions'] = "Összes tranzakció",
  ['ui_total_received'] = "Összes beérkezett",
  ['ui_total_sent'] = "Összes elküldött",
  ['ui_net_earnings'] = "Nettó egyenlegváltozás",
  ['ui_transaction_details'] = "Tranzakció részletei",
  ['ui_view_transaction'] = "Tranzakció megtekintése",
  ['ui_print_receipt'] = "Nyugta nyomtatása",
  ['ui_iban'] = "IBAN",
  ['ui_sender_iban'] = "Feladó IBAN",
  ['ui_receiver_iban'] = "Címzett IBAN",
  ['ui_recipient'] = "Kedvezményezett",
  ['ui_select_recipient'] = "Címzett kiválasztása",
  ['ui_select_account'] = "Számla kiválasztása",
  ['ui_external_account'] = "Külső számla",
  ['ui_multiple_contacts'] = "Több kontakt",
  ['ui_enter_amount'] = "Összeg megadása",
  ['ui_daily_limit'] = "Napi limit",
  ['ui_summary'] = "Összegzés",

  -- 4.8 Bankkártyák
  ['ui_card_holder'] = "Kártyabirtokos",
  ['ui_card_type'] = "Kártyatípus",
  ['ui_pin'] = "PIN",
  ['ui_pin_number'] = "PIN kód",
  ['ui_not_set'] = "Nincs beállítva",
  ['ui_expires'] = "Lejár",
  ['ui_expiry'] = "Lejárat",
  ['ui_current_expiry'] = "Jelenlegi lejárat",
  ['ui_auto_renew'] = "Automatikus megújítás",
  ['ui_manage_card'] = "Kártya kezelése",
  ['ui_create_new_card'] = "Új kártya létrehozása",
  ['ui_select_card'] = "Kártya kiválasztása",
  ['ui_delete_card'] = "Kártya törlése",
  ['ui_delete_card_warning'] = "Ez a művelet nem visszavonható.",
  ['ui_delete_card_confirm'] = "Biztosan törölni szeretnéd a kártyádat?",
  ['ui_warning'] = "Figyelmeztetés",
  ['ui_information'] = "Információ",
  ['ui_blocking_card_warning'] =
  "A <span class=\"bold\">bankkártya letiltásával</span> vedd figyelembe, hogy az újbóli aktiváláshoz <span class=\"bold\">új kártya kibocsátása szükséges</span>. Ennek díja: <span class=\"bold activation-fee\">{fee}</span>.",
  ['ui_activating_card_info'] =
  "A bankkártya aktiválása <span class=\"bold activation-fee\">{fee}</span> szolgáltatási díjjal jár.",

  -- 4.9 Hitelek
  ['ui_loan_plans'] = "Hitelcsomagok",
  ['ui_starter_loan'] = "Kezdő hitel",
  ['ui_standard_loan'] = "Standard hitel",
  ['ui_premium_loan'] = "Prémium hitel",
  ['ui_executive_loan'] = "Vezetői hitel",
  ['ui_custom_loan'] = "Egyedi hitel",
  ['ui_personal_loan'] = "Személyi hitel",
  ['ui_car_loan'] = "Autóhitel",
  ['ui_home_loan'] = "Lakáshitel",
  ['ui_request_loan'] = "Hitel igénylése",
  ['ui_active_loans'] = "Aktív hitelek",
  ['ui_no_active_loans'] = "Nincs aktív hitel",
  ['ui_interest_rate'] = "Kamatláb",
  ['ui_daily_payment'] = "Napi törlesztés",
  ['ui_remaining'] = "Hátralévő",
  ['ui_term'] = "Futamidő",
  ['ui_select_term'] = "Futamidő kiválasztása",
  ['ui_plan'] = "Csomag",
  ['ui_total_to_repay'] = "Visszafizetendő összesen",
  ['ui_manage_personal_loan'] = "{loan} kezelése",
  ['ui_next_payment'] = "Következő törlesztés",
  ['ui_partial_payment'] = "Részfizetés",
  ['ui_pay_off_loan'] = "Hitel teljes kifizetése",
  ['ui_loan_overdue_warning'] =
  "A hitel törlesztése <span class=\"bold\">lejárt</span>. Kérjük, mielőbb rendezd a <span class=\"bold\">hátralékot</span>, hogy elkerüld a <span class=\"bold\">további díjakat vagy büntetéseket</span>.",

  -- 4.10 Hitelminősítés
  ['ui_credit_score'] = "Hitelminősítés",
  ['ui_credit_score_ranks'] = "Hitelminősítési szintek",
  ['ui_credit_score_info'] = "Hitelminősítés információ",
  ['ui_credit_score_info_text'] = "A hitelminősítés befolyásolja a kamatlábakat:",
  ['ui_higher_scores_lower_rates'] = "magasabb pontszám = alacsonyabb kamat",
  ['ui_lower_scores_increase'] = "alacsonyabb pontszám = magasabb kamat",
  ['ui_view_ranks'] = "Szintek megtekintése",
  ['ui_score'] = "Pontszám",
  ['ui_rank'] = "Szint",
  ['ui_rate'] = "Kamat",
  ['ui_excellent'] = "Kiváló",
  ['ui_very_good'] = "Nagyon jó",
  ['ui_good'] = "Jó",
  ['ui_fair'] = "Közepes",
  ['ui_poor'] = "Gyenge",
  ['ui_very_poor'] = "Nagyon gyenge",

  -- 4.11 Megtakarítási célok
  ['ui_saving_goals'] = "Megtakarítási célok",
  ['ui_no_saving_goals'] = "Nincsenek megtakarítási célok",
  ['ui_create_first_goal'] = "Hozd létre az első megtakarítási célodat<br>a haladás követéséhez",
  ['ui_create_new_saving_goal'] = "Új megtakarítási cél létrehozása",
  ['ui_manage_saving_goal'] = "Megtakarítási cél kezelése",
  ['ui_manage_goal'] = "Cél kezelése",
  ['ui_goal'] = "Cél",
  ['ui_goal_name'] = "Cél neve",
  ['ui_target_amount'] = "Célösszeg",
  ['ui_initial_deposit'] = "Kezdő befizetés",
  ['ui_saved'] = "Megtakarítva",
  ['ui_add_to_goal'] = "Hozzáadás a célhoz",
  ['ui_withdraw_funds'] = "Pénz kivétele",
  ['ui_interest_tracker'] = "Kamatkövető",
  ['ui_total_interest_earned'] = "Összes megszerzett kamat",
  ['ui_this_week'] = "Ezen a héten",
  ['ui_next_payout'] = "Következő kifizetés",

  -- 4.12 Számlák és számlázás
  ['ui_bills_list'] = "Számlák listája",
  ['ui_pay_bill'] = "Számla befizetése",
  ['ui_pay_all_bills'] = "Összes számla befizetése",
  ['ui_view_bill'] = "Számla megtekintése",
  ['ui_invoice'] = "Számla",
  ['ui_reference_id'] = "Hivatkozási azonosító",
  ['ui_subtotal'] = "Részösszeg",
  ['ui_vat'] = "ÁFA",
  ['ui_due'] = "Esedékes",
  ['ui_paid_on'] = "Kifizetve ekkor",

  -- 4.13 Kapcsolatok
  ['ui_contacts'] = "Kapcsolatok",
  ['ui_favorites'] = "Kedvencek",
  ['ui_no_contacts'] = "Nincsenek kapcsolatok",
  ['ui_no_favorite_contacts'] = "Nincsenek kedvenc kapcsolatok",
  ['ui_save_contact'] = "Kapcsolat mentése",

  -- 4.14 Felugró ablakok és párbeszédek
  ['ui_are_you_sure'] = "Biztos vagy benne?",
  ['ui_are_you_sure_iban_change'] = "Biztosan meg szeretnéd változtatni az IBAN-t?",
  ['ui_are_you_sure_pin_change'] = "Biztosan meg szeretnéd változtatni a PIN kódot?",
  ['ui_are_you_sure_daily_limit_change'] = "Biztosan meg szeretnéd változtatni a napi limitet?",
  ['ui_are_you_sure_remove_user'] =
  "Biztosan el szeretnéd távolítani <span class=\"bold\">{user}</span> felhasználót a <span class=\"bold\">{account}</span> számláról?",
  ['ui_are_you_sure_pay_bill'] = "Biztosan ki szeretnéd fizetni a számlát?",
  ['ui_are_you_sure_print_receipt'] = "Biztosan ki szeretnéd nyomtatni a nyugtát?",
  ['ui_copy_success'] = "Vágólapra másolva",
  ['ui_copy_error'] = "Sikertelen másolás",
  ['ui_loading_data'] = "Adatok betöltése...",
  ['ui_logging_out'] = "Kijelentkezés...",
  ['ui_generated_automatically'] = "A rendszer által automatikusan generálva",

  -- 4.15 Üres állapotok és helykitöltők
  ['ui_no_users_yet'] = "Még nincsenek felhasználók",
  ['ui_no_bills'] = "Még nincsenek számlák",
  ['ui_no_transactions_yet'] = "Még nincsenek tranzakciók",
  ['ui_no_recent_activity'] = "Nincs legutóbbi aktivitás",
  ['ui_no_transaction_history'] = "Még nincs tranzakciós előzmény",
  ['ui_transaction_history_help'] = "Itt fog megjelenni a tranzakciós előzményed",
  ['ui_bills_help'] = "Itt fog megjelenni a számláid előzménye",
  ['ui_loan_history_help'] = "Itt fog megjelenni a hiteleid előzménye",
  ['ui_savings_transactions_appear_here'] = "Itt fognak megjelenni a megtakarítási tranzakcióid",
  ['ui_make_first_transaction'] = "Hajts végre az első tranzakciót az egyenleg grafikon megjelenítéséhez",

  -- 4.16 Időmegjelölések
  ['ui_day'] = "nap",
  ['ui_days'] = "nap",
  ['ui_days_late'] = "{days} napja késik",
  ['ui_hours_late'] = "{hours} órája késik",
  ['ui_minutes_late'] = "{minutes} perce késik",
  ['ui_in_days'] = "{days} nap múlva",
  ['ui_in_hours'] = "{hours} óra múlva",
  ['ui_in_minutes'] = "{minutes} perc múlva",

  -- 4.17 Formátum szövegek (string.format / template literal)
  ['ui_showing_transactions'] = "%d–%d megjelenítve a(z) %d-ból",
  ['ui_loan_term_format'] = "%s/%s • %d %s",
  ['ui_days_format'] = "%d %s",
  ['ui_users_count'] = "%d %s",

  -- =============================================
  -- 5. TRANZAKCIÓS SZÖVEGEK (Szerveroldali)
  -- =============================================

  -- 5.1 Küldő / Fogadó megnevezések
  ['tx_wallet'] = "Tárca",
  ['tx_custom_account'] = "Egyedi számla",
  ['tx_bank_loan'] = "Bank (Hitel)",
  ['tx_bank_card_purchase'] = "Bank (Kártyás vásárlás)",
  ['tx_bank_card_activation'] = "Bank (Kártya aktiválás)",
  ['tx_bank_card_renewal'] = "Bank (Kártya megújítás)",
  ['tx_bank_loan_payoff'] = "Bank (Hitel lezárása)",
  ['tx_bank_iban_change'] = "Bank (IBAN módosítás)",
  ['tx_bank_pin_change'] = "Bank (PIN módosítás)",
  ['tx_bank_account_creation'] = "Bank (Számlanyitás)",
  ['tx_bank_receipt_print'] = "Bank (Nyugta nyomtatás)",
  ['tx_loan_payment'] = "Hitel törlesztés",

  -- 5.2 Tranzakció okok – Befizetések
  ['tx_reason_deposit_card'] = "Befizetés kártyaszámlára",
  ['tx_reason_deposit_business'] = "Befizetés üzleti számlára",
  ['tx_reason_deposit_custom'] = "Befizetés egyedi számlára",
  ['tx_reason_deposit_savings'] = "Befizetés megtakarítási számlára",
  ['tx_reason_deposit_bank'] = "Befizetés bankszámlára",
  ['tx_reason_receipt_print'] = "Nyugta nyomtatása",

  -- 5.3 Tranzakció okok – Kivétek
  ['tx_reason_withdraw_card'] = "Kivét kártyaszámláról",
  ['tx_reason_withdraw_business'] = "Kivét üzleti számláról",
  ['tx_reason_withdraw_custom'] = "Kivét egyedi számláról",
  ['tx_reason_withdraw_savings'] = "Kivét megtakarítási számláról",
  ['tx_reason_withdraw_bank'] = "Kivét bankszámláról",

  -- 5.4 Tranzakció okok – Átutalások
  ['tx_reason_transfer_to'] = "Átutalás ide:",
  ['tx_reason_transfer_business'] = "Átutalás üzleti számlára",
  ['tx_reason_transfer_custom'] = "Átutalás egyedi számlára",
  ['tx_reason_transfer_personal'] = "Átutalás személyes számlára",
  ['tx_reason_transfer_savings'] = "Átutalás megtakarítási számlára",

  -- 5.5 Tranzakció okok – Egyéb
  ['tx_reason_card_purchase'] = "Kártyás vásárlás:",
  ['tx_reason_loan_disbursement'] = "Hitel folyósítás:",
  ['tx_reason_loan_payment'] = "Hitel törlesztés:",
  ['tx_reason_loan_payoff'] = "Hitel lezárás:",
  ['tx_reason_penalty'] = "Bírság:",
  ['tx_reason_paid_bill'] = "Befizetett számla:",
  ['tx_reason_iban_change'] = "IBAN módosítás díja",
  ['tx_reason_pin_change'] = "PIN módosítás díja",
  ['tx_reason_account_creation'] = "Számlanyitási díj",
  ['tx_reason_paycheck'] = "Fizetés",
  ['tx_paycheck'] = "Fizetés",

  -- =============================================
  -- 6. IDŐ / DÁTUM SZÖVEGEK
  -- =============================================

  ['time_expired'] = "lejárt",
  ['time_month'] = "hónap",
  ['time_months'] = "hónap",
  ['time_in_format'] = "%d %s múlva",

  -- =============================================
  -- 7. WEBHOOK SZÖVEGEK
  -- =============================================

  -- 7.1 Webhook Címek
  ['webhook_title_deposit'] = "💰 Banki befizetés",
  ['webhook_title_withdraw'] = "💸 Banki készpénzfelvétel",
  ['webhook_title_transfer'] = "💳 Banki átutalás",
  ['webhook_title_savings_deposit'] = "🏦 Megtakarítási befizetés",
  ['webhook_title_savings_withdraw'] = "🏦 Megtakarítási kivét",
  ['webhook_title_savings_transfer'] = "🏦 Megtakarítási átutalás",
  ['webhook_title_loan_create'] = "📋 Hitel létrehozva",
  ['webhook_title_account_create'] = "🏦 Számla létrehozva",
  ['webhook_title_account_delete'] = "🗑️ Számla törölve",
  ['webhook_title_account_add_user'] = "👤 Felhasználó hozzáadva a számlához",
  ['webhook_title_account_remove_user'] = "👤 Felhasználó eltávolítva a számláról",
  ['webhook_title_account_change_permissions'] = "🔐 Számlajogosultságok módosítva",
  ['webhook_title_default'] = "Banki napló",

  -- 7.2 Webhook Mezőnevek
  ['webhook_field_from'] = "Feladó",
  ['webhook_field_to'] = "Címzett",
  ['webhook_field_amount'] = "Összeg",
  ['webhook_field_reason'] = "Indok",
  ['webhook_field_account'] = "Számla",
  ['webhook_field_goal'] = "Cél",
  ['webhook_field_loan_plan'] = "Hitelcsomag",
  ['webhook_field_interest_rate'] = "Kamatláb",
  ['webhook_field_duration'] = "Időtartam",
  ['webhook_field_borrower'] = "Hitelfelvevő",
  ['webhook_field_account_name'] = "Számla neve",
  ['webhook_field_iban'] = "IBAN",
  ['webhook_field_owner'] = "Tulajdonos",
  ['webhook_field_final_balance'] = "Végső egyenleg",
  ['webhook_field_added_user'] = "Hozzáadott felhasználó",
  ['webhook_field_account_owner'] = "Számla tulajdonosa",
  ['webhook_field_removed_user'] = "Eltávolított felhasználó",
  ['webhook_field_user'] = "Felhasználó",
  ['webhook_field_new_permissions'] = "Új jogosultságok",
  ['webhook_field_player_source'] = "Játékos azonosító",
  ['webhook_field_license'] = "Licenc",
  ['webhook_field_discord'] = "Discord",

  -- 7.3 Webhook Egyéb szövegek
  ['webhook_reason_savings_transfer'] = "Átutalás megtakarításból (%s)",
  ['webhook_duration_months'] = "%s hónap",
  ['webhook_discord_not_linked'] = "Nincs összekapcsolva",
  ['webhook_author_suffix'] = "Banki naplók",

  -- 7.4 Webhook Számlatípus megnevezések
  ['webhook_account_personal'] = "Személyes",
  ['webhook_account_business'] = "Üzleti: %s",
  ['webhook_account_custom'] = "Egyedi: %s",
  ['webhook_account_business_simple'] = "Üzleti",
  ['webhook_account_custom_simple'] = "Egyedi",
  ['webhook_sender_savings_suffix'] = " (Megtakarítás)",
  ['webhook_multiple_recipients'] = "Több címzett (%s számla)",
}
