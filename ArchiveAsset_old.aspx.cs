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
    public partial class ArchiveAsset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                con1.Open();
                String AID = Request["ID"];
                lblAssetId.Text += AID;

                SqlCommand cmdStatusArchive = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Status' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda10 = new SqlDataAdapter();
                sda10.SelectCommand = cmdStatusArchive;
                DataTable dt10 = new DataTable();
                sda10.Fill(dt10);

                foreach (DataRow dr in dt10.Rows)
                {
                    ddlArchStatus.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }
                con1.Close();
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            tbCalDate.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
        }

        protected void btnArchAsset_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
            con1.Open();

            SqlCommand SearchCommand = new SqlCommand(@"UPDATE [AITINV].[dbo].[ASSETS] SET Status_RefID=@StatusId, RetiredDate=@RetireDate WHERE AIT_Asset_ID=@AssetId", con1);

            String paramValue = lblAssetId.Text;
            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue);

            String paramValue2 = ddlArchStatus.SelectedItem.Value;
            SearchCommand.Parameters.AddWithValue("@StatusId", paramValue2);

            String paramValue11 = tbCalDate.Text;
            SearchCommand.Parameters.AddWithValue("@RetireDate", paramValue11);

            SearchCommand.ExecuteNonQuery();
            con1.Close();
        }
    }
}