-- Database setup script for the projects database
-- This script creates the schema and inserts sample data

/* SCHEMA CREATION */

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

/* DATA INSERTION */

-- projects_sample_data.sql

-- Insert sample categories
INSERT INTO category (category_name) VALUES
('Woodworking'),
('Painting'),
('Electronics'),
('Gardening'),
('Home Improvement');

-- Insert sample projects
INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES
('Backyard Deck', 40, 38, 5, 'Building a deck in the backyard'),
('Kitchen Cabinet Painting', 20, 22, 3, 'Refreshing kitchen cabinets with new paint'),
('Smart Lighting System', 15, 16, 4, 'Installing smart LED lights in the living room'),
('Raised Garden Beds', 12, 10, 2, 'Creating garden beds for vegetables'),
('Bathroom Remodel', 80, 75, 7, 'Complete bathroom renovation');

-- Insert sample materials
INSERT INTO material (project_id, material_name, num_required, cost) VALUES
(1, 'Pressure-treated lumber', 20, 120.50),
(1, 'Galvanized screws', 500, 25.75),
(1, 'Decking boards', 30, 180.00),
(2, 'Primer', 2, 24.99),
(2, 'Paint', 3, 45.50),
(2, 'Paint brushes', 2, 18.75),
(3, 'Smart LED bulbs', 8, 120.00),
(3, 'Smart switch', 2, 50.00),
(3, 'Wires and connectors', 1, 15.25),
(4, 'Cedar wood', 12, 96.00),
(4, 'Soil', 4, 20.00),
(4, 'Compost', 2, 15.00),
(5, 'Ceramic tiles', 200, 300.00),
(5, 'Grout', 2, 12.50),
(5, 'Tile cutter', 1, 45.00);

-- Insert sample project categories (junction table)
INSERT INTO project_category (project_id, category_id) VALUES
(1, 1),  -- Woodworking
(1, 5),  -- Home Improvement
(2, 2),  -- Painting
(2, 5),  -- Home Improvement
(3, 3),  -- Electronics
(3, 5),  -- Home Improvement
(4, 4),  -- Gardening
(4, 5),  -- Home Improvement
(5, 5);  -- Home Improvement

-- Insert sample steps for each project
INSERT INTO step (project_id, step_text, step_order) VALUES
(1, 'Measure and mark the area for the deck', 1),
(1, 'Prepare the ground and lay the foundation', 2),
(1, 'Install support posts and beams', 3),
(1, 'Attach joists to the frame', 4),
(1, 'Install decking boards', 5),
(1, 'Add railings and stairs if needed', 6),
(1, 'Apply sealant or stain to protect the wood', 7),

(2, 'Remove old cabinet doors and hardware', 1),
(2, 'Clean and prepare the cabinet surfaces', 2),
(2, 'Apply primer to the cabinets', 3),
(2, 'Paint the cabinets with the first coat', 4),
(2, 'Allow the first coat to dry completely', 5),
(2, 'Apply the second coat of paint', 6),
(2, 'Reattach the doors and hardware', 7),

(3, 'Plan your smart lighting layout', 1),
(3, 'Install the smart switch at the desired location', 2),
(3, 'Connect the smart LED bulbs to the power source', 3),
(3, 'Pair the smart bulbs with your home automation system', 4),
(3, 'Test the lighting system and adjust settings as needed', 5),

(4, 'Choose the location for your garden beds', 1),
(4, 'Measure and mark the area for the beds', 2),
(4, 'Build the frame for the raised beds using cedar wood', 3),
(4, 'Fill the beds with soil and compost', 4),
(4, 'Plant your vegetables or flowers', 5),

(5, 'Remove old fixtures and surfaces', 1),
(5, 'Install new plumbing if needed', 2),
(5, 'Prepare the walls and floor for tiling', 3),
(5, 'Lay out the ceramic tiles and make adjustments as needed', 4),
(5, 'Apply adhesive and install the tiles', 5),
(5, 'Allow the adhesive to set, then apply grout', 6),
(5, 'Clean the tiles and enjoy your new bathroom', 7);


