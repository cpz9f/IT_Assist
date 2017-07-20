<%@ Page Title="" Language="C#" MasterPageFile="~/AitInventoryMgmt.Master" AutoEventWireup="true" CodeBehind="AddAsset.aspx.cs" Inherits="WebApplicationIntern.AddAsset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-custom navbar-fixed-top" data-spy="affix" data-offset-top="197">
            <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand a1" href="#">IT Assets Inventory System</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="a2" id="btnAdvSearch" href="AddAsset.aspx">ADD ASSET</a></li>
                        <li><a class="a3" id="btnReturn" href="Default.aspx">BACK TO HOMEPAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav><br /><br /><br />
        <div class="container-fluid">
                <center><h1 class="a3">ADD NEW ASSET RECORD</h1></center><br /><br />
        </div>

    <div id="addAssetdiv" runat="server">
        <div class="form-horizantal row a2">
           
                <div class="form-group col-md-4"><br /><center>
	                <div class="col-md-4"><asp:Label id="lblAdAsset" runat="server">*Asset Id : </asp:Label></div>&nbsp;&nbsp;&nbsp;
	                <div class="col-md-2"><asp:TextBox id="tbAdAssetId" runat="server" placeholder="Enter your Asset ID" CssClass="form-control required input-block" Width="200px"></asp:TextBox></div><br /><br />
                               </center>     <!--<span class="form-icon fa fa-user"></span>-->
	            </div>
            

           
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblAssetType" CssClass="a2" runat="server">*Asset Type : </asp:Label> </div>&nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:DropDownList ID="ddlAssetType" runat="server" CssClass="form-control required" Width="200px">
                        <asp:ListItem Text="Select Asset Type" Value="0"></asp:ListItem>
                        
                </asp:DropDownList></div></center>
            </div>
            

           
                <div class="form-group col-md-4"><br />
                    <center><div class="col-md-4"><asp:Label id="lblManufacturer" runat="server">*Manufacturer : </asp:Label></div>&nbsp;&nbsp;&nbsp;
                    <div class="col-md-2"><asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="form-control required" Width="200px">
                        <asp:ListItem Text="Select Manufacturer" Value="0"></asp:ListItem>
                        
                    </asp:DropDownList></div></center>
                </div>
            
        </div>
        <div class="form-horizantal row a2">
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblModel" CssClass="a2" runat="server">*Model : </asp:Label></div> &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:DropDownList ID="ddlModel" runat="server" CssClass="form-control required" Width="200px">
                        <asp:ListItem Text="Select Model" Value="0"></asp:ListItem>
                        
                </asp:DropDownList></div></center>
            </div>
            

	       
	        <div class="form-group col-md-4"><br />
		        <center></center><div class="col-md-4"><asp:Label id="lblDeptName" CssClass="a2" runat="server">*Department Name : </asp:Label> </div>&nbsp;&nbsp;&nbsp;
	            <div class="col-md-2"><asp:DropDownList ID="ddlDeptName" runat="server" CssClass="form-control required" Width="200px">
	                    <asp:ListItem Text="Select Department" Value="0"></asp:ListItem>
	                    
	            </asp:DropDownList></div></center>
	        </div>
	        

            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblStatus" CssClass="a2" runat="server">*Status : </asp:Label> </div>&nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control required" Width="200px">
                        <asp:ListItem Text="Select Status" Value="0"></asp:ListItem>
                        
                </asp:DropDownList></div></center>
            </div>
         </div>   

          <div class="form-horizantal row a2">
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label6" runat="server" Text="Usage Reference ID"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                 <div class="col-md-2"><asp:DropDownList ID="ddlUsageRefID" runat="server" CssClass="form-control required" Width="200px">
                        <asp:ListItem Text="Select Usage Reference" Value="0"></asp:ListItem>
                        
                </asp:DropDownList></div></center>
            </div>
            

            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblOS" CssClass="a2" runat="server">Serial Number : </asp:Label></div> &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbSerialNo" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></div></center>
            </div>
            
             
                <div class="form-group col-md-4"><br />
                    <center><div class="col-md-4"><asp:Label id="lblDeptId" runat="server">MM Asset Tag : </asp:Label></div>&nbsp;&nbsp;&nbsp;
                    <div class="col-md-2"><asp:TextBox ID="tbmmAssetTag" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></div></center>
                </div>
            
        </div>
        <div class="form-horizantal row a2"> 
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblLogType" CssClass="a2" runat="server">Req No. : </asp:Label></div> &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbreqNo" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
                </div></center>
            </div>
            

            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label1" runat="server" Text="Initiation Date"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbInitDate" runat="server" CssClass="datePicker form-control" Width="200px"></asp:TextBox></div></center>
            </div>
   
           
            <div class="form-group col-md-4"><br /><center>
                <center><div class="col-md-4"><asp:Label ID="Label2" runat="server" Text="Warranty End Date"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbwarrEndDate" runat="server" CssClass="datePicker form-control" Width="200px"></asp:TextBox></div></center>
            </div>
         </div> 

          <div class="form-horizantal row a2"> 
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label3" runat="server" Text="*Marked For Replacement"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbMFRep" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></div></center>
            </div>
            

      
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label4" runat="server" Text="Retired Date"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbRetDate" runat="server" CssClass="form-control datePicker" Width="200px"></asp:TextBox></div></center>
            </div>
           
            <div class="form-group col-md-4"><br /><center>
                <center><div class="col-md-4"><asp:Label ID="Label5" runat="server" Text="Disposal Reason"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbdisposalReason" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></div></center>
            </div>
          </div>  

           
        <div class="form-horizantal row a2">
            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label7" runat="server" Text="Police Asset ID"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbPoliceAssetID" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></div></center>
            </div>
           

            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label8" runat="server" Text="Location"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbLocation" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></div></center>
            </div>
            
        
            <div class="form-group col-md-4"><br /><center>
                <center><div class="col-md-4"><asp:Label ID="Label9" runat="server" Text="Payment Location"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbPayLocation" CssClass="form-control" runat="server" Width="200px"></asp:TextBox></div></center>
            </div>
         </div>  

         <div class="form-horizantal row a2">   
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label10" runat="server" Text="Audit Date"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbAuditDate" runat="server" CssClass="datePicker form-control" Width="200px"></asp:TextBox></div></center>
            </div>
            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label12" runat="server" Text="Notes"></asp:Label>></div>
                <div class="col-md-2"><asp:TextBox ID="tbNotes" runat="server" CssClass="form-control" Width="200px"></asp:TextBox></div></center>
            </div>
        </div>
    </div>
       <center></center> <asp:Label ID="Label11" runat="server" ForeColor="#CC0000" Text="* (Mandatory Fields)"></asp:Label></center>
        <br /><br />

        <div class="form-horizantal row">
            <center><asp:Button ID="btnAdAsset" runat="server" Text="Add new Asset" CssClass="btn btn-primary1" OnClick="Click_btnAdAsset"/></center>
        </div>

       <div id="afterAdd" runat="server">
            <center><asp:Label ID="lblAfterAdd" runat="server"><h2 CssClass="a2"> Successfully added a new </h2></asp:Label></center><br /><br />
            <center><asp:Button ID="btnAfterAdd" runat="server" OnClick="btnAfterAdd_Click" Text="Add another Asset" CssClass="btn btn-info"/></center>
        </div><br />

        <div class="alert alert-dismissible alert-danger" runat="server" id="cautionMessage">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>Oh snap!</strong> <a href="#" class="alert-link">Please fill all mandatory fields</a> and try submitting again.
        </div>
</asp:Content>
