using System;
using System.Data;
using System.Web;
using Login_Form_ASP.BAL;

namespace Login_Form_ASP.DAL
{
    public class MainClass
    {
         common_Methods objcomm = new common_Methods();

        public DataTable GetLoginDetails(string gblStrUseName,string gblStrPassword)
        {
            DataTable dt = new DataTable();
            string sqlQueryText = "";
            sqlQueryText += @"SELECT * FROM [dbo].[Db_User_Table] ";
            sqlQueryText += @" WHERE UserName = '" + gblStrUseName +"' ";
            sqlQueryText += @" AND [Password] = '" + gblStrPassword + "' ";
            dt = objcomm.GetDataTable(sqlQueryText);
            return dt;
        }

        public int InsertUserDetails(string gblStrName,string gblStrUseName,string gblStrPassword)
        {
            string sqlQueryText = "";
            int intRecordId = 0;

            sqlQueryText = "INSERT INTO [dbo].[Db_User_Table] (Name, UserName, [Password]) ";
            sqlQueryText += " VALUES ('" + gblStrName + "','" + gblStrUseName + "','" + gblStrPassword + "' ) ";

            intRecordId = objcomm.ExecuteNonQuery(sqlQueryText);

            return intRecordId;
        }

        public DataTable CheckUserExists(string gblStrUseName)
        {
            DataTable dt = new DataTable();
            string sqlQueryText = "";
            sqlQueryText += @"SELECT * FROM [dbo].[Db_User_Table] ";
            sqlQueryText += @" WHERE UserName = '" + gblStrUseName + "'; ";
            dt = objcomm.GetDataTable(sqlQueryText);
            return dt;
        }

        public void IsLogin()
        {
            if (HttpContext.Current.Session["LOGIN"] == null)
            {
                HttpContext.Current.Response.Redirect("Login.aspx");
            }
        }
    }
}