CREATE PROCEDURE dbo.usp_SearchTerms
    @SearchTerms NVARCHAR(500)
AS
BEGIN
SELECT s.StrValue, w.Id as WeightedId, s.Id as SearchId, w.SelectedCount,
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
(SELECT row_number() OVER ( ORDER BY priorityF, StrValue asc) as rn, SearchId from #tempRes WHERE priorityF = 3) as rnt
WHERE rn > 20
)


select * from #tempRes ORDER BY priorityF asc, SelectedCount desc, StrValue asc;


DROP TABLE #tempRes
END;

