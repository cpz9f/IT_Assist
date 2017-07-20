using System;
using System.Web;
using System.Web.UI;

namespace WebApplicationIntern
{

    public partial class Default_old : System.Web.UI.Page
    {
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
