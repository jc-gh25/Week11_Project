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
