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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Fill the Manufacturer Drop Down list
                SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                con1.Open();

                SqlCommand cmdManufacturer = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Manufacturer' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmdManufacturer;
                DataTable dt = new DataTable();
                sda.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    ddlManu.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdDname = new SqlCommand("SELECT distinct DeptName FROM [AITINV].[dbo].[ASSETS]", con1);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                sda1.SelectCommand = cmdDname;
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                foreach (DataRow dr in dt1.Rows)
                {
                    ddlDept.Items.Add(new ListItem(dr["DeptName"].ToString()));
                }

                SqlCommand cmdAssetModel = new SqlCommand("SELECT ID, Reference_Data FROM [AITINV].[dbo].[AITInventoryRefData] where Category = 'Model' ORDER BY Reference_Data", con1);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                sda2.SelectCommand = cmdAssetModel;
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);

                foreach (DataRow dr in dt2.Rows)
                {
                    ddlMdl.Items.Add(new ListItem(dr["Reference_Data"].ToString(), dr["ID"].ToString()));
                }

                SqlCommand cmdAssetId = new SqlCommand("Select distinct AIT_Asset_ID from [AITINV].[dbo].[ASSETS]", con1);
                SqlDataAdapter sda3 = new SqlDataAdapter();
                sda3.SelectCommand = cmdAssetId;
                DataTable dt3 = new DataTable();
                sda3.Fill(dt3);
                int i = 0;
                foreach (DataRow dr in dt3.Rows)
                {
                    ddlAsset.Items.Add(new ListItem(dr["AIT_Asset_ID"].ToString()));
                }
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "Arch")
            //{
            //    int index = Convert.ToInt32(e.CommandArgument);
            //    GridViewRow row = GridView1.Rows[index];
            //    string assetID = GridView1.SelectedRow.Cells[0].Text;

            //    SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
            //    con1.Open();
            //    SqlCommand update = new SqlCommand("Update [dbo].[ASSETS] Set Status_RefID=90 Where AIT_Asset_ID='AIT1955'", con1);
            //    //insert.Parameters.Add("@Status", SqlDbType.NVarChar).Value = assetID;

            //    update.ExecuteNonQuery();
            //    con1.Close();
            //}

            if (e.CommandName == "EDIT")
            {
                int rowindex = Convert.ToInt32(e.CommandArgument);
                string ID = GridView1.Rows[rowindex].Cells[1].Text;
                Response.Redirect("EditAsset.aspx?ID=" + ID);
            }

            if (e.CommandName == "ARCHIVE")
            {
                int rowindex1 = Convert.ToInt32(e.CommandArgument);
                string ID = GridView1.Rows[rowindex1].Cells[1].Text;
                Response.Redirect("ArchiveAsset.aspx?ID=" + ID);
            }
        }


        /* public string getASearchData()
         {
             string data = "";
             using (SqlConnection conn = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;"))
             {
                 using (SqlCommand cmd = new SqlCommand())
                 {
                     cmd.Connection = conn;

                     cmd.Connection.Open();
                     using (SqlDataReader sqlRdr = cmd.ExecuteReader())
                     {
                         // table = new DataTable();  
                         // table.Load(reader);  
                         if (sqlRdr.HasRows)
                         {
                             while (sqlRdr.Read())
                             {
                                 int studentId = sqlRdr.GetInt32(0);
                                 string Name = sqlRdr.GetString(1);
                                 string EmailAddress = sqlRdr.GetString(2);
                                 string Gender = sqlRdr.GetString(3);
                                 data += "<tr><td>" + studentId + "</td><td>" + Name + "</td><td>" + EmailAddress + "</td><td>" + Gender + "</td></tr>";
                             }
                         }
                     }
                 }
                 return data;
             }
         } */

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void Click_btnASearch(object sender, EventArgs e)
        {
            if (ddlAsset.SelectedIndex > 0)
            {
                if (ddlDept.SelectedIndex > 0)
                {
                    if (ddlManu.SelectedIndex > 0)
                    {
                        if (ddlMdl.SelectedIndex > 0)
                        {
                            /* QUERY WITH ALL THE 4 FIELDS SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE modelRef.[Reference_Data]=@Model and manuRef.Reference_Data=@Manu and DeptName=@Dept
                                                     and AIT_Asset_ID=@AssetId", con1);

                            String paramValue = ddlMdl.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Model", paramValue);

                            String paramValue1 = ddlManu.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Manu", paramValue1);

                            String paramValue2 = ddlDept.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Dept", paramValue2);

                            String paramValue3 = ddlAsset.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue3);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }

                        else
                        {
                            /* QUERY WITH ONLY ASSET_ID, DEPARTMENT_NAME & MANUFACTUERER SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE manuRef.Reference_Data=@Manu and DeptName=@Dept
                                                     and AIT_Asset_ID=@AssetId", con1);

                            String paramValue1 = ddlManu.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Manu", paramValue1);

                            String paramValue2 = ddlDept.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Dept", paramValue2);

                            String paramValue3 = ddlAsset.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue3);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }
                    }

                    else
                    {
                        if (ddlMdl.SelectedIndex > 0)
                        {
                            /* QUERY WITH ASSET_ID, DEPARTMENT_NAME AND MODEL FIELDS SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE modelRef.[Reference_Data]=@Model and DeptName=@Dept
                                                     and AIT_Asset_ID=@AssetId", con1);

                            String paramValue = ddlMdl.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Model", paramValue);

                            String paramValue2 = ddlDept.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Dept", paramValue2);

                            String paramValue3 = ddlAsset.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue3);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }

                        else
                        {
                            /* QUERY WITH ONLY ASSET_ID AND DEPARTMENT_NAME SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE DeptName=@Dept
                                                     and AIT_Asset_ID=@AssetId", con1);

                            String paramValue = ddlMdl.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Model", paramValue);

                            String paramValue1 = ddlManu.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Manu", paramValue1);

                            String paramValue2 = ddlDept.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Dept", paramValue2);

                            String paramValue3 = ddlAsset.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue3);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }
                    }
                }

                else
                {
                    if (ddlManu.SelectedIndex > 0)
                    {
                        if (ddlMdl.SelectedIndex > 0)
                        {
                            /* QUERY WITH ASSET_ID, MANUFACTURER AND MODEL SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE modelRef.[Reference_Data]=@Model and manuRef.Reference_Data=@Manu
                                                     and AIT_Asset_ID=@AssetId", con1);

                            String paramValue = ddlMdl.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Model", paramValue);

                            String paramValue1 = ddlManu.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Manu", paramValue1);

                            String paramValue3 = ddlAsset.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue3);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }

                        else
                        {
                            /* QUERY WITH ONLY ASSET_ID AND MANUFACTUERER SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE manuRef.Reference_Data=@Manu
                                                     and AIT_Asset_ID=@AssetId", con1);

                            String paramValue1 = ddlManu.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Manu", paramValue1);

                            String paramValue3 = ddlAsset.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue3);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }
                    }

                    else
                    {
                        if (ddlMdl.SelectedIndex > 0)
                        {
                            /* QUERY WITH ASSET_ID AND MODEL SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE modelRef.[Reference_Data]=@Model
                                                     and AIT_Asset_ID=@AssetId", con1);

                            String paramValue = ddlMdl.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Model", paramValue);

                            String paramValue3 = ddlAsset.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue3);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }

                        else
                        {
                            /* QUERY WITH ONLY ASSET_ID SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT  a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE AIT_Asset_ID=@AssetId", con1);

                            String paramValue3 = ddlAsset.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@AssetId", paramValue3);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }
                    }
                }
            }

            else
            {
                if (ddlDept.SelectedIndex > 0)
                {
                    if (ddlManu.SelectedIndex > 0)
                    {
                        if (ddlMdl.SelectedIndex > 0)
                        {
                            /* QUERY WITH DEPARTMENT_NAME, MANUFACTURER AND MODEL FIELDS SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE modelRef.[Reference_Data]=@Model and manuRef.Reference_Data=@Manu and DeptName=@Dept
                                                     ", con1);

                            String paramValue = ddlMdl.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Model", paramValue);

                            String paramValue1 = ddlManu.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Manu", paramValue1);

                            String paramValue2 = ddlDept.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Dept", paramValue2);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }

                        else
                        {
                            /* QUERY WITH DEPARTMENT_NAME AND MANUFACTURER SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE manuRef.Reference_Data=@Manu and DeptName=@Dept
                                                     ", con1);

                            String paramValue1 = ddlManu.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Manu", paramValue1);

                            String paramValue2 = ddlDept.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Dept", paramValue2);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }
                    }

                    else
                    {
                        if (ddlMdl.SelectedIndex > 0)
                        {
                            /* QUERY WITH DEPARTMENT_NAME AND MODEL ARE SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE modelRef.[Reference_Data]=@Model and DeptName=@Dept
                                                     ", con1);

                            String paramValue = ddlMdl.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Model", paramValue);

                            String paramValue2 = ddlDept.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Dept", paramValue2);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }

                        else
                        {
                            /* QUERY WITH DEPARTMENT_NAME SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE DeptName=@Dept", con1);

                            String paramValue2 = ddlDept.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Dept", paramValue2);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }
                    }
                }

                else
                {
                    if (ddlManu.SelectedIndex > 0)
                    {
                        if (ddlMdl.SelectedIndex > 0)
                        {
                            /* QUERY WITH MANUFACTURER AND MODEL FIELDS SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE modelRef.[Reference_Data]=@Model and manuRef.Reference_Data=@Manu", con1);

                            String paramValue = ddlMdl.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Model", paramValue);

                            String paramValue1 = ddlManu.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Manu", paramValue1);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }

                        else
                        {
                            /* QUERY WITH MANUFACTURER SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE manuRef.Reference_Data=@Manu", con1);

                            String paramValue1 = ddlManu.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Manu", paramValue1);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }
                    }

                    else
                    {
                        if (ddlMdl.SelectedIndex > 0)
                        {
                            /* QUERY WITH MODEL SELECTED */
                            SqlConnection con1 = new SqlConnection("Data Source=tstsql04;Initial Catalog=AITINV;Integrated Security=SSPI;");
                            con1.Open();

                            SqlCommand SearchCommand = new SqlCommand(@"SELECT a.[ID], [AIT_Asset_ID], 
		                                                    aType.[Reference_Data] as [Asset_Type], 
		                                                    statRef.[Reference_Data] as [Status_Type], 
		                                                    manuRef.[Reference_Data] as [Manufacture_Type], 
		                                                    modelRef.[Reference_Data] as [Model_Type], 
		                                                    [DeptName], 
		                                                    [Location]
                                                      FROM [AITINV].[dbo].[ASSETS] a
	                                                    left join [dbo].[AITInventoryRefData] aType
		                                                    on a.[AssetType_RefID] = aType.[ID]
	                                                    left join [dbo].[AITInventoryRefData] statRef
		                                                    on a.[Status_RefID] = statRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] manuRef
		                                                    on a.[Manufacturer_RefID] = manuRef.[ID]
	                                                    left join [dbo].[AITInventoryRefData] modelRef
		                                                    on a.[Model_RefID] = modelRef.[ID] 
                                                     WHERE modelRef.[Reference_Data]=@Model", con1);

                            String paramValue = ddlMdl.SelectedItem.Text;
                            SearchCommand.Parameters.AddWithValue("@Model", paramValue);

                            SqlDataAdapter sda = new SqlDataAdapter();
                            sda.SelectCommand = SearchCommand;

                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            con1.Close();
                        }
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }


        protected void btnAssetSubmit_Click(object sender, EventArgs e)
        {

        }


    }
}