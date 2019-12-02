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
    public partial class AddTurnovers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack) {
             RenderNotifications();
            }
            RenderGrids();

        }

        protected void Submit(object sender, EventArgs e)
        {
            string text = txtEditor.Text;
            if (Session["LnkLbl"].ToString() == "UpcomingLbl")
            {
                UpcomingLbl.Text = txtEditor.Text;
                TextEditorPanel.Visible = false;
            }
            else if (Session["LnkLbl"].ToString() == "WhatsNewLbl")
            {
                WhatsNewLbl.Text = txtEditor.Text;
                TextEditorPanel.Visible = false;
            }
            else if (Session["LnkLbl"].ToString() == "OngoingLbl")
            {
                OngoingLbl.Text = txtEditor.Text;
                TextEditorPanel.Visible = false;
            }

            var timeUtc = DateTime.UtcNow;
            TimeZoneInfo easternZone = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            DateTime easternTime = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, easternZone);

            String query = "INSERT INTO [dbo].[Turnover_Notifications] ([Section] ,[Notification] ,[Date] ,[time]) VALUES (@Section, @Notification, @Date, @Time)";
            using (SqlConnection connection = new SqlConnection(myConnectionString()))
            {

                var mycommand = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                { connection.Open(); }
                mycommand.Parameters.AddWithValue("@Section", Session["LnkLbl"].ToString());
                mycommand.Parameters.AddWithValue("@Notification", text);
                mycommand.Parameters.AddWithValue("@Date", easternTime.ToString("MM/dd/yyyy"));
                mycommand.Parameters.AddWithValue("@Time", easternTime.ToString("HH:mm:ss tt"));
                mycommand.ExecuteNonQuery();

            }
            TextEditorPanel.Visible = false;
            DarkPanel.Visible = false;


        }



        protected void Open(object sender, EventArgs e)
        {

            LinkButton LnkBttn = (LinkButton)sender;
            Session["LnkLbl"]  = LnkBttn.ID;
           if (Session["LnkLbl"].ToString() == "Upcomingbtn")
            {

                TextEditorPanel.Visible = true;
                txtEditor.Text = UpcomingLbl.Text;
                Session["LnkLbl"] = "UpcomingLbl";
            }
           else if (Session["LnkLbl"].ToString() == "WhatsNewBtn")
            {
                TextEditorPanel.Visible = true;
                txtEditor.Text = WhatsNewLbl.Text;
                Session["LnkLbl"] = "WhatsNewLbl";
            }
            else if (Session["LnkLbl"].ToString() == "OngoingBtn")
            {
                TextEditorPanel.Visible = true;
                txtEditor.Text = OngoingLbl.Text;
                Session["LnkLbl"] = "OngoingLbl";
            }
            DarkPanel.Visible = true;

        }

        void RenderNotifications()
        {

            string Upcoming = "SELECT TOP (1) [Section], [Notification], [Date], [time]  FROM[dbo].[Turnover_Notifications] where [Section] = 'UpcomingLbl' order by convert(date,[Date]) desc, convert(time, [time]) desc";
            SqlConnection UpcomingConn = new SqlConnection(myConnectionString());
            SqlCommand UpcomingComm = new SqlCommand(Upcoming, UpcomingConn);
            UpcomingConn.Open();
            SqlDataReader UpcomingDR = UpcomingComm.ExecuteReader();
            if (UpcomingDR.Read())
            {
                UpcomingLbl.Text = UpcomingDR.GetValue(1).ToString();
            }
            UpcomingConn.Close();

            ////////////
            string Ongoing = "SELECT TOP (1) [Section], [Notification], [Date], [time]  FROM[dbo].[Turnover_Notifications] where [Section] = 'OngoingLbl' order by convert(date,[Date]) desc, convert(time, [time]) desc";
            SqlConnection OngoingConn = new SqlConnection(myConnectionString());
            SqlCommand OngoingComm = new SqlCommand(Ongoing, OngoingConn);
            OngoingConn.Open();
            SqlDataReader OngoingDR = OngoingComm.ExecuteReader();
            if (OngoingDR.Read())
            {
                OngoingLbl.Text = OngoingDR.GetValue(1).ToString();
            }
            OngoingConn.Close();

            ////////////
            string WhatsNew = "SELECT TOP (1) [Section], [Notification], [Date], [time]  FROM[dbo].[Turnover_Notifications] where [Section] = 'WhatsNewLbl' order by convert(date,[Date]) desc, convert(time, [time]) desc";
            SqlConnection WhatsNewConn = new SqlConnection(myConnectionString());
            SqlCommand WhatsNewComm = new SqlCommand(WhatsNew, WhatsNewConn);
            WhatsNewConn.Open();
            SqlDataReader WhatsNewDR = WhatsNewComm.ExecuteReader();
            if (WhatsNewDR.Read())
            {
                WhatsNewLbl.Text = WhatsNewDR.GetValue(1).ToString();
            }
            WhatsNewConn.Close();

        }

            string myConnectionString()
        {
        }

        void RenderGrids()
        {

            String LastAMTime="";
            string FindLastAMTime = @" SELECT TOP (1)
      [Date]
      ,[Shift]
      ,[Time]
  FROM [dbo].[TurnoverComments]
  where shift = 'AM'
    order by date desc, time desc";
            SqlConnection FindLastAMTimeConn = new SqlConnection(myConnectionString());
            SqlCommand FindLastAMTimeComm = new SqlCommand(FindLastAMTime, FindLastAMTimeConn);
            FindLastAMTimeConn.Open();
            SqlDataReader FindLastAMTimeDR = FindLastAMTimeComm.ExecuteReader();
            if (FindLastAMTimeDR.Read())
            {
                LastAMTime = FindLastAMTimeDR.GetValue(0).ToString() + " " + FindLastAMTimeDR.GetValue(2).ToString();
            }
            FindLastAMTimeConn.Close();


            String LastPMTime="";
            string FindLastPMTime = @" SELECT TOP (1)
                                    [Date]
                                    ,[Shift]
                                    ,[Time]
                                    FROM [dbo].[TurnoverComments]
                                    where shift = 'PM'
                                    order by date desc, time desc";
            SqlConnection FindLastPMTimeConn = new SqlConnection(myConnectionString());
            SqlCommand FindLastPMTimeComm = new SqlCommand(FindLastPMTime, FindLastPMTimeConn);
            FindLastPMTimeConn.Open();
            SqlDataReader FindLastPMTimeDR = FindLastPMTimeComm.ExecuteReader();
            if (FindLastPMTimeDR.Read())
            {
                LastPMTime = FindLastPMTimeDR.GetValue(0).ToString() + " " + FindLastPMTimeDR.GetValue(2).ToString();
            }
            FindLastPMTimeConn.Close();


            String LastOvernightTime ="";
            string FindLastOvernightTime = @" SELECT TOP (1)
                                    [Date]
                                    ,[Shift]
                                    ,[Time]
                                    FROM [dbo].[TurnoverComments]
                                    where shift = 'Overnight'
                                    order by date desc, time desc";
            SqlConnection FindLastOvernightTimeConn = new SqlConnection(myConnectionString());
            SqlCommand FindLastOvernightTimeComm = new SqlCommand(FindLastOvernightTime, FindLastOvernightTimeConn);
            FindLastOvernightTimeConn.Open();
            SqlDataReader FindLastOvernightTimeDR = FindLastOvernightTimeComm.ExecuteReader();
            if (FindLastOvernightTimeDR.Read())
            {
                LastOvernightTime = FindLastOvernightTimeDR.GetValue(0).ToString() + " " + FindLastOvernightTimeDR.GetValue(2).ToString();
            }
            FindLastOvernightTimeConn.Close();



            var timeUtc = DateTime.UtcNow;
            TimeZoneInfo easternZone = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            DateTime easternTime = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, easternZone);

            TestDS.SelectCommand = @"Select Toc.[IncidentNumber], StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
IMP.Remarks,
toc.[OperatorInitials]


from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
      ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county in ('Kings','Richmond') and shift ='AM' and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '"+ LastAMTime + "')  and convert(datetime, '"+ LastAMTime +"') >     dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";

            BQE_SIE_PM_DS.SelectCommand = @"Select Toc.[IncidentNumber], StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
IMP.Remarks,
toc.[OperatorInitials]


from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
      ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county in ('Kings','Richmond') and shift ='PM'             and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastPMTime + "')  and convert(datetime, '" + LastPMTime + "') >     dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";
            BQE_SIE_Overnight_DS.SelectCommand = @"Select Toc.[IncidentNumber], StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
IMP.Remarks,
toc.[OperatorInitials]


from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
      ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county in ('Kings','Richmond') and shift ='Overnight' and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastOvernightTime + "')  and convert(datetime, '" + LastOvernightTime + "') >    dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";

            BronxAMDS.SelectCommand = @"Select
Toc.[IncidentNumber],
StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
imp.Remarks,
toc.[OperatorInitials]
from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
      ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county = 'Bronx' and shift = 'AM' 
and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastAMTime + "') and convert(datetime, '" + LastAMTime + "') >    dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";
            Bronx_PM_DS.SelectCommand = @"Select
Toc.[IncidentNumber],
StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
imp.Remarks,
toc.[OperatorInitials]
from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
      ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county = 'Bronx' and shift = 'PM'              and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastPMTime + "')  and convert(datetime, '" + LastPMTime + "') >    dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";
            Bronx_Overnight_DS.SelectCommand = @"Select
Toc.[IncidentNumber],
StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
imp.Remarks,
toc.[OperatorInitials]
from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
      ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county = 'Bronx' and shift = 'Overnight'             and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastOvernightTime + "')  and convert(datetime, '" + LastOvernightTime + "') >      dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";

            ManhattanAMDS.SelectCommand = @"Select
Toc.[IncidentNumber],
StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
imp.Remarks,
toc.[OperatorInitials]


from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
     ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county = 'New York' and shift = 'AM' and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastAMTime + "')   and convert(datetime, '" + LastAMTime + "') >     dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";

            Manhattan_PM_DS.SelectCommand = @"Select
Toc.[IncidentNumber],
StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
imp.Remarks,
toc.[OperatorInitials]


from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
     ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county = 'New York' and shift = 'PM'             and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastPMTime + "')   and convert(datetime, '" + LastPMTime + "') >    dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";

            Manhattan_Overnight_DS.SelectCommand = @"Select
Toc.[IncidentNumber],
StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
imp.Remarks,
toc.[OperatorInitials]


from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
     ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county = 'New York' and shift = 'Overnight'             and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastOvernightTime + "')  and convert(datetime, '" + LastOvernightTime + "') >      dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";

            QueensAMDS.SelectCommand = @"Select
Toc.[IncidentNumber],
StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
imp.Remarks,
toc.[OperatorInitials]


from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
     ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county = 'Queens' and shift = 'AM' and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastAMTime + "')   and convert(datetime, '" + LastAMTime + "') >     dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";
            QueensPMDS.SelectCommand = @"Select
Toc.[IncidentNumber],
StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
imp.Remarks,
toc.[OperatorInitials]


from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
     ,[OperatorInitials]
,time
  FROM[dbo].[TurnoverComments]) toc
 left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
where county = 'Queens' and shift = 'PM' and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastPMTime + "') and convert(datetime, '" + LastPMTime + "') >    dateadd(hour, -10, convert(datetime, '" + easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";

            Queens_Overnight_DS.SelectCommand = @"Select
Toc.[IncidentNumber],
StreetAddress,
County,
Latitude,
Longitude,
imp.[IncidentType],
TOC.Date,
TOC.Comments,
toc.shift,
imp.Remarks,
toc.[OperatorInitials]


from
(
SELECT
    [IncidentNumber]
      ,[Date]
      ,[Shift]
      ,[Comments]
     ,[OperatorInitials],
      time
  FROM[dbo].[TurnoverComments]) toc
    left join[dbo].[LiveIMP] as IMP on TOC.[IncidentNumber] = IMP.IncidentNumber
    where county = 'Queens' and shift = 'Overnight' and convert(datetime, concat([date], ' ', [time])) = convert(datetime, '" + LastOvernightTime + "')  and convert(datetime, '" + LastOvernightTime + "') >      dateadd(hour, -10, convert(datetime, '"+ easternTime.ToString("MM/dd/yyyy HH:mm:ss tt") + "'))";



        }
    }
}
