using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace EventBookingSystem
{
    public partial class Checkout : System.Web.UI.Page
    {
        DBController controller = new DBController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["eImage"] == null || Session["eImage"].ToString() == "")
                Response.Redirect("Events.aspx");
            lblTitle.Text = Session["eName"].ToString();
            lblPrice.Text = Session["ePrice"].ToString();
            lblQuantity.Text = Session["eQty"].ToString();
            decimal price = Convert.ToDecimal(lblPrice.Text.Remove(0,2));
            int qty = Convert.ToInt32(lblQuantity.Text);
            lblTotal.Text = (price * qty).ToString();
        }
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            string query = "insert into Bookings (UserEmail,EventId,Quantity,BookedAt)" +
                "values (@uid,@eid,@qty,'"+ DateTime.Now + "')";
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("@uid", Session["uEmail"].ToString());
            parameters.Add("@eid", Session["eId"].ToString());
            parameters.Add("@qty", Session["eQty"].ToString());
            if (controller.createRecord(query, parameters) != 0)
            {
                Response.Write("<script>alert('Booking Completed!');window.location.replace('HomePage.aspx');</script>");
            }
            else
            {
                Response.Write("<script>alert('Some Error occured!');</script>");
            }
        }
    }
}