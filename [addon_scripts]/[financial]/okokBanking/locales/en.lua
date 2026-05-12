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

Locales['en'] = {

    -- =============================================
    -- 1. SETTINGS
    -- =============================================

    ['ui_language'] = "en-US", -- Used for formatting dates in the UI

    -- =============================================
    -- 2. TEXTUI LOCALES (Interaction Prompts)
    -- =============================================

    ['open_banking'] = {
        text = '[E] Access Bank',
        color = 'darkblue',
        position = 'left'
    },
    ['open_atm'] = {
        text = '[E] Access ATM',
        color = 'darkblue',
        position = 'left'
    },
    ['open_banking_target'] = {
        text = 'Access Bank',
        color = 'darkblue',
        position = 'left'
    },
    ['open_atm_target'] = {
        text = 'Access ATM',
        color = 'darkblue',
        position = 'left'
    },

    -- =============================================
    -- 3. NOTIFICATIONS
    -- =============================================

    -- 3.1 Transactions (Deposit, Withdraw, Transfer)
    ['success_deposit'] = {title = "Success", text = "Deposit successful", time = 5000, type = "success"},
    ['success_withdraw'] = {title = "Success", text = "Withdraw successful", time = 5000, type = "success"},
    ['success_transfer'] = {title = "Success", text = "Transfer successful", time = 5000, type = "success"},
    ['failed_to_withdraw'] = {title = "Error", text = "Failed to withdraw from society", time = 5000, type = "error"},
    ['failed_to_transfer'] = {title = "Error", text = "Failed to transfer", time = 5000, type = "error"},
    ['not_enough_money'] = {title = "Error", text = "You don't have enough money to perform this action", time = 5000, type = "error"},
    ['not_enough_cash'] = {title = "Error", text = "You don't have enough cash", time = 5000, type = "error"},
    ['insufficient_funds'] = {title = "Error", text = "Insufficient funds", time = 5000, type = "error"},
    ['no_valid_recipients'] = {title = "Error", text = "No valid recipients found for transfer", time = 5000, type = "error"},
    ['amount_exceeds_limit'] = {title = "Error", text = "Amount exceeds the limit", time = 5000, type = "error"},
    ['daily_limit_exceeded'] = {title = "Error", text = "Daily limit exceeded", time = 5000, type = "error"},

    -- 3.2 IBAN & PIN
    ['iban_not_found'] = {title = "Error", text = "IBAN not found", time = 5000, type = "error"},
    ['iban_updated'] = {title = "Success", text = "Your IBAN has been updated successfully", time = 5000, type = "success"},
    ['iban_in_use'] = {title = "Error", text = "This IBAN is already in use", time = 5000, type = "error"},
    ['pin_updated'] = {title = "Success", text = "Your PIN has been updated successfully", time = 5000, type = "success"},
    ['pin_update_failed'] = {title = "Error", text = "Failed to update your PIN, please try again", time = 5000, type = "error"},
    ['error_pin_invalid_format'] = {title = "Error", text = "PIN must be a 4-digit number", time = 5000, type = "error"},
    ['daily_limit_updated'] = {title = "Success", text = "Daily limit updated successfully", time = 5000, type = "success"},
    ['daily_limit_update_failed'] = {title = "Error", text = "Failed to update daily limit, please try again", time = 5000, type = "error"},

    -- 3.3 Cards
    ['success_card_created'] = {title = "Success", text = "Card created successfully", time = 5000, type = "success"},
    ['success_card_deleted'] = {title = "Success", text = "Card deleted successfully", time = 5000, type = "success"},
    ['card_managed_successfully'] = {title = "Success", text = "Card information updated successfully", time = 5000, type = "success"},
    ['error_card_created'] = {title = "Error", text = "Failed to create your card, please try again", time = 5000, type = "error"},
    ['error_card_not_found'] = {title = "Error", text = "Card not found", time = 5000, type = "error"},
    ['error_card_delete_failed'] = {title = "Error", text = "Card not found or could not be deleted", time = 5000, type = "error"},
    ['error_no_cards_found'] = {title = "Error", text = "No cards found", time = 5000, type = "error"},
    ['no_active_cards'] = {title = "Error", text = "You don't have any active cards", time = 5000, type = "error"},
    ['invalid_cards_data'] = {title = "Error", text = "Invalid cards data", time = 5000, type = "error"},
    ['card_number_not_found'] = {title = "Error", text = "Card number not found", time = 5000, type = "error"},
    ['max_credit_cards_reached'] = {title = "Error", text = "You have reached the maximum number of credit cards", time = 5000, type = "error"},
    ['max_total_credit_cards_reached'] = {title = "Error", text = "You have reached the maximum number of total credit cards", time = 5000, type = "error"},
    ['card_already_exists'] = {title = "Error", text = "This account already has a card created", time = 5000, type = "error"},

    -- 3.4 Bills
    ['no_unpaid_bills'] = {title = "Error", text = "All your bills are paid", time = 5000, type = "info"},
    ['no_unpaid_bills_found'] = {title = "Error", text = "No unpaid bills found", time = 5000, type = "error"},
    ['success_paid_all_bills'] = {title = "Success", text = "All bills paid successfully", time = 5000, type = "success"},
    ['bill_paid_success'] = {title = "Success", text = "Bill paid successfully", time = 5000, type = "success"},
    ['error_paid_all_bills'] = {title = "Error", text = "Failed to pay bills, please try again", time = 5000, type = "error"},
    ['bill_payment_failed'] = {title = "Error", text = "Failed to pay bill, please try again", time = 5000, type = "error"},
    ['success_receipt_printed'] = {title = "Success", text = "Receipt printed successfully", time = 5000, type = "success"},
    ['failed_to_print_receipt'] = {title = "Error", text = "Failed to print receipt, please try again", time = 5000, type = "error"},
    ['no_reference_id'] = {title = "Error", text = "No reference ID provided", time = 5000, type = "error"},
    ['already_paid'] = {title = "Error", text = "This has already been paid", time = 5000, type = "error"},

    -- 3.5 Accounts
    ['success_account_created'] = {title = "Success", text = "New account created successfully", time = 5000, type = "success"},
    ['success_account_closed'] = {title = "Success", text = "Account closed successfully", time = 5000, type = "success"},
    ['success_account_left'] = {title = "Success", text = "You have left the account successfully", time = 5000, type = "success"},
    ['success_account_name_updated'] = {title = "Success", text = "Account name updated successfully", time = 5000, type = "success"},
    ['account_not_found'] = {title = "Error", text = "Account not found", time = 5000, type = "error"},
    ['invalid_account_name'] = {title = "Error", text = "Invalid account name", time = 5000, type = "error"},
    ['error_account_name_empty'] = {title = "Error", text = "Account name cannot be empty", time = 5000, type = "error"},
    ['error_account_name_length'] = {title = "Error", text = "Account name must be between 1 and 50 characters", time = 5000, type = "error"},
    ['error_insufficient_funds'] = {title = "Error", text = "You don't have enough money to create an account", time = 5000, type = "error"},
    ['error_insufficient_funds_account_creation'] = {title = "Error", text = "Insufficient funds to create account", time = 5000, type = "error"},
    ['error_max_accounts_reached'] = {title = "Error", text = "You have reached the maximum number of accounts", time = 5000, type = "error"},
    ['error_account_creation_failed'] = {title = "Error", text = "Failed to create account. Please try again", time = 5000, type = "error"},
    ['error_account_update_failed'] = {title = "Error", text = "Failed to update account", time = 5000, type = "error"},
    ['error_account_deletion_failed'] = {title = "Error", text = "Failed to delete account. Please try again", time = 5000, type = "error"},
    ['error_account_has_balance'] = {title = "Error", text = "Cannot close account with remaining balance. Please withdraw all funds first", time = 5000, type = "error"},
    ['error_account_has_active_loans'] = {title = "Error", text = "Cannot close/leave account with active loans. Please pay off all loans first", time = 5000, type = "error"},
    ['error_invalid_account_type'] = {title = "Error", text = "Invalid account type", time = 5000, type = "error"},
    ['error_invalid_custom_account_identifier'] = {title = "Error", text = "Invalid account identifier", time = 5000, type = "error"},
    ['error_owner_cannot_leave'] = {title = "Error", text = "Account owners cannot leave their account. Please close the account instead", time = 5000, type = "error"},
    ['error_no_access_found'] = {title = "Error", text = "No access found for this account", time = 5000, type = "error"},
    ['failed_to_access_savings_account'] = {title = "Error", text = "Failed to access savings account", time = 5000, type = "error"},

    -- 3.6 Users & Permissions
    ['success_user_added'] = {title = "Success", text = "User added successfully", time = 5000, type = "success"},
    ['success_user_removed'] = {title = "Success", text = "User removed successfully", time = 5000, type = "success"},
    ['success_permissions_updated'] = {title = "Success", text = "Permissions updated successfully", time = 5000, type = "success"},
    ['error_user_not_found'] = {title = "Error", text = "User not found", time = 5000, type = "error"},
    ['error_user_add_failed'] = {title = "Error", text = "Failed to add user", time = 5000, type = "error"},
    ['error_user_already_has_access'] = {title = "Error", text = "User already has access to this account", time = 5000, type = "error"},
    ['error_cannot_add_owner'] = {title = "Error", text = "Cannot add the account owner", time = 5000, type = "error"},
    ['error_cannot_remove_owner'] = {title = "Error", text = "Cannot remove the account owner", time = 5000, type = "error"},
    ['error_permissions_update_failed'] = {title = "Error", text = "Failed to update permissions", time = 5000, type = "error"},
    ['error_player_not_online'] = {title = "Error", text = "Player is not online", time = 5000, type = "error"},
    ['player_not_found'] = {title = "Error", text = "Player not found", time = 5000, type = "error"},
    ['no_permission'] = {title = "Error", text = "You don't have permission to perform this action", time = 5000, type = "error"},
    ['feature_disabled'] = {title = "Error", text = "This feature is currently disabled", time = 5000, type = "error"},
    ['invalid_daily_limit'] = {title = "Error", text = "Invalid daily limit value", time = 5000, type = "error"},

    -- 3.7 Loans
    ['loan_success_created'] = {title = "Success", text = "Loan created successfully!", time = 5000, type = "success"},
    ['loan_success_paid'] = {title = "Success", text = "Loan paid successfully", time = 5000, type = "success"},
    ['loan_success_partial_paid'] = {title = "Success", text = "Loan partial payment successful", time = 5000, type = "success"},
    ['loan_not_found'] = {title = "Error", text = "Loan not found", time = 5000, type = "error"},
    ['no_plans'] = {title = "Error", text = "Loan plans are not available.", time = 5000, type = "error"},
    ['unknown_plan'] = {title = "Error", text = "Selected loan plan is invalid.", time = 5000, type = "error"},
    ['plan_disabled'] = {title = "Error", text = "This loan plan is currently disabled.", time = 5000, type = "error"},
    ['invalid_amount'] = {title = "Error", text = "Invalid amount.", time = 5000, type = "error"},
    ['invalid_term'] = {title = "Error", text = "Invalid term selected.", time = 5000, type = "error"},
    ['too_many_active_loans'] = {title = "Error", text = "You have reached the limit of active loans.", time = 5000, type = "error"},
    ['has_late_payments'] = {title = "Error", text = "You have late payments. Resolve them before requesting a new loan.", time = 5000, type = "error"},

    -- 3.8 Savings Goals
    ['success_goal_created'] = {title = "Success", text = "Savings goal created successfully", time = 5000, type = "success"},
    ['success_goal_withdrawn'] = {title = "Success", text = "Savings goal withdrawn successfully", time = 5000, type = "success"},
    ['success_goal_added'] = {title = "Success", text = "Money added to savings goal successfully", time = 5000, type = "success"},
    ['goal_not_found'] = {title = "Error", text = "Goal not found", time = 5000, type = "error"},
    ['goal_already_completed'] = {title = "Error", text = "Goal is already completed", time = 5000, type = "error"},
    ['invalid_goal_id'] = {title = "Error", text = "Invalid goal ID", time = 5000, type = "error"},
    ['invalid_goal_name'] = {title = "Error", text = "Invalid goal name", time = 5000, type = "error"},
    ['invalid_target_amount'] = {title = "Error", text = "Invalid target amount", time = 5000, type = "error"},
    ['invalid_initial_deposit'] = {title = "Error", text = "Invalid initial deposit", time = 5000, type = "error"},
    ['max_goals_reached'] = {title = "Error", text = "You have reached the maximum number of savings goals", time = 5000, type = "error"},
    ['no_funds_to_withdraw'] = {title = "Error", text = "No funds available to withdraw from goal", time = 5000, type = "error"},
    ['failed_to_delete_goal'] = {title = "Error", text = "Failed to delete goal", time = 5000, type = "error"},
    ['failed_to_update_goal'] = {title = "Error", text = "Failed to update goal", time = 5000, type = "error"},

    -- 3.9 Contacts
    ['success_contact_saved'] = {title = "Success", text = "Contact saved successfully", time = 5000, type = "success"},
    ['success_contact_deleted'] = {title = "Success", text = "Contact deleted successfully", time = 5000, type = "success"},
    ['success_contact_favorite_toggled'] = {title = "Success", text = "Contact added to favorites successfully", time = 5000, type = "success"},
    ['error_contact_save_failed'] = {title = "Error", text = "Failed to save contact", time = 5000, type = "error"},
    ['error_contact_delete_failed'] = {title = "Error", text = "Failed to delete contact", time = 5000, type = "error"},
    ['error_contact_favorite_toggle_failed'] = {title = "Error", text = "Failed to toggle contact favorite", time = 5000, type = "error"},
    ['max_contacts_reached'] = {title = "Error", text = "You have reached the maximum number of contacts", time = 5000, type = "error"},
    ['max_favorites_reached'] = {title = "Error", text = "You have reached the maximum number of favorite contacts", time = 5000, type = "error"},

    -- 3.10 General Errors
    ['unknown_error'] = {title = "Error", text = "An unknown error occurred", time = 5000, type = "error"},
    ['error_invalid_data'] = {title = "Error", text = "Invalid data provided", time = 5000, type = "error"},
    ['invalid_parameters'] = {title = "Error", text = "Invalid parameters", time = 5000, type = "error"},
    ['database_error'] = {title = "Error", text = "Database error occurred", time = 5000, type = "error"},
    ['error_database_update_failed'] = {title = "Error", text = "Database update failed", time = 5000, type = "error"},
    ['db_insert_failed'] = {title = "Error", text = "Could not create the loan. Please try again.", time = 5000, type = "error"},

    -- =============================================
    -- 4. UI LOCALES
    -- =============================================

    -- 4.1 Navigation & Sections
    ['ui_overview'] = "Overview",
    ['ui_transactions'] = "Transactions",
    ['ui_loans'] = "Loans",
    ['ui_savings'] = "Savings",
    ['ui_bills'] = "Bills",
    ['ui_cards'] = "Cards",
    ['ui_management'] = "Management",
    ['ui_statistics'] = "Statistics",
    ['ui_history'] = "History",

    -- 4.2 Common Actions & Buttons
    ['ui_view'] = "View",
    ['ui_view_all'] = "View All",
    ['ui_edit'] = "Edit",
    ['ui_delete'] = "Delete",
    ['ui_remove'] = "Remove",
    ['ui_add'] = "Add",
    ['ui_add_new'] = "Add New",
    ['ui_create'] = "Create",
    ['ui_save'] = "Save",
    ['ui_save_changes'] = "Save Changes",
    ['ui_cancel'] = "Cancel",
    ['ui_confirm'] = "Confirm",
    ['ui_copy'] = "Copy",
    ['ui_print'] = "Print",
    ['ui_show'] = "Show",
    ['ui_hide'] = "Hide",
    ['ui_change'] = "Change",
    ['ui_manage'] = "Manage",
    ['ui_select'] = "Select",
    ['ui_selected'] = "Selected",
    ['ui_search'] = "Search...",
    ['ui_pay'] = "Pay",
    ['ui_pay_all'] = "Pay All",

    -- 4.3 Common Labels
    ['ui_name'] = "Name",
    ['ui_type'] = "Type",
    ['ui_status'] = "Status",
    ['ui_date'] = "Date",
    ['ui_amount'] = "Amount",
    ['ui_price'] = "Price",
    ['ui_balance'] = "Balance",
    ['ui_description'] = "Description",
    ['ui_actions'] = "Actions",
    ['ui_author'] = "Author",
    ['ui_notes'] = "Notes",
    ['ui_info'] = "Info",
    ['ui_id'] = "ID",
    ['ui_total'] = "Total",
    ['ui_to'] = "To",
    ['ui_from'] = "From",
    ['ui_in'] = "in",

    -- 4.4 Status Labels
    ['ui_new'] = "New",
    ['ui_pending'] = "Pending",
    ['ui_active'] = "Active",
    ['ui_blocked'] = "Blocked",
    ['ui_paid'] = "Paid",
    ['ui_unpaid'] = "Unpaid",
    ['ui_completed'] = "Completed",
    ['ui_complete'] = "complete",
    ['ui_sent'] = "Sent",
    ['ui_received'] = "Received",

    -- 4.5 Account Types & Labels
    ['ui_personal'] = "Personal",
    ['ui_business'] = "Business",
    ['ui_shared'] = "Shared",
    ['ui_owner'] = "Owner",
    ['ui_user'] = "User",
    ['ui_personal_account'] = "Personal Account",
    ['ui_business_account'] = "Business Account",
    ['ui_savings_account'] = "Savings Account",
    ['ui_checking_account'] = "Checking Account",
    ['ui_your_account'] = "Your Account",
    ['ui_all_accounts'] = "All Accounts",
    ['ui_company'] = "Company",
    ['ui_high_yield'] = "High Yield",
    ['ui_higher_rates'] = "Higher Rates",

    -- 4.6 Account Management
    ['ui_account_name'] = "Account Name",
    ['ui_account_type'] = "Account Type",
    ['ui_account_status'] = "Account Status",
    ['ui_account_settings'] = "Account Settings",
    ['ui_account_users'] = "Account Users",
    ['ui_opening_date'] = "Opening Date",
    ['ui_create_account'] = "Create Account",
    ['ui_create_new_account'] = "Create New Account",
    ['ui_add_account'] = "Add Account",
    ['ui_close_account'] = "Close Account",
    ['ui_leave_account'] = "Leave Account",
    ['ui_change_name'] = "Change Name",
    ['ui_manage_account_users'] = "Manage Account Users",
    ['ui_add_new_user'] = "Add New User",
    ['ui_player_id'] = "Player ID",
    ['ui_edit_permissions'] = "Edit Permissions",
    ['ui_remove_user'] = "Remove User",
    ['ui_confirm_close_account'] = "Confirm Close Account",
    ['ui_confirm_leave_account'] = "Confirm Leave Account",
    ['ui_close_account_btn'] = "I want to close my account",
    ['ui_close_account_warning'] = "Closing your account will permanently delete all data and cannot be undone. All funds must be withdrawn before closing.",
    ['ui_close_account_permanent'] = "Account closure will permanently delete all data and cannot be undone.",
    ['ui_leave_account_warning'] = "You will lose access to this account.",
    ['ui_leave_account_warning_full'] = "You will lose access to this account. Make sure all funds are withdrawn before leaving.",
    ['ui_account_has_balance'] = "Account has remaining balance",
    ['ui_withdraw_before_close'] = "Make sure all funds are withdrawn before closing.",
    ['ui_create_account_info'] = "By creating a new account, you will be charged a fee of",

    -- 4.7 Transactions
    ['ui_deposit'] = "Deposit",
    ['ui_withdraw'] = "Withdraw",
    ['ui_transfer'] = "Transfer",
    ['ui_deposit_money'] = "Deposit Money",
    ['ui_withdraw_money'] = "Withdraw Money",
    ['ui_transfer_money'] = "Transfer Money",
    ['ui_recent_transactions'] = "Recent Transactions",
    ['ui_total_transactions'] = "Total Transactions",
    ['ui_total_received'] = "Total Received",
    ['ui_total_sent'] = "Total Sent",
    ['ui_net_earnings'] = "Net Earnings",
    ['ui_transaction_details'] = "Transaction Details",
    ['ui_view_transaction'] = "View Transaction",
    ['ui_print_receipt'] = "Print Receipt",
    ['ui_iban'] = "IBAN",
    ['ui_sender_iban'] = "Sender IBAN",
    ['ui_receiver_iban'] = "Receiver IBAN",
    ['ui_recipient'] = "Recipient",
    ['ui_select_recipient'] = "Select recipient",
    ['ui_select_account'] = "Select Account",
    ['ui_external_account'] = "External Account",
    ['ui_multiple_contacts'] = "Multiple Contacts",
    ['ui_enter_amount'] = "Enter amount",
    ['ui_daily_limit'] = "Daily Limit",
    ['ui_summary'] = "Summary",

    -- 4.8 Cards
    ['ui_card_holder'] = "Card Holder",
    ['ui_card_type'] = "Card Type",
    ['ui_pin'] = "PIN",
    ['ui_pin_number'] = "Pin Number",
    ['ui_not_set'] = "Not Set",
    ['ui_expires'] = "Expires",
    ['ui_expiry'] = "Expiry",
    ['ui_current_expiry'] = "Current Expiry",
    ['ui_auto_renew'] = "Auto-Renew",
    ['ui_manage_card'] = "Manage Card",
    ['ui_create_new_card'] = "Create New Card",
    ['ui_select_card'] = "Select card",
    ['ui_delete_card'] = "Delete Card",
    ['ui_delete_card_warning'] = "This action cannot be undone.",
    ['ui_delete_card_confirm'] = "Are you sure you want to delete your card?",
    ['ui_warning'] = "Warning",
    ['ui_information'] = "Information",
    ['ui_blocking_card_warning'] = "By <span class=\"bold\">blocking your bank card</span>, please note that if you wish to reactivate it, <span class=\"bold\">a new card must be issued</span>. This process carries a replacement fee of <span class=\"bold activation-fee\">{fee}</span>.",
    ['ui_activating_card_info'] = "Please note that activating your bank card requires a service fee of <span class=\"bold activation-fee\">{fee}</span>.",

    -- 4.9 Loans
    ['ui_loan_plans'] = "Loan Plans",
    ['ui_starter_loan'] = "Starter Loan",
    ['ui_standard_loan'] = "Standard Loan",
    ['ui_premium_loan'] = "Premium Loan",
    ['ui_executive_loan'] = "Executive Loan",
    ['ui_custom_loan'] = "Custom Loan",
    ['ui_personal_loan'] = "Personal Loan",
    ['ui_car_loan'] = "Car Loan",
    ['ui_home_loan'] = "Home Loan",
    ['ui_request_loan'] = "Request Loan",
    ['ui_active_loans'] = "Active Loans",
    ['ui_no_active_loans'] = "No active loans",
    ['ui_interest_rate'] = "Interest Rate",
    ['ui_daily_payment'] = "Daily Payment",
    ['ui_remaining'] = "Remaining",
    ['ui_term'] = "Term",
    ['ui_select_term'] = "Select term",
    ['ui_plan'] = "Plan",
    ['ui_total_to_repay'] = "Total to Repay",
    ['ui_manage_personal_loan'] = "Manage {loan}",
    ['ui_next_payment'] = "Next Payment",
    ['ui_partial_payment'] = "Partial Payment",
    ['ui_pay_off_loan'] = "Pay Off Loan",
    ['ui_loan_overdue_warning'] = "Your loan payment is <span class=\"bold\">overdue</span>. Please settle the <span class=\"bold\">outstanding amount</span> as soon as possible to avoid <span class=\"bold\">additional fees or penalties</span>.",

    -- 4.10 Credit Score
    ['ui_credit_score'] = "Credit Score",
    ['ui_credit_score_ranks'] = "Credit Score Ranks",
    ['ui_credit_score_info'] = "Credit Score Information",
    ['ui_credit_score_info_text'] = "Credit score affects interest rates:",
    ['ui_higher_scores_lower_rates'] = "higher scores lower rates",
    ['ui_lower_scores_increase'] = "lower scores increase them",
    ['ui_view_ranks'] = "View Ranks",
    ['ui_score'] = "Score",
    ['ui_rank'] = "Rank",
    ['ui_rate'] = "Rate",
    ['ui_excellent'] = "Excellent",
    ['ui_very_good'] = "Very Good",
    ['ui_good'] = "Good",
    ['ui_fair'] = "Fair",
    ['ui_poor'] = "Poor",
    ['ui_very_poor'] = "Very Poor",

    -- 4.11 Savings Goals
    ['ui_saving_goals'] = "Saving Goals",
    ['ui_no_saving_goals'] = "No saving goals",
    ['ui_create_first_goal'] = "Create your first saving goal<br>to start tracking your progress",
    ['ui_create_new_saving_goal'] = "Create New Saving Goal",
    ['ui_manage_saving_goal'] = "Manage Saving Goal",
    ['ui_manage_goal'] = "Manage Goal",
    ['ui_goal'] = "Goal",
    ['ui_goal_name'] = "Goal Name",
    ['ui_target_amount'] = "Target Amount",
    ['ui_initial_deposit'] = "Initial Deposit",
    ['ui_saved'] = "Saved",
    ['ui_add_to_goal'] = "Add to Goal",
    ['ui_withdraw_funds'] = "Withdraw Funds",
    ['ui_interest_tracker'] = "Interest Tracker",
    ['ui_total_interest_earned'] = "Total Interest Earned",
    ['ui_this_week'] = "This Week",
    ['ui_next_payout'] = "Next Payout",

    -- 4.12 Bills & Invoices
    ['ui_bills_list'] = "Bills List",
    ['ui_pay_bill'] = "Pay Bill",
    ['ui_pay_all_bills'] = "Pay All Bills",
    ['ui_view_bill'] = "View Bill",
    ['ui_invoice'] = "Invoice",
    ['ui_reference_id'] = "Reference ID",
    ['ui_subtotal'] = "Subtotal",
    ['ui_vat'] = "VAT",
    ['ui_due'] = "Due",
    ['ui_paid_on'] = "Paid on",

    -- 4.13 Contacts
    ['ui_contacts'] = "Contacts",
    ['ui_favorites'] = "Favorites",
    ['ui_no_contacts'] = "No contacts",
    ['ui_no_favorite_contacts'] = "No favorite contacts",
    ['ui_save_contact'] = "Save Contact",

    -- 4.14 Modals & Dialogs
    ['ui_are_you_sure'] = "Are you sure?",
    ['ui_are_you_sure_iban_change'] = "Are you sure you want to change your IBAN?",
    ['ui_are_you_sure_pin_change'] = "Are you sure you want to change your PIN?",
    ['ui_are_you_sure_daily_limit_change'] = "Are you sure you want to change your daily limit?",
    ['ui_are_you_sure_remove_user'] = "Are you sure you want to remove <span class=\"bold\">{user}</span> from the <span class=\"bold\">{account}</span>?",
    ['ui_are_you_sure_pay_bill'] = "Are you sure you want to pay the bill?",
    ['ui_are_you_sure_print_receipt'] = "Are you sure you want to print the receipt?",
    ['ui_copy_success'] = "Copied to clipboard",
    ['ui_copy_error'] = "Failed to copy",
    ['ui_loading_data'] = "Loading data...",
    ['ui_logging_out'] = "Logging out...",
    ['ui_generated_automatically'] = "Generated automatically by the system",

    -- 4.15 Empty States & Placeholders
    ['ui_no_users_yet'] = "No users yet",
    ['ui_no_bills'] = "No bills yet",
    ['ui_no_transactions_yet'] = "No transactions yet",
    ['ui_no_recent_activity'] = "No recent activity",
    ['ui_no_transaction_history'] = "No transaction history yet",
    ['ui_transaction_history_help'] = "Your transaction history will appear here",
    ['ui_bills_help'] = "Your bills history will appear here",
    ['ui_loan_history_help'] = "Your loan history will appear here",
    ['ui_savings_transactions_appear_here'] = "Your savings transactions will appear here",
    ['ui_make_first_transaction'] = "Make your first transaction to see the balance chart",

    -- 4.16 Time Labels
    ['ui_day'] = "day",
    ['ui_days'] = "days",
    ['ui_days_late'] = "{days} days late",
    ['ui_hours_late'] = "{hours} hours late",
    ['ui_minutes_late'] = "{minutes} minutes late",
    ['ui_in_days'] = "in {days} days",
    ['ui_in_hours'] = "in {hours} hours",
    ['ui_in_minutes'] = "in {minutes} minutes",

    -- 4.17 Format Strings (used with string.format or template literals)
    ['ui_showing_transactions'] = "Showing %d-%d of %d",
    ['ui_loan_term_format'] = "%s/%s • %d %s",
    ['ui_days_format'] = "%d %s",
    ['ui_users_count'] = "%d %s",

    -- =============================================
    -- 5. TRANSACTION LOCALES (Server-side)
    -- =============================================

    -- 5.1 Sender/Receiver Names
    ['tx_wallet'] = "Wallet",
    ['tx_custom_account'] = "Custom Account",
    ['tx_bank_loan'] = "Bank (Loan)",
    ['tx_bank_card_purchase'] = "Bank (Card Purchase)",
    ['tx_bank_card_activation'] = "Bank (Card Activation)",
    ['tx_bank_card_renewal'] = "Bank (Card Renewal)",
    ['tx_bank_loan_payoff'] = "Bank (Loan Payoff)",
    ['tx_bank_iban_change'] = "Bank (IBAN Change)",
    ['tx_bank_pin_change'] = "Bank (PIN Change)",
    ['tx_bank_account_creation'] = "Bank (Account Creation)",
    ['tx_bank_receipt_print'] = "Bank (Receipt Print)",
    ['tx_loan_payment'] = "Loan Payment",

    -- 5.2 Transaction Reasons - Deposits
    ['tx_reason_deposit_card'] = "Deposit to card account",
    ['tx_reason_deposit_business'] = "Deposit to business account",
    ['tx_reason_deposit_custom'] = "Deposit to custom account",
    ['tx_reason_deposit_savings'] = "Deposit to savings account",
    ['tx_reason_deposit_bank'] = "Deposit to bank account",
    ['tx_reason_receipt_print'] = "Receipt print",

    -- 5.3 Transaction Reasons - Withdrawals
    ['tx_reason_withdraw_card'] = "Withdraw from card account",
    ['tx_reason_withdraw_business'] = "Withdraw from business account",
    ['tx_reason_withdraw_custom'] = "Withdraw from custom account",
    ['tx_reason_withdraw_savings'] = "Withdraw from savings account",
    ['tx_reason_withdraw_bank'] = "Withdraw from bank account",

    -- 5.4 Transaction Reasons - Transfers
    ['tx_reason_transfer_to'] = "Transfer to",
    ['tx_reason_transfer_business'] = "Transfer to business account",
    ['tx_reason_transfer_custom'] = "Transfer to custom account",
    ['tx_reason_transfer_personal'] = "Transfer to personal account",
    ['tx_reason_transfer_savings'] = "Transfer to savings account",

    -- 5.5 Transaction Reasons - Other
    ['tx_reason_card_purchase'] = "Card Purchase:",
    ['tx_reason_loan_disbursement'] = "Loan disbursement:",
    ['tx_reason_loan_payment'] = "Loan payment:",
    ['tx_reason_loan_payoff'] = "Loan payoff:",
    ['tx_reason_penalty'] = "Penalty:",
    ['tx_reason_paid_bill'] = "Paid bill:",
    ['tx_reason_iban_change'] = "IBAN change fee",
    ['tx_reason_pin_change'] = "PIN change fee",
    ['tx_reason_account_creation'] = "Account creation fee",
    ['tx_reason_paycheck'] = "Paycheck",
    ['tx_paycheck'] = "Paycheck",

    -- =============================================
    -- 6. TIME/DATE LOCALES
    -- =============================================

    ['time_expired'] = "expired",
    ['time_month'] = "month",
    ['time_months'] = "months",
    ['time_in_format'] = "in %d %s",

    -- =============================================
    -- 7. WEBHOOK LOCALES
    -- =============================================

    -- 7.1 Webhook Titles
    ['webhook_title_deposit'] = "💰 Bank Deposit",
    ['webhook_title_withdraw'] = "💸 Bank Withdrawal",
    ['webhook_title_transfer'] = "💳 Bank Transfer",
    ['webhook_title_savings_deposit'] = "🏦 Savings Deposit",
    ['webhook_title_savings_withdraw'] = "🏦 Savings Withdrawal",
    ['webhook_title_savings_transfer'] = "🏦 Savings Transfer",
    ['webhook_title_loan_create'] = "📋 Loan Created",
    ['webhook_title_account_create'] = "🏦 Account Created",
    ['webhook_title_account_delete'] = "🗑️ Account Deleted",
    ['webhook_title_account_add_user'] = "👤 User Added to Account",
    ['webhook_title_account_remove_user'] = "👤 User Removed from Account",
    ['webhook_title_account_change_permissions'] = "🔐 Account Permissions Changed",
    ['webhook_title_default'] = "Banking Log",

    -- 7.2 Webhook Field Names
    ['webhook_field_from'] = "From",
    ['webhook_field_to'] = "To",
    ['webhook_field_amount'] = "Amount",
    ['webhook_field_reason'] = "Reason",
    ['webhook_field_account'] = "Account",
    ['webhook_field_goal'] = "Goal",
    ['webhook_field_loan_plan'] = "Loan Plan",
    ['webhook_field_interest_rate'] = "Interest Rate",
    ['webhook_field_duration'] = "Duration",
    ['webhook_field_borrower'] = "Borrower",
    ['webhook_field_account_name'] = "Account Name",
    ['webhook_field_iban'] = "IBAN",
    ['webhook_field_owner'] = "Owner",
    ['webhook_field_final_balance'] = "Final Balance",
    ['webhook_field_added_user'] = "Added User",
    ['webhook_field_account_owner'] = "Account Owner",
    ['webhook_field_removed_user'] = "Removed User",
    ['webhook_field_user'] = "User",
    ['webhook_field_new_permissions'] = "New Permissions",
    ['webhook_field_player_source'] = "Player Source",
    ['webhook_field_license'] = "License",
    ['webhook_field_discord'] = "Discord",

    -- 7.3 Webhook Other Text
    ['webhook_reason_savings_transfer'] = "Transfer from Savings (%s)",
    ['webhook_duration_months'] = "%s months",
    ['webhook_discord_not_linked'] = "Not linked",
    ['webhook_author_suffix'] = "Banking Logs",

    -- 7.4 Webhook Account Type Labels
    ['webhook_account_personal'] = "Personal",
    ['webhook_account_business'] = "Business: %s",
    ['webhook_account_custom'] = "Custom: %s",
    ['webhook_account_business_simple'] = "Business",
    ['webhook_account_custom_simple'] = "Custom",
    ['webhook_sender_savings_suffix'] = " (Savings)",
    ['webhook_multiple_recipients'] = "Multiple Recipients (%s accounts)",
}
