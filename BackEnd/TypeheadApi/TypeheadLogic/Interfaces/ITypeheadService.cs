using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TypeheadData.Models;
using TypeheadEntities.Entities;

namespace TypeheadEntities.Interfaces
{
    public interface ITypeadService
    {
         void Init(TypeheadDb typeheadContext);

        List<SearchDataRow> SearchDataText(string filterText);

        int TypeaheadSelected(SearchDataRow row);
    }
}
