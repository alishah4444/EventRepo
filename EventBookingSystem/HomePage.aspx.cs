using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBookingSystem
{
    public partial class HomePage : System.Web.UI.Page
    {
        DBController controller = new DBController();
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "select top 3 * from Events where BeginOn > getDate() order by BeginOn";
            SqlDataReader reader = controller.getSingleRecordById(query);
            rptHomePage.DataSource = reader;
            rptHomePage.DataBind();
        }
        protected void lbEventId_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string id = btn.CommandArgument;
            Response.Redirect("EventDetails.aspx?id=" + id);
        }

    }
}