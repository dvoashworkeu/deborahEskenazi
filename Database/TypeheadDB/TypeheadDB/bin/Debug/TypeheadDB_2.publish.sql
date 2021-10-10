﻿/*
Deployment script for TYPEADTEST

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "TYPEADTEST"
:setvar DefaultFilePrefix "TYPEADTEST"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering Procedure [dbo].[usp_SearchTerms]...';


GO
ALTER PROCEDURE dbo.usp_SearchTerms
    @SearchTerms NVARCHAR(500)
AS
BEGIN
SELECT s.StrValue, w.SearchDataId as WeightedId, s.Id as SearchId, w.SelectedCount,
	CASE
		WHEN w.Id IS NOT NULL THEN 1
		ELSE
		CASE 
			WHEN s.StrValue like concat(LTRIM(RTRIM(@SearchTerms)),'%') THEN 2                     
			ELSE CASE 
				WHEN s.StrValue like concat('%',LTRIM(RTRIM(@SearchTerms)),'%') THEN 3
				ELSE 4 END END END as priorityF
INTO #tempRes
FROM dbo.SearchData s
LEFT JOIN 
dbo.SearchWeight w
On s.Id = w.SearchDataId AND w.SearchTerms = @SearchTerms
WHERE s.StrValue like concat('%',LTRIM(RTRIM(@SearchTerms)),'%')
ORDER BY priorityF asc;

UPDATE #tempRes SET priorityF = (CASE 
			WHEN StrValue like concat(LTRIM(RTRIM(@SearchTerms)),'%') THEN 2                     
			ELSE CASE 
				WHEN StrValue like concat('%',LTRIM(RTRIM(@SearchTerms)),'%') THEN 3
				ELSE 4 END END), SelectedCount = 0
WHERE  SearchId in (
SELECT rnt.SearchId from
(SELECT row_number() OVER ( ORDER BY priorityF, SelectedCount desc, StrValue asc) as rn, SearchId from #tempRes WHERE priorityF = 1) as rnt
WHERE rn > 5
)


UPDATE #tempRes SET priorityF = 4 
WHERE  SearchId in (
SELECT rnt.SearchId from
(SELECT row_number() OVER ( ORDER BY priorityF, StrValue asc) as rn, SearchId from #tempRes WHERE priorityF = 2) as rnt
WHERE rn > 5
)

UPDATE #tempRes SET priorityF = 4 
WHERE  SearchId in (
SELECT rnt.SearchId from
(SELECT row_number() OVER ( ORDER BY priorityF, SelectedCount desc, StrValue asc) as rn, SearchId from #tempRes WHERE priorityF = 3) as rnt
WHERE rn > 20
)


select * from #tempRes ORDER BY priorityF asc, StrValue asc;


DROP TABLE #tempRes
END;
GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF (NOT EXISTS(SELECT * FROM [dbo].[SearchData]))  
BEGIN  
    
SET IDENTITY_INSERT [dbo].[SearchData] ON 

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (1, N'dvo1beginwith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (2, N'dvo21beginwith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (3, N'dvo31beginwith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (4, N'dvo41beginwith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (5, N'dvo51beginwith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (6, N'dvo61beginwith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (7, N'dvo71beginwith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (8, N'Contains1dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (9, N'Contains21dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (10, N'Contains31dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (11, N'Contains41dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (12, N'Contains51dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (13, N'Contains61dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (14, N'Contains71dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (15, N'Contains81dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (16, N'Contains91dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (17, N'Contains10dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (18, N'Contains11dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (19, N'Contains12dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (20, N'Contains13dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (21, N'Contains14dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (22, N'Contains15dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (23, N'Contains16dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (24, N'Contains17dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (25, N'Contains18dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (26, N'Contains19dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (27, N'Contains20dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (28, N'Contains21dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (29, N'Contains22dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (30, N'Contains23dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (31, N'Contains24dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (32, N'Contains25dvowith')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (33, N'dvo1aW')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (34, N'aWdvo21')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (35, N'aWdvo31')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (36, N'aWdvo41')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (37, N'aWdvo51')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (38, N'aWdvo61')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (39, N'aWdvo71')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (40, N'aWdvo81')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (41, N'Jonathan')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (42, N'Julia')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (43, N'Meier')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (44, N'Dora')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (45, N'Damien')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (46, N'Salomon')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (47, N'Serge')

INSERT [dbo].[SearchData] ([Id], [StrValue]) VALUES (48, N'sh hhfdtyjjjfhjfdgh gift fjhg')

SET IDENTITY_INSERT [dbo].[SearchData] OFF


END
IF (NOT EXISTS(SELECT * FROM [dbo].[SearchWeight]))  
BEGIN 

SET IDENTITY_INSERT [dbo].[SearchWeight] ON 

INSERT [dbo].[SearchWeight] ([Id], [SearchTerms], [SearchDataId], [SelectedCount]) VALUES (1, N'dv', 33, 5)

INSERT [dbo].[SearchWeight] ([Id], [SearchTerms], [SearchDataId], [SelectedCount]) VALUES (2, N'dvo', 34, 3)

INSERT [dbo].[SearchWeight] ([Id], [SearchTerms], [SearchDataId], [SelectedCount]) VALUES (3, N'dvo', 35, 3)

INSERT [dbo].[SearchWeight] ([Id], [SearchTerms], [SearchDataId], [SelectedCount]) VALUES (4, N'dvo', 36, 1)

INSERT [dbo].[SearchWeight] ([Id], [SearchTerms], [SearchDataId], [SelectedCount]) VALUES (5, N'dvo', 37,1)

INSERT [dbo].[SearchWeight] ([Id], [SearchTerms], [SearchDataId], [SelectedCount]) VALUES (6, N'dvo', 38,1)

INSERT [dbo].[SearchWeight] ([Id], [SearchTerms], [SearchDataId], [SelectedCount]) VALUES (7, N'dvo', 39,1)

INSERT [dbo].[SearchWeight] ([Id], [SearchTerms], [SearchDataId], [SelectedCount]) VALUES (8, N'dvo', 40, 1)

SET IDENTITY_INSERT [dbo].[SearchWeight] OFF


END

GO

GO
PRINT N'Update complete.';


GO
