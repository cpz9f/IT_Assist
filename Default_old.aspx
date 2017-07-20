<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default_old.aspx.cs" Inherits="WebApplicationIntern.Default_old" %>

<!DOCTYPE html>
<html>
<head runat="server">
	<title>IT Assets</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome.min.css">
    <link rel="stylesheet" href="font-awesome.css">
    <link rel="stylesheet" href="Stylesheet1.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            position: relative;
        }
        .affix {
            top:0;
            width: 100%;
            z-index: 9999 !important;
        }
        .navbar {
            margin-bottom: 0px;
        }

        .affix ~ .container-fluid {
           position: relative;
           top: 50px;
        }
        #section1 {padding-top:50px;height:880px;color: #632989;}
        #section2 {padding-top:50px;height:800px;color: #632989;}
        
    </style>
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
				      <li><a class="a2" href="#section1">HOME</a></li>
				      <li><a class="a2" href="#section2">SERVICES</a></li>
	                </ul>
                </div>
            </div>
        </nav>
        <div id="section1" class="container-fluid">
	        <center><h2>WELCOME! HAPPY TO SEE YOU</h2></center>

	    </div>
	    <div id="section2" class="container-fluid">
	            <center><h1 class="a3">OUR SERVICES</h1></center><br /><br />
				<div class="col-md-3 col-xs-12 col-sm-6">
						<!--<center><i class="fa fa-archive" aria-hidden="true"></i></center>-->
						<center><h4 class="a4">ADMIN OPS</h4></center>
					    <!--<center><i class="fa fa-user-circle-o" aria-hidden="true"></i></center>-->
					    <center><asp:Image id="imgadmin" runat="server" Height="128px" Width="128px" ImageUrl="user.jpg"></asp:Image></center>
					    <br /><center><asp:Button ID="Btnadmin" runat="server" Text="Go Admin" OnClick="Btnadmin_Click" CssClass="btn btn-primary1"/></center>
					    <br /><center><p class="a4 font-format">You can perform some admin tasks like, Add or Edit categories and add new values to Existing Categories.</p></center>
				</div>

				<div class="col-md-3 col-xs-12 col-sm-6">
                        <!--<center><i class="fa fa-archive" aria-hidden="true"></i></center>-->
                        <center><h4 class="a4">ADD ASSET</h4></center>
                        <!--<center><i class="fa fa-user-circle-o" aria-hidden="true"></i></center>-->
                        <center><asp:Image id="imgAdd" runat="server" Height="128px" Width="128px" ImageUrl="add.jpg"></asp:Image></center>
                        <br /><center><asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Asset" CssClass="btn btn-primary1"/></center>
                        <br /><center><p class="a4 font-format">This is a Non-admin function, you can add a new asset to the existing records.</p></center>
                </div>

				<div class="col-md-3 col-xs-12 col-sm-6">
                        <!--<center><i class="fa fa-archive" aria-hidden="true"></i></center>-->
                        <center><h4 class="a4">NON-ADMIN OPS</h4></center>
                        <!--<center><i class="fa fa-user-circle-o" aria-hidden="true"></i></center>-->
                        <center><asp:Image id="imguser" runat="server" Height="128px" Width="128px" ImageUrl="edit.jpg"></asp:Image></center>
                        <br /><center><asp:Button ID="Btnuser" runat="server" OnClick="Btnuser_Click" Text="Go Search" CssClass="btn btn-primary1"/></center>
                        <br /><center><p class="a4 font-format">You can perform some user tasks like, Search, Edit or Archive asset records.</p></center>
                </div>

				<div class="col-md-3 col-xs-12 col-sm-6">
                        <!--<center><i class="fa fa-archive" aria-hidden="true"></i></center>-->
                        <center><h4 class="a4">LOG INFO</h4></center>
                        <!--<center><i class="fa fa-user-circle-o" aria-hidden="true"></i></center>-->
                        <center><asp:Image id="imgLog" runat="server" Height="128px" Width="128px" ImageUrl="log.jpg"></asp:Image></center>
                        <br /><center><asp:Button ID="btnLog" runat="server" Text="Check Logs" CssClass="btn btn-primary1"/></center>
                        <br /><center><p class="a4 font-format">Both Admin and Non-Admin can avail this functionality, this let you to check the logs with data changes including usernames.</p></center>
                </div>
	    </div>
	  
	</form>
</body>
</html>
