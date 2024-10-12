using System;

namespace VersionDiff
{
    [Serializable]
    public class VersionComparison
    {
        #region Instance Variables

        private string m_schameName;
        private VersionComparisonType m_type = VersionComparisonType.AssemblyComparison;
        private string m_currentVersionDataSchemaType;
        private string m_comparedVersionDataSchemaType;

        private string m_currentVersionDataSource;
        private string m_comparedVersionDataSource;

        private string m_currentVersionObjectsFileName;
        private string m_comparedVersionObjectsFileName;
        private string m_currentVersionExistOnlyObjectsFileName;
        private string m_currentVersionNonExistObjectsFileName;

        #endregion

        #region Instance Properties

        public VersionComparisonType  Type
        {
            get { return m_type; }
            set { m_type = value; }
        }
        public string CurrentVersionDataSchemaType
        {
            get { return m_currentVersionDataSchemaType; }
            set { m_currentVersionDataSchemaType = value; }
        }
        public string ComparedVersionDataSchemaType
        {
            get { return m_comparedVersionDataSchemaType; }
            set { m_comparedVersionDataSchemaType = value; }
        }
        public string CurrentVersionDataSource
        {
            get { return m_currentVersionDataSource; }
            set { m_currentVersionDataSource = value; }
        }
        public string ComparedVersionDataSource
        {
            get { return m_comparedVersionDataSource; }
            set { m_comparedVersionDataSource = value; }
        }
        public string CurrentVersionObjectsFileName
        {
            get { return m_currentVersionObjectsFileName; }
            set { m_currentVersionObjectsFileName = value; }
        }
        public string ComparedVersionObjectsFileName
        {
            get { return m_comparedVersionObjectsFileName; }
            set { m_comparedVersionObjectsFileName = value; }
        }
        public string CurrentVersionExistOnlyObjectsFileName
        {
            get { return m_currentVersionExistOnlyObjectsFileName; }
            set { m_currentVersionExistOnlyObjectsFileName = value; }
        }
        public string CurrentVersionNonExistObjectsFileName
        {
            get { return m_currentVersionNonExistObjectsFileName; }
            set { m_currentVersionNonExistObjectsFileName = value; }
        }
        public string SchameName
        {
            get { return m_schameName; }
            set { m_schameName = value; }
        }

        #endregion
    }
}