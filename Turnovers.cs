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
    public partial class turnovers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            ResetSessions();

           

        }

        protected void Pull_IMP_Bttn_Click(object sender, EventArgs e)
        {
            Session["Shift_Select"] = Shift_RadioButtonList.SelectedItem.Text;
            Session["Brooklyn"] = TextBox1.Text;
            Session["Queens_LIE"] = TextBox5.Text;
            Session["Queens_GCP"] = TextBox4.Text;
            Session["Manhattan"] = TextBox3.Text;
            Session["Bronx"]= TextBox2.Text;

            foreach (GridViewRow row in GridView1.Rows)
            {
                //if using TemplateField columns then you may need to use FindControl method
                CheckBox cb = (CheckBox)row.FindControl("Checkbox_ID");
                if (cb.Checked == true)
                {
                    if (Session["IMP"].ToString() == "") {
                        Session["IMP"] = "'"+ row.Cells[1].Text + "'";
                    }
                    else if (Session["IMP"].ToString() != "") {
                        Session["IMP"] = Session["IMP"].ToString() + "," +"'"+ row.Cells[1].Text + "'";
                    }
                   
                }
            }

            foreach (GridViewRow row in GridView2.Rows)
            {
                //if using TemplateField columns then you may need to use FindControl method
                CheckBox cb = (CheckBox)row.FindControl("Checkbox_ID");
                if (cb.Checked == true)
                {
                    if (Session["IMP"].ToString() == "")
                    {
                        Session["IMP"] = "'" + row.Cells[1].Text + "'";
                    }
                    else if (Session["IMP"].ToString() != "")
                    {
                        Session["IMP"] = Session["IMP"].ToString() + "," + "'" + row.Cells[1].Text + "'";
                    }

                }
            }


            //  Response.Write(Session["IMP"].ToString());
            Response.Redirect("~/JTMC/Turnovers/EditAndPublishTurnovers.aspx");


        }

    

        string myConnectionString()
        {
          // commented out
}

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        void ResetSessions()
        {
            Session["IMP"] = "";
            Session["Shift_Select"] = "";
            Session["Shift_Select"] = "";
            Session["Brooklyn"] = "";
            Session["Queens_LIE"] = "";
            Session["Queens_GCP"] = "";
            Session["Manhattan"] = "";
            Session["Bronx"] = "";

            //String query = " DELETE FROM [dbo].[TurnoverComments] WHERE [IncidentNumber] != '@IncidentNumber'";


            //using (SqlConnection connection = new SqlConnection(myConnectionString()))
            //{

            //    var mycommand = new SqlCommand(query, connection);
            //    if (connection.State == ConnectionState.Closed)
            //    { connection.Open(); }
            //    mycommand.Parameters.AddWithValue("@IncidentNumber", "''");

            //    mycommand.ExecuteNonQuery();


            //}
            //Response.Write("For testing purposes, All previous turnover comments and Session Variables have just been flushed");

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Session["IMP"] = "";
            Session["Shift_Select"] = "";
            Session["Shift_Select"] = "";
            Session["Brooklyn"] = "";
            Session["Queens_LIE"] = "";
            Session["Queens_GCP"] = "";
            Session["Manhattan"] = "";
            Session["Bronx"] = "";

            String query = " DELETE FROM [dbo].[TurnoverComments] WHERE [IncidentNumber] != '@IncidentNumber'";


            using (SqlConnection connection = new SqlConnection(myConnectionString()))
            {

                var mycommand = new SqlCommand(query, connection);
                if (connection.State == ConnectionState.Closed)
                { connection.Open(); }
                mycommand.Parameters.AddWithValue("@IncidentNumber", "''");

                mycommand.ExecuteNonQuery();


            }
            Response.Write("For testing purposes, All previous turnover comments and Session Variables have just been flushed");
        }


        protected void GotoTurnovers(object sender, EventArgs e)
        {
            Response.Redirect("~/JTMC/Turnovers/UpdatedTurnovers.aspx");

        }
    }
}
