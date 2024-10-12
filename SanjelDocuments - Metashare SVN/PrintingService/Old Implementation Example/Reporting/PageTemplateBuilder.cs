using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sanjel.Jdt.Reporting
{
    public class PageTemplateBuilder
    {
        private readonly PageTemplateBuilder _instance = new PageTemplateBuilder();

        public PageTemplateBuilder Instance
        {
            get { return _instance; }
        }
    }
}
