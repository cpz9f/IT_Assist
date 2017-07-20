<%@ Page Title="" Language="C#" MasterPageFile="~/AitInventoryMgmt.Master" AutoEventWireup="true" CodeBehind="ArchiveAsset.aspx.cs" Inherits="WebApplicationIntern.ArchiveAsset" %>
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
                        <li><a class="a2" id="btnNsearch" href="#">EDIT ASSET</a></li>
                        <li><a class="a2" id="btnAArchive" href="ArchiveAsset.aspx">ARCHIVE ASSET</a></li>
                        <li><a class="a3" id="btnReturn" href="Default.aspx">BACK TO HOMEPAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav><br /><br /><br />

         <div class="container-fluid">
                <center><h1 class="a3" id="head" runat="server">ARCHIVE ASSET RECORD</h1></center><br /><br />
        </div><br /><br />

        <div class="container" id="archivediv" runat="server">
            <div class="form-horizontal row a2">
                <center>
                    <div class="col-md-12">
                        <h3 class="a2"><asp:Label ID="lblAsset" runat="server" Height="40px"> Archiving the Asset : </asp:Label>
                        <asp:Label ID="lblAssetId" runat="server"></asp:Label></h3>
                    </div>
                </center>
            </div><br />

            <div class="form-horizontal row a2">
                <div class="form-group col-md-1"></div>
                <center><div class="form-group col-md-5 row a2">
                             <asp:Label id="lblStatusSelect" runat="server"> Status : </asp:Label>
                             <asp:DropDownList ID="ddlArchStatus" runat="server" CssClass="form-control" Width="300px">
                                    <asp:ListItem Text="Select Status" Value="0"></asp:ListItem>
                             </asp:DropDownList>
                        </div>
                </center>

                <center><div class="form-group col-md-5 row a2">
                    <asp:Label ID="lblDatePicker" runat="server">Archive Date : </asp:Label>
                   <asp:TextBox ID="tbCalDate" runat="server" CssClass="form-control datePicker" Width="300px"></asp:TextBox>
                    </div>
                </center>

                 <div class="form-group col-md-1"></div>
            </div>
        </div><br /><br /><br />

        <center><asp:Button ID="btnArchAsset" runat="server" Text="Archive Asset" CssClass="btn btn-primary1" OnClick="btnArchAsset_Click"/></center>
           
    <div id="afterArchive" runat="server">
           <center><asp:Label ID="lblAfterArchive" runat="server"><h2 CssClass="a2"> Successfully Arhived the Asset </h2></asp:Label></center><br /><br />
    </div>

    <div class="alert alert-dismissible alert-danger" runat="server" id="archCautionMessage">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>Oh snap!</strong> <a href="#" class="alert-link">Please select Category and the Retire date</a> and try submitting again.
    </div>
</asp:Content>
