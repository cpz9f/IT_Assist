using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationIntern
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btnuser_Click(Object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
        }

        protected void btnAdd_Click(Object sender, EventArgs e)
        {
            Response.Redirect("AddAsset.aspx");
        }

        protected void Btnadmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminOps.aspx");
        }
    }
}