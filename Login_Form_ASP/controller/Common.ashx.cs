using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Login_Form_ASP.DAL;
using System.Data;

namespace Login_Form_ASP.Contoller
{
    public class Common : IHttpHandler
    {
        protected string gblStrUsername = "";
        MainClass objDALOpr = new MainClass();

        public void ProcessRequest(HttpContext context)
        {
            SetVariable();
            context.Response.ContentType = "text/plain";
            context.Response.Write(CheckUserExists());
        }

        public string CheckUserExists()
        {
            string strMsg = "";
            DataTable dtUser = new DataTable();
            dtUser = objDALOpr.CheckUserExists(gblStrUsername);

            if (dtUser.Rows.Count > 0)
            {
                strMsg = "Username already exists! Please choose a different one.";
            }

            return strMsg;
        }

        public void SetVariable()
        {
            if (HttpContext.Current.Request.QueryString["username"] != null)
            {
                gblStrUsername = Convert.ToString(HttpContext.Current.Request.QueryString["username"]);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}