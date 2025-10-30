CREATE TABLE `job` (
  `job_id` integer PRIMARY KEY,
  `year` year,
  `salary` float,
  `size_id` integer,
  `remote_id` integer,
  `currency_id` integer,
  `experience_id` integer,
  `employment_id` integer,
  `position_id` integer,
  `country_id` integer
);

CREATE TABLE `company_size` (
  `size_id` integer PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `remote` (
  `remote_id` integer PRIMARY KEY,
  `percentage` float
);

CREATE TABLE `currency` (
  `currency_id` integer PRIMARY KEY,
  `currency_name` varchar(255)
);

CREATE TABLE `experience_level` (
  `experience_id` integer PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `employment_type` (
  `employment_id` integer PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `positions` (
  `position_id` integer PRIMARY KEY,
  `position` varchar(255)
);

CREATE TABLE `countries` (
  `country_id` integer PRIMARY KEY,
  `name` varchar(255)
);

ALTER TABLE `job` ADD FOREIGN KEY (`size_id`) REFERENCES `company_size` (`size_id`);

ALTER TABLE `job` ADD FOREIGN KEY (`remote_id`) REFERENCES `remote` (`remote_id`);

ALTER TABLE `job` ADD FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`);

ALTER TABLE `job` ADD FOREIGN KEY (`experience_id`) REFERENCES `experience_level` (`experience_id`);

ALTER TABLE `job` ADD FOREIGN KEY (`employment_id`) REFERENCES `employment_type` (`employment_id`);

ALTER TABLE `job` ADD FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`);

ALTER TABLE `job` ADD FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);
