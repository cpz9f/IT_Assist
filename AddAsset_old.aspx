<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAsset_old.aspx.cs" Inherits="WebApplicationIntern.AddAsset" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>IT Assets</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome.min.css">
    <link rel="stylesheet" href="font-awesome.css">
    <link rel="stylesheet" href="Stylesheet1.css">


    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head> 
<body class="body2" data-spy="scroll" data-target=".navbar" data-offset="50">
    <form id="form2" runat="server">
        <nav class="navbar navbar-custom navbar-fixed-top" data-spy="affix" data-offset-top="197">
            <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand a1" href="#">IT Assets Inventory System</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="a2" id="btnAdvSearch" href="AddAsset.aspx">ADD ASSET</a></li>
                        <li><a class="a2" id="btnNsearch" href="EditAsset.aspx">EDIT ASSET</a></li>
                        <li><a class="a2" id="btnArchAsset" href="ArchiveAsset.aspx">ARCHIVE ASSET</a></li>
                        <li><a class="a3" id="btnReturn" href="Default.aspx">BACK TO HOMEPAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav><br /><br /><br />
        <div class="container-fluid">
                <center><h1 class="a3">ADD NEW ASSET RECORD</h1></center><br /><br />
        </div>

        <div class="form-horizantal row a2">
           
                <div class="form-group col-md-4"><br /><center>
	                <div class="col-md-4"><asp:Label id="lblAdAsset" runat="server">*Asset Id : </asp:Label></div>&nbsp;&nbsp;&nbsp;
	                <div class="col-md-2"><asp:TextBox id="tbAdAssetId" runat="server" placeholder="Enter your Asset ID" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox></div><br /><br />
                               </center>     <!--<span class="form-icon fa fa-user"></span>-->
	            </div>
            

           
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblAssetType" CssClass="a2" runat="server">*Asset Type : </asp:Label> </div>&nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:DropDownList ID="ddlAssetType" runat="server" Width="200px">
                        <asp:ListItem Text="Select Asset Type" Value="0"></asp:ListItem>
                        
                </asp:DropDownList></div></center>
            </div>
            

           
                <div class="form-group col-md-4"><br />
                    <center><div class="col-md-4"><asp:Label id="lblManufacturer" runat="server">*Manufacturer : </asp:Label></div>&nbsp;&nbsp;&nbsp;
                    <div class="col-md-2"><asp:DropDownList ID="ddlManufacturer" runat="server" Width="200px">
                        <asp:ListItem Text="Select Manufacturer" Value="0"></asp:ListItem>
                        
                    </asp:DropDownList></div></center>
                </div>
            
        </div>
        <div class="form-horizantal row a2">
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblModel" CssClass="a2" runat="server">*Model : </asp:Label></div> &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:DropDownList ID="ddlModel" runat="server" Width="200px">
                        <asp:ListItem Text="Select Model" Value="0"></asp:ListItem>
                        
                </asp:DropDownList></div></center>
            </div>
            

	       
	        <div class="form-group col-md-4"><br />
		        <center></center><div class="col-md-4"><asp:Label id="lblDeptName" CssClass="a2" runat="server">*Department Name : </asp:Label> </div>&nbsp;&nbsp;&nbsp;
	            <div class="col-md-2"><asp:DropDownList ID="ddlDeptName" runat="server" Width="200px">
	                    <asp:ListItem Text="Select Department" Value="0"></asp:ListItem>
	                    
	            </asp:DropDownList></div></center>
	        </div>
	        

            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblStatus" CssClass="a2" runat="server">*Status : </asp:Label> </div>&nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:DropDownList ID="ddlStatus" runat="server" Width="200px">
                        <asp:ListItem Text="Select Status" Value="0"></asp:ListItem>
                        
                </asp:DropDownList></div></center>
            </div>
         </div>   

          <div class="form-horizantal row a2">
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label6" runat="server" Text="Usage Reference ID"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                 <div class="col-md-2"><asp:DropDownList ID="ddlUsageRefID" runat="server" Width="200px">
                        <asp:ListItem Text="Select Usage Reference" Value="0"></asp:ListItem>
                        
                </asp:DropDownList></div></center>
            </div>
            

            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblOS" CssClass="a2" runat="server">Serial Number : </asp:Label></div> &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbSerialNo" runat="server"></asp:TextBox></div></center>
            </div>
            
             
                <div class="form-group col-md-4"><br />
                    <center><div class="col-md-4"><asp:Label id="lblDeptId" runat="server">MM Asset Tag : </asp:Label></div>&nbsp;&nbsp;&nbsp;
                    <div class="col-md-2"><asp:TextBox ID="tbmmAssetTag" runat="server"></asp:TextBox></div></center>
                </div>
            
        </div>
        <div class="form-horizantal row a2"> 
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label id="lblLogType" CssClass="a2" runat="server">Req No. : </asp:Label></div> &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbreqNo" runat="server"></asp:TextBox></div></center>
            </div>
            

            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label1" runat="server" Text="Initiation Date"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbInitDate" runat="server"></asp:TextBox></div></center>
            </div>
   
           
            <div class="form-group col-md-4"><br /><center>
                <center><div class="col-md-4"><asp:Label ID="Label2" runat="server" Text="Warranty End Date"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbwarrEndDate" runat="server"></asp:TextBox></div></center>
            </div>
         </div> 

          <div class="form-horizantal row a2"> 
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label3" runat="server" Text="*Marked For Replacement"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbMFRep" runat="server"></asp:TextBox></div></center>
            </div>
            

      
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label4" runat="server" Text="Retired Date"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbRetDate" runat="server"></asp:TextBox></div></center>
            </div>
           
            <div class="form-group col-md-4"><br /><center>
                <center><div class="col-md-4"><asp:Label ID="Label5" runat="server" Text="Disposal Reason"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbdisposalReason" runat="server"></asp:TextBox></div></center>
            </div>
          </div>  

           
        <div class="form-horizantal row a2">
            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label7" runat="server" Text="Police Asset ID"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbPoliceAssetID" runat="server"></asp:TextBox></div></center>
            </div>
           

            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label8" runat="server" Text="Location"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbLocation" runat="server"></asp:TextBox></div></center>
            </div>
            
        
            <div class="form-group col-md-4"><br /><center>
                <center><div class="col-md-4"><asp:Label ID="Label9" runat="server" Text="Payment Location"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbPayLocation" runat="server"></asp:TextBox></div></center>
            </div>
         </div>  

         <div class="form-horizantal row a2">   
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label10" runat="server" Text="Audit Date"></asp:Label></div>
                &nbsp;&nbsp;&nbsp;
                <div class="col-md-2"><asp:TextBox ID="tbAuditDate" runat="server"></asp:TextBox></div></center>
            </div>
            
            <div class="form-group col-md-4"><br />
                <center><div class="col-md-4"><asp:Label ID="Label12" runat="server" Text="Notes"></asp:Label>></div>
                <div class="col-md-2"><asp:TextBox ID="tbNotes" runat="server"></asp:TextBox></div></center>
            </div>
            

        </div>
       <center></center> <asp:Label ID="Label11" runat="server" ForeColor="#CC0000" Text="* (Mandatory Fields)"></asp:Label></center>
        <br /><br />

        <div class="form-horizantal row">
            <center><asp:Button ID="btnAdAsset" runat="server" Text="Add new Asset" CssClass="btn btn-primary1" OnClick="Click_btnAdAsset"/></center>
        </div>
    </form>
</body> 
</html> 
