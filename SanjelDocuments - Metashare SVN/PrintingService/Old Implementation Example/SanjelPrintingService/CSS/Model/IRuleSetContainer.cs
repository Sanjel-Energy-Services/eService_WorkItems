
using System.Collections.Generic;

namespace Sanjel.PrintingService.CSS.Model
{
    public interface IRuleSetContainer
    {
        List<CssRuleSet> RuleSets { get; set; }
    }
}