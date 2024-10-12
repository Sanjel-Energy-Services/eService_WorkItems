
using Sanjel.Common.Core;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public static class RegisterDisassemblers
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
            Register(CssLineDisassembler.Instance, factory, isRegister);
            Register(CssBorderDisassembler.Instance, factory, isRegister);

            Register(CssMarginDisassembler.Instance, factory, isRegister);
            Register(CssPaddingDisassembler.Instance, factory, isRegister);
        }
    }
}
