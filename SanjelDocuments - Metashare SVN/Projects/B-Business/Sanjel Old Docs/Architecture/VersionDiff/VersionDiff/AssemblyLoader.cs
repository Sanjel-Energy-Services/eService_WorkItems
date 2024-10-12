using System;
using System.Collections.Generic;

namespace VersionDiff
{
    public class AssemblyLoader : IDisposable
    {
        private AppDomain m_appDomain;
        private AssemblyElementLoader m_assemblyElementLoader;

        public AssemblyLoader(string path)
        {
            Load(path);
        }

        public void Load(string path)
        {
            if (m_appDomain != null) Unload();

            AppDomainSetup appDomainSetup = new AppDomainSetup();
            appDomainSetup.ApplicationBase = AppDomain.CurrentDomain.BaseDirectory;
            appDomainSetup.ApplicationName = "VersionDiff";
            appDomainSetup.ShadowCopyFiles = "true";
            appDomainSetup.ShadowCopyDirectories = path;

            m_appDomain = AppDomain.CreateDomain("VersionDiffTemp", null, appDomainSetup);
            m_assemblyElementLoader = (AssemblyElementLoader) m_appDomain.CreateInstanceAndUnwrap("VersionDiff", "VersionDiff.AssemblyElementLoader");
        }

        public List<VersionedElement> LoadAssembly(string filename)
        {
            return m_assemblyElementLoader.LoadAssembly(filename);
        }

        public void Unload()
        {
            AppDomain.Unload(m_appDomain);
            m_appDomain = null;
        }

        public void Dispose()
        {
            Unload();
        }
    }
}