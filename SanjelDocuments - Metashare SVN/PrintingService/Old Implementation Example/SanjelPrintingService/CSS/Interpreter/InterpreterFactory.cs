
using System;
using Sanjel.Common.Core;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public class InterpreterFactory : Factory
    {
        private static readonly InterpreterFactory _instance = new InterpreterFactory();

        protected InterpreterFactory() { }

        public static InterpreterFactory Instance
        {
            get { return _instance; }
        }

        public static T GetInterpreter<T>()
        {
            return (T)_instance.GetInterpreter(typeof(T));
        }

        public ICssInterpreter GetInterpreter(Type type)
        {
            return GetProduct(type) as ICssInterpreter;
        }
    }
}
