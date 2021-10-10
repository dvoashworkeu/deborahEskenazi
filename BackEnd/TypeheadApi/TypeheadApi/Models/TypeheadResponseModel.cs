using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TypeheadEntities.Entities;

namespace TypeheadApi.Models
{
    public class TypeheadResponseModel
    {
        public List<SearchDataRow> SearchDataList { get; set; }
    }
}