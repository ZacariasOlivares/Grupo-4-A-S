#Inscribir o insertar un nuevo estudiante, profesor o asistente de la educación.
Insert into usuario (idUsuario,Funcion_idFuncion,Nombre,EstadoUsuario_idEstado_Usuario) values("203348613","1","Ernesto Manzanares","1");

#Inscribir o insertar un nuevo libro.
insert into libro (idLibro,Autor_idAutor,Editorial_idEditorial,titulo,fecha_de_publicacion,Estado_idEstado) values ("52","5","5","Shakuntala","1992-05-04","1");

#Préstamos de libros a estudiante, profesor o asistente de la educación.
Insert into Prestamo (idPrestamo,Usuario_idUsuario,Libro_idLibro,Fecha_Prestamo,Fecha_Devolucion,Estadoprestamo_idEstadoprestamo) values ("11","21342563","12","2021/09/28","2021/10/08","1");

#Devolución de libros por parte de un estudiante, profesor o asistente de la educación.
Update Prestamo set Estadoprestamo_idEstadoprestamo = 2 where idPrestamo = 1;

#Verificar el stock de los libros en la biblioteca y los que están en calidad de préstamos.
SELECT count(DISTINCT idLibro) as Stock, count(idPrestamo) as Prestados FROM libro left JOIN prestamo 
ON Libro_idLibro = idLibro and Estado_idEstado = EstadoPrestamo_idEstadoPrestamo where Estado_idEstado=1;

#Renovar el préstamo de un libro a un estudiante, profesor o asistente de la educación
Update prestamo set  fecha_Devolucion = "2021/10/08" where idPrestamo = 1;

#Dar de baja un libro, que no es eliminarlo, sino un cambio de estado.
Update libro set Estado_idEstado = 2 where idLibro = 49;

#Informar la cantidad de libros en préstamos (id libro, nombre libro, fecha de préstamo, fecha de devolución, id usuario y nombre usuario).
select idUsuario, Nombre, Libro_idLibro, Titulo, Fecha_Prestamo, Fecha_Devolucion 
from Prestamo inner join usuario ON prestamo.Usuario_idUsuario = usuario.idUsuario 
inner join libro ON prestamo.Libro_idLibro = libro.idLibro
where estadoprestamo_idEstadoPrestamo = 1;


#Eliminar o cambiar de estado a un usuario de la base de datos.
update usuario set EstadoUsuario_idEstado_Usuario = 2 where idUsuario = (idUsuario);
