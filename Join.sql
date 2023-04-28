create database empresa;
use empresa;

create table departamento
( id integer not null,
nombre varchar(20),
primary key (id));

create table empleados
(
id_empleado integer not null,
nombre varchar(20),
departamento_id integer,
primary key(id_empleado),
foreign key(departamento_id) references departamento(id));

insert into departamento values(33,'ventas');
insert into departamento values(34,'Ingenieria');
insert into departamento values(35,'Contabilidad');
insert into departamento values(36,'Marketing');
insert into departamento values(37,'Desarrollo');
insert into departamento values(38,'Dibujo');

insert into empleados values(100,'Juan',33);
insert into empleados values(101,'Alex',34);
insert into empleados values(102,'Diego',35);
insert into empleados values(103,'Alberto',33);
insert into empleados values(104,'Cristopher',36);
insert into empleados values(105,'Fabian',35);
#---------------Consultas
select * from empleados;
select * from departamento;
#----------JOIN-------------
select * from empleados e
JOIN departamento d on e.departamento_id=d.id;

select * from departamento d
JOIN empleados e on e.departamento_id=d.id;

#----------LEFT JOIN-------------
select empleados.nombre, departamento.nombre from departamento
LEFT JOIN empleados on empleados.departamento_id=departamento.id;

select empleados.nombre, departamento.nombre from empleados
LEFT JOIN departamento on empleados.departamento_id=departamento.id;

#----------RIGHT JOIN-------------
select empleados.nombre, departamento.nombre from departamento
RIGHT JOIN empleados on empleados.departamento_id=departamento.id;

select empleados.nombre, departamento.nombre from empleados
RIGHT JOIN departamento on empleados.departamento_id=departamento.id;


#----------PROCEDIMIENTOS ALMACENADOS-------------
delimiter $$
create procedure mostrarVariable()
	begin
		declare variable int;
        set variable= 23;
        
        
        select variable;
        
        
end$$
delimiter ;
    
    call mostrarVariable();
    
    drop procedure mostrarVariable;
    
#----------PROCEDIMIENTOS ALMACENADOS-------------
delimiter $$
create procedure suma(a int,b int)
	begin
		declare total int;
        set total= a+b;
        
        
        select total;
        
        
end$$
delimiter ;
call suma(500,300)

#----------PROCEDIMIENTOS ALMACENADOS-------------
delimiter $$
create procedure consulta()
	begin
		
        select * from empleados;
        
        
end$$
delimiter ;
call consulta();

#----------PROCEDIMIENTOS ALMACENADOS-------------
delimiter $$
create procedure consulta2()
	begin
		
        select nombre as Nombre_Departamento from departamento;
        
        
end$$
delimiter ;
call consulta2();

#----------CONSULTA PROCEDIMIENTOS ALMACENADOS-------------
delimiter $$
create procedure consultaEmpleado(id int)
	begin
		
        select * from empleados where id_empleado=id;
        
        
end$$
delimiter ;
call consultaEmpleado(100);

#----------INSERTAR DATOS PROCEDIMIENTOS ALMACENADOS-------------
delimiter $$
create procedure insertarDatos(id int, nombre Varchar(20))
	begin
        insert into departamento
        values(id,nombre);

end$$
delimiter ;
call InsertarDatos(40, "Mantenimiento");
call InsertarDatos(39, "Cobros");

#----------MOSTRAR DATOS PROCEDIMIENTOS ALMACENADOS-------------
delimiter $$
create procedure Dtodo()
	begin
		
        select *  from departamento;
        
        
end$$
delimiter ;
call Dtodo();

#----------MODIFICAR DATOS PROCEDIMIENTOS ALMACENADOS-------------
delimiter $$
create procedure  modificarDatos
	(
	N_id int,
	N_nombre varchar (20),
	N_id_departamento int
     )   
       begin 
       	update empleados set
        id_empleado=N_id,
        nombre=N_nombre,
        departamento_id=N_id_departamento
        where id_empleado=N_id;
end$$
delimiter ;
call modificarDatos(100,"Angel", 40);

#----------ELIMINAR DATOS PROCEDIMIENTOS ALMACENADOS-------------
delimiter $$
create procedure  eliminar_tuplas()
       begin 
       	Delete From empleados where id_empleado=105;
end$$
delimiter ;
call eliminar_tuplas();