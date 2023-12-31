USE [Bankomat]
GO
/****** Object:  Table [dbo].[Banca]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banca](
	[codBanca] [int] NOT NULL,
	[nome] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codBanca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banca_Funzionalità]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banca_Funzionalità](
	[codBanca] [int] NOT NULL,
	[id_funzionalità] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codBanca] ASC,
	[id_funzionalità] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banche]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banche](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Banche] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banche_Funzionalita]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banche_Funzionalita](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdBanca] [bigint] NOT NULL,
	[IdFunzionalita] [bigint] NOT NULL,
 CONSTRAINT [PK_Banche_Funzionalita] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContiCorrente]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContiCorrente](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUtente] [bigint] NOT NULL,
	[Saldo] [int] NOT NULL,
	[DataUltimaOperazione] [date] NOT NULL,
 CONSTRAINT [PK_ContiCorrente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContoCorrente]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContoCorrente](
	[id_contocorrente] [int] NOT NULL,
	[saldo] [float] NOT NULL,
	[data] [date] NOT NULL,
	[id_utente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_contocorrente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funzionalita]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funzionalita](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Funzionalita] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funzionalità]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funzionalità](
	[id_funzionalità] [int] NOT NULL,
	[tipo] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_funzionalità] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimenti]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimenti](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[NomeBanca] [nchar](10) NOT NULL,
	[NomeUtente] [nchar](10) NOT NULL,
	[Funzionalita] [varchar](50) NOT NULL,
	[Quantita] [int] NOT NULL,
	[DataOperazione] [date] NOT NULL,
 CONSTRAINT [PK_Movimenti] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisroOperazioni]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisroOperazioni](
	[codiceBanca] [int] NOT NULL,
	[id_utente] [int] NOT NULL,
	[id_contocorrente] [int] NOT NULL,
	[importo] [float] NOT NULL,
	[data] [date] NOT NULL,
	[id_funzionalità] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codiceBanca] ASC,
	[id_utente] ASC,
	[id_contocorrente] ASC,
	[id_funzionalità] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utente]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utente](
	[id_utente] [int] NOT NULL,
	[username] [varchar](15) NOT NULL,
	[password] [varchar](15) NOT NULL,
	[codBanca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_utente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utenti]    Script Date: 29/09/2023 16:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utenti](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdBanca] [bigint] NOT NULL,
	[NomeUtente] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Bloccato] [bit] NOT NULL,
 CONSTRAINT [PK_Utenti] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Banca_Funzionalità]  WITH CHECK ADD FOREIGN KEY([codBanca])
REFERENCES [dbo].[Banca] ([codBanca])
GO
ALTER TABLE [dbo].[Banca_Funzionalità]  WITH CHECK ADD FOREIGN KEY([id_funzionalità])
REFERENCES [dbo].[Funzionalità] ([id_funzionalità])
GO
ALTER TABLE [dbo].[Banche_Funzionalita]  WITH CHECK ADD  CONSTRAINT [FK_Banche_Funzionalita_Banche] FOREIGN KEY([IdBanca])
REFERENCES [dbo].[Banche] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Banche_Funzionalita] CHECK CONSTRAINT [FK_Banche_Funzionalita_Banche]
GO
ALTER TABLE [dbo].[Banche_Funzionalita]  WITH CHECK ADD  CONSTRAINT [FK_Banche_Funzionalita_Funzionalita] FOREIGN KEY([IdFunzionalita])
REFERENCES [dbo].[Funzionalita] ([Id])
GO
ALTER TABLE [dbo].[Banche_Funzionalita] CHECK CONSTRAINT [FK_Banche_Funzionalita_Funzionalita]
GO
ALTER TABLE [dbo].[ContiCorrente]  WITH CHECK ADD  CONSTRAINT [FK_ContiCorrente_Utenti] FOREIGN KEY([IdUtente])
REFERENCES [dbo].[Utenti] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContiCorrente] CHECK CONSTRAINT [FK_ContiCorrente_Utenti]
GO
ALTER TABLE [dbo].[ContoCorrente]  WITH CHECK ADD FOREIGN KEY([id_utente])
REFERENCES [dbo].[Utente] ([id_utente])
GO
ALTER TABLE [dbo].[Utente]  WITH CHECK ADD FOREIGN KEY([codBanca])
REFERENCES [dbo].[Banca] ([codBanca])
GO
ALTER TABLE [dbo].[Utenti]  WITH CHECK ADD  CONSTRAINT [FK_Utenti_Banche] FOREIGN KEY([IdBanca])
REFERENCES [dbo].[Banche] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Utenti] CHECK CONSTRAINT [FK_Utenti_Banche]
GO
