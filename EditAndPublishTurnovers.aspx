<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAndPublishTurnovers.aspx.cs" Inherits="test3.JTMC.Turnovers.EditAndPublishTurnovers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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
    width: 85px;
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


        <asp:GridView ID="GridView1" runat="server" CssClass="Grid" GridLines="Horizontal" AutoGenerateColumns="False" DataSourceID="Publish_Edit_DS">
            <Columns>
                <asp:BoundField DataField="IncidentNumber" HeaderText="IncidentNumber" SortExpression="IncidentNumber"></asp:BoundField>
                <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"></asp:BoundField>
                <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
              <%--  <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"></asp:BoundField>
                <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"></asp:BoundField>--%>
                <asp:BoundField DataField="IncidentType" HeaderText="IncidentType" SortExpression="IncidentType"></asp:BoundField>
                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                 <asp:TemplateField>
                     <HeaderTemplate>Comments</HeaderTemplate>

                    <ItemTemplate>
                     <asp:TextBox ID="Comments" TextMode="MultiLine" style="border: 1.5px #707070 solid; border-radius: 7px;" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource runat="server" ID="Publish_Edit_DS" ConnectionString='<%$ ConnectionStrings:DataWarehouseConnectionString %>' SelectCommand=""></asp:SqlDataSource>
   

        <button class="button" runat="server" onserverclick="SubmitTurnover_Click"><span>Publish </span></button>


<%--        <a runat="server" class="next" onserverclick="SubmitTurnover_Click">Next &raquo;</a>--%>


        
        
        <div>
        </div>
    </form>
</body>
</html>
