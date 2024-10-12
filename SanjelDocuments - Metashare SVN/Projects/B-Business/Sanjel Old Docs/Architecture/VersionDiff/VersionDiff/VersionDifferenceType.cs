using System;

namespace VersionDiff
{
    [Serializable]
    public enum VersionDifferenceType
    {
        Unchanged = 0,
        Added = 1,
        Deleted = 2,
        Modified = 3,
    }
}