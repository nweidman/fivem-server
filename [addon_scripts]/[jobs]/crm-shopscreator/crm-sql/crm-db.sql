CREATE TABLE `crm_categories` (
	`crm_id` INT NOT NULL AUTO_INCREMENT,
	`crm_label` VARCHAR(255) NOT NULL DEFAULT 'General',
	`crm_icon` VARCHAR(255) NOT NULL DEFAULT 'fa-solid fa-shop',
	`crm_description` VARCHAR(255) NOT NULL DEFAULT 'General items',
	`crm_items` TEXT NOT NULL,
	`crm_restrictions` TEXT NOT NULL,
	PRIMARY KEY (`crm_id`)
) COLLATE='utf8mb4_uca1400_ai_ci';

CREATE TABLE `crm_shops` (
	`crm_id` INT NOT NULL AUTO_INCREMENT,
	`crm_name` VARCHAR(255) NOT NULL DEFAULT '24/7 Shop',
	`crm_template` VARCHAR(55) NOT NULL DEFAULT 'crm-shop-1',
	`crm_type` VARCHAR(55) NOT NULL DEFAULT 'crm-npc',
	`crm_blip` TEXT NOT NULL,
	`crm_coords` TEXT NOT NULL,
	`crm_owners` TEXT NOT NULL,
	`crm_ped` TEXT NOT NULL,
	`crm_categories` TEXT NOT NULL,
	`crm_restrictions` TEXT NOT NULL,
	`crm_status` TEXT NOT NULL,
	PRIMARY KEY (`crm_id`)
) COLLATE='utf8mb4_uca1400_ai_ci';