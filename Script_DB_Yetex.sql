USE [EmpresaYetex]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Nit_Cliente] [bigint] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[Contacto] [varchar](100) NULL,
	[Mail] [varchar](100) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Nit_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[Id_Color] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion_Color] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id_Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Costo_Producto]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costo_Producto](
	[Id_Costo_Producto] [bigint] IDENTITY(1,1) NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[CostoxUnidad] [money] NOT NULL,
	[Fecha_Inicial] [datetime] NOT NULL,
	[Fecha_Final] [datetime] NULL,
 CONSTRAINT [PK_CostoProducto] PRIMARY KEY CLUSTERED 
(
	[Id_Costo_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detalle_Pedido]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Detalle_Pedido](
	[Id_Detalle_Pedido] [bigint] IDENTITY(1,1) NOT NULL,
	[Orden_Pedido] [bigint] NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Id_Color] [smallint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Id_Logotipo] [int] NOT NULL,
	[Observaciones] [varchar](2000) NULL,
	[Valor_Venta_Unitario] [money] NOT NULL,
 CONSTRAINT [PK_DetallePedido] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[Id_Estado] [bigint] IDENTITY(1,1) NOT NULL,
	[Fecha_Estado] [datetime] NOT NULL,
	[Orden_Pedido] [bigint] NOT NULL,
	[Descripcion_Estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Id_Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Forma_Pago]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Forma_Pago](
	[Id_Forma_Pago] [bigint] IDENTITY(1,1) NOT NULL,
	[Fecha_Pago] [datetime] NOT NULL,
	[Orden_Pedido] [bigint] NOT NULL,
	[Descripcion_Forma_Pago] [varchar](20) NOT NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_FormaPago] PRIMARY KEY CLUSTERED 
(
	[Id_Forma_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logotipo]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logotipo](
	[Id_Logotipo] [int] IDENTITY(1,1) NOT NULL,
	[Url_Imagen] [varchar](255) NOT NULL,
	[Fecha_Carga] [datetime] NOT NULL,
 CONSTRAINT [PK_Logotipo] PRIMARY KEY CLUSTERED 
(
	[Id_Logotipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Orden_Pedido] [bigint] IDENTITY(1,1) NOT NULL,
	[Fecha_Pedido] [datetime] NOT NULL,
	[Nit_Cliente] [bigint] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[Orden_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prenda]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prenda](
	[Id_Prenda] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_Prenda] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Prenda] PRIMARY KEY CLUSTERED 
(
	[Id_Prenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Id_Prenda] [int] NOT NULL,
	[Id_Tipo_Prenda] [int] NOT NULL,
	[Talla] [varchar](10) NOT NULL,
	[CostoxUnidad] [money] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_Prenda]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Prenda](
	[Id_Tipo_Prenda] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_Tipo_Prenda] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TipoPrenda] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_Prenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_Usuario]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Usuario](
	[Id_Tipo_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_Tipo_Usuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/10/2015 5:01:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Cedula] [bigint] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](300) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Id_Tipo_Usuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Cliente] ([Nit_Cliente], [Nombre], [Direccion], [Telefono], [Ciudad], [Contacto], [Mail]) VALUES (121, N'Colegio la Inmaculada', N'Cra 54 # 20-89', N'5256262', N'Medellin', N'Nicolas Arboleda', N'abc@gmail.com')
GO
INSERT [dbo].[Cliente] ([Nit_Cliente], [Nombre], [Direccion], [Telefono], [Ciudad], [Contacto], [Mail]) VALUES (122, N'Invamer S.A.S.', N'Cll 32F # 81-47', N'2507080', N'Medellin', N'Jorge Londoño', N'def@gmail.com')
GO
INSERT [dbo].[Cliente] ([Nit_Cliente], [Nombre], [Direccion], [Telefono], [Ciudad], [Contacto], [Mail]) VALUES (123, N'Colegio El Buen Consejo', N'Diag 23 # 34-90', N'2983049', N'Bello', N'Rigoberta Cuartas', N'ghi@gmail.com')
GO
INSERT [dbo].[Cliente] ([Nit_Cliente], [Nombre], [Direccion], [Telefono], [Ciudad], [Contacto], [Mail]) VALUES (124, N'Acería Metallica S.A', N'Cra 43 # 39-09', N'7838748', N'Itagui', N'Bibiana Morales', N'bibiana.marcela@hotmail.es')
GO
INSERT [dbo].[Cliente] ([Nit_Cliente], [Nombre], [Direccion], [Telefono], [Ciudad], [Contacto], [Mail]) VALUES (125, N'Almacenes El Dorado', N'Cll 52 # 25-52', N'2522255', N'Medellin', N'Adriana Lopera', N'jkl@gmail.com')
GO
INSERT [dbo].[Cliente] ([Nit_Cliente], [Nombre], [Direccion], [Telefono], [Ciudad], [Contacto], [Mail]) VALUES (126, N'Colegio El Rosario', N'Cll 57 # 19 -33', N'3015526655', N'Bello', N'Johan Sanchez', N'mno@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

GO
INSERT [dbo].[Color] ([Id_Color], [Descripcion_Color]) VALUES (1, N'Rojo')
GO
INSERT [dbo].[Color] ([Id_Color], [Descripcion_Color]) VALUES (2, N'Verde')
GO
INSERT [dbo].[Color] ([Id_Color], [Descripcion_Color]) VALUES (3, N'Azul')
GO
INSERT [dbo].[Color] ([Id_Color], [Descripcion_Color]) VALUES (4, N'Amarillo')
GO
INSERT [dbo].[Color] ([Id_Color], [Descripcion_Color]) VALUES (5, N'Negro')
GO
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Costo_Producto] ON 

GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (1, 1, 10200.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (2, 2, 10100.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (3, 3, 12200.0000, CAST(N'2015-02-02 00:00:00.000' AS DateTime), CAST(N'2015-03-31 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (4, 3, 12900.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (5, 4, 11000.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (6, 5, 9900.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (7, 6, 9800.0000, CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2015-03-31 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (8, 6, 10100.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (9, 7, 10100.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (10, 8, 10100.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (11, 9, 15400.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (12, 10, 12300.0000, CAST(N'2014-10-02 00:00:00.000' AS DateTime), CAST(N'2015-01-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (13, 10, 13100.0000, CAST(N'2015-01-24 00:00:00.000' AS DateTime), CAST(N'2015-03-31 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (14, 10, 14600.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (15, 11, 19900.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (16, 12, 20000.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (17, 13, 18000.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (18, 14, 18700.0000, CAST(N'2015-02-13 00:00:00.000' AS DateTime), CAST(N'2015-03-31 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (19, 14, 19000.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (20, 15, 16800.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (21, 16, 16900.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (22, 17, 17100.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (23, 18, 17200.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (24, 19, 8200.0000, CAST(N'2015-01-09 00:00:00.000' AS DateTime), CAST(N'2015-03-31 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (25, 19, 8700.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Costo_Producto] ([Id_Costo_Producto], [Id_Producto], [CostoxUnidad], [Fecha_Inicial], [Fecha_Final]) VALUES (26, 20, 7700.0000, CAST(N'2015-04-01 00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Costo_Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle_Pedido] ON 

GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (1, 1, 3, 2, 360, 2, NULL, 25600.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (2, 1, 8, 5, 120, 2, NULL, 33100.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (3, 2, 1, 1, 280, 1, NULL, 28400.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (4, 2, 2, 4, 110, 1, N'Observación cualquiera', 34500.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (5, 2, 4, 1, 150, 2, NULL, 20100.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (6, 2, 19, 5, 330, 1, NULL, 20600.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (7, 3, 10, 4, 240, 1, NULL, 43100.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (8, 3, 11, 2, 230, 3, N'Observación cualquiera', 33000.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (9, 3, 15, 2, 270, 1, NULL, 28900.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (10, 4, 5, 1, 310, 3, NULL, 28200.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (11, 4, 9, 3, 150, 1, NULL, 31600.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (12, 5, 2, 1, 390, 2, N'Observación cualquiera', 25700.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (13, 5, 6, 2, 420, 1, NULL, 21600.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (14, 6, 1, 3, 300, 1, NULL, 32500.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (15, 6, 12, 4, 180, 1, NULL, 42800.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (16, 6, 15, 3, 490, 1, NULL, 32900.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (17, 6, 19, 1, 480, 2, N'Observación cualquiera', 29500.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (18, 7, 3, 4, 470, 1, NULL, 42200.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (19, 8, 1, 3, 330, 1, NULL, 22100.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (20, 8, 12, 3, 460, 2, NULL, 46000.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (21, 8, 17, 2, 240, 1, NULL, 32000.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (22, 8, 20, 2, 480, 3, N'Observación cualquiera', 18000.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (23, 9, 1, 4, 190, 2, NULL, 32400.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (24, 9, 12, 3, 340, 2, NULL, 48400.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (25, 9, 18, 1, 340, 2, NULL, 31800.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (26, 10, 1, 2, 380, 2, NULL, 33700.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (27, 10, 2, 3, 420, 1, N'Observación cualquiera', 37800.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (28, 10, 15, 3, 460, 1, NULL, 43400.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (29, 11, 1, 4, 210, 2, NULL, 25200.0000)
GO
INSERT [dbo].[Detalle_Pedido] ([Id_Detalle_Pedido], [Orden_Pedido], [Id_Producto], [Id_Color], [Cantidad], [Id_Logotipo], [Observaciones], [Valor_Venta_Unitario]) VALUES (30, 11, 17, 2, 280, 1, NULL, 41500.0000)
GO
SET IDENTITY_INSERT [dbo].[Detalle_Pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 

GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (1, CAST(N'2014-12-11 00:00:00.000' AS DateTime), 1, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (2, CAST(N'2014-12-20 00:00:00.000' AS DateTime), 1, N'Terminado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (3, CAST(N'2014-12-21 00:00:00.000' AS DateTime), 1, N'Entregado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (4, CAST(N'2015-01-26 00:00:00.000' AS DateTime), 2, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (5, CAST(N'2015-01-31 00:00:00.000' AS DateTime), 2, N'Terminado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (6, CAST(N'2015-02-02 00:00:00.000' AS DateTime), 2, N'Entregado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (7, CAST(N'2015-04-02 00:00:00.000' AS DateTime), 3, N'En espera')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (8, CAST(N'2015-04-04 00:00:00.000' AS DateTime), 3, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (9, CAST(N'2015-04-13 00:00:00.000' AS DateTime), 3, N'Terminado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (10, CAST(N'2015-04-15 00:00:00.000' AS DateTime), 3, N'Entregado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (11, CAST(N'2015-04-03 00:00:00.000' AS DateTime), 4, N'En espera')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (12, CAST(N'2015-04-03 00:00:00.000' AS DateTime), 4, N'Cancelado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (13, CAST(N'2015-04-03 00:00:00.000' AS DateTime), 5, N'En espera')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (14, CAST(N'2015-04-06 00:00:00.000' AS DateTime), 5, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (15, CAST(N'2015-04-14 00:00:00.000' AS DateTime), 5, N'Terminado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (16, CAST(N'2015-04-14 00:00:00.000' AS DateTime), 5, N'Entregado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (17, CAST(N'2015-04-06 00:00:00.000' AS DateTime), 6, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (18, CAST(N'2015-04-08 00:00:00.000' AS DateTime), 6, N'Suspendido')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (19, CAST(N'2015-04-15 00:00:00.000' AS DateTime), 7, N'En espera')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (20, CAST(N'2015-04-19 00:00:00.000' AS DateTime), 7, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (21, CAST(N'2015-04-29 00:00:00.000' AS DateTime), 7, N'Terminado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (22, CAST(N'2015-04-30 00:00:00.000' AS DateTime), 7, N'Entregado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (23, CAST(N'2015-04-18 00:00:00.000' AS DateTime), 8, N'En espera')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (24, CAST(N'2015-04-24 00:00:00.000' AS DateTime), 8, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (25, CAST(N'2015-04-25 00:00:00.000' AS DateTime), 8, N'Suspendido')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (26, CAST(N'2015-04-22 00:00:00.000' AS DateTime), 9, N'En espera')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (27, CAST(N'2015-04-29 00:00:00.000' AS DateTime), 9, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (28, CAST(N'2015-05-15 00:00:00.000' AS DateTime), 9, N'Terminado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (29, CAST(N'2015-05-16 00:00:00.000' AS DateTime), 9, N'Entregado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (30, CAST(N'2015-04-23 00:00:00.000' AS DateTime), 10, N'En espera')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (31, CAST(N'2015-04-26 00:00:00.000' AS DateTime), 10, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (32, CAST(N'2015-05-10 00:00:00.000' AS DateTime), 10, N'Terminado')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (33, CAST(N'2015-05-01 00:00:00.000' AS DateTime), 11, N'En espera')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (34, CAST(N'2015-05-04 00:00:00.000' AS DateTime), 11, N'En proceso')
GO
INSERT [dbo].[Estado] ([Id_Estado], [Fecha_Estado], [Orden_Pedido], [Descripcion_Estado]) VALUES (35, CAST(N'2015-05-14 00:00:00.000' AS DateTime), 11, N'Terminado')
GO
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Forma_Pago] ON 

GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (1, CAST(N'2014-12-11 00:00:00.000' AS DateTime), 1, N'Efectivo', 58700.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (2, CAST(N'2015-01-26 00:00:00.000' AS DateTime), 2, N'Efectivo', 60000.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (3, CAST(N'2015-01-26 00:00:00.000' AS DateTime), 2, N'Cheque', 43600.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (4, CAST(N'2015-04-02 00:00:00.000' AS DateTime), 3, N'Cheque', 105000.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (5, CAST(N'2015-04-03 00:00:00.000' AS DateTime), 4, N'Efectivo', 59800.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (6, CAST(N'2015-04-03 00:00:00.000' AS DateTime), 5, N'Efectivo', 30000.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (7, CAST(N'2015-04-14 00:00:00.000' AS DateTime), 5, N'Efectivo', 17300.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (8, CAST(N'2015-04-06 00:00:00.000' AS DateTime), 6, N'Efectivo', 56000.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (9, CAST(N'2015-04-15 00:00:00.000' AS DateTime), 7, N'Efectivo', 20000.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (10, CAST(N'2015-04-15 00:00:00.000' AS DateTime), 7, N'Cheque', 10000.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (11, CAST(N'2015-04-18 00:00:00.000' AS DateTime), 7, N'Tarjeta de crédito', 12200.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (12, CAST(N'2015-04-22 00:00:00.000' AS DateTime), 9, N'Efectivo', 112600.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (13, CAST(N'2015-04-23 00:00:00.000' AS DateTime), 10, N'Efectivo', 114900.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (14, CAST(N'2015-05-01 00:00:00.000' AS DateTime), 11, N'Efectivo', 20000.0000)
GO
INSERT [dbo].[Forma_Pago] ([Id_Forma_Pago], [Fecha_Pago], [Orden_Pedido], [Descripcion_Forma_Pago], [Valor]) VALUES (15, CAST(N'2015-05-14 00:00:00.000' AS DateTime), 11, N'Tarjeta de crédito', 46700.0000)
GO
SET IDENTITY_INSERT [dbo].[Forma_Pago] OFF
GO
SET IDENTITY_INSERT [dbo].[Logotipo] ON 

GO
INSERT [dbo].[Logotipo] ([Id_Logotipo], [Url_Imagen], [Fecha_Carga]) VALUES (1, N'D:\Logotipos_Yetex\Logotipo1.jpg', CAST(N'2014-04-15 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logotipo] ([Id_Logotipo], [Url_Imagen], [Fecha_Carga]) VALUES (2, N'D:\Logotipos_Yetex\Logotipo2.jpg', CAST(N'2014-05-20 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Logotipo] ([Id_Logotipo], [Url_Imagen], [Fecha_Carga]) VALUES (3, N'D:\Logotipos_Yetex\Logotipo2.png', CAST(N'2014-06-02 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Logotipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido] ON 

GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (1, CAST(N'2014-12-11 00:00:00.000' AS DateTime), 121)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (2, CAST(N'2015-01-26 00:00:00.000' AS DateTime), 122)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (3, CAST(N'2015-04-02 00:00:00.000' AS DateTime), 123)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (4, CAST(N'2015-04-03 00:00:00.000' AS DateTime), 124)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (5, CAST(N'2015-04-03 00:00:00.000' AS DateTime), 125)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (6, CAST(N'2015-04-06 00:00:00.000' AS DateTime), 126)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (7, CAST(N'2015-04-15 00:00:00.000' AS DateTime), 121)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (8, CAST(N'2015-04-18 00:00:00.000' AS DateTime), 122)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (9, CAST(N'2015-04-22 00:00:00.000' AS DateTime), 123)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (10, CAST(N'2015-04-23 00:00:00.000' AS DateTime), 124)
GO
INSERT [dbo].[Pedido] ([Orden_Pedido], [Fecha_Pedido], [Nit_Cliente]) VALUES (11, CAST(N'2015-05-01 00:00:00.000' AS DateTime), 125)
GO
SET IDENTITY_INSERT [dbo].[Pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[Prenda] ON 

GO
INSERT [dbo].[Prenda] ([Id_Prenda], [Descripcion_Prenda]) VALUES (1, N'Camisa')
GO
INSERT [dbo].[Prenda] ([Id_Prenda], [Descripcion_Prenda]) VALUES (2, N'Sudadera')
GO
INSERT [dbo].[Prenda] ([Id_Prenda], [Descripcion_Prenda]) VALUES (3, N'Buso')
GO
INSERT [dbo].[Prenda] ([Id_Prenda], [Descripcion_Prenda]) VALUES (4, N'Blue Jean')
GO
INSERT [dbo].[Prenda] ([Id_Prenda], [Descripcion_Prenda]) VALUES (5, N'Pantaloneta')
GO
SET IDENTITY_INSERT [dbo].[Prenda] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (1, 1, 2, N'S', 10200.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (2, 1, 1, N'M', 10100.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (3, 1, 3, N'XXL', 12900.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (4, 1, 4, N'S', 11000.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (5, 1, 5, N'L', 9900.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (6, 1, 5, N'XL', 10100.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (7, 1, 5, N'XS', 10100.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (8, 1, 6, N'L', 10100.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (9, 2, 7, N'XS', 15400.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (10, 2, 8, N'L', 14600.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (11, 2, 9, N'S', 19900.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (12, 2, 9, N'M', 20000.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (13, 3, 10, N'XS', 18000.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (14, 3, 7, N'S', 19000.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (15, 4, 11, N'XS', 16800.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (16, 4, 11, N'S', 16900.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (17, 4, 11, N'M', 17100.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (18, 4, 11, N'L', 17200.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (19, 5, 10, N'S', 8700.0000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Prenda], [Id_Tipo_Prenda], [Talla], [CostoxUnidad]) VALUES (20, 5, 9, N'XS', 7700.0000)
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Prenda] ON 

GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (1, N'Polo')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (2, N'Perilla')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (3, N'Cuello en V')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (4, N'Cuello redondo')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (5, N'Cuello de la misma tela')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (6, N'Cuello en rib')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (7, N'Impermeable')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (8, N'Perchada')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (9, N'Olímpica')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (10, N'Perchado algodón')
GO
INSERT [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda], [Descripcion_Tipo_Prenda]) VALUES (11, N'Colegial')
GO
SET IDENTITY_INSERT [dbo].[Tipo_Prenda] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] ON 

GO
INSERT [dbo].[Tipo_Usuario] ([Id_Tipo_Usuario], [Descripcion_Tipo_Usuario]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[Tipo_Usuario] ([Id_Tipo_Usuario], [Descripcion_Tipo_Usuario]) VALUES (2, N'Usuario')
GO
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] OFF
GO
INSERT [dbo].[Usuario] ([Cedula], [Nombre], [Login], [Password], [Email], [Id_Tipo_Usuario]) VALUES (123, N'Johan Diez', N'xander', N'12345', N'xander10@hotmail.com', 1)
GO
INSERT [dbo].[Usuario] ([Cedula], [Nombre], [Login], [Password], [Email], [Id_Tipo_Usuario]) VALUES (6500437, N'Julian Montoya', N'montoyesco', N'0596', N'montoyesco@hotmail.com', 1)
GO
ALTER TABLE [dbo].[Costo_Producto]  WITH CHECK ADD  CONSTRAINT [FK_CostoProducto_Producto] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Costo_Producto] CHECK CONSTRAINT [FK_CostoProducto_Producto]
GO
ALTER TABLE [dbo].[Detalle_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_Color] FOREIGN KEY([Id_Color])
REFERENCES [dbo].[Color] ([Id_Color])
GO
ALTER TABLE [dbo].[Detalle_Pedido] CHECK CONSTRAINT [FK_DetallePedido_Color]
GO
ALTER TABLE [dbo].[Detalle_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_Logotipo] FOREIGN KEY([Id_Logotipo])
REFERENCES [dbo].[Logotipo] ([Id_Logotipo])
GO
ALTER TABLE [dbo].[Detalle_Pedido] CHECK CONSTRAINT [FK_DetallePedido_Logotipo]
GO
ALTER TABLE [dbo].[Detalle_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_Pedido] FOREIGN KEY([Orden_Pedido])
REFERENCES [dbo].[Pedido] ([Orden_Pedido])
GO
ALTER TABLE [dbo].[Detalle_Pedido] CHECK CONSTRAINT [FK_DetallePedido_Pedido]
GO
ALTER TABLE [dbo].[Detalle_Pedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallePedido_Producto] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Detalle_Pedido] CHECK CONSTRAINT [FK_DetallePedido_Producto]
GO
ALTER TABLE [dbo].[Estado]  WITH CHECK ADD  CONSTRAINT [FK_Estado_Pedido] FOREIGN KEY([Orden_Pedido])
REFERENCES [dbo].[Pedido] ([Orden_Pedido])
GO
ALTER TABLE [dbo].[Estado] CHECK CONSTRAINT [FK_Estado_Pedido]
GO
ALTER TABLE [dbo].[Forma_Pago]  WITH CHECK ADD  CONSTRAINT [FK_FormaPago_Pedido] FOREIGN KEY([Orden_Pedido])
REFERENCES [dbo].[Pedido] ([Orden_Pedido])
GO
ALTER TABLE [dbo].[Forma_Pago] CHECK CONSTRAINT [FK_FormaPago_Pedido]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Cliente] FOREIGN KEY([Nit_Cliente])
REFERENCES [dbo].[Cliente] ([Nit_Cliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Cliente]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Prenda] FOREIGN KEY([Id_Prenda])
REFERENCES [dbo].[Prenda] ([Id_Prenda])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Prenda]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_TipoPrenda] FOREIGN KEY([Id_Tipo_Prenda])
REFERENCES [dbo].[Tipo_Prenda] ([Id_Tipo_Prenda])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_TipoPrenda]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([Id_Tipo_Usuario])
REFERENCES [dbo].[Tipo_Usuario] ([Id_Tipo_Usuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
ALTER TABLE [dbo].[Estado]  WITH CHECK ADD CHECK  (([Descripcion_Estado]='Cancelado' OR [Descripcion_Estado]='Suspendido' OR [Descripcion_Estado]='En espera' OR [Descripcion_Estado]='En proceso' OR [Descripcion_Estado]='Terminado' OR [Descripcion_Estado]='Entregado'))
GO
ALTER TABLE [dbo].[Forma_Pago]  WITH CHECK ADD CHECK  (([Descripcion_Forma_Pago]='Saldo pendiente' OR [Descripcion_Forma_Pago]='Tarjeta de crédito' OR [Descripcion_Forma_Pago]='Cheque' OR [Descripcion_Forma_Pago]='Efectivo'))
GO
