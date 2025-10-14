CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `material_name` varchar(128) NOT NULL,
  `num_required` int DEFAULT NULL,
  `cost` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`material_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(128) NOT NULL,
  `estimated_hours` decimal(7,2) DEFAULT NULL,
  `actual_hours` decimal(7,2) DEFAULT NULL,
  `difficulty` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `project_category` (
  `project_id` int NOT NULL,
  `category_id` int NOT NULL,
  UNIQUE KEY `project_id` (`project_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `project_category_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `project_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `step` (
  `step_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `step_text` text NOT NULL,
  `step_order` int NOT NULL,
  PRIMARY KEY (`step_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `step_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


