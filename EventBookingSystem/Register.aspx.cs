using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBookingSystem
{
    public partial class Register : System.Web.UI.Page
    {
        DBController controller = new DBController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uType"] != null && Session["uType"].ToString() == "Admin")
                Response.Redirect("Dashboard.aspx");
            else if (Session["uType"] != null && Session["uType"].ToString() == "User")
                Response.Redirect("HomePage.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string query = "insert into Users (Name,Password,Type,Email,CreatedOn,Verified,IsActive)" +
                "values (@name,@password,'User',@email,'"+DateTime.Now+"',1,1)";
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("@email", txtEmail.Text);
            parameters.Add("@password", txtPassword.Text);
            parameters.Add("@name", txtName.Text);
            if (controller.createRecord(query, parameters) != 0)
            {
                Session["uName"] = txtName.Text;
                Session["uEmail"] = txtEmail.Text;
                Session["uType"] = "User";
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                Response.Write("<script>alert('Some Error occured!');</script>");
            }
        }
    }
}