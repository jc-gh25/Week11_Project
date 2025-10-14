CREATE VIEW project_materials_view AS
SELECT p.project_id, p.project_name, m.material_name, m.num_required, m.cost
FROM project p
JOIN material m ON p.project_id = m.project_id;

/*CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_materials_view` AS select `p`.`project_id` AS `project_id`,`p`.`project_name` AS `project_name`,`m`.`material_name` AS `material_name`,`m`.`num_required` AS `num_required`,`m`.`cost` AS `cost` from (`project` `p` join `material` `m` on((`p`.`project_id` = `m`.`project_id`)));

