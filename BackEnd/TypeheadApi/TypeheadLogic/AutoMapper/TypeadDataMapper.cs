using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TypeheadData.Models;
using TypeheadEntities.Entities;

namespace TypeheadLogic.AutoMapper
{
    public static class TypeadDataMapper
    {
        private static MapperConfiguration _config;

        static TypeadDataMapper()
        {
            _config = new MapperConfiguration(cfg =>
                    cfg.CreateMap<SearchResultRow, SearchDataRow>()
                    .ForMember(x=>x.Text, y=> y.MapFrom(o=> o.StrValue))
                );
        }

        public static SearchDataRow ToEntity(SearchData data)
        {
            var mapper = new Mapper(_config);
            return mapper.Map<SearchDataRow>(data);
        }

        public static List<SearchDataRow> ToListEntity(List<SearchResultRow> dataList)
        {
            var mapper = new Mapper(_config);
            return mapper.Map<List<SearchDataRow>>(dataList);
        }
    }
}
