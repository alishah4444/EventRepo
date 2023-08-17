using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBookingSystem
{
    public partial class Events : System.Web.UI.Page
    {
        DBController controller = new DBController();
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "select * from Events where BeginOn > getDate()";
            SqlDataReader reader = controller.getSingleRecordById(query);
            rptEvents.DataSource = reader;  
            rptEvents.DataBind();
        }
        protected void lbEventId_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string id = btn.CommandArgument;
            Response.Redirect("EventDetails.aspx?id=" + id);
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtDate.Text == "")
                return;
            DateTime tempDate;
            if (!DateTime.TryParse(txtDate.Text, out tempDate))
                return;
            string query = "select * from Events where cast(BeginOn as date) = @begin";
            Dictionary<string, string> map = new Dictionary<string, string>();
            map.Add("@begin", txtDate.Text);
            SqlDataReader reader = controller.getSingleRecordById(query,map);
            rptEvents.DataSource = reader;
            rptEvents.DataBind();
        }
    }
}