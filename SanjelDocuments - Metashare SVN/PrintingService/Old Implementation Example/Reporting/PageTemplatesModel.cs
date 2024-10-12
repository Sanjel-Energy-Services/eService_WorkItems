using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sanjel.Jdt.Domain;

namespace Sanjel.Jdt.Reporting
{
    public class PageTemplatesModel
    {
        public JobType CurrentJobType { get; set; }
        public List<PageTemplate> Templates { get; set; }
        public PageTemplate CurrentDocument { get; set; }

        public PageTemplatesModel(JobType jobType)
        {
            CurrentJobType = jobType;
        }
    }
}
