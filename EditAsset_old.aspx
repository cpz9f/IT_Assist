<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAsset_old.aspx.cs" Inherits="WebApplicationIntern.EditAsset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IT Assets</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="font-awesome.min.css"/>
    <link rel="stylesheet" href="font-awesome.css"/>
    <link rel="stylesheet" href="Stylesheet1.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
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
                <center><h1 class="a3">EDIT ASSET RECORD</h1></center><br /><br />
        </div>
      <div id="inner">
        <div class="form-horizantal row a2">
            <center>
                <div class="form-group col-md-4"><br />
	                <asp:Label id="lblEdAsset" runat="server">Asset Id : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdAssetId" runat="server" CssClass="input-block" Height="30px" ReadOnly="true" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label2" runat="server">AssetType: </asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlEdAssetTypeID" runat="server" Width="200px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                </asp:DropDownList>
	            <%--    <asp:TextBox id="tbEdAssetTypeId" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                 <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label3" runat="server">Status: </asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlEdStatusId" runat="server" Width="200px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                </asp:DropDownList>    
	               <%-- <asp:TextBox id="tbEdStatusId" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>
           </div>

        <div class="form-horizantal row a2">
            <center>
                <div class="form-group col-md-4"><br />
	                <asp:Label id="Label4" runat="server">Manufacturer: </asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlEdManuRefID" runat="server" Width="200px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                </asp:DropDownList> 
	                <%--<asp:TextBox id="tbEdManuRefID" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label5" runat="server">Model: </asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlEdModelRefID" runat="server" Width="200px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                </asp:DropDownList> 
	               <%-- <asp:TextBox id="tbEdModelRefID" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                 <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label6" runat="server">Serial Number : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdSerialNum" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>
           </div>

        <div class="form-horizantal row a2">
            <center>
                <div class="form-group col-md-4"><br />
	                <asp:Label id="Label7" runat="server">MM Asset Tag : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdMMAssetTag" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label8" runat="server">Required Number : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdReqNum" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                 <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label9" runat="server">Init Date : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdInitDate" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	        </div></center>
         </div>
        
        <div class="form-horizantal row a2">
            <center>
                <div class="form-group col-md-4"><br />
	                <asp:Label id="Label10" runat="server">Warranty End Date: </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdWarrantyEndDate" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label11" runat="server">Marked for Replacement: </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdMark4Replace" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                 <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label12" runat="server">Retired Date : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdRetiredDate" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	        </div></center>
         </div>       

        <div class="form-horizantal row a2">
            <center>
                <div class="form-group col-md-4"><br />
	                <asp:Label id="Label13" runat="server"> Disposal Reason : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdDispoReason" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                 <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label15" runat="server"> Department Name : </asp:Label>&nbsp;&nbsp;&nbsp;
                     <asp:DropDownList ID="ddlEdDeptName" runat="server" Width="200px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                </asp:DropDownList>
	              <%--  <asp:TextBox id="tbEdDeptName" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	        </div></center>
         </div>   
        
        <div class="form-horizantal row a2">
            <center>
                <div class="form-group col-md-4"><br />
	                <asp:Label id="Label16" runat="server"> Usage Reference ID : </asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlEdUsageRefID" runat="server" Width="200px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                </asp:DropDownList> 
	                <%--<asp:TextBox id="tbEdUsageRefID" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label17" runat="server"> Police Asset ID : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdPoliceAssetID" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                 <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label18" runat="server"> Location : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdLocation" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	        </div></center>
         </div>       

        <div class="form-horizantal row a2">
            <center>
                <div class="form-group col-md-4"><br />
	                <asp:Label id="Label19" runat="server"> Pay Location : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdPayLoc" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label20" runat="server"> Audit Date : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdAuditDate" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>

                 <center><div class="form-group col-md-4"><br />
	                <asp:Label id="Label21" runat="server"> Notes : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdNotes" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div></center>
         </div> 

        <div>
            <center><asp:Button ID="tbnEditSubmit" runat="server" Text="Update Asset" OnClick="tbnEditSubmit_Click" CssClass="btn btn-primary1"/></center>
        </div>

    </div>
    </form>
</body>
</html>

