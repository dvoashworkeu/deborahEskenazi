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
