<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="turnovers.aspx.cs" Inherits="test3.JTMC.Turnovers.turnovers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
   
    
    <style>
            .Grid, .Grid th{
    border:1px solid #F8F8F8;
    color: #303030;
}
         .Grid td {
    border:1px solid #F8F8F8;
    color: #606060;

}


        .button {
    border-radius: 4px;
    background-color: #E8E8E8;
    border: none;
    color: #303030;
    text-align: center;
    font-size: 14px;
    padding: 9px;
    width: 75px;
    transition: all 0.5s;
    cursor: pointer;
    margin: 5px;
}


.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}


    </style>



</head>
<body>
    <form id="form1" runat="server">
        <button runat="server" id="VisitTurnoversID" onserverclick="GotoTurnovers" title="Search" 
            style="position:absolute; top:1px; font-size:12px; right: 5px; background-color:white; border:none; color:#303030;">View Turnovers <i class='fas fa-share'></i>

        </button>
        <h2 style="color:#303030;">Crash</h2>
        <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataSourceID="PullTurnoversDs">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="Checkbox_ID" runat="server" checked="true"  />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>
                <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
                <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                <%--<asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="PullTurnoversDs" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand="SELECT [IncidentNumber], [StreetAddress], [County], [Latitude], [Longitude], [IncidentType], Remarks FROM [LiveIMP] where [IncidentType] = 'Crash' order by county"></asp:SqlDataSource>
        
        
        <br />


        <h2 style="color:#303030;">Road Work</h2>
        <asp:GridView ID="GridView2" CssClass="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="Checkbox_ID" runat="server" checked="true"  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>
                <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
                <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
                <%--<asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand="SELECT [IncidentNumber], [StreetAddress], [County], [IncidentType], [Remarks] FROM [LiveIMP] where incidenttype ='Road Work' order by county"></asp:SqlDataSource>
        
  
        <br />
        <asp:RadioButtonList ID="Shift_RadioButtonList" runat="server" style="color:#303030" >
            <asp:ListItem Text="AM" Selected="True">AM</asp:ListItem>
            <asp:ListItem Text="PM">PM</asp:ListItem>
            <asp:ListItem Text="Overnight">Overnight</asp:ListItem>
        </asp:RadioButtonList>
        <br />

        <asp:Panel ID="Panel1" runat="server" >
            <h2 style="color:#303030">Operators</h2>
            <asp:TextBox ID="TextBox1" runat="server" Text="" placeholder="Brooklyn/Staten Island:"></asp:TextBox>         <br />
            <asp:TextBox ID="TextBox2" runat="server" Text="" placeholder="Bronx:" ></asp:TextBox> <br />
            <asp:TextBox ID="TextBox3" runat="server" Text=""  placeholder="Manhattan:"></asp:TextBox> <br />
            <asp:TextBox ID="TextBox4" runat="server" Text=""  placeholder="Queens (GCP/VWE):"></asp:TextBox> <br />
            <asp:TextBox ID="TextBox5" runat="server" Text=""  placeholder="Queens (LIE/BQE):"></asp:TextBox> <br />

                    <button class="button" runat="server" onserverclick="Pull_IMP_Bttn_Click"><span>Next </span></button>

<%--       <asp:Button ID="Pull_IMP_Bttn" runat="server" Text="Continue" OnClick="Pull_IMP_Bttn_Click" />--%>

            </asp:Panel>
       
      

        <br />

        <asp:Button ID="Button1" runat="server" Text="Flush All" OnClick="Button1_Click1" />

        <div>
        </div>
    </form>
</body>
</html>
