<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArchiveAsset.aspx.cs" Inherits="WebApplicationIntern.ArchiveAsset" %>

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
                        <li><a class="a2" id="btnAArchive" href="ArchiveAsset.aspx">ARCHIVE ASSET</a></li>
                        <li><a class="a3" id="btnReturn" href="Default.aspx">BACK TO HOMEPAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav><br /><br /><br />

         <div class="container-fluid">
                <center><h1 class="a3">ARCHIVE ASSET RECORD</h1></center><br /><br />
        </div><br /><br />

        <div class="Container">
            <div class="form-horizontal row a2">
                <center>
                    <div class="col-md-4">
                        <asp:Label ID="lblAsset" runat="server"> Archiving the Asset : </asp:Label>
                        <asp:Label ID="lblAssetId" runat="server"></asp:Label>
                    </div>
                </center>
                <center><div class="col-md-4">
                             <asp:Label id="lblStatusSelect" runat="server"> Status : </asp:Label>
                             <asp:DropDownList ID="ddlArchStatus" runat="server" Width="200px">
                                    <asp:ListItem Text="Select Status" Value="0"></asp:ListItem>
                             </asp:DropDownList>
                        </div>
                </center>
            </div><br />
            <div class="form-horizontal row a2">
                <center>
                    <asp:Label ID="lblDatePicker" runat="server">Archive Date : </asp:Label>
                    <asp:TextBox ID="tbCalDate" runat="server"></asp:TextBox></center><br />
                <center><asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar></center>
            </div>
        </div><br /><br /><br />

        <center><asp:Button ID="btnArchAsset" runat="server" Text="Archive Asset" CssClass="btn btn-primary1" OnClick="btnArchAsset_Click"/></center>
    </form>
</body>
</html>
