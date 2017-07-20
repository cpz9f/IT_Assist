<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOps.aspx.cs" Inherits="WebApplicationIntern.AdminOps" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IT Assets</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="font-awesome.min.css" />
    <link rel="stylesheet" href="font-awesome.css" />
    <link rel="stylesheet" href="Stylesheet1.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
</head> 

<body class="body2" data-spy="scroll" data-target=".navbar" data-offset="50">

    <form id="form1" runat="server">
        <nav class="navbar navbar-custom navbar-fixed-top" data-spy="affix" data-offset-top="197">
            <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand a1" href="#">IT Assets Inventory System</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="a2" id="btnAdvSearch" href="AdminOps.aspx">ADD VALUES TO CATEGORIES</a></li>
                        <li><a class="a2" id="btnNsearch" href="#">ADD/EDIT CATEGORIES</a></li>
                        <li><a class="a3" id="btnReturn" href="Default.aspx">BACK TO HOMEPAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav><br /><br /><br />

         <div class="container-fluid">
                <center><h1 class="a3">ADMIN OPERATIONS</h1></center>
        </div><br /><br /><br /><br />

        <div class="Container">
            <div class="form-horizantal row">
            <div class="form-group col-md-6">
				<center><asp:Label id="ddlbl1" CssClass="a2" runat="server">Category Type: </asp:Label>&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlNewRefData" runat="server" Width="200px">
	                <asp:ListItem Text="Select Category : " Value="0"></asp:ListItem>
	            </asp:DropDownList></center>
            </div>

                <div class="form-group col-md-4">
                    <asp:TextBox id="tbNewRefData" runat="server" placeholder="Enter New Reference Data" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox>
                </div>
            </div>
        </div><br /><br />

        <center><asp:Button ID="btnAddCategoryRef" runat="server" OnClick="btnAddCategoryRef_Click" Text="Add Asset" CssClass="btn btn-info"/></center>
    </form>
</body>
</html>
