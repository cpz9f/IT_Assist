<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search_old.aspx.cs" Inherits="WebApplicationIntern.Search" %>

<!DOCTYPE html>
<html>
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
                        <li><a class="a2" id="btnAdvSearch" href="Search.aspx">ADVANCED SEARCH</a></li>
                        <li><a class="a2" id="btnNsearch" href="#">QUICK SEARCH</a></li>
                        <li><a class="a3" id="btnReturn" href="Default.aspx">BACK TO HOMEPAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav><br /><br /><br />
        <div class="container-fluid">
                <center><h1 class="a3">ADVANCED INVENTORY SEARCH</h1></center>
        </div>
        <!--<div class="col-sm-3">
				<asp:DropDownList id="ddnAssetId" runat="server">
				</asp:DropDownList>
        </div>-->
        <div class="form-horizantal row">
            <center><div class="form-group col-md-6"><br />
				<asp:Label id="ddlbl1" CssClass="a2" runat="server">Asset ID : </asp:Label>	
                <asp:DropDownList ID="ddlAsset" runat="server" Width="200px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	            </asp:DropDownList>
            </div></center>

            <center><div class="form-group col-md-6"><br />
                <asp:Label id="ddlbl2" CssClass="a2" runat="server">Department Name : </asp:Label>   
                <asp:DropDownList ID="ddlDept" runat="server" Width="200px">
                    <asp:ListItem Text="Select Department" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div></center>
        </div>

        <div class="form-horizantal row">
            <center><div class="form-group col-md-4"><br />
                <asp:Label id="ddlbl3" CssClass="a2" runat="server">Manufacturer : </asp:Label>   
                <asp:DropDownList ID="ddlManu" runat="server" Width="200px">
                    <asp:ListItem Text="Select Manufacturer" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div></center>

            <center><div class="form-group col-md-4"><br />
                <asp:Label id="ddlbl4" CssClass="a2" runat="server">Asset Model : </asp:Label>   
                <asp:DropDownList ID="ddlMdl" runat="server" Width="200px">
                    <asp:ListItem Text="Select Model" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div></center>

            <center><div class="form-group col-md-4"><br />
                <asp:Label id="ddlbl5" CssClass="a2" runat="server">Operating System : </asp:Label>   
                <asp:DropDownList ID="ddlOs" runat="server" Width="200px">
                    <asp:ListItem Text="Select OS" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div></center>
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
    </form>  
</body>	
</html>	