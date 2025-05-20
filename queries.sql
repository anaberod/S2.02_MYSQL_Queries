USE tienda;

-- 1. List the name of all products in the product table.
SELECT nombre FROM producto;

-- 2. List the names and prices of all products in the product table.
SELECT nombre, precio FROM producto;

-- 3. List all columns of the product table.
SELECT * FROM producto;

-- 4. List product names, prices in euros, and prices in USD (1 EUR = 1.08 USD).
SELECT nombre, precio, precio * 1.08 AS precio_usd FROM producto;

-- 5. Same as above, with column aliases.
SELECT nombre AS 'nombre de producto', precio AS euros, precio * 1.08 AS dólares FROM producto;

-- 6. List product names in uppercase along with their prices.
SELECT UPPER(nombre), precio FROM producto;

-- 7. List product names in lowercase along with their prices.
SELECT LOWER(nombre), precio FROM producto;

-- 8. List manufacturer names and the first two characters in uppercase.
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;

-- 9. List product names and their prices rounded to the nearest integer.
SELECT nombre, ROUND(precio) FROM producto;

-- 10. List product names and their prices truncated to whole numbers.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

-- 11. List manufacturer codes of products in the product table.
SELECT codigo_fabricante FROM producto;

-- 12. List unique manufacturer codes of products in the product table.
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13. List manufacturer names in ascending order.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. List manufacturer names in descending order.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. List product names ordered by name ascending, then price descending.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. List the first 5 rows from the manufacturer table.
SELECT * FROM fabricante LIMIT 5;

-- 17. List 2 rows starting from the 4th row (inclusive) from the manufacturer table.
SELECT * FROM fabricante LIMIT 3 OFFSET 3;

-- 18. List the name and price of the cheapest product.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. List the name and price of the most expensive product.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. List names of all products from manufacturer with code 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21. List product name, price, and manufacturer name for all products.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22. Same as above, but sorted by manufacturer name.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;

-- 23. List product code, name, manufacturer code, and manufacturer name for all products.
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 24. List name, price, and manufacturer name of the cheapest product.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio ASC LIMIT 1;

-- 25. List name, price, and manufacturer name of the most expensive product.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;

-- 26. List all products from the manufacturer Lenovo.
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

-- 27. List all products from manufacturer Crucial with price greater than 200.
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Crucial') AND precio > 200;

-- 28. List all products from manufacturers Asus, Hewlett-Packard, and Seagate without using IN.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

-- 29. List all products from manufacturers Asus, Hewlett-Packard, and Seagate using IN.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30. List product names and prices from manufacturers whose name ends with 'e'.
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';

-- 31. List product names and prices where manufacturer name contains 'w'.
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';

-- 32. List product name, price, and manufacturer for products priced >= 180, ordered by price DESC, then name ASC.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

-- 33. List manufacturer code and name for manufacturers with associated products.
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 34. List all manufacturers and their products, including those with no products.
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 35. List manufacturers with no associated products.
SELECT fabricante.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo IS NULL;

-- 36. List all products from manufacturer Lenovo without using INNER JOIN.
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

-- 37. List all products with the same price as the most expensive product from Lenovo.
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 38. List the name of the most expensive product from Lenovo.
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 39. List the name of the cheapest product from Hewlett-Packard.
SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard'));

-- 40. List all products with price greater than or equal to the most expensive Lenovo product.
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 41. List all products from Asus that have a price above the average price of Asus products.
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));

USE universidad;

-- 42. Return first surname, second surname, and name of all students ordered alphabetically
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;

-- 43. Find students who have not registered a phone number
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

-- 44. List students born in 1999
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 45. List professors without a phone number and whose NIF ends in 'K'
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 46. List subjects in the first semester of the third year of degree with ID 7
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 47. List professors with their department name ordered by surnames and name
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM profesor pr JOIN persona p ON pr.id_profesor = p.id JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 48. List subject names and academic years for student with NIF '26902806M'
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura am JOIN persona p ON am.id_alumno = p.id JOIN asignatura a ON am.id_asignatura = a.id JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE p.nif = '26902806M';

-- 49. List departments with professors teaching in 'Grado en Ingeniería Informática (Plan 2015)'
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 50. List students enrolled in any subject during the 2018/2019 academic year
SELECT DISTINCT p.* FROM alumno_se_matricula_asignatura am JOIN persona p ON am.id_alumno = p.id JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

-- 51. List all professors and their departments including those with no department
SELECT d.nombre AS department, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 52. List professors not assigned to any department
SELECT p.* FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor WHERE p.tipo = 'profesor' AND pr.id_profesor IS NULL;

-- 53. List departments with no professors
SELECT d.* FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NULL;

-- 54. List professors who do not teach any subject
SELECT p.* FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;

-- 55. List subjects without a professor assigned
SELECT * FROM asignatura WHERE id_profesor IS NULL;

-- 56. List departments that have not taught any subject
SELECT d.* FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;

-- 57. Count total number of students
SELECT COUNT(*) AS total_students FROM persona WHERE tipo = 'alumno';

-- 58. Count number of students born in 1999
SELECT COUNT(*) AS students_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 59. Count professors per department (only those with professors)
SELECT d.nombre AS department, COUNT(*) AS num_professors FROM profesor pr JOIN departamento d ON pr.id_departamento = d.id GROUP BY d.id ORDER BY num_professors DESC;

-- 60. Count professors per department (including departments without professors)
SELECT d.nombre AS department, COUNT(pr.id_profesor) AS num_professors FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.id;

-- 61. Count subjects per degree (including degrees without subjects)
SELECT g.nombre AS degree, COUNT(a.id) AS num_subjects FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id ORDER BY num_subjects DESC;

-- 62. List degrees with more than 40 subjects
SELECT g.nombre AS degree, COUNT(a.id) AS num_subjects FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id HAVING COUNT(a.id) > 40;

-- 63. Sum total credits by subject type and degree
SELECT g.nombre AS degree, a.tipo, SUM(a.creditos) AS total_credits FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id, a.tipo;

-- 64. Count students enrolled in any subject per academic year
SELECT ce.anyo_inicio, COUNT(DISTINCT am.id_alumno) AS num_students FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar GROUP BY ce.id;

-- 65. Count subjects each professor teaches (including those with none)
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS num_subjects FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor GROUP BY p.id ORDER BY num_subjects DESC;

-- 66. Show all data of the youngest student
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;

-- 67. List professors who have a department but do not teach any subject
SELECT p.* FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;


