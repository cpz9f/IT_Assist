<%@ Page Title="" Language="C#" MasterPageFile="~/AitInventoryMgmt.Master" AutoEventWireup="true" CodeBehind="AdminOps.aspx.cs" Inherits="WebApplicationIntern.AdminOps" %>
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
                        <li><a class="a2" id="btnAdvSearch" href="AdminOps.aspx">ADD VALUES TO CATEGORIES</a></li>
                        <li><a class="a3" id="btnReturn" href="Default.aspx">BACK TO HOMEPAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav><br /><br /><br />

         <div class="container-fluid">
                <center><h1 class="a3">ADMIN OPERATIONS</h1></center>
        </div><br /><br /><br /><br />

        <div class="Container" runat="server" id="outerDiv">
            <div class="form-horizantal row">
                <div class="form-group col-md-1"></div>
            <div class="form-group col-md-5">
				<center><asp:Label id="ddlbl1" CssClass="a2" runat="server">Category Type: </asp:Label>&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlNewRefData" runat="server" Width="200px">
	                <asp:ListItem Text="Select Category : " Value="0"></asp:ListItem>
	            </asp:DropDownList></center>
            </div>

                <div class="form-group col-md-5">
                    <asp:TextBox id="tbNewRefData" runat="server" placeholder="Enter New Reference Data" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox>
                </div>
                <div class="form-group col-md-1"></div>
            </div>
        </div><br /><br />
        <div id="afterSubmit" runat="server">
            <center><asp:Label ID="lblStatus" runat="server"><h2 CssClass="a2"> Successfully created the new </h2></asp:Label></center><br /><br />
            <center><asp:Button ID="btnAfterStatus" runat="server" OnClick="btnAfterStatus_Click" Text="Add another Category" CssClass="btn btn-info"/></center>
        </div>
        
        <center><asp:Button ID="btnAddCategoryRef" runat="server" OnClick="btnAddCategoryRef_Click" Text="Add Category" CssClass="btn btn-info"/></center>
        
        <div class="alert alert-dismissible alert-danger" runat="server" id="adminCautionMessage">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>Oh snap!</strong> <a href="#" class="alert-link">Please select Category and the Retire date</a> and try submitting again.
        </div>
</asp:Content>
