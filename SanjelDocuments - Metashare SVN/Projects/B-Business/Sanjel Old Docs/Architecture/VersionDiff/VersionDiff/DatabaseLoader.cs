using System;
using System.Collections.Generic;
using System.Data;

namespace VersionDiff
{
    public class DatabaseLoader : IDisposable
    {
        private string m_connectionString;
        private Type m_dbConnectionType;
        private IDbConnection m_dbConnection;

        public string ConnectionString
        {
            get { return m_connectionString; }
        }

        public Type DbConnectionType
        {
            get { return m_dbConnectionType; }
        }

        public IDbConnection DbConnection
        {
            get { return m_dbConnection; }
        }

        public DatabaseLoader(Type dbConnectionType, string connectionString)
        {
            Load(dbConnectionType, connectionString);
        }

        public void Load(Type dbConnectionType, string connectionString)
        {
            m_connectionString = connectionString;
            m_dbConnectionType = dbConnectionType;

            m_dbConnection = Activator.CreateInstance(dbConnectionType) as IDbConnection;
            m_dbConnection.ConnectionString = connectionString;
            m_dbConnection.Open();
        }

        public void Unload()
        {
            m_dbConnection.Close();
            m_dbConnection.Dispose();
            m_dbConnection = null;
        }

        public void Dispose()
        {
            Unload();
        }

        public List<VersionedElement> LoadTables()
        {
            using (IDbCommand command = m_dbConnection.CreateCommand())
            {
                command.CommandText = "SELECT TABLE_NAME FROM USER_TABLES";

                using (IDataReader r = command.ExecuteReader())
                {
                    List<VersionedElement> tables = new List<VersionedElement>();
                    while (r.Read())
                    {
                        string tableName = r.GetString(0);
                        VersionedElement tableInfo = new VersionedElement(tableName);
                        tableInfo.Children = LoadTableColumns(tableName);
                        tables.Add(tableInfo);
                    }
                    return tables;
                }
            }
        }

        public List<VersionedElement> LoadTableColumns(string tableName)
        {
            using (IDbCommand command = m_dbConnection.CreateCommand())
            {
                command.CommandText = "SELECT COLUMN_NAME, DATA_TYPE, DATA_LENGTH, DATA_PRECISION, DATA_SCALE, NULLABLE FROM USER_TAB_COLUMNS WHERE TABLE_NAME = :tableName";
                AddParameter(command, "tableName", tableName);

                using (IDataReader r = command.ExecuteReader())
                {
                    List<VersionedElement> columns = new List<VersionedElement>();
                    while (r.Read())
                    {
                        string columnName = r.GetString(0);
                        string dataType = r.GetString(1);
                        int dataLength = r.GetInt32(2);
                        int dataPrecision = r.IsDBNull(3) ? 0 : r.GetInt32(3);
                        int dataScale = r.IsDBNull(4) ? 0 : r.GetInt32(4);
                        if (dataPrecision != 0)
                        {
                            dataType += "(" + dataPrecision.ToString();
                            if (dataScale != 0)
                            {
                                dataType += "," + dataScale.ToString();
                            }
                            dataType += ")";
                        }
                        else if (dataLength != 0)
                        {
                            dataType += "(" + dataLength.ToString() + ")";
                        }
                        string nullable = r.GetString(5);
                        columns.Add(new VersionedElement(columnName, dataType, nullable == "Y" ? "nullable" : "Not nullable"));
                    }
                    return columns;
                }
            }
        }

        private IDataParameter AddParameter(IDbCommand command, string parameterName, object value)
        {
            IDbDataParameter parameter = command.CreateParameter();
            parameter.ParameterName = parameterName;
            parameter.Value = value;
            parameter.Direction = ParameterDirection.Input;
            command.Parameters.Add(parameter);
            return parameter;
        }
    }
}