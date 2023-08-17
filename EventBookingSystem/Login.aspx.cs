using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
namespace EventBookingSystem
{
    public partial class Login : System.Web.UI.Page
    {
        DBController controller = new DBController();

        string connection = ConfigurationManager.ConnectionStrings["ebsconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uType"] != null && Session["uType"].ToString() == "Admin")
                Response.Redirect("Dashboard.aspx");
            else if (Session["uType"] != null && Session["uType"].ToString() == "User")
                Response.Redirect("HomePage.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string query = "select Name,Email,Type from Users where Email=@email and Password=@password";
            Dictionary<string,string> parameters = new Dictionary<string,string>();
            parameters.Add("@email", txtEmail.Text);
            parameters.Add("@password", txtPassword.Text);
            SqlDataReader reader = controller.getSingleRecordById(query, parameters);
            if (reader.Read())
            {
                Session["uName"] = reader["Name"].ToString();
                Session["uEmail"] = txtEmail.Text;
                Session["uType"] = reader["Type"].ToString();
                if (Session["uType"].ToString() == "User")
                    Response.Redirect("HomePage.aspx");
                else if (Session["uType"].ToString() == "Admin")
                    Response.Redirect("Dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Credentials does not matched!');</script>");

            }
        }
    }
}