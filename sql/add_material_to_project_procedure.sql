DELIMITER //
CREATE PROCEDURE add_material_to_project(
    IN project_id INT,
    IN material_name VARCHAR(100),
    IN num_required DECIMAL(10,2),
    IN cost DECIMAL(10,2)
)
BEGIN
    INSERT INTO materials (project_id, material_name, quantity, unit)
    VALUES (project_id, material_name, quantity, unit);
END //
DELIMITER ;
