USE [master]
GO
/****** Object:  Database [Skola]    Script Date: 26/08/2017 18:04:21 ******/
CREATE DATABASE [Skola]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Skola', FILENAME = N'\\Mac\Home\Documents\Visual Studio 2015\Projects\Seminarski rad\Skola.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Skola_log', FILENAME = N'\\Mac\Home\Documents\Visual Studio 2015\Projects\Seminarski rad\Skola_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Skola] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Skola].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Skola] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Skola] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Skola] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Skola] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Skola] SET ARITHABORT OFF 
GO
ALTER DATABASE [Skola] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Skola] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Skola] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Skola] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Skola] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Skola] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Skola] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Skola] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Skola] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Skola] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Skola] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Skola] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Skola] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Skola] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Skola] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Skola] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Skola] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Skola] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Skola] SET  MULTI_USER 
GO
ALTER DATABASE [Skola] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Skola] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Skola] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Skola] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Skola] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Skola] SET QUERY_STORE = OFF
GO
USE [Skola]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Skola]
GO
/****** Object:  User [test_korisnik]    Script Date: 26/08/2017 18:04:21 ******/
CREATE USER [test_korisnik] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 26/08/2017 18:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 26/08/2017 18:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 26/08/2017 18:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 26/08/2017 18:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 26/08/2017 18:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 26/08/2017 18:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Predbiljezba]    Script Date: 26/08/2017 18:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predbiljezba](
	[IdPredbiljezba] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NOT NULL,
	[Ime] [nvarchar](200) NOT NULL,
	[Prezime] [nvarchar](200) NOT NULL,
	[Adresa] [nvarchar](200) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Telefon] [varchar](25) NOT NULL,
	[Status] [varchar](20) NULL,
	[IdSeminar] [int] NOT NULL,
 CONSTRAINT [PK_Predbiljezba] PRIMARY KEY CLUSTERED 
(
	[IdPredbiljezba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seminar]    Script Date: 26/08/2017 18:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seminar](
	[IdSeminar] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Opis] [varchar](max) NULL,
	[Datum] [date] NOT NULL,
	[Popunjen] [bit] NULL,
	[IdZaposlenik] [int] NULL,
 CONSTRAINT [PK_Seminar] PRIMARY KEY CLUSTERED 
(
	[IdSeminar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zaposlenik]    Script Date: 26/08/2017 18:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposlenik](
	[IdZaposlenik] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](200) NOT NULL,
	[Prezime] [nvarchar](200) NOT NULL,
	[KorisnickoIme] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Zaposlenik] PRIMARY KEY CLUSTERED 
(
	[IdZaposlenik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'613382b9-6e1b-4e87-9711-9620dfd97956', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7aa895e6-fe73-449a-bf91-da54fce2eaba', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f9d75339-0401-4b65-82e1-377805019894', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'613382b9-6e1b-4e87-9711-9620dfd97956', N'mirko@spirko.hr', 0, N'ACnQd98b4NrrdgY85HY4oJ8Cq6WihcZANIMSUefsheOufe53Sm+wG5YdIeaXwSETvA==', N'242e43d0-6e18-49f0-8242-3590932bcada', NULL, 0, 0, NULL, 1, 0, N'mirko@spirko.hr')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7aa895e6-fe73-449a-bf91-da54fce2eaba', N'marin@marinovski.hr', 0, N'AMQCB3hinZHlW0nI3E59Zqrt5x83igVlBppMFFs6/tlp2aYD7BUU37O8FGtBH/jBmA==', N'5f3f0004-146c-413c-a533-7475ec083965', NULL, 0, 0, NULL, 1, 0, N'marin@marinovski.hr')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f9d75339-0401-4b65-82e1-377805019894', N'jura@klafura.hr', 0, N'AMgBWXe/nqP0VqkVyVaE88gNUM/1/JwjVefzmgd5P2WeEG0NKsNGweaX6VT1EyimTg==', N'ec259b75-ed11-4c47-ad4f-25fa05fff737', NULL, 0, 0, NULL, 1, 0, N'jura@klafura.hr')
SET IDENTITY_INSERT [dbo].[Predbiljezba] ON 

INSERT [dbo].[Predbiljezba] ([IdPredbiljezba], [Datum], [Ime], [Prezime], [Adresa], [Email], [Telefon], [Status], [IdSeminar]) VALUES (2009, CAST(N'2017-08-01' AS Date), N'Test ', N'Osoba 1', N'Ilica 1', N'test@osoba.hr', N'123.456.789', N'Prihvacen', 2005)
INSERT [dbo].[Predbiljezba] ([IdPredbiljezba], [Datum], [Ime], [Prezime], [Adresa], [Email], [Telefon], [Status], [IdSeminar]) VALUES (2010, CAST(N'2017-08-01' AS Date), N'Test', N'Osoba 2', N'Ilica 2', N'test@osoba2.hr', N'123.456.987', N'Odbijen', 2006)
INSERT [dbo].[Predbiljezba] ([IdPredbiljezba], [Datum], [Ime], [Prezime], [Adresa], [Email], [Telefon], [Status], [IdSeminar]) VALUES (2011, CAST(N'2017-08-01' AS Date), N'Test', N'Osoba 3', N'Ilica 3', N'test@osoba3.hr', N'321.456.789', N'Prihvacen', 3005)
SET IDENTITY_INSERT [dbo].[Predbiljezba] OFF
SET IDENTITY_INSERT [dbo].[Seminar] ON 

INSERT [dbo].[Seminar] ([IdSeminar], [Naziv], [Opis], [Datum], [Popunjen], [IdZaposlenik]) VALUES (2005, N'Programer Internet Aplikacija - JAVA', N'Java', CAST(N'2018-08-15' AS Date), 1, 1)
INSERT [dbo].[Seminar] ([IdSeminar], [Naziv], [Opis], [Datum], [Popunjen], [IdZaposlenik]) VALUES (2006, N'Programer Internet Aplikacija - C#', N'C#', CAST(N'2018-08-15' AS Date), 0, 2)
INSERT [dbo].[Seminar] ([IdSeminar], [Naziv], [Opis], [Datum], [Popunjen], [IdZaposlenik]) VALUES (3005, N'Programer internet aplikacija – PHP & MySQL', N'PHP & MySQL', CAST(N'2018-08-15' AS Date), 0, 3)
SET IDENTITY_INSERT [dbo].[Seminar] OFF
SET IDENTITY_INSERT [dbo].[Zaposlenik] ON 

INSERT [dbo].[Zaposlenik] ([IdZaposlenik], [Ime], [Prezime], [KorisnickoIme], [Password]) VALUES (1, N'Mirko', N'Spirko', N'mirko@spirko.hr', N'1Algebra-')
INSERT [dbo].[Zaposlenik] ([IdZaposlenik], [Ime], [Prezime], [KorisnickoIme], [Password]) VALUES (2, N'Jura', N'Klafura', N'jura@klafura.hr', N'1Algebra-')
INSERT [dbo].[Zaposlenik] ([IdZaposlenik], [Ime], [Prezime], [KorisnickoIme], [Password]) VALUES (3, N'Marin', N'Marinovski', N'marin@marinovski.hr', N'1Algebra-')
SET IDENTITY_INSERT [dbo].[Zaposlenik] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 26/08/2017 18:04:22 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 26/08/2017 18:04:22 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 26/08/2017 18:04:22 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 26/08/2017 18:04:22 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 26/08/2017 18:04:22 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 26/08/2017 18:04:22 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Predbiljezba]  WITH CHECK ADD  CONSTRAINT [FK_Predbiljezba_Seminar] FOREIGN KEY([IdSeminar])
REFERENCES [dbo].[Seminar] ([IdSeminar])
GO
ALTER TABLE [dbo].[Predbiljezba] CHECK CONSTRAINT [FK_Predbiljezba_Seminar]
GO
ALTER TABLE [dbo].[Seminar]  WITH CHECK ADD  CONSTRAINT [FK_Seminar_Zaposlenik] FOREIGN KEY([IdZaposlenik])
REFERENCES [dbo].[Zaposlenik] ([IdZaposlenik])
GO
ALTER TABLE [dbo].[Seminar] CHECK CONSTRAINT [FK_Seminar_Zaposlenik]
GO
USE [master]
GO
ALTER DATABASE [Skola] SET  READ_WRITE 
GO
