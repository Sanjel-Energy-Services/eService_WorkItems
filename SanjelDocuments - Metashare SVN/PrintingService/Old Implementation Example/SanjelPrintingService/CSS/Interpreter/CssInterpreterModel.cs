
using Sanjel.PrintingService.CSS.Model;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public class ValueUnitPair
    {
        public object Value { get; set; }
        public EnumLengthUnit Unit { get; set; }

        public ValueUnitPair(object data, EnumLengthUnit unit = EnumLengthUnit.None)
        {
            Value = data;
            Unit = unit;
        }
    }

    public class CssInterpreterModel
    {
        public CssTerm Term { get; set; }
        public CssBinding Binding { get; set; }

        public CssInterpreterModel(CssTerm term, CssBinding binding)
        {
            Term = term;
            Binding = binding;
        }

        public bool InterpretTerm(ref StyleModel model)
        {
            if (Binding == null || Term == null)
            {
                return false;
            }

            ICssInterpreter interpreter = InterpreterFactory.Instance.GetInterpreter(Binding.InterpreterType);
            if (interpreter == null)
            {
                return false;
            }

            ValueUnitPair pair = interpreter.InterpretTerm(Binding.ValueType, Term);
            if (pair != null)
            {
                if (Binding.ValueBindings != null)
                {
                    foreach (string binding in Binding.ValueBindings)
                    {
                        CssInterpreterUtilities.SetPropertyValueByPath(model, pair.Value, binding);
                    }
                }
                if (Binding.UnitBindings != null)
                {
                    foreach (string binding in Binding.UnitBindings)
                    {
                        CssInterpreterUtilities.SetPropertyValueByPath(model, pair.Unit, binding);
                    }
                }
                return true;
            }
            return false;
        }
    }
}

