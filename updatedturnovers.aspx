<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatedTurnovers.aspx.cs" Inherits="test3.JTMC.Turnovers.AddTurnovers" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="Panel1" runat="server" style="position:absolute; top:0%; left: 2%; width:520px; border: none;">
            <style>
                .DefaultBttnCSS{
                    border:none;
                    background-color:transparent;

                }
                .Grid, .Grid th{
                border:1px solid #F8F8F8;
                color: #303030;
                }
                .Grid td {
                border:1px solid #F8F8F8;
                color: #606060;

                }


            </style>


  <%--          <asp:Button ID="Button1" runat="server" Text="Default" CssClass="DefaultBttnCSS" />
            <asp:Button ID="Button2" runat="server" Text="AM View" />
            <asp:Button ID="Button3" runat="server" Text="PM View" />
            <asp:Button ID="Button4" runat="server" Text="Overnight View" />--%>

            <h1>Brooklyn/Staten Island</h1>
            <asp:Label ID="AMLblBQESIE" runat="server" Text="AM" Font-Bold="true"></asp:Label>
            <asp:GridView ID="GridView1" CssClass="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="TestDS" Width="506px">
                                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress"></asp:BoundField>
                   <%-- <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="Incident Type" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="Shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="Operator Initials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="TestDS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>
            <asp:Label ID="PMLblBQESIE" runat="server" Text="PM" Font-Bold="true"></asp:Label> <br/>
            <asp:GridView ID="GridView5" CssClass="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="BQE_SIE_PM_DS" Width="506px">
                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
<%--                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>--%>
                   <%-- <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="OperatorInitials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="BQE_SIE_PM_DS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>
            <asp:Label ID="OvernightLblBQESIE" runat="server" Text="Overnight" Font-Bold="true"></asp:Label>
            <asp:GridView ID="GridView6" CssClass="Grid" runat="server" DataSourceID="BQE_SIE_Overnight_DS" AutoGenerateColumns="False" Width="506px">
                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
<%--                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>--%>
                   <%-- <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="OperatorInitials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="BQE_SIE_Overnight_DS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>


            <h1>Bronx</h1>
            <asp:Label ID="BronxAMLBL" runat="server" Text="AM" Font-Bold="true"></asp:Label>
            <asp:GridView ID="GridView2" CssClass="Grid" runat="server" DataSourceID="BronxAMDS" AutoGenerateColumns="False" Width="498px">
                                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress"></asp:BoundField>
                   <%-- <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="Incident Type" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="Shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="Operator Initials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="BronxAMDS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>
            <asp:Label ID="BronxPMLBL" runat="server" Text="PM" Font-Bold="true"></asp:Label><br/>
            <asp:GridView ID="GridView7" CssClass="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="Bronx_PM_DS">
                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
<%--                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>--%>
                   <%-- <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="OperatorInitials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="Bronx_PM_DS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>
            <asp:Label ID="BronxOvernightLBL" runat="server" Text="Overnight" Font-Bold="true"></asp:Label>
            <asp:GridView ID="GridView8" CssClass="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="Bronx_Overnight_DS">
                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
                  <%--  <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="OperatorInitials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="Bronx_Overnight_DS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>
         
            
            <h1>Manhattan</h1>
            <asp:Label ID="ManhattanAMLbl" runat="server" Text="AM" Font-Bold="true"></asp:Label>
            <asp:GridView ID="GridView3" CssClass="Grid" runat="server" DataSourceID="ManhattanAMDS" AutoGenerateColumns="False" Width="498px">
                               <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress"></asp:BoundField>
                   <%-- <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="Incident Type" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="Shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="Operator Initials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="ManhattanAMDS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>
            <asp:Label ID="ManhattanPMLbl" runat="server" Text="PM" Font-Bold="true"></asp:Label><br/>
            <asp:GridView ID="GridView9" CssClass="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="Manhattan_PM_DS">
                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
                    <%--<asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="OperatorInitials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="Manhattan_PM_DS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>
            <asp:Label ID="ManhattanOvernightLbl" runat="server" Text="Overnight" Font-Bold="true"></asp:Label>
            <asp:GridView ID="GridView10" CssClass="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="Manhattan_Overnight_DS">
                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
                   <%-- <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="OperatorInitials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="Manhattan_Overnight_DS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>


            <h1>Queens</h1>
            <asp:Label ID="QueensAMLbl" runat="server" Text="AM" Font-Bold="true"></asp:Label>
            <asp:GridView ID="GridView4" CssClass="Grid" runat="server" DataSourceID="QueensAMDS" AutoGenerateColumns="False" Width="498px">
                               <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress"></asp:BoundField>
                   <%-- <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="Incident Type" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="Shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="Operator Initials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="QueensAMDS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>
            <asp:Label ID="QueensPMLbl" runat="server" Text="PM" Font-Bold="true"></asp:Label><br/>
            <asp:GridView ID="GridView11" CssClass="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="QueensPMDS">
                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
                   <%-- <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="OperatorInitials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="QueensPMDS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>
            <asp:Label ID="QueensOvernightLbl" runat="server" Text="Overnight" Font-Bold="true"></asp:Label>
            <asp:GridView ID="GridView12" CssClass="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="Queens_Overnight_DS">
                <Columns>
<%--                    <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>--%>
                    <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
                    <%--<asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                    <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
<%--                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>--%>
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments"></asp:BoundField>
                    <asp:BoundField DataField="shift" HeaderText="shift" SortExpression="shift"></asp:BoundField>
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                    <asp:BoundField DataField="OperatorInitials" HeaderText="OperatorInitials" SortExpression="OperatorInitials"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="Queens_Overnight_DS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
            <br/><br/>


        </asp:Panel>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
           
        <asp:Panel ID="Panel2" runat="server" style="position:fixed; top:0px; right: 0px; width:400px;">
            <asp:Label ID="Label2" runat="server" Text="Upcoming"></asp:Label><br/>
            <asp:Panel ID="Panel4" runat="server"   Width="300px" Height="75px" ScrollBars="auto" style="border:solid lightgray; " >
                <asp:Label ID="UpcomingLbl" runat="server"  autosize="true" TextMode="MultiLine"></asp:Label>
            </asp:Panel>

<asp:LinkButton ID="Upcomingbtn" style="position: absolute; right: 76px; top: 84px;" runat="server" OnClick="Open">
 <i style="color:#303030" class="fa fa-edit"></i></asp:LinkButton>
            <br />
            <asp:Label ID="Label1" runat="server" Text="What's New"></asp:Label> <br/>
            <asp:Panel ID="Panel5" runat="server"  Width="300px" Height="75px" ScrollBars="auto"  style="border:solid lightgray;">  
                <asp:Label ID="WhatsNewLbl" runat="server" autosize="true"  TextMode="MultiLine"></asp:Label> <br/>           
                </asp:Panel>
            <asp:LinkButton ID="WhatsNewBtn" style="position: absolute; right: 76px; top: 202px;" runat="server" OnClick="Open">
 <i style="color:#303030"  class="fa fa-edit"></i></asp:LinkButton>
            <br />

            <asp:Label ID="Label3" runat="server" Text="Ongoing"></asp:Label><br/>
            <asp:Panel ID="Panel6" runat="server" Width="300px" Height="75px" ScrollBars="auto"  style="border:solid lightgray;">
                <asp:Label ID="OngoingLbl" runat="server" autosize="true"  TextMode="MultiLine"></asp:Label> <br/>
                </asp:Panel>
<asp:LinkButton ID="OngoingBtn" style="position: absolute; right: 76px; top: 320.5px;" runat="server" OnClick="Open">
 <i style="color:#303030"  class="fa fa-edit"></i></asp:LinkButton>
        </asp:Panel>



    <asp:Panel ID="DarkPanel" visible="false" style=" left:0px; top: 0px; position:fixed; opacity: 0.5; height: 100%; width: 100%; background-color: grey; z-index: 2;" runat="server"></asp:Panel>

        <asp:Panel ID="TextEditorPanel"  Visible="false" runat="server"  style=" height: 440px; width: 450px; z-index: 3; position: absolute; background-color: white; left: 30%;">
            
<asp:TextBox ID="txtEditor" style="background-color:white;"  runat="server" Width="450" Height="400" />
<asp:HtmlEditorExtender ID="HtmlEditorExtender1"  runat="server" TargetControlID="txtEditor">
</asp:HtmlEditorExtender>
<br />
<asp:Button Text="Submit" runat="server" OnClick="Submit" />
<br />
        </asp:Panel>
     



            </ContentTemplate>
        </asp:UpdatePanel>




        

        <div>
        </div>
    </form>
</body>
</html>
