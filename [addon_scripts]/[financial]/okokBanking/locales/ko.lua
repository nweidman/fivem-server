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

Locales['ko'] = {

    -- =============================================
    -- 1. SETTINGS
    -- =============================================

    ['ui_language'] = "ko-KR", -- Used for formatting dates in the UI

    -- =============================================
    -- 2. TEXTUI LOCALES (Interaction Prompts)
    -- =============================================

    ['open_banking'] = {
        text = '[E] 은행 업무',
        color = 'darkblue',
        position = 'left'
    },
    ['open_atm'] = {
        text = '[E] ATM 이용',
        color = 'darkblue',
        position = 'left'
    },
    ['open_banking_target'] = {
        text = '은행 업무',
        color = 'darkblue',
        position = 'left'
    },
    ['open_atm_target'] = {
        text = 'ATM 이용',
        color = 'darkblue',
        position = 'left'
    },

    -- =============================================
    -- 3. NOTIFICATIONS
    -- =============================================

    -- 3.1 Transactions (Deposit, Withdraw, Transfer)
    ['success_deposit'] = {title = "성공", text = "입금이 완료되었습니다", time = 5000, type = "success"},
    ['success_withdraw'] = {title = "성공", text = "출금이 완료되었습니다", time = 5000, type = "success"},
    ['success_transfer'] = {title = "성공", text = "송금이 완료되었습니다", time = 5000, type = "success"},
    ['failed_to_withdraw'] = {title = "오류", text = "출금에 실패했습니다", time = 5000, type = "error"},
    ['failed_to_transfer'] = {title = "오류", text = "송금에 실패했습니다", time = 5000, type = "error"},
    ['not_enough_money'] = {title = "오류", text = "이 작업을 수행할 충분한 자금이 없습니다", time = 5000, type = "error"},
    ['not_enough_cash'] = {title = "오류", text = "현금이 부족합니다", time = 5000, type = "error"},
    ['insufficient_funds'] = {title = "오류", text = "자금 부족", time = 5000, type = "error"},
    ['no_valid_recipients'] = {title = "오류", text = "송금할 유효한 수취인이 없습니다", time = 5000, type = "error"},
    ['amount_exceeds_limit'] = {title = "오류", text = "금액이 한도를 초과했습니다", time = 5000, type = "error"},
    ['daily_limit_exceeded'] = {title = "오류", text = "일일 한도를 초과했습니다", time = 5000, type = "error"},

    -- 3.2 IBAN & PIN
    ['iban_not_found'] = {title = "오류", text = "IBAN을 찾을 수 없습니다", time = 5000, type = "error"},
    ['iban_updated'] = {title = "성공", text = "IBAN이 성공적으로 업데이트되었습니다", time = 5000, type = "success"},
    ['iban_in_use'] = {title = "오류", text = "이미 사용 중인 IBAN입니다", time = 5000, type = "error"},
    ['pin_updated'] = {title = "성공", text = "PIN이 성공적으로 업데이트되었습니다", time = 5000, type = "success"},
    ['pin_update_failed'] = {title = "오류", text = "PIN 업데이트에 실패했습니다. 다시 시도해주세요", time = 5000, type = "error"},
    ['error_pin_invalid_format'] = {title = "오류", text = "PIN은 4자리 숫자여야 합니다", time = 5000, type = "error"},
    ['daily_limit_updated'] = {title = "성공", text = "일일 한도가 성공적으로 업데이트되었습니다", time = 5000, type = "success"},
    ['daily_limit_update_failed'] = {title = "오류", text = "일일 한도 업데이트에 실패했습니다. 다시 시도해주세요", time = 5000, type = "error"},

    -- 3.3 Cards
    ['success_card_created'] = {title = "성공", text = "카드가 성공적으로 생성되었습니다", time = 5000, type = "success"},
    ['success_card_deleted'] = {title = "성공", text = "카드가 성공적으로 삭제되었습니다", time = 5000, type = "success"},
    ['card_managed_successfully'] = {title = "성공", text = "카드 정보가 성공적으로 업데이트되었습니다", time = 5000, type = "success"},
    ['error_card_created'] = {title = "오류", text = "카드 생성에 실패했습니다. 다시 시도해주세요", time = 5000, type = "error"},
    ['error_card_not_found'] = {title = "오류", text = "카드를 찾을 수 없습니다", time = 5000, type = "error"},
    ['error_card_delete_failed'] = {title = "오류", text = "카드를 찾을 수 없거나 삭제할 수 없습니다", time = 5000, type = "error"},
    ['error_no_cards_found'] = {title = "오류", text = "카드를 찾을 수 없습니다", time = 5000, type = "error"},
    ['no_active_cards'] = {title = "오류", text = "활성 카드가 없습니다", time = 5000, type = "error"},
    ['invalid_cards_data'] = {title = "오류", text = "유효하지 않은 카드 데이터입니다", time = 5000, type = "error"},
    ['card_number_not_found'] = {title = "오류", text = "카드 번호를 찾을 수 없습니다", time = 5000, type = "error"},
    ['max_credit_cards_reached'] = {title = "오류", text = "신용카드 최대 개수에 도달했습니다", time = 5000, type = "error"},
    ['max_total_credit_cards_reached'] = {title = "오류", text = "총 신용카드 최대 개수에 도달했습니다", time = 5000, type = "error"},
    ['card_already_exists'] = {title = "오류", text = "이 계좌에는 이미 생성된 카드가 있습니다", time = 5000, type = "error"},

    -- 3.4 Bills
    ['no_unpaid_bills'] = {title = "오류", text = "모든 청구서가 납부되었습니다", time = 5000, type = "info"},
    ['no_unpaid_bills_found'] = {title = "오류", text = "미납 청구서를 찾을 수 없습니다", time = 5000, type = "error"},
    ['success_paid_all_bills'] = {title = "성공", text = "모든 청구서가 성공적으로 납부되었습니다", time = 5000, type = "success"},
    ['bill_paid_success'] = {title = "성공", text = "청구서가 성공적으로 납부되었습니다", time = 5000, type = "success"},
    ['error_paid_all_bills'] = {title = "오류", text = "청구서 납부에 실패했습니다. 다시 시도해주세요", time = 5000, type = "error"},
    ['bill_payment_failed'] = {title = "오류", text = "청구서 납부에 실패했습니다. 다시 시도해주세요", time = 5000, type = "error"},
    ['success_receipt_printed'] = {title = "성공", text = "영수증이 성공적으로 출력되었습니다", time = 5000, type = "success"},
    ['failed_to_print_receipt'] = {title = "오류", text = "영수증 출력에 실패했습니다. 다시 시도해주세요", time = 5000, type = "error"},
    ['no_reference_id'] = {title = "오류", text = "제공된 참조 ID가 없습니다", time = 5000, type = "error"},
    ['already_paid'] = {title = "오류", text = "이미 납부된 항목입니다", time = 5000, type = "error"},

    -- 3.5 Accounts
    ['success_account_created'] = {title = "성공", text = "새 계좌가 성공적으로 생성되었습니다", time = 5000, type = "success"},
    ['success_account_closed'] = {title = "성공", text = "계좌가 성공적으로 폐지되었습니다", time = 5000, type = "success"},
    ['success_account_left'] = {title = "성공", text = "계좌에서 성공적으로 탈퇴했습니다", time = 5000, type = "success"},
    ['success_account_name_updated'] = {title = "성공", text = "계좌명이 성공적으로 변경되었습니다", time = 5000, type = "success"},
    ['account_not_found'] = {title = "오류", text = "계좌를 찾을 수 없습니다", time = 5000, type = "error"},
    ['invalid_account_name'] = {title = "오류", text = "유효하지 않은 계좌명입니다", time = 5000, type = "error"},
    ['error_account_name_empty'] = {title = "오류", text = "계좌명은 비워둘 수 없습니다", time = 5000, type = "error"},
    ['error_account_name_length'] = {title = "오류", text = "계좌명은 1자 이상 50자 이하여야 합니다", time = 5000, type = "error"},
    ['error_insufficient_funds'] = {title = "오류", text = "계좌를 생성할 충분한 자금이 없습니다", time = 5000, type = "error"},
    ['error_insufficient_funds_account_creation'] = {title = "오류", text = "계좌 생성을 위한 자금이 부족합니다", time = 5000, type = "error"},
    ['error_max_accounts_reached'] = {title = "오류", text = "최대 계좌 개수에 도달했습니다", time = 5000, type = "error"},
    ['error_account_creation_failed'] = {title = "오류", text = "계좌 생성에 실패했습니다. 다시 시도해주세요", time = 5000, type = "error"},
    ['error_account_update_failed'] = {title = "오류", text = "계좌 업데이트에 실패했습니다", time = 5000, type = "error"},
    ['error_account_deletion_failed'] = {title = "오류", text = "계좌 삭제에 실패했습니다. 다시 시도해주세요", time = 5000, type = "error"},
    ['error_account_has_balance'] = {title = "오류", text = "잔액이 남아있는 계좌는 폐지할 수 없습니다. 먼저 모든 자금을 출금해주세요", time = 5000, type = "error"},
    ['error_account_has_active_loans'] = {title = "오류", text = "활성 대출이 있는 계좌는 폐지하거나 탈퇴할 수 없습니다. 모든 대출을 상환해주세요", time = 5000, type = "error"},
    ['error_invalid_account_type'] = {title = "오류", text = "유효하지 않은 계좌 유형입니다", time = 5000, type = "error"},
    ['error_invalid_custom_account_identifier'] = {title = "오류", text = "유효하지 않은 계좌 식별자입니다", time = 5000, type = "error"},
    ['error_owner_cannot_leave'] = {title = "오류", text = "계좌 소유자는 계좌에서 탈퇴할 수 없습니다. 대신 계좌를 폐지해주세요", time = 5000, type = "error"},
    ['error_no_access_found'] = {title = "오류", text = "이 계좌에 대한 접근 권한이 없습니다", time = 5000, type = "error"},
    ['failed_to_access_savings_account'] = {title = "오류", text = "적금 계좌 접근에 실패했습니다", time = 5000, type = "error"},

    -- 3.6 Users & Permissions
    ['success_user_added'] = {title = "성공", text = "사용자가 성공적으로 추가되었습니다", time = 5000, type = "success"},
    ['success_user_removed'] = {title = "성공", text = "사용자가 성공적으로 제거되었습니다", time = 5000, type = "success"},
    ['success_permissions_updated'] = {title = "성공", text = "권한이 성공적으로 업데이트되었습니다", time = 5000, type = "success"},
    ['error_user_not_found'] = {title = "오류", text = "사용자를 찾을 수 없습니다", time = 5000, type = "error"},
    ['error_user_add_failed'] = {title = "오류", text = "사용자 추가에 실패했습니다", time = 5000, type = "error"},
    ['error_user_already_has_access'] = {title = "오류", text = "이미 이 계좌에 접근 권한이 있습니다", time = 5000, type = "error"},
    ['error_cannot_add_owner'] = {title = "오류", text = "계좌 소유자는 추가할 수 없습니다", time = 5000, type = "error"},
    ['error_cannot_remove_owner'] = {title = "오류", text = "계좌 소유자는 제거할 수 없습니다", time = 5000, type = "error"},
    ['error_permissions_update_failed'] = {title = "오류", text = "권한 업데이트에 실패했습니다", time = 5000, type = "error"},
    ['error_player_not_online'] = {title = "오류", text = "플레이어가 온라인 상태가 아닙니다", time = 5000, type = "error"},
    ['player_not_found'] = {title = "오류", text = "플레이어를 찾을 수 없습니다", time = 5000, type = "error"},
    ['no_permission'] = {title = "오류", text = "이 작업을 수행할 권한이 없습니다", time = 5000, type = "error"},
    ['feature_disabled'] = {title = "오류", text = "이 기능은 현재 비활성화되어 있습니다", time = 5000, type = "error"},
    ['invalid_daily_limit'] = {title = "오류", text = "유효하지 않은 일일 한도입니다", time = 5000, type = "error"},

    -- 3.7 Loans
    ['loan_success_created'] = {title = "성공", text = "대출이 성공적으로 생성되었습니다!", time = 5000, type = "success"},
    ['loan_success_paid'] = {title = "성공", text = "대출이 성공적으로 상환되었습니다", time = 5000, type = "success"},
    ['loan_success_partial_paid'] = {title = "성공", text = "대출 부분 상환이 완료되었습니다", time = 5000, type = "success"},
    ['loan_not_found'] = {title = "오류", text = "대출을 찾을 수 없습니다", time = 5000, type = "error"},
    ['no_plans'] = {title = "오류", text = "이용 가능한 대출 상품이 없습니다", time = 5000, type = "error"},
    ['unknown_plan'] = {title = "오류", text = "선택한 대출 상품이 유효하지 않습니다", time = 5000, type = "error"},
    ['plan_disabled'] = {title = "오류", text = "이 대출 상품은 현재 비활성화되어 있습니다", time = 5000, type = "error"},
    ['invalid_amount'] = {title = "오류", text = "유효하지 않은 금액입니다", time = 5000, type = "error"},
    ['invalid_term'] = {title = "오류", text = "선택한 기간이 유효하지 않습니다", time = 5000, type = "error"},
    ['too_many_active_loans'] = {title = "오류", text = "활성 대출의 한도에 도달했습니다", time = 5000, type = "error"},
    ['has_late_payments'] = {title = "오류", text = "연체된 상환금이 있습니다. 새 대출을 신청하기 전에 해결해주세요", time = 5000, type = "error"},

    -- 3.8 Savings Goals
    ['success_goal_created'] = {title = "성공", text = "적금 목표가 성공적으로 생성되었습니다", time = 5000, type = "success"},
    ['success_goal_withdrawn'] = {title = "성공", text = "적금 목표에서 성공적으로 출금했습니다", time = 5000, type = "success"},
    ['success_goal_added'] = {title = "성공", text = "적금 목표에 자금이 성공적으로 추가되었습니다", time = 5000, type = "success"},
    ['goal_not_found'] = {title = "오류", text = "목표를 찾을 수 없습니다", time = 5000, type = "error"},
    ['goal_already_completed'] = {title = "오류", text = "이미 완료된 목표입니다", time = 5000, type = "error"},
    ['invalid_goal_id'] = {title = "오류", text = "유효하지 않은 목표 ID입니다", time = 5000, type = "error"},
    ['invalid_goal_name'] = {title = "오류", text = "유효하지 않은 목표명입니다", time = 5000, type = "error"},
    ['invalid_target_amount'] = {title = "오류", text = "유효하지 않은 목표 금액입니다", time = 5000, type = "error"},
    ['invalid_initial_deposit'] = {title = "오류", text = "유효하지 않은 초기 입금액입니다", time = 5000, type = "error"},
    ['max_goals_reached'] = {title = "오류", text = "적금 목표의 최대 개수에 도달했습니다", time = 5000, type = "error"},
    ['no_funds_to_withdraw'] = {title = "오류", text = "목표에서 출금할 수 있는 자금이 없습니다", time = 5000, type = "error"},
    ['failed_to_delete_goal'] = {title = "오류", text = "목표 삭제에 실패했습니다", time = 5000, type = "error"},
    ['failed_to_update_goal'] = {title = "오류", text = "목표 업데이트에 실패했습니다", time = 5000, type = "error"},

    -- 3.9 Contacts
    ['success_contact_saved'] = {title = "성공", text = "연락처가 성공적으로 저장되었습니다", time = 5000, type = "success"},
    ['success_contact_deleted'] = {title = "성공", text = "연락처가 성공적으로 삭제되었습니다", time = 5000, type = "success"},
    ['success_contact_favorite_toggled'] = {title = "성공", text = "연락처가 즐겨찾기에 성공적으로 추가되었습니다", time = 5000, type = "success"},
    ['error_contact_save_failed'] = {title = "오류", text = "연락처 저장에 실패했습니다", time = 5000, type = "error"},
    ['error_contact_delete_failed'] = {title = "오류", text = "연락처 삭제에 실패했습니다", time = 5000, type = "error"},
    ['error_contact_favorite_toggle_failed'] = {title = "오류", text = "연락처 즐겨찾기 변경에 실패했습니다", time = 5000, type = "error"},
    ['max_contacts_reached'] = {title = "오류", text = "최대 연락처 개수에 도달했습니다", time = 5000, type = "error"},
    ['max_favorites_reached'] = {title = "오류", text = "최대 즐겨찾기 연락처 개수에 도달했습니다", time = 5000, type = "error"},

    -- 3.10 General Errors
    ['unknown_error'] = {title = "오류", text = "알 수 없는 오류가 발생했습니다", time = 5000, type = "error"},
    ['error_invalid_data'] = {title = "오류", text = "유효하지 않은 데이터가 제공되었습니다", time = 5000, type = "error"},
    ['invalid_parameters'] = {title = "오류", text = "유효하지 않은 매개변수입니다", time = 5000, type = "error"},
    ['database_error'] = {title = "오류", text = "데이터베이스 오류가 발생했습니다", time = 5000, type = "error"},
    ['error_database_update_failed'] = {title = "오류", text = "데이터베이스 업데이트에 실패했습니다", time = 5000, type = "error"},
    ['db_insert_failed'] = {title = "오류", text = "대출을 생성할 수 없습니다. 다시 시도해주세요", time = 5000, type = "error"},

    -- =============================================
    -- 4. UI LOCALES
    -- =============================================

    -- 4.1 Navigation & Sections
    ['ui_overview'] = "개요",
    ['ui_transactions'] = "거래",
    ['ui_loans'] = "대출",
    ['ui_savings'] = "적금",
    ['ui_bills'] = "청구서",
    ['ui_cards'] = "카드",
    ['ui_management'] = "관리",
    ['ui_statistics'] = "통계",
    ['ui_history'] = "거래내역",

    -- 4.2 Common Actions & Buttons
    ['ui_view'] = "보기",
    ['ui_view_all'] = "모두 보기",
    ['ui_edit'] = "편집",
    ['ui_delete'] = "삭제",
    ['ui_remove'] = "제거",
    ['ui_add'] = "추가",
    ['ui_add_new'] = "새로 추가",
    ['ui_create'] = "생성",
    ['ui_save'] = "저장",
    ['ui_save_changes'] = "변경사항 저장",
    ['ui_cancel'] = "취소",
    ['ui_confirm'] = "확인",
    ['ui_copy'] = "복사",
    ['ui_print'] = "인쇄",
    ['ui_show'] = "표시",
    ['ui_hide'] = "숨기기",
    ['ui_change'] = "변경",
    ['ui_manage'] = "관리",
    ['ui_select'] = "선택",
    ['ui_selected'] = "선택됨",
    ['ui_search'] = "검색...",
    ['ui_pay'] = "결제",
    ['ui_pay_all'] = "모두 결제",

    -- 4.3 Common Labels
    ['ui_name'] = "이름",
    ['ui_type'] = "유형",
    ['ui_status'] = "상태",
    ['ui_date'] = "날짜",
    ['ui_amount'] = "금액",
    ['ui_price'] = "가격",
    ['ui_balance'] = "잔액",
    ['ui_description'] = "설명",
    ['ui_actions'] = "작업",
    ['ui_author'] = "작성자",
    ['ui_notes'] = "메모",
    ['ui_info'] = "정보",
    ['ui_id'] = "ID",
    ['ui_total'] = "합계",
    ['ui_to'] = "받는사람",
    ['ui_from'] = "보낸사람",
    ['ui_in'] = "에서",

    -- 4.4 Status Labels
    ['ui_new'] = "새로운",
    ['ui_pending'] = "대기중",
    ['ui_active'] = "활성",
    ['ui_blocked'] = "차단됨",
    ['ui_paid'] = "납부됨",
    ['ui_unpaid'] = "미납",
    ['ui_completed'] = "완료됨",
    ['ui_complete'] = "완료",
    ['ui_sent'] = "송금됨",
    ['ui_received'] = "수령됨",

    -- 4.5 Account Types & Labels
    ['ui_personal'] = "개인",
    ['ui_business'] = "사업",
    ['ui_shared'] = "공유",
    ['ui_owner'] = "소유자",
    ['ui_user'] = "사용자",
    ['ui_personal_account'] = "개인 계좌",
    ['ui_business_account'] = "사업 계좌",
    ['ui_savings_account'] = "적금 계좌",
    ['ui_checking_account'] = "당좌 계좌",
    ['ui_your_account'] = "내 계좌",
    ['ui_all_accounts'] = "모든 계좌",
    ['ui_company'] = "회사",
    ['ui_high_yield'] = "고수익",
    ['ui_higher_rates'] = "높은 금리",

    -- 4.6 Account Management
    ['ui_account_name'] = "계좌명",
    ['ui_account_type'] = "계좌 유형",
    ['ui_account_status'] = "계좌 상태",
    ['ui_account_settings'] = "계좌 설정",
    ['ui_account_users'] = "계좌 사용자",
    ['ui_opening_date'] = "개설일",
    ['ui_create_account'] = "계좌 생성",
    ['ui_create_new_account'] = "새 계좌 생성",
    ['ui_add_account'] = "계좌 추가",
    ['ui_close_account'] = "계좌 폐지",
    ['ui_leave_account'] = "계좌 탈퇴",
    ['ui_change_name'] = "이름 변경",
    ['ui_manage_account_users'] = "계좌 사용자 관리",
    ['ui_add_new_user'] = "새 사용자 추가",
    ['ui_player_id'] = "플레이어 ID",
    ['ui_edit_permissions'] = "권한 편집",
    ['ui_remove_user'] = "사용자 제거",
    ['ui_confirm_close_account'] = "계좌 폐지 확인",
    ['ui_confirm_leave_account'] = "계좌 탈퇴 확인",
    ['ui_close_account_btn'] = "계좌를 폐지하고 싶습니다",
    ['ui_close_account_warning'] = "계좌를 폐지하면 모든 데이터가 영구적으로 삭제되며 되돌릴 수 없습니다. 폐지 전에 모든 자금을 출금해야 합니다.",
    ['ui_close_account_permanent'] = "계좌 폐지는 모든 데이터를 영구적으로 삭제하며 되돌릴 수 없습니다.",
    ['ui_leave_account_warning'] = "이 계좌에 대한 접근 권한을 잃게 됩니다.",
    ['ui_leave_account_warning_full'] = "이 계좌에 대한 접근 권한을 잃게 됩니다. 탈퇴하기 전에 모든 자금을 출금해주세요.",
    ['ui_account_has_balance'] = "계좌에 남은 잔액이 있습니다",
    ['ui_withdraw_before_close'] = "폐지하기 전에 모든 자금을 출금해주세요.",
    ['ui_create_account_info'] = "새 계좌를 생성하면 다음의 수수료가 청구됩니다",

    -- 4.7 Transactions
    ['ui_deposit'] = "입금",
    ['ui_withdraw'] = "출금",
    ['ui_transfer'] = "송금",
    ['ui_deposit_money'] = "금액 입금",
    ['ui_withdraw_money'] = "금액 출금",
    ['ui_transfer_money'] = "금액 송금",
    ['ui_recent_transactions'] = "최근 거래",
    ['ui_total_transactions'] = "총 거래",
    ['ui_total_received'] = "총 수령액",
    ['ui_total_sent'] = "총 송금액",
    ['ui_net_earnings'] = "순 수익",
    ['ui_transaction_details'] = "거래 상세",
    ['ui_view_transaction'] = "거래 보기",
    ['ui_print_receipt'] = "영수증 인쇄",
    ['ui_iban'] = "IBAN",
    ['ui_sender_iban'] = "송금인 IBAN",
    ['ui_receiver_iban'] = "수령인 IBAN",
    ['ui_recipient'] = "수령인",
    ['ui_select_recipient'] = "수령인 선택",
    ['ui_select_account'] = "계좌 선택",
    ['ui_external_account'] = "외부 계좌",
    ['ui_multiple_contacts'] = "여러 연락처",
    ['ui_enter_amount'] = "금액 입력",
    ['ui_daily_limit'] = "일일 한도",
    ['ui_summary'] = "요약",

    -- 4.8 Cards
    ['ui_card_holder'] = "카드 소유자",
    ['ui_card_type'] = "카드 종류",
    ['ui_pin'] = "PIN",
    ['ui_pin_number'] = "PIN 번호",
    ['ui_not_set'] = "설정되지 않음",
    ['ui_expires'] = "만료",
    ['ui_expiry'] = "만료일",
    ['ui_current_expiry'] = "현재 만료일",
    ['ui_auto_renew'] = "자동 갱신",
    ['ui_manage_card'] = "카드 관리",
    ['ui_create_new_card'] = "새 카드 생성",
    ['ui_select_card'] = "카드 선택",
    ['ui_delete_card'] = "카드 삭제",
    ['ui_delete_card_warning'] = "이 작업은 취소할 수 없습니다.",
    ['ui_delete_card_confirm'] = "정말 카드를 삭제하시겠습니까?",
    ['ui_warning'] = "경고",
    ['ui_information'] = "정보",
    ['ui_blocking_card_warning'] = "<span class=\"bold\">은행 카드를 차단</span>하면 다시 활성화하려는 경우 <span class=\"bold\">새 카드를 재발급</span>받아야 합니다. 이 과정에는 <span class=\"bold activation-fee\">{fee}</span>의 재발급 수수료가 발생합니다.",
    ['ui_activating_card_info'] = "은행 카드를 활성화하려면 <span class=\"bold activation-fee\">{fee}</span>의 서비스 수수료가 필요합니다.",

    -- 4.9 Loans
    ['ui_loan_plans'] = "대출 상품",
    ['ui_starter_loan'] = "시작 대출",
    ['ui_standard_loan'] = "표준 대출",
    ['ui_premium_loan'] = "프리미엄 대출",
    ['ui_executive_loan'] = "임원 대출",
    ['ui_custom_loan'] = "맞춤 대출",
    ['ui_personal_loan'] = "개인 대출",
    ['ui_car_loan'] = "자동차 대출",
    ['ui_home_loan'] = "주택 대출",
    ['ui_request_loan'] = "대출 신청",
    ['ui_active_loans'] = "활성 대출",
    ['ui_no_active_loans'] = "활성 대출이 없습니다",
    ['ui_interest_rate'] = "이자율",
    ['ui_daily_payment'] = "일일 상환금",
    ['ui_remaining'] = "남은 금액",
    ['ui_term'] = "기간",
    ['ui_select_term'] = "기간 선택",
    ['ui_plan'] = "상품",
    ['ui_total_to_repay'] = "총 상환액",
    ['ui_manage_personal_loan'] = "{loan} 관리",
    ['ui_next_payment'] = "다음 상환일",
    ['ui_partial_payment'] = "부분 상환",
    ['ui_pay_off_loan'] = "대출 완제",
    ['ui_loan_overdue_warning'] = "대출 상환금이 <span class=\"bold\">연체되었습니다</span>. 추가 수수료나 패널티를 피하기 위해 <span class=\"bold\">미납 금액</span>을 가능한 한 빨리 해결해주세요.",

    -- 4.10 Credit Score
    ['ui_credit_score'] = "신용점수",
    ['ui_credit_score_ranks'] = "신용점수 등급",
    ['ui_credit_score_info'] = "신용점수 정보",
    ['ui_credit_score_info_text'] = "신용점수는 이자율에 영향을 미칩니다:",
    ['ui_higher_scores_lower_rates'] = "높은 점수는 낮은 이자율",
    ['ui_lower_scores_increase'] = "낮은 점수는 이자율을 인상합니다",
    ['ui_view_ranks'] = "등급 보기",
    ['ui_score'] = "점수",
    ['ui_rank'] = "등급",
    ['ui_rate'] = "이자율",
    ['ui_excellent'] = "우수",
    ['ui_very_good'] = "매우 좋음",
    ['ui_good'] = "좋음",
    ['ui_fair'] = "보통",
    ['ui_poor'] = "나쁨",
    ['ui_very_poor'] = "매우 나쁨",

    -- 4.11 Savings Goals
    ['ui_saving_goals'] = "적금 목표",
    ['ui_no_saving_goals'] = "적금 목표가 없습니다",
    ['ui_create_first_goal'] = "첫 번째 적금 목표를 생성하여<br>진행 상황을 추적하세요",
    ['ui_create_new_saving_goal'] = "새 적금 목표 생성",
    ['ui_manage_saving_goal'] = "적금 목표 관리",
    ['ui_manage_goal'] = "목표 관리",
    ['ui_goal'] = "목표",
    ['ui_goal_name'] = "목표명",
    ['ui_target_amount'] = "목표 금액",
    ['ui_initial_deposit'] = "초기 입금액",
    ['ui_saved'] = "저축액",
    ['ui_add_to_goal'] = "목표에 추가",
    ['ui_withdraw_funds'] = "자금 출금",
    ['ui_interest_tracker'] = "이자 추적",
    ['ui_total_interest_earned'] = "총 이자 수익",
    ['ui_this_week'] = "이번 주",
    ['ui_next_payout'] = "다음 지급일",

    -- 4.12 Bills & Invoices
    ['ui_bills_list'] = "청구서 목록",
    ['ui_pay_bill'] = "청구서 납부",
    ['ui_pay_all_bills'] = "모든 청구서 납부",
    ['ui_view_bill'] = "청구서 보기",
    ['ui_invoice'] = "송장",
    ['ui_reference_id'] = "참조 ID",
    ['ui_subtotal'] = "소계",
    ['ui_vat'] = "부가세",
    ['ui_due'] = "납부예정",
    ['ui_paid_on'] = "납부일",

    -- 4.13 Contacts
    ['ui_contacts'] = "연락처",
    ['ui_favorites'] = "즐겨찾기",
    ['ui_no_contacts'] = "연락처가 없습니다",
    ['ui_no_favorite_contacts'] = "즐겨찾기 연락처가 없습니다",
    ['ui_save_contact'] = "연락처 저장",

    -- 4.14 Modals & Dialogs
    ['ui_are_you_sure'] = "정말로 진행하시겠습니까?",
    ['ui_are_you_sure_iban_change'] = "정말로 IBAN을 변경하시겠습니까?",
    ['ui_are_you_sure_pin_change'] = "정말로 PIN을 변경하시겠습니까?",
    ['ui_are_you_sure_daily_limit_change'] = "정말로 일일 한도를 변경하시겠습니까?",
    ['ui_are_you_sure_remove_user'] = "<span class=\"bold\">{user}</span>을(를) <span class=\"bold\">{account}</span>에서 제거하시겠습니까?",
    ['ui_are_you_sure_pay_bill'] = "정말로 청구서를 납부하시겠습니까?",
    ['ui_are_you_sure_print_receipt'] = "정말로 영수증을 인쇄하시겠습니까?",
    ['ui_copy_success'] = "클립보드에 복사되었습니다",
    ['ui_copy_error'] = "복사에 실패했습니다",
    ['ui_loading_data'] = "데이터 로드 중...",
    ['ui_logging_out'] = "로그아웃 중...",
    ['ui_generated_automatically'] = "시스템에서 자동으로 생성됨",

    -- 4.15 Empty States & Placeholders
    ['ui_no_users_yet'] = "아직 사용자가 없습니다",
    ['ui_no_bills'] = "아직 청구서가 없습니다",
    ['ui_no_transactions_yet'] = "아직 거래가 없습니다",
    ['ui_no_recent_activity'] = "최근 활동이 없습니다",
    ['ui_no_transaction_history'] = "아직 거래 내역이 없습니다",
    ['ui_transaction_history_help'] = "거래 내역이 여기에 표시됩니다",
    ['ui_bills_help'] = "청구서 내역이 여기에 표시됩니다",
    ['ui_loan_history_help'] = "대출 내역이 여기에 표시됩니다",
    ['ui_savings_transactions_appear_here'] = "적금 거래 내역이 여기에 표시됩니다",
    ['ui_make_first_transaction'] = "첫 거래를 진행하여 잔액 차트를 확인하세요",

    -- 4.16 Time Labels
    ['ui_day'] = "일",
    ['ui_days'] = "일",
    ['ui_days_late'] = "{days}일 연체",
    ['ui_hours_late'] = "{hours}시간 연체",
    ['ui_minutes_late'] = "{minutes}분 연체",
    ['ui_in_days'] = "{days}일 후",
    ['ui_in_hours'] = "{hours}시간 후",
    ['ui_in_minutes'] = "{minutes}분 후",

    -- 4.17 Format Strings (used with string.format or template literals)
    ['ui_showing_transactions'] = "%d-%d / 총 %d건",
    ['ui_loan_term_format'] = "%s/%s • %d %s",
    ['ui_days_format'] = "%d %s",
    ['ui_users_count'] = "%d %s",

    -- =============================================
    -- 5. TRANSACTION LOCALES (Server-side)
    -- =============================================

    -- 5.1 Sender/Receiver Names
    ['tx_wallet'] = "지갑",
    ['tx_custom_account'] = "맞춤 계좌",
    ['tx_bank_loan'] = "은행 (대출)",
    ['tx_bank_card_purchase'] = "은행 (카드 구매)",
    ['tx_bank_card_activation'] = "은행 (카드 활성화)",
    ['tx_bank_card_renewal'] = "은행 (카드 갱신)",
    ['tx_bank_loan_payoff'] = "은행 (대출 완제)",
    ['tx_bank_iban_change'] = "은행 (IBAN 변경)",
    ['tx_bank_pin_change'] = "은행 (PIN 변경)",
    ['tx_bank_account_creation'] = "은행 (계좌 생성)",
    ['tx_bank_receipt_print'] = "은행 (영수증 인쇄)",
    ['tx_loan_payment'] = "대출 상환",

    -- 5.2 Transaction Reasons - Deposits
    ['tx_reason_deposit_card'] = "카드 계좌에 입금",
    ['tx_reason_deposit_business'] = "사업 계좌에 입금",
    ['tx_reason_deposit_custom'] = "맞춤 계좌에 입금",
    ['tx_reason_deposit_savings'] = "적금 계좌에 입금",
    ['tx_reason_deposit_bank'] = "은행 계좌에 입금",
    ['tx_reason_receipt_print'] = "영수증 인쇄",

    -- 5.3 Transaction Reasons - Withdrawals
    ['tx_reason_withdraw_card'] = "카드 계좌에서 출금",
    ['tx_reason_withdraw_business'] = "사업 계좌에서 출금",
    ['tx_reason_withdraw_custom'] = "맞춤 계좌에서 출금",
    ['tx_reason_withdraw_savings'] = "적금 계좌에서 출금",
    ['tx_reason_withdraw_bank'] = "은행 계좌에서 출금",

    -- 5.4 Transaction Reasons - Transfers
    ['tx_reason_transfer_to'] = "송금하기",
    ['tx_reason_transfer_business'] = "사업 계좌로 송금",
    ['tx_reason_transfer_custom'] = "맞춤 계좌로 송금",
    ['tx_reason_transfer_personal'] = "개인 계좌로 송금",
    ['tx_reason_transfer_savings'] = "적금 계좌로 송금",

    -- 5.5 Transaction Reasons - Other
    ['tx_reason_card_purchase'] = "카드 구매:",
    ['tx_reason_loan_disbursement'] = "대출 지급:",
    ['tx_reason_loan_payment'] = "대출 상환:",
    ['tx_reason_loan_payoff'] = "대출 완제:",
    ['tx_reason_penalty'] = "패널티:",
    ['tx_reason_paid_bill'] = "청구서 납부:",
    ['tx_reason_iban_change'] = "IBAN 변경 수수료",
    ['tx_reason_pin_change'] = "PIN 변경 수수료",
    ['tx_reason_account_creation'] = "계좌 생성 수수료",
    ['tx_reason_paycheck'] = "급여",
    ['tx_paycheck'] = "급여",

    -- =============================================
    -- 6. TIME/DATE LOCALES
    -- =============================================

    ['time_expired'] = "만료됨",
    ['time_month'] = "개월",
    ['time_months'] = "개월",
    ['time_in_format'] = "%d %s 후",

    -- =============================================
    -- 7. WEBHOOK LOCALES
    -- =============================================

    -- 7.1 Webhook Titles
    ['webhook_title_deposit'] = "💰 은행 입금",
    ['webhook_title_withdraw'] = "💸 은행 출금",
    ['webhook_title_transfer'] = "💳 은행 송금",
    ['webhook_title_savings_deposit'] = "🏦 적금 입금",
    ['webhook_title_savings_withdraw'] = "🏦 적금 출금",
    ['webhook_title_savings_transfer'] = "🏦 적금 송금",
    ['webhook_title_loan_create'] = "📋 대출 생성",
    ['webhook_title_account_create'] = "🏦 계좌 생성",
    ['webhook_title_account_delete'] = "🗑️ 계좌 삭제",
    ['webhook_title_account_add_user'] = "👤 사용자 계좌에 추가",
    ['webhook_title_account_remove_user'] = "👤 사용자 계좌에서 제거",
    ['webhook_title_account_change_permissions'] = "🔐 계좌 권한 변경",
    ['webhook_title_default'] = "은행 로그",

    -- 7.2 Webhook Field Names
    ['webhook_field_from'] = "보낸사람",
    ['webhook_field_to'] = "받는사람",
    ['webhook_field_amount'] = "금액",
    ['webhook_field_reason'] = "이유",
    ['webhook_field_account'] = "계좌",
    ['webhook_field_goal'] = "목표",
    ['webhook_field_loan_plan'] = "대출 상품",
    ['webhook_field_interest_rate'] = "이자율",
    ['webhook_field_duration'] = "기간",
    ['webhook_field_borrower'] = "대출자",
    ['webhook_field_account_name'] = "계좌명",
    ['webhook_field_iban'] = "IBAN",
    ['webhook_field_owner'] = "소유자",
    ['webhook_field_final_balance'] = "최종 잔액",
    ['webhook_field_added_user'] = "추가된 사용자",
    ['webhook_field_account_owner'] = "계좌 소유자",
    ['webhook_field_removed_user'] = "제거된 사용자",
    ['webhook_field_user'] = "사용자",
    ['webhook_field_new_permissions'] = "새 권한",
    ['webhook_field_player_source'] = "플레이어 출처",
    ['webhook_field_license'] = "라이센스",
    ['webhook_field_discord'] = "디스코드",

    -- 7.3 Webhook Other Text
    ['webhook_reason_savings_transfer'] = "적금에서 송금 (%s)",
    ['webhook_duration_months'] = "%s 개월",
    ['webhook_discord_not_linked'] = "연결되지 않음",
    ['webhook_author_suffix'] = "은행 로그",

    -- 7.4 Webhook Account Type Labels
    ['webhook_account_personal'] = "개인",
    ['webhook_account_business'] = "사업: %s",
    ['webhook_account_custom'] = "맞춤: %s",
    ['webhook_account_business_simple'] = "사업",
    ['webhook_account_custom_simple'] = "맞춤",
    ['webhook_sender_savings_suffix'] = " (적금)",
    ['webhook_multiple_recipients'] = "여러 수령인 (%s 계좌)",
}
