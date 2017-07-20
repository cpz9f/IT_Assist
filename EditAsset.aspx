<%@ Page Title="" Language="C#" MasterPageFile="~/AitInventoryMgmt.Master" AutoEventWireup="true" CodeBehind="EditAsset.aspx.cs" Inherits="WebApplicationIntern.EditAsset" %>
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
                        <li><a class="a2" id="btnNsearch" href="EditAsset.aspx">EDIT ASSET</a></li>
                        <li><a class="a2" id="btnArchAsset" href="#">ARCHIVE ASSET</a></li>
                        <li><a class="a3" id="btnReturn" href="Default.aspx">BACK TO HOMEPAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav><br /><br /><br />

    <div class="container-fluid">
           <center><h1 class="a3">EDIT ASSET RECORD</h1></center><br /><br />
    </div>

    <div id="inner" class="container" runat="server">
         <div class="form-horizantal a2 row">
                <div class="form-group col-md-4">
	                <asp:Label id="lblEdAsset" for="tbEdAssetId" runat="server">Asset Id : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdAssetId" runat="server" ReadOnly="true" CssClass="form-control" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div>


                <div class="dropdown col-md-4 form-group">
	                <asp:Label id="Label2" for="ddlEdAssetTypeID" runat="server">AssetType: </asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlEdAssetTypeID" CssClass="form-control required" runat="server" Width="250px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                </asp:DropDownList>
	            <%--    <asp:TextBox id="tbEdAssetTypeId" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div>

                    <div class="dropdown form-group col-md-4">
	                    <asp:Label id="Label16" runat="server"> Usage Reference ID : </asp:Label>&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlEdUsageRefID" runat="server" CssClass="form-control required" Width="250px">
	                    <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                    </asp:DropDownList> 
	                    <%--<asp:TextBox id="tbEdUsageRefID" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                        <!--<span class="form-icon fa fa-user"></span>-->
	                </div>
       </div>

         <div class="form-horizantal a2 row">
            <div class="dropdown col-md-4 form-group">
	                    <asp:Label id="Label15" runat="server"> Department Name : </asp:Label>&nbsp;&nbsp;&nbsp;
                         <asp:DropDownList ID="ddlEdDeptName" runat="server" CssClass="form-control required" Width="250px">
	                    <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                    </asp:DropDownList>
	                  <%--  <asp:TextBox id="tbEdDeptName" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                        <!--<span class="form-icon fa fa-user"></span>-->
	         </div>       
       
            <div class="dropdown form-group col-md-4">
	                    <asp:Label id="Label4" for="ddlEdManuRefID" runat="server">Manufacturer: </asp:Label>&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlEdManuRefID" CssClass="form-control required" runat="server"  Width="250px">
	                    <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                    </asp:DropDownList> 
	                    <%--<asp:TextBox id="tbEdManuRefID" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                        <!--<span class="form-icon fa fa-user"></span>-->
	        </div>

             <div class="dropdown col-md-4 form-group">
	                    <asp:Label id="Label3" for="ddlEdStatusId" runat="server">Status: </asp:Label>&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlEdStatusId" CssClass="form-control required" runat="server" Width="250px">
	                    <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                    </asp:DropDownList>    
	                   <%-- <asp:TextBox id="tbEdStatusId" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                        <!--<span class="form-icon fa fa-user"></span>-->
	         </div>
            
        </div>

         <div class="form-horizantal a2 row">
                <div class="dropdown col-md-4 form-group">
	                <asp:Label id="Label5" runat="server">Model: </asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlEdModelRefID" CssClass="form-control required" runat="server" Width="250px">
	                <asp:ListItem Text="Select Asset" Value="0"></asp:ListItem>
	                </asp:DropDownList>
	               <%-- <asp:TextBox id="tbEdModelRefID" runat="server" CssClass="input-block" Height="30px" Width="250px"></asp:TextBox><br /><br />--%>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            </div>

              <div class="form-group col-md-4">  
	                <asp:Label id="Label11" runat="server">Marked for Replacement: </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdMark4Replace" runat="server" CssClass="form-control required" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	            
            </div>

             <div class="form-group col-md-4">
	                <asp:Label id="Label6" runat="server">Serial Number : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdSerialNum" runat="server" CssClass="form-control" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
            </div>
       </div>

         <div class="form-horizantal a2 row">
             <div class="form-group col-md-4">
	                <asp:Label id="Label9" runat="server">Init Date : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdInitDate" runat="server" CssClass="form-control datePicker" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
             </div>
 
             <div class="form-group col-md-4">
                <asp:Label id="Label20" runat="server"> Audit Date : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdAuditDate" runat="server" CssClass="form-control datePicker" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>--> 
              </div>

            <div class="form-group col-md-4">                    
                    <asp:Label id="Label10" runat="server">Warranty End Date: </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdWarrantyEndDate" runat="server" CssClass="form-control datePicker" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	        </div>

             
         </div>
        
         <div class="form-horizantal a2 row">  
             <div class="form-group col-md-4">     
	                <asp:Label id="Label12" runat="server">Retired Date : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdRetiredDate" runat="server" CssClass="form-control datePicker" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
             </div>

             <div class="form-group col-md-4">
	                <asp:Label id="Label18" runat="server"> Location : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdLocation" runat="server" CssClass="form-control" Height="40px" Width="250px"></asp:TextBox>
                                                <!--<span class="form-icon fa fa-user"></span>-->    
             </div>

             <div class="form-group col-md-4"> 
                <asp:Label id="Label19" runat="server"> Pay Location : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdPayLoc" runat="server" CssClass="form-control" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->    
            </div>
        </div>

         <div class="form-horizantal a2 row">
             <div class="form-group col-md-4">
	                <asp:Label id="Label7" runat="server">MM Asset Tag : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdMMAssetTag" runat="server" CssClass="form-control" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	         </div>
             
             <div class="form-group col-md-4">  
	                <asp:Label id="Label8" runat="server">Required Number : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdReqNum" runat="server" CssClass="form-control" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	         </div>

             <div class="form-group col-md-4">
	            <asp:Label id="Label17" runat="server"> Police Asset ID : </asp:Label>&nbsp;&nbsp;&nbsp;
	            <asp:TextBox id="tbEdPoliceAssetID" runat="server" CssClass="form-control" Height="40px" Width="250px"></asp:TextBox>
                                            <!--<span class="form-icon fa fa-user"></span>-->        
            </div>
        </div>

         <div class="form-horizantal a2 row">
            <div class="form-group col-md-4">
                    <asp:Label id="Label13" runat="server"> Disposal Reason : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdDispoReason" runat="server" CssClass="form-control" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
	        </div>

            <div class="form-group col-md-4">
                    <asp:Label id="Label21" runat="server"> Notes : </asp:Label>&nbsp;&nbsp;&nbsp;
	                <asp:TextBox id="tbEdNotes" runat="server" CssClass="form-control" Height="40px" Width="250px"></asp:TextBox>
                                    <!--<span class="form-icon fa fa-user"></span>-->
             </div>
         </div>
 
    </div>  

    <div id="submission" runat="server">
            <center><asp:Button ID="tbnEditSubmit" runat="server" Text="Update Asset" OnClick="tbnEditSubmit_Click" CssClass="btn btn-primary1"/>
            </center>
     </div>

    <div id="afterEdit" runat="server">
            <center><asp:Label ID="lblAfterEdit" runat="server"><h2 CssClass="a2"> Successfully Edited the Asset </h2></asp:Label></center><br /><br />
    </div>

    <div class="alert alert-dismissible alert-danger" runat="server" id="editCautionMessage">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>Oh snap!</strong> <a href="#" class="alert-link">Please fill all mandatory fields</a> and try submitting again.
        </div>
</asp:Content>
