using System;
using System.Collections.Generic;
using System.Collections.Specialized;

namespace VersionDiff
{
    [Serializable]
    public class VersionedElement
    {
        private VersionDifferenceType m_differenceType = VersionDifferenceType.Unchanged;
        private string m_signature;
        private string m_name;
        private string[] m_parameters;
        private List<VersionedElement> m_children;

        public VersionDifferenceType DifferenceType
        {
            get { return m_differenceType; }
            set { m_differenceType = value; }
        }

        public string Signature
        {
            get { return m_signature; }
            set { m_signature = value; }
        }

        public string Name
        {
            get { return m_name; }
            set
            {
                m_name = value;
                m_signature = GetSignature();
            }
        }

        public string[] Parameters
        {
            get { return m_parameters; }
            set
            {
                m_parameters = value;
                m_signature = GetSignature();
            }
        }

        public List<VersionedElement> Children
        {
            get { return m_children; }
            set { m_children = value; }
        }

        public VersionedElement()
        {
        }

        public VersionedElement(string name, params string[] parameters)
        {
            m_name = name;
            m_parameters = parameters;
            m_signature = GetSignature();
        }

        public VersionedElement Clone()
        {
            return new VersionedElement(this.m_name, this.m_parameters);
        }

        public override string ToString()
        {
            return GetSignature();
        }

        private string GetSignature()
        {
            if (m_parameters == null || m_parameters.Length == 0)
            {
                return m_name;
            }
            else
            {
                return m_name + "(" + string.Join(",", m_parameters) + ")";
            }
        }

        public override bool Equals(object obj)
        {
            VersionedElement versionedElement2 = obj as VersionedElement;
            if (this.m_name != versionedElement2.m_name) return false;
            return AreEqualParameters(versionedElement2);
        }

        private bool AreEqualParameters(VersionedElement element2)
        {
            bool isEmpty = this.m_parameters == null || this.m_parameters.Length == 0;
            bool isEmpty2 = element2.m_parameters == null || element2.m_parameters.Length == 0;
            if (isEmpty && isEmpty2) return true;
            if (isEmpty || isEmpty2) return false;
            if (this.m_parameters.Length != element2.m_parameters.Length) return false;
            for (int i = 0; i < this.m_parameters.Length; i++)
            {
                if (!this.m_parameters[i].Equals(element2.m_parameters[i])) return false;
            }
            return true;
        }

        public static int Compare(VersionedElement p1, VersionedElement p2)
        {
            if (p1 == null && p2 == null) return 0;
            else if (p1 == null) return -1;
            else if (p2 == null) return 1;

            return string.Compare(p1.Signature, p2.Signature, true);
        }

        /// <summary>
        /// Find elements exist in assemblyElements1 but not exist in assemblyElements2.
        /// </summary>
        /// <param name="assemblyElements1"></param>
        /// <param name="assemblyElements2"></param>
        /// <returns></returns>
        public static List<VersionedElement> CompareDifference(List<VersionedElement> assemblyElements1, List<VersionedElement> assemblyElements2)
        {
            if (assemblyElements1 == null || assemblyElements1.Count == 0) return null;
            if (assemblyElements2 == null || assemblyElements2.Count == 0)
            {
                return CloneList(assemblyElements1, VersionDifferenceType.Added);
            }

            List<VersionedElement> added = new List<VersionedElement>();

            HybridDictionary hashedAssemblyElements2 = new HybridDictionary();
            foreach (VersionedElement element in assemblyElements2)
            {
                hashedAssemblyElements2.Add(element.Signature, element);
            }

            foreach (VersionedElement element in assemblyElements1)
            {
                VersionedElement findElement = hashedAssemblyElements2[element.Signature] as VersionedElement;
                if (findElement == null)
                {
                    VersionedElement newElement = element.Clone();
                    newElement.DifferenceType = VersionDifferenceType.Added;
                    newElement.Children = CloneList(element.Children, VersionDifferenceType.Added);
                    added.Add(newElement);
                }
                else
                {
                    List<VersionedElement> childrenDifference = CompareDifference(element.Children, findElement.Children);
                    if (!findElement.AreEqualParameters(element))
                    {
                        VersionedElement newElement = element.Clone();
                        newElement.DifferenceType = VersionDifferenceType.Modified;
                        newElement.Children = childrenDifference;
                        added.Add(newElement);
                    }
                    else if (childrenDifference != null && childrenDifference.Count > 0)
                    {
                        VersionedElement newElement = element.Clone();
                        newElement.DifferenceType = VersionDifferenceType.Unchanged;
                        newElement.Children = childrenDifference;
                        added.Add(newElement);
                    }
                }
            }

            return added;
        }

        public static List<VersionedElement> CloneList(List<VersionedElement> list, VersionDifferenceType differenceType)
        {
            if (list == null || list.Count == 0) return null;

            List<VersionedElement> cloneList = new List<VersionedElement>();
            foreach (VersionedElement element in list)
            {
                VersionedElement newElement = element.Clone();
                newElement.DifferenceType = differenceType;
                newElement.Children = CloneList(element.Children, differenceType);
                cloneList.Add(newElement);
            }
            return cloneList;
        }
    }
}