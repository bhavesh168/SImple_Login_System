using System.Data;
using System.Data.SqlClient;

namespace Login_Form_ASP.BAL
{
    public class common_Methods
    {
        DataTable dt = new DataTable();
        common_Connection db_Conn = new common_Connection();
        SqlCommand sqlcmd = new SqlCommand();

        public DataTable GetDataTable(string QueryText)
        {
            dt.Clear();
            SqlConnection conn = db_Conn.GetSqlConnection();
            SqlDataAdapter sd = new SqlDataAdapter(QueryText, conn);
            sd.Fill(dt);

            return dt;
        }

        public int ExecuteNonQuery(string QueryText)
        {
            int intRecordId = 0;
            SqlConnection conn = db_Conn.GetSqlConnection();
            using (SqlCommand command = new SqlCommand(QueryText + "; SELECT SCOPE_IDENTITY();", conn))
            {
                object result = command.ExecuteScalar();
                conn.Close();

                if (result != null && int.TryParse(result.ToString(), out intRecordId))
                {
                    return intRecordId;
                }
            }

            return intRecordId;
        }
    }
}