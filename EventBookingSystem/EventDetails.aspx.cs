using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBookingSystem
{
    
    public partial class EventDetails : System.Web.UI.Page
    {
        public string city="";
        DBController controller = new DBController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            if (Request.QueryString["id"] != null && Request.QueryString["id"] != string.Empty)
            {
                string query = "select * from events where Id=@id";
                Dictionary<string, string> parameters = new Dictionary<string, string>();
                parameters.Add("@id", Request.QueryString["id"]);
                SqlDataReader reader = controller.getSingleRecordById(query, parameters);
                if (reader.Read())
                {
                    lblName.Text = reader["Title"].ToString();
                    lblTitle2.Text = reader["Title"].ToString();
                    lblAddress.Text = reader["Address"].ToString() + ", " + reader["City"].ToString() + ", ( " + reader["Zip"].ToString() + " )";
                    lblBegin.Text = reader["BeginOn"].ToString();
                    lblEnd.Text = reader["FinishAt"].ToString();
                    ltrAddress.Text = reader["Address"].ToString() + ", " + reader["City"].ToString() + ", ( " + reader["Zip"].ToString() + " )";
                    ltrStart.Text = reader["BeginOn"].ToString();
                    ltrEnd.Text = reader["FinishAt"].ToString();
                    lblPrice.Text = "$ "+ reader["Price"].ToString();
                    lblPrice2.Text = lblPrice.Text;
                    city = reader["City"].ToString();
                    Session["eId"] = reader["id"].ToString(); 
                    detailImg.ImageUrl = "images/"+reader["ImageUrl"].ToString();
                }
                else
                {
                    Response.Redirect("NotFound.html");

                }
            }
        }

        protected void lblIncrease_Click(object sender, EventArgs e)
        {
            if (int.Parse(lblQuantity.Text) == 10)
                Response.Write("<script>alert('Maximum 10 tickets Allowed!');</script>");
            else
                lblQuantity.Text = (int.Parse(lblQuantity.Text) + 1).ToString();
            lblIncrease.Focus();
        }
        protected void lblDecrease_Click(object sender, EventArgs e)
        {
            if (int.Parse(lblQuantity.Text) != 1)
                lblQuantity.Text = (int.Parse(lblQuantity.Text) - 1).ToString();
            lblDescrease.Focus();
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblQuantity.Text = 1.ToString();
            lblDescrease.Focus();
        }
        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            Session["eName"] = lblName.Text;
            Session["ePrice"] = lblPrice.Text;
            Session["eQty"] = lblQuantity.Text;
            Session["eImage"] = detailImg.ImageUrl;
            Response.Redirect("Checkout.aspx");
        }
    }
}