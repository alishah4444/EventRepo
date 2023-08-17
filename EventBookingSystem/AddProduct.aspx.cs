using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventBookingSystem
{
    public partial class AddProduct : System.Web.UI.Page
    {
        DBController controller = new DBController();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            string pic = "";
            if (fuEventImage.HasFile)
            {
                pic = "~/images/" + txtName.Text + DateTime.Now.ToString("HH:mm:ss").Replace(":", "") + ".jpg";
            }
            string query = "insert into Events (Title,ImageUrl,Description,BeginOn,FinishAt,Address,City,Zip,Price)" +
                "values (@title,@image,@description,@begin,@finish,@address,@city,@zip,@price)";
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("@title", txtName.Text);
            parameters.Add("@image", pic.Remove(0,9));
            parameters.Add("@description", txtDescription.Text);
            parameters.Add("@begin", DateTime.Parse(txtBeginAt.Text).ToString());
            parameters.Add("@finish", DateTime.Parse(txtFinishAt.Text).ToString());
            parameters.Add("@city", txtCity.Text);
            parameters.Add("@address", txtAddress.Text);
            parameters.Add("@zip", txtZip.Text);
            parameters.Add("@price", txtPrice.Text);
            if (controller.createRecord(query, parameters) != 0)
            {
                fuEventImage.SaveAs(Server.MapPath(pic));
                Response.Redirect("AdminProducts.aspx");
            }
            else
            {
                Response.Write("<script>alert('Some Error occured!');</script>");
            }
        }
    }
}