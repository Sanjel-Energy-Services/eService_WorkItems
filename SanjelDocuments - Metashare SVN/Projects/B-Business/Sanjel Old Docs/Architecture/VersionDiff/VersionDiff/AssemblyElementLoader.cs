using System;
using System.Collections.Generic;
using System.Reflection;

namespace VersionDiff
{
    public class AssemblyElementLoader : MarshalByRefObject
    {
        public List<VersionedElement> LoadAssembly(string assemblyName)
        {
            Assembly assembly = Assembly.LoadFrom(assemblyName);
            return LoadTypes(assembly);
        }

        private List<VersionedElement> LoadTypes(Assembly assembly)
        {
            Type[] types = assembly.GetTypes();
            if (types == null || types.Length == 0) return null;

            List<VersionedElement> nodes = new List<VersionedElement>();
            foreach (Type type in types)
            {
                VersionedElement versionedElement = new VersionedElement(type.Name);
                versionedElement.Children = LoadTypeProperties(type);
                nodes.Add(versionedElement);
            }

            nodes.Sort(VersionedElement.Compare);
            return nodes;
        }

        private List<VersionedElement> LoadTypeProperties(Type type)
        {
            PropertyInfo[] properties = type.GetProperties(BindingFlags.DeclaredOnly | BindingFlags.GetProperty | BindingFlags.Public | BindingFlags.Instance);
            if (properties == null || properties.Length == 0) return null;

            List<VersionedElement> nodes = new List<VersionedElement>();
            foreach (PropertyInfo property in properties)
            {
                string propertyName = property.Name + ":" + property.PropertyType.Name;
                string[] parameterStrings = GetParameterString(property.GetIndexParameters());
                VersionedElement versionedElement = new VersionedElement(propertyName, parameterStrings);
                nodes.Add(versionedElement);
            }

            nodes.Sort(VersionedElement.Compare);
            return nodes;
        }

        private static string[] GetParameterString(ParameterInfo[] parameters)
        {
            if (parameters == null || parameters.Length == 0) return null;

            string[] parameterStrings = new string[parameters.Length];
            for (int i = 0; i < parameters.Length; i++)
            {
                parameterStrings[i] = parameters[i].Name + ":" + parameters[i].ParameterType.Name;
            }
            return parameterStrings;
        }
    }
}