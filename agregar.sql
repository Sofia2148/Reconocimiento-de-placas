USE [lili]
GO

SET ANSI_NULL ON 
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  sp_InsertarModificarRegistro
(
	@Id_peersona int ,
	@Nombre nvarchar(max),
	@Apellido_pa nvarchar(max),
	@Apellido_ma nvarchar(max),
	@Placas nvarchar(max),
	@Imagen image,
	@Marca nvarchar(max),
	@Modelo nvarchar(max),
	@Descripcion nvarchar(max),
	@Direccion nvarchar(max),
	@Telefono nvarchar(max),
	@Cp int,
	@Fecha datetime
)
AS
	IF EXISTS (SELECT * FROM Problema where Id_peersona=@Id_peersona)
		UPDATE Problema
		SET Id_peersona=@Id_peersona,
			Nombre=@Nombre ,
			Apellido_pa=@Apellido_pa ,
			Apellido_ma=@Apellido_ma ,
			Placas=@Placas ,
			Imagen=@Imagen ,
			Marca=@Marca ,
			Modelo=@Modelo ,
			Descripcion=@Descripcion ,
			Direccion=@Direccion ,
			Telefono=@Telefono ,
			Cp=@Cp,
			Fecha=@Fecha
		WHERE Id_peersona=@Id_peersona
	ELSE
		INSERT INTO Problema
		(Id_peersona,Nombre, Apellido_pa , Apellido_ma , placas , Imagen , Marca , Modelo , Descripcion , Direccion , Telefono , Cp , Fecha )
		VALUES 
		(@Id_peersona,@Nombre, @Apellido_pa , @Apellido_ma , @placas , @Imagen , @Marca , @Modelo , @Descripcion , @Direccion , @Telefono , @Cp , @Fecha )