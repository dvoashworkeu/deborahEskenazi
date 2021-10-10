CREATE TABLE [dbo].[SearchWeight] (
    [Id]           INT         IDENTITY (1, 1) NOT NULL,
    [SearchTerms]  NVARCHAR (500) NOT NULL,
    [SearchDataId] INT         NOT NULL,
    [SelectedCount] INT NOT NULL DEFAULT 1, 
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SearchWeight_SearchData] FOREIGN KEY ([SearchDataId]) REFERENCES [dbo].[SearchData] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
);

