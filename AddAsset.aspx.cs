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
    public partial class AddAsset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Fill the Manufacturer Drop Down list
                SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                con1.Open();

                cautionMessage.Visible = false;
                afterAdd.Visible = false;

                SqlCommand cmdManufacturer = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Manufacturer' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmdManufacturer;
                DataTable dt = new DataTable();
                sda.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    ddlManufacturer.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdDname = new SqlCommand("SELECT distinct[Dept] ,[DeptName] FROM [AITINV].[dbo].[ASSETS]", con1);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                sda1.SelectCommand = cmdDname;
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                foreach (DataRow dr in dt1.Rows)
                {
                    ddlDeptName.Items.Add(new ListItem(dr["DeptName"].ToString(), dr["Dept"].ToString()));
                }

                SqlCommand cmdAssetModel = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Model' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                sda2.SelectCommand = cmdAssetModel;
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);

                foreach (DataRow dr in dt2.Rows)
                {
                    ddlModel.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdAssetType = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'AssetType' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda3 = new SqlDataAdapter();
                sda3.SelectCommand = cmdAssetType;
                DataTable dt3 = new DataTable();
                sda3.Fill(dt3);

                foreach (DataRow dr in dt3.Rows)
                {
                    ddlAssetType.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdUsagewithDept = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'UsageWithinDept' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda4 = new SqlDataAdapter();
                sda4.SelectCommand = cmdUsagewithDept;
                DataTable dt4 = new DataTable();
                sda4.Fill(dt4);

                foreach (DataRow dr in dt4.Rows)
                {
                    ddlUsageRefID.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdStatus = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Status' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda5 = new SqlDataAdapter();
                sda5.SelectCommand = cmdStatus;
                DataTable dt5 = new DataTable();
                sda5.Fill(dt5);

                foreach (DataRow dr in dt5.Rows)
                {
                    ddlStatus.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }
                con1.Close();
            }
        }

        protected void Click_btnAdAsset(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(tbAdAssetId.Text) && String.IsNullOrEmpty(tbAuditDate.Text) &&
                String.IsNullOrEmpty(tbdisposalReason.Text) && String.IsNullOrEmpty(tbInitDate.Text)
                && String.IsNullOrEmpty(tbLocation.Text) && String.IsNullOrEmpty(tbMFRep.Text) &&
                String.IsNullOrEmpty(tbmmAssetTag.Text) && String.IsNullOrEmpty(tbNotes.Text) &&
                String.IsNullOrEmpty(tbPayLocation.Text) && String.IsNullOrEmpty(tbPoliceAssetID.Text)
                && String.IsNullOrEmpty(tbreqNo.Text) && String.IsNullOrEmpty(tbRetDate.Text) &&
                String.IsNullOrEmpty(tbSerialNo.Text) && String.IsNullOrEmpty(tbwarrEndDate.Text))
            {
                //MessageBox.Show("Please fill the values");
                cautionMessage.Visible = true;
                tbAdAssetId.BorderColor = System.Drawing.Color.OrangeRed;
                ddlAssetType.BorderColor = System.Drawing.Color.OrangeRed;
                ddlDeptName.BorderColor = System.Drawing.Color.OrangeRed;
                ddlManufacturer.BorderColor = System.Drawing.Color.OrangeRed;
                ddlModel.BorderColor = System.Drawing.Color.OrangeRed;
                ddlStatus.BorderColor = System.Drawing.Color.OrangeRed;
                ddlUsageRefID.BorderColor = System.Drawing.Color.OrangeRed;
                tbMFRep.BorderColor = System.Drawing.Color.OrangeRed;
            }

            else if (ddlAssetType.SelectedIndex == 0 || ddlDeptName.SelectedIndex == 0 || ddlManufacturer.SelectedIndex == 0 ||
                    ddlModel.SelectedIndex == 0 || ddlStatus.SelectedIndex == 0 || ddlUsageRefID.SelectedIndex == 0 || String.IsNullOrEmpty(tbMFRep.Text))
            {
                //MessageBox.Show("Please fill all the mandatory fields");
                cautionMessage.Visible = true;
                ddlAssetType.BorderColor = System.Drawing.Color.OrangeRed;
                ddlDeptName.BorderColor = System.Drawing.Color.OrangeRed;
                ddlManufacturer.BorderColor = System.Drawing.Color.OrangeRed;
                ddlModel.BorderColor = System.Drawing.Color.OrangeRed;
                ddlStatus.BorderColor = System.Drawing.Color.OrangeRed;
                ddlUsageRefID.BorderColor = System.Drawing.Color.OrangeRed;
                tbMFRep.BorderColor = System.Drawing.Color.OrangeRed;
            }

            else
            {
                using (SqlConnection connection = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;"))
                {
                    connection.Open();
                    SqlCommand InsertCommand = new SqlCommand(@"INSERT INTO[AITINV].[dbo].[ASSETS]
                                                VALUES(@AssetID,@AssetTypeRefID,@StatusRefID,@ManuRefID,@ModelRefID,@SerialNo,@MMAssetTag,
                                                @ReqNo,@InitDate,@WarrantyEndDate,@MFRep,@Retireddate,@DisposalReason,@DeptNo,@DeptName,
                                                @UsageRefID,@PoliceAssetID,@Location,@PayLoc,@AuditDate,@Notes)", connection);

                    String assetID = tbAdAssetId.Text;
                    InsertCommand.Parameters.AddWithValue("@AssetID", assetID);

                    String assetType = ddlAssetType.SelectedItem.Value;
                    InsertCommand.Parameters.AddWithValue("@AssetTypeRefID", assetType);

                    String manufacturer = ddlManufacturer.SelectedItem.Value;
                    InsertCommand.Parameters.AddWithValue("@ManuRefID", manufacturer);

                    String model = ddlModel.SelectedItem.Value;
                    InsertCommand.Parameters.AddWithValue("@ModelRefID", model);

                    String deptNo = ddlDeptName.SelectedItem.Value;
                    InsertCommand.Parameters.AddWithValue("@DeptNo", deptNo);

                    String deptName = ddlDeptName.SelectedItem.Text;
                    InsertCommand.Parameters.AddWithValue("@DeptName", deptName);


                    String usageRefID = ddlUsageRefID.SelectedItem.Value;
                    InsertCommand.Parameters.AddWithValue("@UsageRefID", usageRefID);

                    String status = ddlStatus.SelectedItem.Value;
                    InsertCommand.Parameters.AddWithValue("@StatusRefID", status);

                    String serialNo = tbSerialNo.Text;
                    InsertCommand.Parameters.AddWithValue("@SerialNo", serialNo);

                    String mmAsssetTag = tbmmAssetTag.Text;
                    InsertCommand.Parameters.AddWithValue("@MMAssetTag", mmAsssetTag);

                    String reqNo = tbreqNo.Text;
                    InsertCommand.Parameters.AddWithValue("@ReqNo", reqNo);

                    String initDate = tbInitDate.Text;
                    InsertCommand.Parameters.AddWithValue("@InitDate", initDate);

                    String warantyEndDate = tbwarrEndDate.Text;
                    InsertCommand.Parameters.AddWithValue("@WarrantyEndDate", warantyEndDate);

                    String MFRep = tbMFRep.Text;
                    InsertCommand.Parameters.AddWithValue("@MFRep", MFRep);

                    String retiredDate = tbRetDate.Text;
                    InsertCommand.Parameters.AddWithValue("@Retireddate", retiredDate);

                    String disposalReason = tbdisposalReason.Text;
                    InsertCommand.Parameters.AddWithValue("@DisposalReason", disposalReason);

                    String PoliceAssetID = tbPoliceAssetID.Text;
                    InsertCommand.Parameters.AddWithValue("@PoliceAssetID", PoliceAssetID);

                    String location = tbLocation.Text;
                    InsertCommand.Parameters.AddWithValue("@Location", location);

                    String payLoc = tbPayLocation.Text;
                    InsertCommand.Parameters.AddWithValue("@PayLoc", payLoc);

                    String auditDate = tbAuditDate.Text;
                    InsertCommand.Parameters.AddWithValue("@AuditDate", auditDate);

                    String notes = tbNotes.Text;
                    InsertCommand.Parameters.AddWithValue("@Notes", notes);

                    //SqlCommand InsertCommand = new SqlCommand(@"INSERT INTO [AITINV].[dbo].[ASSETS] 
                    //       VALUES ('AITT5555891113',63,90,122,212,'ASFG6634598EBBR',001299,
                    // 	'','1991-07-07','2020-07-07',0,'','',2,'Inventory Disposed',
                    //     	1099,00909,'C18',927,'1991-07-07','New Asset')", connection);

                    int result = InsertCommand.ExecuteNonQuery();

                    if (result < 0)
                    {
                        MessageBox.Show("Error inserting data into Database!");
                    }
                    else
                    {
                        cautionMessage.Visible = false;
                        addAssetdiv.Visible = false;
                        btnAdAsset.Visible = false;
                        Label11.Visible = false;
                        lblAfterAdd.Text += " Asset with id : " + @assetID;
                        afterAdd.Visible = true;
                    }

                    connection.Close();


                    tbAdAssetId.Text = "";
                    tbNotes.Text = "";
                    tbPayLocation.Text = "";
                    tbLocation.Text = "";
                    tbPoliceAssetID.Text = "";
                    tbdisposalReason.Text = "";
                    tbMFRep.Text = "";
                    tbRetDate.Text = "";
                    tbwarrEndDate.Text = "";
                    tbInitDate.Text = "";
                    tbreqNo.Text = "";
                    tbmmAssetTag.Text = "";
                    tbSerialNo.Text = "";


                }
            }
        }

        protected void btnAfterAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAsset.aspx");
        }
    }
}