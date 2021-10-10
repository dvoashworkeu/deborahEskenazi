namespace TypeheadData.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SearchWeight")]
    public partial class SearchWeight
    {
        public int Id { get; set; }

        [Required]
        [StringLength(500)]
        public string SearchTerms { get; set; }

        public int SearchDataId { get; set; }

        public int SelectedCount { get; set; }

        public virtual SearchData SearchData { get; set; }
    }
}
