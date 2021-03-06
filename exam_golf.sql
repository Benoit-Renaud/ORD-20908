GO
/****** Object:  Table [dbo].[Golfeur]    Script Date: 2018-10-19 6:10:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Golfeur](
	[id] [int] NOT NULL,
	[Prenom] [nvarchar](50) NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Golfeur] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GolfeurATrou]    Script Date: 2018-10-19 6:10:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GolfeurATrou](
	[golfeur_id] [int] NOT NULL,
	[trou_id] [int] NOT NULL,
	[resultat] [int] NULL,
 CONSTRAINT [PK_GolfeurATrou] PRIMARY KEY CLUSTERED 
(
	[golfeur_id] ASC,
	[trou_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournoi]    Script Date: 2018-10-19 6:10:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournoi](
	[id] [int] NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tournoi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trou]    Script Date: 2018-10-19 6:10:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trou](
	[id] [int] NOT NULL,
	[tournoi_id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[par] [int] NOT NULL,
 CONSTRAINT [PK_Trou] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GolfeurATrou]  WITH CHECK ADD  CONSTRAINT [FK_GolfeurATrou_Golfeur] FOREIGN KEY([golfeur_id])
REFERENCES [dbo].[Golfeur] ([id])
GO
ALTER TABLE [dbo].[GolfeurATrou] CHECK CONSTRAINT [FK_GolfeurATrou_Golfeur]
GO
ALTER TABLE [dbo].[GolfeurATrou]  WITH CHECK ADD  CONSTRAINT [FK_GolfeurATrou_Trou] FOREIGN KEY([trou_id])
REFERENCES [dbo].[Trou] ([id])
GO
ALTER TABLE [dbo].[GolfeurATrou] CHECK CONSTRAINT [FK_GolfeurATrou_Trou]
GO
ALTER TABLE [dbo].[Trou]  WITH CHECK ADD  CONSTRAINT [FK_Trou_Tournoi] FOREIGN KEY([tournoi_id])
REFERENCES [dbo].[Tournoi] ([id])
GO
ALTER TABLE [dbo].[Trou] CHECK CONSTRAINT [FK_Trou_Tournoi]
GO
