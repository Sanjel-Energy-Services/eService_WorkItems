
using System.Collections.Generic;

namespace Sanjel.PrintingService.CSS.Model
{
    public interface IDeclarationContainer
    {
        List<CssDeclaration> Declarations { get; set; }
    }
}