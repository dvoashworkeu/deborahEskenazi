using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;

namespace TypeheadData.Models
{
    public partial class TypeheadDb : DbContext
    {
        public TypeheadDb()
            : base("name=TypeheadDb")
        {
        }

        public virtual DbSet<SearchData> SearchDatas { get; set; }
        public virtual DbSet<SearchWeight> SearchWeights { get; set; }


        public IEnumerable<SearchResultRow> SearchDataText(string filterText)
        {
            SqlParameter searchTerms = new SqlParameter("@SearchTerms", SqlDbType.Text);
            searchTerms.Value = filterText;

            return Database.SqlQuery<SearchResultRow>("exec dbo.usp_SearchTerms @SearchTerms", searchTerms);
        }

        public int TypeaheadSelected(int searchDataId, string searchText)
        {
            var data = SearchDatas.Find(searchDataId);
            var weighted = data.SearchWeights?.FirstOrDefault(x => x.SearchTerms == searchText);
            if (weighted == null)
            {
                weighted = new SearchWeight
                {
                    SearchTerms = searchText,
                    SearchDataId = searchDataId,
                    SelectedCount = 1

                };
                this.SearchWeights.Add(weighted);
            }
            else
            {
                weighted.SelectedCount++;
            };
            this.SaveChanges();
            return weighted.SelectedCount;
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {

        }


    }
}
