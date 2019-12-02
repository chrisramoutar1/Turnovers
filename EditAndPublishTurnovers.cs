using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test3.JTMC.Turnovers
{
    public partial class EditAndPublishTurnovers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Publish_Edit_DS.SelectCommand = "SELECT [IncidentNumber], [StreetAddress], [County], [Latitude], [Longitude], [IncidentType], Remarks FROM [LiveIMP]" +
                "where [IncidentNumber] in ("+Session["IMP"].ToString() + ") order by county, IncidentType";
        }

        protected void SubmitTurnover_Click(object sender, EventArgs e)
        {
            var timeUtc = DateTime.UtcNow;
            TimeZoneInfo easternZone = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            DateTime easternTime = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, easternZone);

            String query = "INSERT INTO [dbo].[TurnoverComments] ([IncidentNumber] ,[Date] ,[Shift] ,[Comments],[OperatorInitials], [Time]) VALUES (@IncidentNumber, @Date, @Shift, @Comments, @OperatorInitials, @Time)";


            foreach (GridViewRow row in GridView1.Rows)
            {
                //if (row.Cells[2].Text == "Kings") { }
                //if (row.Cells[2].Text == "Queens") { }
                //if (row.Cells[2].Text == "Bronx") { }
                //if (row.Cells[2].Text == "New York") { }
                //if (row.Cells[2].Text == "Richmond") { }


                using (SqlConnection connection = new SqlConnection(myConnectionString()))
                {
                    

                    var mycommand = new SqlCommand(query, connection);
                    if (connection.State == ConnectionState.Closed)
                    { connection.Open(); }
                    System.Web.UI.WebControls.TextBox Comments = (System.Web.UI.WebControls.TextBox)row.FindControl("Comments");
                    mycommand.Parameters.AddWithValue("@IncidentNumber", row.Cells[0].Text);
                    mycommand.Parameters.AddWithValue("@Date", easternTime.ToString("MM/dd/yyyy"));
                    mycommand.Parameters.AddWithValue("@Shift", Session["Shift_Select"].ToString());
                    mycommand.Parameters.AddWithValue("@Comments", Comments.Text);
                    mycommand.Parameters.AddWithValue("@Time", easternTime.ToString("HH:mm:ss tt"));

                    if (row.Cells[2].Text == "Kings")
                            {
                                mycommand.Parameters.AddWithValue("@OperatorInitials", Session["Brooklyn"].ToString());
                            }
                            if (row.Cells[2].Text == "Bronx")
                            {
                                mycommand.Parameters.AddWithValue("@OperatorInitials", Session["Bronx"].ToString());
                            }
                            if (row.Cells[2].Text == "New York")
                            {
                                mycommand.Parameters.AddWithValue("@OperatorInitials", Session["Manhattan"].ToString());
                            }
                            if (row.Cells[2].Text == "Richmond")
                            {
                                mycommand.Parameters.AddWithValue("@OperatorInitials", Session["Brooklyn"].ToString());
                            }
                            if (row.Cells[2].Text == "Queens")
                            {
                                string s1 = ReturnStation(row.Cells[0].Text);
                                if (s1.Contains("Van") || s1.Contains("Belt") || s1.Contains("Grand") || s1.Contains("Clear") || s1.Contains("CVE")
                                    || s1.Contains("VWE") || s1.Contains("GCP") || s1.Contains("White") || s1.Contains("Cross"))
                                { mycommand.Parameters.AddWithValue("@OperatorInitials", Session["Queens_GCP"].ToString()); }

                                if (s1.Contains("BQE") || s1.Contains("LIE") || s1.Contains("Brooklyn") || s1.Contains("Long"))
                                { mycommand.Parameters.AddWithValue("@OperatorInitials", Session["Queens_LIE"].ToString()); }
                            }

                    mycommand.ExecuteNonQuery();


                }
            }

            Response.Redirect("~/JTMC/Turnovers/UpdatedTurnovers.aspx");
        }





        string myConnectionString()
        {
        }

        string ReturnStation(string IncidentNumber)
        {
            String lat = "";
            String lng = "";


            string latlngSQL = @"SELECT TOP (1) [IncidentNumber]
                                ,[Latitude]
                                ,[Longitude]
                                FROM [dbo].[LiveIMP]
                                where IncidentNumber = '"+ IncidentNumber + "'";
            SqlConnection LatLngConnection = new SqlConnection(myConnectionString());
            SqlCommand LatLngComm = new SqlCommand(latlngSQL, LatLngConnection);
            LatLngConnection.Open();
            SqlDataReader LatLngDR = LatLngComm.ExecuteReader();
            if (LatLngDR.Read())
            {
                lat = LatLngDR.GetValue(1).ToString();
                lng = LatLngDR.GetValue(2).ToString();
            }
            LatLngConnection.Close();

            /////////////////////////
            ///
            string highway = "";
            string GetHighwaySql = @"SELECT top (1) *, ROUND ((3960 * acos(cos(radians('"+lat+"')) *  cos(radians([Latitude])) " +
                                    "* cos(radians([Longitude]) - radians("+ lng + ")) +  sin(radians("+lat+")) " +
                                    "* sin(radians([Latitude])))), 1) AS 'Distance in miles' " +
                                    "FROM[dbo].[Queens Exits] ORDER BY[Distance in miles] ASC";
            SqlConnection GetHighwayConnection = new SqlConnection(myConnectionString());
            SqlCommand GetHighwayComm = new SqlCommand(GetHighwaySql, GetHighwayConnection);
            GetHighwayConnection.Open();
            SqlDataReader GetHighwayDR = GetHighwayComm.ExecuteReader();
            if (GetHighwayDR.Read())
            {
                highway = GetHighwayDR.GetValue(2).ToString();
            }
            GetHighwayConnection.Close();





           
            return highway;
            
        }
    }
}
