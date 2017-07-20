using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Windows.Forms;

namespace WebApplicationIntern
{
    public partial class AdminOps : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                con1.Open();

                SqlCommand cmdStatusArchive = new SqlCommand("SELECT distinct Category FROM [AITINV].[dbo].[AITInventoryRefData] ORDER BY Category", con1);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                sda1.SelectCommand = cmdStatusArchive;
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                foreach (DataRow dr in dt1.Rows)
                {
                    ddlNewRefData.Items.Add(new ListItem(dr["Category"].ToString()));
                }
                con1.Close();
            }
        }

        protected void btnAddCategoryRef_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
            con1.Open();

            SqlCommand SearchCommand = new SqlCommand(@"INSERT INTO[AITINV].[dbo].[AITInventoryRefData] VALUES(@Category,@ReferenceData)", con1);

            String paramValue = ddlNewRefData.SelectedIndex.ToString();
            SearchCommand.Parameters.AddWithValue("@Category", paramValue);

            String paramValue1 = tbNewRefData.Text;
            SearchCommand.Parameters.AddWithValue("@ReferenceData", paramValue1);

            SearchCommand.ExecuteNonQuery();

            con1.Close();
        }
    }
}