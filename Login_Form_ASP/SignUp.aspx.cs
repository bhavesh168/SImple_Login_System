using System;
using System.Security.Cryptography;
using System.Text;
using Login_Form_ASP.DAL;

namespace Login_Form_ASP
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected string gblStrName = "", gblStrUseName = "", gblStrPassword = "", gblStrMessage = "", gblStrMessageType = "";
        MainClass objDALOpr = new MainClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MSG"] != null)
            {
                gblStrMessage = gblStrMessageType = string.Empty;

                if (Session["MSG"].ToString() == "AddF")
                {
                    gblStrMessage = "Please try again!";
                    gblStrMessageType = "error";
                }
                if (Session["MSG"].ToString() == "VALD")
                {
                    gblStrMessage = Session["MSGTXT"].ToString();
                    gblStrMessageType = Session["MSGTYP"].ToString();
                }
                Session["MSG"] = null;
            }

            if (Request.HttpMethod == "POST" && Request.Form["FRM_1"] != null)
            {
                gblStrName = Convert.ToString(Request.Form["txtname"]);
                gblStrUseName = Convert.ToString(Request.Form["txtusername"]);
                gblStrPassword = Convert.ToString(Request.Form["txtpassword"]);
                
                Session["NameOFUser"] = gblStrName;

                if (Validate_FRM())
                {
                    gblStrPassword = GetEncryPassword(gblStrPassword);

                    if (objDALOpr.InsertUserDetails(gblStrName, gblStrUseName, gblStrPassword) > 0)
                    {
                        Session["MSG"] = "AddS";
                        Session["LOGIN"] = "YES";
                        Response.Redirect("Welcome.aspx");
                    }
                    else
                    {
                        Response.Redirect("SignUp.aspx");
                        Session["MSG"] = "AddF";
                        Session["NameOFUser"] = string.Empty;
                    }
                }
                else
                {
                    Response.Redirect("SignUp.aspx");
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

            if (gblStrName == "")
            {
                gblStrMessage += "Please Enter name <br/>";
                gblStrMessageType = "error";
                Session["MSG"] = "VALD";
                IsValid = false;
            }
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