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
    public partial class EditAsset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                con1.Open();
                String AID = Request["ID"];
                tbEdAssetId.Text = AID;
  
                SqlCommand cmdEDSelectCond = new SqlCommand("select * from [AITINV].[dbo].[ASSETS]   WHERE AIT_Asset_ID=@AID", con1);

                cmdEDSelectCond.Parameters.AddWithValue("@AID", AID);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmdEDSelectCond;
                DataTable dat = new DataTable();
                sda.Fill(dat);

               
                SqlCommand cmdManufacturer = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Manufacturer' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda4 = new SqlDataAdapter();
                sda4.SelectCommand = cmdManufacturer;
                DataTable dt4 = new DataTable();
                sda4.Fill(dt4);

                foreach (DataRow dr in dt4.Rows)
                {
                    ddlEdManuRefID.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdDname = new SqlCommand("SELECT distinct Dept, DeptName FROM [AITINV].[dbo].[ASSETS]", con1);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                sda1.SelectCommand = cmdDname;
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                foreach (DataRow dr in dt1.Rows)
                {
                    ddlEdDeptName.Items.Add(new ListItem(dr["DeptName"].ToString(), dr["Dept"].ToString()));
                }

                //SqlCommand cmdDno = new SqlCommand("SELECT distinct Dept FROM [AITINV].[dbo].[ASSETS]", con1);
                //SqlDataAdapter sda5 = new SqlDataAdapter();
                //sda5.SelectCommand = cmdDno;
                //DataTable dt5 = new DataTable();
                //sda5.Fill(dt5);

                //foreach (DataRow dr in dt5.Rows)
                //{
                //    ddlEdDept.Items.Add(new ListItem(dr["Dept"].ToString()));
                //}

                SqlCommand cmdAssetModel = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Model' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                sda2.SelectCommand = cmdAssetModel;
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);

                foreach (DataRow dr in dt2.Rows)
                {
                    ddlEdModelRefID.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdAssetId = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'AssetType' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda3 = new SqlDataAdapter();
                sda3.SelectCommand = cmdAssetId;
                DataTable dt3 = new DataTable();
                sda3.Fill(dt3);
               
                foreach (DataRow dr in dt3.Rows)
                {
                    ddlEdAssetTypeID.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdStatus = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Status' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda6 = new SqlDataAdapter();
                sda6.SelectCommand = cmdStatus;
                DataTable dt6 = new DataTable();
                sda6.Fill(dt6);
               
                foreach (DataRow dr in dt6.Rows)
                {
                    ddlEdStatusId.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdUsage = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Usage' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda7 = new SqlDataAdapter();
                sda6.SelectCommand = cmdUsage;
                DataTable dt7 = new DataTable();
                sda6.Fill(dt6);

                foreach (DataRow dr in dt6.Rows)
                {
                    ddlEdUsageRefID.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

          
                //making sure the previous selection has been cleared
                ddlEdAssetTypeID.ClearSelection(); 
                ddlEdAssetTypeID.Items.FindByValue(dat.Rows[0]["AssetType_RefID"].ToString()).Selected = true;

                ddlEdDeptName.ClearSelection();
                ddlEdDeptName.Items.FindByValue(dat.Rows[0]["Dept"].ToString()).Selected = true;

                ddlEdManuRefID.ClearSelection();
                ddlEdManuRefID.Items.FindByValue(dat.Rows[0]["Manufacturer_RefID"].ToString()).Selected = true;

                ddlEdModelRefID.ClearSelection();
                ddlEdModelRefID.Items.FindByValue(dat.Rows[0]["Model_RefID"].ToString()).Selected = true;

                ddlEdStatusId.ClearSelection();
                ddlEdStatusId.Items.FindByValue(dat.Rows[0]["Status_RefID"].ToString()).Selected = true;

                ddlEdUsageRefID.ClearSelection();
                ddlEdUsageRefID.Items.FindByValue(dat.Rows[0]["Usage_RefID"].ToString()).Selected = true;

               

                tbEdSerialNum.Text = dat.Rows[0]["SerialNo"].ToString();
                tbEdMMAssetTag.Text = dat.Rows[0]["MM_Asset_Tag"].ToString();
                tbEdReqNum.Text = dat.Rows[0]["ReqNo"].ToString();
                tbEdInitDate.Text = dat.Rows[0]["Init_Date"].ToString();
                tbEdWarrantyEndDate.Text = dat.Rows[0]["WarrantyEndDate"].ToString();
                tbEdMark4Replace.Text = dat.Rows[0]["MarkedForReplacement"].ToString();
                tbEdRetiredDate.Text = dat.Rows[0]["RetiredDate"].ToString();
                tbEdDispoReason.Text = dat.Rows[0]["Disposal_Reason"].ToString();
               
                tbEdPoliceAssetID.Text = dat.Rows[0]["Police_Asset_ID"].ToString();
                tbEdLocation.Text = dat.Rows[0]["Location"].ToString();
                tbEdPayLoc.Text = dat.Rows[0]["PayLocation"].ToString();
                tbEdAuditDate.Text = dat.Rows[0]["AuditDate"].ToString();
                tbEdNotes.Text = dat.Rows[0]["Notes"].ToString();
                con1.Close();

            }
           
        }

        protected void tbnEditSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
            con1.Open();

            SqlCommand SearchCommand = new SqlCommand(@"UPDATE [AITINV].[dbo].[ASSETS] SET AssetType_RefID=@AssetTypeId, Status_RefID=@StatusId, Manufacturer_RefID=@ManuRefId, 
                                       Model_RefID=@ModelRefId, SerialNo=@SerialNum, MM_Asset_Tag=@MMAssetTag, ReqNo=@ReqNum, Init_Date=@InitDate, WarrantyEndDate=@WarrantyEndDate,
                                       MarkedForReplacement=@Marked4Replace, RetiredDate=@RetireDate, Disposal_Reason=@DisposalReason, Dept=@Dept, DeptName=@DeptName, 
                                       Usage_RefID=@UsageRefId, Police_Asset_ID=@PoliceAssetId, Location=@Location, PayLocation=@PayLoc, AuditDate=@AuditDate, Notes=@Notes WHERE AIT_Asset_ID=@AssetId", con1);

            String paramValue = tbEdAssetId.Text;
            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue);

            String paramValue1 = ddlEdAssetTypeID.SelectedItem.Value;
            SearchCommand.Parameters.AddWithValue("@AssetTypeId", paramValue1);

            String paramValue2 = ddlEdStatusId.SelectedItem.Value;
            SearchCommand.Parameters.AddWithValue("@StatusId", paramValue2);

            String paramValue3 = ddlEdManuRefID.SelectedItem.Value;
            SearchCommand.Parameters.AddWithValue("@ManuRefId", paramValue3);

            String paramValue4 = ddlEdModelRefID.SelectedItem.Value;
            SearchCommand.Parameters.AddWithValue("@ModelRefId", paramValue4);

            String paramValue5 = tbEdSerialNum.Text;
            SearchCommand.Parameters.AddWithValue("@SerialNum", paramValue5);

            String paramValue6 = tbEdMMAssetTag.Text;
            SearchCommand.Parameters.AddWithValue("@MMAssetTag", paramValue6);

            String paramValue7 = tbEdReqNum.Text;
            SearchCommand.Parameters.AddWithValue("@ReqNum", paramValue7);

            String paramValue8 = tbEdInitDate.Text;
            SearchCommand.Parameters.AddWithValue("@InitDate", paramValue8);

            String paramValue9 = tbEdWarrantyEndDate.Text;
            SearchCommand.Parameters.AddWithValue("@WarrantyEndDate", paramValue9);

            String paramValue10 = tbEdMark4Replace.Text;
            SearchCommand.Parameters.AddWithValue("@Marked4Replace", paramValue10);

            String paramValue11 = tbEdRetiredDate.Text;
            SearchCommand.Parameters.AddWithValue("@RetireDate", paramValue11);

            String paramValue12 = tbEdDispoReason.Text;
            SearchCommand.Parameters.AddWithValue("@DisposalReason", paramValue12);

            String paramValue13 = ddlEdDeptName.SelectedItem.Value;
            SearchCommand.Parameters.AddWithValue("@Dept", paramValue13);

            String paramValue14 = ddlEdDeptName.SelectedItem.Text;
            SearchCommand.Parameters.AddWithValue("@DeptName", paramValue14);

            String paramValue15 = ddlEdUsageRefID.SelectedItem.Value;
            SearchCommand.Parameters.AddWithValue("@UsageRefId", paramValue15);

            String paramValue16 = tbEdPoliceAssetID.Text;
            SearchCommand.Parameters.AddWithValue("@PoliceAssetId", paramValue16);

            String paramValue17 = tbEdLocation.Text;
            SearchCommand.Parameters.AddWithValue("@Location", paramValue17);

            String paramValue18 = tbEdPayLoc.Text;
            SearchCommand.Parameters.AddWithValue("@PayLoc", paramValue18);

            String paramValue19 = tbEdAuditDate.Text;
            SearchCommand.Parameters.AddWithValue("@AuditDate", paramValue19);

            String paramValue20 = tbEdNotes.Text;
            SearchCommand.Parameters.AddWithValue("@Notes", paramValue20);
            int check = SearchCommand.ExecuteNonQuery();

            if (check == 1)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}