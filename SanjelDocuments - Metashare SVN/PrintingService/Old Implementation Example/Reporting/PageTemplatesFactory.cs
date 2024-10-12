using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Sanjel.Jdt.Reporting
{
    public class PageTemplatesFactory
    {
        private readonly PageTemplatesFactory _instance = new PageTemplatesFactory();
        private Dictionary<string, string> _templates = new Dictionary<string, string>();

        public PageTemplatesFactory Instance
        {
            get { return _instance; }
        }

    }
}
