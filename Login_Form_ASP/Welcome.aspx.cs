using System;
using Login_Form_ASP.DAL;

namespace Login_Form_ASP
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected string gblStrName = "", gblStrMsg="";
        MainClass objDALMain = new MainClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            objDALMain.IsLogin();

            if (Session["MSG"].ToString() == "LGNS")
            {
                gblStrMsg = "Welcome back";
            }
            else if (Session["MSG"].ToString() == "AddS")
            {
                gblStrMsg = "Welcome ";
            }
            gblStrName = Session["NameOFUser"].ToString();

            if (Request.HttpMethod == "POST" && Request.Form["Logout"] != null)
            {
                Response.Redirect("Logout.aspx");
            }
        }
    }
}