using System.Collections.Generic;
using System.Linq;
using TypeheadData.Models;
using TypeheadEntities.Entities;
using TypeheadEntities.Interfaces;
using TypeheadLogic.AutoMapper;

namespace TypeheadLogic.Services
{
    public class TypeheadService : ITypeadService
    {
        private TypeheadDb typeheadContext;

        public TypeheadService()
        {
            
        }
        public void Init(TypeheadDb typeheadContext)
        {
            this.typeheadContext = typeheadContext;
        }

        public List<SearchDataRow> SearchDataText(string filterText)
        {
            var res = typeheadContext.SearchDataText(filterText).ToList();
            return TypeadDataMapper.ToListEntity(res);
        }

        public int TypeaheadSelected(SearchDataRow row)
        {
            int res = typeheadContext.TypeaheadSelected(row.SearchId, row.Text);
            return res;
        }

    }
}
