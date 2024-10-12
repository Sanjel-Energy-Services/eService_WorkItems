
using System;
using Sanjel.Common.Core;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public class DisassemblerFactory : Factory
    {
        private static readonly DisassemblerFactory _instance = new DisassemblerFactory();

        protected DisassemblerFactory() { }

        public static DisassemblerFactory Instance
        {
            get { return _instance; }
        }

        public static T GetDisassembler<T>()
        {
            return (T)_instance.GetDisassembler(typeof(T));
        }

        public ICssDisassembler GetDisassembler(Type type)
        {
            return GetProduct(type) as ICssDisassembler;
        }
    }
}
