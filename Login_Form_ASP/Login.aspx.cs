using System;
using System.Security.Cryptography;
using System.Text;
using Login_Form_ASP.DAL;
using System.Data;

namespace Login_Form_ASP
{
    public partial class Login : System.Web.UI.Page
    {
        protected string gblStrName = "", gblStrUseName = "", gblStrPassword = "", gblStrMessage = "", gblStrMessageType = "";
        MainClass objDALOpr = new MainClass();
        protected DataTable dtLoginDetails = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MSG"] != null)
            {
                gblStrMessage = gblStrMessageType = string.Empty;

                if (Session["MSG"].ToString() == "LGNF")
                {
                    gblStrMessage = "Please provide valid credentials or create a new account.";
                    gblStrMessageType = "error";
                }
                else if (Session["MSG"].ToString() == "VALD")
                {
                    gblStrMessage = Session["MSGTXT"].ToString();
                    gblStrMessageType = Session["MSGTYP"].ToString();
                }
                Session["MSG"] = null;
            }

            if (Request.HttpMethod == "POST" && Request.Form["FRM_3"] != null)
            {
                gblStrUseName = Convert.ToString(Request.Form["txtusername"]);
                gblStrPassword = Convert.ToString(Request.Form["txtpassword"]);

                if (Validate_FRM())
                {
                    gblStrPassword = GetEncryPassword(gblStrPassword);
                    dtLoginDetails = objDALOpr.GetLoginDetails(gblStrUseName, gblStrPassword);
                    if (dtLoginDetails.Rows.Count > 0)
                    {
                        Session["MSG"] = "LGNS";
                        Session["LOGIN"] = "YES";
                        Session["NameOFUser"] = dtLoginDetails.Rows[0]["Name"].ToString();
                        Response.Redirect("Welcome.aspx");
                    }
                    else
                    {
                        Session["MSG"] = "LGNF";
                        Response.Redirect("Login.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected string GetEncryPassword(string password)
        {
            using (SHA1Managed sha1 = new SHA1Managed())
            {
                byte[] hashBytes = sha1.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();

                foreach (byte b in hashBytes)
                {
                    builder.Append(b.ToString("x2")); // Convert each byte to a hexadecimal string
                }

                return builder.ToString();
            }
        }

        protected bool Validate_FRM()
        {
            gblStrMessage = gblStrMessageType = string.Empty;
            bool IsValid = true;

            if (gblStrUseName == "")
            {
                gblStrMessage += "Please Enter username <br/>";
                gblStrMessageType = "error";
                Session["MSG"] = "VALD";
                IsValid = false;
            }
            if (gblStrPassword == "")
            {
                gblStrMessage += "Please Enter password <br/>";
                gblStrMessageType = "error";
                Session["MSG"] = "VALD";
                IsValid = false;
            }

            Session["MSGTXT"] = gblStrMessage;
            Session["MSGTYP"] = gblStrMessageType;

            return IsValid;
        }
    }
}