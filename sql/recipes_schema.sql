CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ingredient` (
  `ingredient_id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `unit_id` int DEFAULT NULL,
  `ingredient_name` varchar(64) NOT NULL,
  `instruction` varchar(64) DEFAULT NULL,
  `ingredient_order` int NOT NULL,
  `amount` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`),
  KEY `recipe_id` (`recipe_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE,
  CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `recipe` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(128) NOT NULL,
  `notes` text,
  `num_servings` int DEFAULT NULL,
  `prep_time` time DEFAULT NULL,
  `cook_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `recipe_category` (
  `recipe_id` int NOT NULL,
  `category_id` int NOT NULL,
  UNIQUE KEY `recipe_id` (`recipe_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `recipe_category_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `step` (
  `step_id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `step_order` int NOT NULL,
  `step_text` text NOT NULL,
  PRIMARY KEY (`step_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `step_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `unit` (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `unit_name_singular` varchar(32) NOT NULL,
  `unit_name_plural` varchar(34) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

