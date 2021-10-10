using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TypeheadData.Models
{
    public class SearchResultRow
    {
        public int SearchId { get; set; }
        public int? WeightedId { get; set; }

        public string StrValue { get; set; }
    }
}
