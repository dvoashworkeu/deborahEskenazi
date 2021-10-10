using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using TypeheadApi.Models;
using TypeheadData.Models;
using TypeheadEntities.Entities;
using TypeheadEntities.Interfaces;

namespace TypeheadApi.Controllers
{
    public class TypeheadController : ApiController
    {
        private readonly ITypeadService _typeadService;
        //TODO: introduce the new DBContext as instance per request without autofac
        private TypeheadDb typeheadDb = new TypeheadDb();

        public TypeheadController(ITypeadService typeadService)
        {
            _typeadService = typeadService;

            _typeadService.Init(new TypeheadData.Models.TypeheadDb());
        }

        // POST: api/Typehead/TypeaheadSelected/itemId
        [ResponseType(typeof(int))]
        [HttpPost]
        public IHttpActionResult TypeaheadSelected(SearchDataRow row)
        {
            int count = _typeadService.TypeaheadSelected(row);
            return Ok(count);
        }

        // GET: api/GeTypeheadFilteredData/dvo
        [ResponseType(typeof(TypeheadResponseModel))]
        public IHttpActionResult GeTypeheadFilteredData(string filterText)
        {

            var model = new TypeheadResponseModel
            {
                SearchDataList = new List<TypeheadEntities.Entities.SearchDataRow>()
            };

            if(!String.IsNullOrEmpty(filterText))
                model.SearchDataList = _typeadService.SearchDataText(filterText);

            return Ok(model);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                typeheadDb.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
