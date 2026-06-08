using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Narrativa
{
    public class CRUD
    {
        string cs = ConfigurationManager.ConnectionStrings["NarrativaConnection"].ConnectionString;

        public DataTable getDataTable(string mySql)
        {
            SqlConnection con = new SqlConnection(cs);

            SqlDataAdapter da = new SqlDataAdapter(mySql, con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            return dt;
        }

        public SqlDataReader getDrPassSql(string mySql)
        {
            SqlConnection con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand(mySql, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            return dr;
        }

        public void executeQuery(string mySql)
        {
            SqlConnection con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand(mySql, con);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
        }

        public object getSingleValue(string mySql)
        {
            SqlConnection con = new SqlConnection(cs);

            SqlCommand cmd = new SqlCommand(mySql, con);

            con.Open();

            object result = cmd.ExecuteScalar();

            con.Close();

            return result;
        }
    }
}