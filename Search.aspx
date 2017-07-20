<%@ Page Title="" Language="C#" MasterPageFile="~/AitInventoryMgmt.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebApplicationIntern.Search" %>
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
                        <li><a class="a2" id="btnAdvSearch" href="Search.aspx">ADVANCED SEARCH</a></li>
                        <li><a class="a3" id="btnReturn" href="Default.aspx">BACK TO HOMEPAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav><br /><br /><br />
        <div class="container-fluid">
                <center><h1 class="a3">ADVANCED INVENTORY SEARCH</h1></center>
        </div><br /><br />
        <!--<div class="col-sm-3">
				<asp:DropDownList id="ddnAssetId" runat="server">
				</asp:DropDownList>
        </div>-->
        <div class="form-horizantal row">
            <div class="form-group col-md-2"></div>
            <center><div class="form-group col-md-4"><br />
				<asp:Label id="ddlbl1" CssClass="a2" runat="server">Asset ID : </asp:Label>	
                <asp:DropDownList ID="ddlAsset" CssClass="form-control" runat="server" Width="300px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	            </asp:DropDownList>
            </div></center>

            <center><div class="form-group col-md-4"><br />
                <asp:Label id="ddlbl2" CssClass="a2" runat="server">Department Name : </asp:Label>   
                <asp:DropDownList ID="ddlDept" CssClass="form-control" runat="server" Width="300px">
                    <asp:ListItem Text="Select Department" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div></center>
            <div class="form-group col-md-2"></div>
        </div>
        
        <div class="form-horizantal row">
            <div class="form-group col-md-2"></div>
            <center><div class="form-group col-md-4"><br />
                <asp:Label id="ddlbl3" CssClass="a2" runat="server">Manufacturer : </asp:Label>   
                <asp:DropDownList ID="ddlManu" CssClass="form-control" runat="server" Width="300px">
                    <asp:ListItem Text="Select Manufacturer" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div></center>
       
            <center><div class="form-group col-md-4"><br />
                <asp:Label id="ddlbl4" CssClass="a2" runat="server">Asset Model : </asp:Label>   
                <asp:DropDownList ID="ddlMdl" CssClass="form-control" runat="server" Width="300px">
                    <asp:ListItem Text="Select Model" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div></center>
            <div class="form-group col-md-2"></div>
        </div><br />

        <div class="form-horizantal row">
                <center><asp:Button ID="btnASearch" runat="server" Text="Search Results" onclick="Click_btnASearch" CssClass="btn btn-primary1"/></center> 
        </div><br /><br />

        <div id="search_wrapper" class="col-md-12 dataTables_wrapper a2">
				    <center>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover dataTable a2" AutoGenerateColumns="false" AllowPaging="true" 
                        OnPageIndexChanging="OnPageIndexChanging" OnRowCommand="GridView2_RowCommand" PageSize="10" style="width: 100%"
                         DataKeyNames="ID">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" Visible="false"
                                DataField="ID" HeaderText="ID" />
                            <asp:BoundField ItemStyle-Width="150px" 
                                DataField="AIT_Asset_ID" HeaderText="Asset_ID" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Asset_Type" HeaderText="Asset_Type" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Status_Type" HeaderText="Status_Type" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Manufacture_Type" HeaderText="Manufacture_Type" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Model_Type" HeaderText="Model_Type" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="DeptName" HeaderText="DeptName" /> 
                            <asp:BoundField ItemStyle-Width="150px" DataField="Location" HeaderText="Location" /> 
                            <%--<asp:BoundField ItemStyle-Width="150px" DataField="Edit" HeaderText="Edit" /> 
                            <asp:BoundField ItemStyle-Width="150px" DataField="Archive" HeaderText="Archiv" />--%>

                            <asp:TemplateField HeaderText="Edit" >
                                <ItemTemplate>

                                    <div class="col-md-8">    
                                        <%--<p><a href="#modAddNewAsset" id="ancAddNewAsset" data-toggle="modal"><span class="glyphicon glyphicon-plus pull-right"></span></a></p>--%>
                                        <asp:Button ID="btnResEdit2" runat="server" Text="Edit" CssClass="btn btn-primary1" CommandName="EDIT" CommandArgument='<%# Container.DataItemIndex %>'/>
                                    </div><br />
                                    <%--<asp:Button ID="btnResEdit2" runat="server" Text="Edit" CssClass="btn btn-primary1"
                                                href="#modAddNewAsset" data-toggle="modal"/>--%>
                                </ItemTemplate>
                            </asp:TemplateField>

                           <asp:TemplateField HeaderText="Archive" >
                                <ItemTemplate>
                                    <asp:Button ID="btnResArch1" runat="server" CommandName="ARCHIVE" CommandArgument="<%# Container.DataItemIndex %>" Text="Archive" CssClass="btn btn-info"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
				</center>
</asp:Content>
