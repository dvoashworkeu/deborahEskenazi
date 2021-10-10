namespace TypeheadData.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SearchData")]
    public partial class SearchData
    {

        public SearchData()
        {
            SearchWeights = new HashSet<SearchWeight>();
        }

        public int Id { get; set; }

        [Required]
        public string StrValue { get; set; }

        public virtual ICollection<SearchWeight> SearchWeights { get; set; }
    }
}
