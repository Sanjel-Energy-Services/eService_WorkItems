
using System;
using System.Drawing;

namespace Sanjel.PrintingService.CSS.Model
{
    // My HSV considers Hue Sat and Val as values from 0 - 255.
    internal struct HsvColor
    {
        #region Instance Variables

        private int _hue;
        private int _saturation;
        private int _value;

        #endregion Instance Variables

        #region Instance Properties

        public int Hue
        {
            get { return _hue; }
            set { _hue = value; }
        }

        public int Saturation
        {
            get { return _saturation; }
            set { _saturation = value; }
        }

        public int Value
        {
            get { return _value; }
            set { _value = value; }
        }

        public Color Color
        {
            get { return ToRgb(); }
            set { FromRgb(value); }
        }

        #endregion Instance Properties

        #region Constructors

        public HsvColor(int h, int s, int v)
        {
            _hue = h;
            _saturation = s;
            _value = v;
        }

        public HsvColor(Color color)
        {
            _hue = 0;
            _saturation = 0;
            _value = 0;
            FromRgb(color);
        }

        #endregion Constructors

        #region Private Methods

        private static bool CompareFloatNumber(double value1, double value2, double precision = double.Epsilon)
        {
            return Math.Abs(value1 - value2) < precision;
        }

        private void FromRgb(Color color)
        {
            double red = color.R / 255D;
            double green = color.G / 255D;
            double blue = color.B / 255D;
            double hue; double sat;

            double min = Math.Min(Math.Min(red, green), blue);
            double max = Math.Max(Math.Max(red, green), blue);
            double val = max;
            double delta = max - min;
            if (CompareFloatNumber(max, 0) || CompareFloatNumber(delta, 0))
            {
                sat = 0;
                hue = 0;
            }
            else
            {
                sat = delta / max;
                if (CompareFloatNumber(red, max))
                {
                    hue = (60D * ((green - blue) / delta)) % 360D;
                }
                else if (CompareFloatNumber(green, max))
                {
                    hue = 60D * ((blue - red) / delta) + 120D;
                }
                else
                {
                    hue = 60D * ((red - green) / delta) + 240D;
                }
            }
            if (hue < 0)
            {
                hue += 360D;
            }

            Hue = (int)(hue / 360D * 255D);
            Saturation = (int)(sat * 255D);
            Value = (int)(val * 255D);
        }

        private Color ToRgb()
        {
            double red = 0;
            double green = 0;
            double blue = 0;

            double hue = (Hue / 255D * 360D) % 360D;
            double sat = Saturation / 255D;
            double val = Value / 255D;

            if (CompareFloatNumber(sat, 0))
            {
                red = val;
                green = val;
                blue = val;
            }
            else
            {
                double sectorPos = hue / 60D;
                int sectorNumber = (int)(Math.Floor(sectorPos));

                double fractionalSector = sectorPos - sectorNumber;

                double p = val * (1D - sat);
                double q = val * (1D - (sat * fractionalSector));
                double t = val * (1D - (sat * (1D - fractionalSector)));

                switch (sectorNumber)
                {
                    case 0: red = val; green = t; blue = p; break;
                    case 1: red = q; green = val; blue = p; break;
                    case 2: red = p; green = val; blue = t; break;
                    case 3: red = p; green = q; blue = val; break;
                    case 4: red = t; green = p; blue = val; break;
                    case 5: red = val; green = p; blue = q; break;
                }
            }
            return Color.FromArgb((int)(red * 255D), (int)(green * 255D), (int)(blue * 255D));
        }

        #endregion Private Methods

        #region Instance Methods

        public static bool operator !=(HsvColor left, HsvColor right)
        {
            return !(left == right);
        }
        
        public static bool operator ==(HsvColor left, HsvColor right)
        {
            return (left.Hue == right.Hue && left.Value == right.Value && left.Saturation == right.Saturation);
        }

        public override bool Equals(object obj)
        {
            if (obj == null)
                return false;

            if (GetType() != obj.GetType())
                return false;

            return this == (HsvColor) obj;
        }

        public override int GetHashCode()
        {
            return Hue*10000 + Saturation*100 + Value;
        }

        #endregion Instance Methods
    }
}