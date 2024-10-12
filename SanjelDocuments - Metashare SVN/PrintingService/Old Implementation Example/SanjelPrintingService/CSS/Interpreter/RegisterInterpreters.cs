
using Sanjel.Common.Core;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public static class RegisterInterpreters
    {
        private static void Register(object instance, IFactory factory, bool isRegister)
        {
            if (isRegister)
            {
                factory.Register(instance.GetType(), instance);
            }
            else
            {
                factory.Unregister(instance.GetType());
            }
        }

        public static void RegisterAll(IFactory factory)
        {
            RegisterAll(factory, true);
        }

        public static void UnregisterAll(IFactory factory)
        {
            RegisterAll(factory, false);
        }

        private static void RegisterAll(IFactory factory, bool isRegister)
        {
            //Register(CssBorderWidthInterpreter.Instance, factory, isRegister);
            //Register(CssEnumInterpreter.Instance, factory, isRegister);
            //Register(CssTextInterpreter.Instance, factory, isRegister);
            //Register(CssEnumInterpreter.Instance, factory, isRegister);
            //Register(CssEnumInterpreter.Instance, factory, isRegister);
            //Register(CssEnumInterpreter.Instance, factory, isRegister);
            //Register(CssEnumInterpreter.Instance, factory, isRegister);
            //Register(CssEnumInterpreter.Instance, factory, isRegister);
            //Register(CssColorInterpreter.Instance, factory, isRegister);
            //Register(CssNumberInterpreter.Instance, factory, isRegister);

            Register(CssBorderWidthInterpreter.Instance, factory, isRegister);
            Register(CssEnumInterpreter.Instance, factory, isRegister);
            Register(CssTextInterpreter.Instance, factory, isRegister);
            Register(CssColorInterpreter.Instance, factory, isRegister);
            Register(CssNumberInterpreter.Instance, factory, isRegister);
        }
    }
}
