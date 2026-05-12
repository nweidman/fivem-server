ALTER TABLE `players`
    DROP COLUMN IF EXISTS `pincode`;

ALTER TABLE `players`
    ADD COLUMN IF NOT EXISTS `pincode` LONGTEXT NULL DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS `okok_credit_score` INT(11) NULL DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS `okok_bank_contacts` TEXT NULL DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS `opening_date` LONGTEXT NULL DEFAULT NULL;

CREATE TABLE IF NOT EXISTS `okokbanking_societies` (
    `society` VARCHAR(255) NULL DEFAULT NULL,
    `society_name` VARCHAR(255) NULL DEFAULT NULL,
    `value` INT(50) NULL DEFAULT NULL,
    `iban` VARCHAR(32) NOT NULL,
    `pincode` JSON NULL DEFAULT NULL,
    `credit_score` INT(11) NULL DEFAULT NULL,
    `opening_date` LONGTEXT NULL DEFAULT NULL
);

ALTER TABLE `okokbanking_societies`
    ADD COLUMN IF NOT EXISTS `pincode` JSON NULL DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS `credit_score` INT(11) NULL DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS `okok_bank_contacts` TEXT NULL DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS `opening_date` LONGTEXT NULL DEFAULT NULL;

CREATE TABLE IF NOT EXISTS `okokbanking_accounts` (
    `account_holder` VARCHAR(64) NULL DEFAULT NULL,
    `account_identifier` VARCHAR(64) NULL DEFAULT NULL,
    `account_name` VARCHAR(100) NULL DEFAULT NULL,
    `owner_name` VARCHAR(100) NULL DEFAULT NULL,
    `balance` INT(50) NULL DEFAULT NULL,
    `iban` VARCHAR(32) NULL DEFAULT NULL,
    `pincode` JSON NULL DEFAULT NULL,
    `account_type` VARCHAR(50) NULL DEFAULT NULL,
    `daily_avg` LONGTEXT NULL DEFAULT NULL,
    `interest_total` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `okok_credit_score` INT(11) NULL DEFAULT NULL,
    `opening_date` LONGTEXT NULL DEFAULT NULL,
    INDEX `idx_okok_acc_type` (`account_type`, `account_holder`),
    UNIQUE KEY `idx_account_identifier` (`account_identifier`)
);

CREATE TABLE IF NOT EXISTS `okokbanking_loans` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `identifier` VARCHAR(64) NOT NULL,
    `label` VARCHAR(64) NOT NULL,
    `contract_total` INT UNSIGNED NOT NULL,
    `months` SMALLINT UNSIGNED NOT NULL,
    `monthly_payment` INT UNSIGNED NOT NULL,
    `months_paid` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    `paid` INT UNSIGNED NOT NULL DEFAULT 0,
    `next_due_at` INT UNSIGNED NOT NULL,
    `grace_ends_at` INT UNSIGNED NULL DEFAULT NULL,
    `status` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    INDEX `idx_okb_loans_cid_status_due` (`identifier`, `status`, `next_due_at`),
    INDEX `idx_okb_loans_status_next` (`status`, `next_due_at`),
    INDEX `idx_okb_loans_grace` (`grace_ends_at`, `status`),
    INDEX `idx_okb_loans_payment` (`status`, `next_due_at`)
);

CREATE TABLE IF NOT EXISTS `okokbanking_savinggoals` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `account_holder` VARCHAR(64) NOT NULL,
    `account_identifier` VARCHAR(64) NOT NULL,
    `goal_name` VARCHAR(100) NOT NULL,
    `target_amount` INT UNSIGNED NOT NULL,
    `balance` INT UNSIGNED NOT NULL DEFAULT 0,
    `interest_total` BIGINT UNSIGNED NOT NULL DEFAULT 0,
    `daily_avg` LONGTEXT NULL DEFAULT NULL,
    `is_completed` BOOLEAN NOT NULL DEFAULT FALSE,
    `created_at` INT UNSIGNED NOT NULL,
    `completed_at` INT UNSIGNED NULL DEFAULT NULL,
    INDEX `idx_okok_goals_account_holder` (`account_holder`, `is_completed`),
    INDEX `idx_okok_goals_account_id` (`account_identifier`, `is_completed`),
    INDEX `idx_okok_goals_completed` (`is_completed`)
);

CREATE TABLE IF NOT EXISTS `okokbanking_account_users` (
    `citizenid` VARCHAR(64) NOT NULL PRIMARY KEY,
    `accounts` JSON NOT NULL DEFAULT '{}'
);

ALTER TABLE `players`
    MODIFY COLUMN `opening_date` LONGTEXT NULL DEFAULT NULL;

ALTER TABLE `okokbanking_societies`
    MODIFY COLUMN `opening_date` LONGTEXT NULL DEFAULT NULL;

ALTER TABLE `okokbanking_accounts`
    MODIFY COLUMN `opening_date` LONGTEXT NULL DEFAULT NULL;