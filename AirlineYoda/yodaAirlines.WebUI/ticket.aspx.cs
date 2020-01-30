using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using yodaAirlines.Business;
using yodaAirlines.DataAccess;

namespace yodaAirlines.WebUI
{
    public partial class ticket : System.Web.UI.Page
    {
        string selectedFrom = "ANKARA", selectedTo = "", selectedDate = "", selectedAirplane;
        string numberOfPassengers = "0";
        string selectedOUTflight = "";
        string selectedINflight = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ButtonGO.Visible = false;
            RadioButtonListIN.Visible = false;
            RadioButtonListOUT.Visible = false;
            RadioButtonListOUTseat.Visible = false;
            if (!IsPostBack)
            {
                DropDownListTicketFrom.DataSource = Business.Ticket.getTicketFrom();
                DropDownListTicketFrom.DataBind();
            }
            else
            {
                if (RadioButtonList1.SelectedIndex == 1)
                {
                    DropDownListTicketFrom.DataSource = Business.Ticket.getReturnTicketFrom();
                    DropDownListTicketFrom.DataBind();
                }
                try
                {
                    selectedTo = DropDownListTicketWhere.SelectedItem.Text;
                    selectedDate = DropDownListTicketDate.SelectedItem.Text;
                }
                catch(NullReferenceException ec)
                {

                }
                
            }
            selectedFrom = DropDownListTicketFrom.SelectedItem.Text;

        }       
       
        protected void RadioButtonListOUT_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedOUTflight = RadioButtonListOUT.SelectedItem.Text;
            string[] wordsOUT = selectedOUTflight.Split(' ');
            selectedAirplane = wordsOUT[9];
            RadioButtonListOUTseat.Visible = true;
            RadioButtonListOUTseat.DataSource = Business.Ticket.getTicketSeat(selectedAirplane);
            RadioButtonListOUTseat.DataBind();
        }

        protected void RadioButtonListIN_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedINflight = RadioButtonListIN.SelectedItem.Text;
            string[] wordsIN = selectedINflight.Split(' ');
            selectedAirplane = wordsIN[9];
            RadioButtonListINSeat.Visible = true;
            RadioButtonListINSeat.DataSource = Business.Ticket.getTicketSeat(selectedAirplane);
            RadioButtonListINSeat.DataBind();
        }

        protected void ButtonGO_Click(object sender, EventArgs e)
        {
            
        }

        protected void DropDownListTicketWhere_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedTo = DropDownListTicketWhere.SelectedItem.Text;
            if(RadioButtonList1.SelectedIndex == 1)
            {
                DropDownListTicketDate.DataSource = Business.Ticket.getRoundTripTicketDate(selectedFrom, selectedTo);
                DropDownListTicketDate.DataBind();
            }
            else
            {
                DropDownListTicketDate.DataSource = Business.Ticket.getTicketDate(selectedFrom, selectedTo);
                DropDownListTicketDate.DataBind();
            }            
        }

        protected void DropDownListTicketDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedDate = DropDownListTicketDate.SelectedItem.Text;
        }

        protected void DropDownListTicketPassengerNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            numberOfPassengers = DropDownListTicketPassengerNumber.SelectedItem.Text;

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownListTicketFrom_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedFrom = DropDownListTicketFrom.SelectedItem.Text;
            if(RadioButtonList1.SelectedIndex == 1)
            {
                DropDownListTicketWhere.DataSource = Business.Ticket.getRoundTripTicketWhere(selectedFrom);
                DropDownListTicketWhere.DataBind();
            }
            else
            {
                DropDownListTicketWhere.DataSource = Business.Ticket.getTicketWhere(selectedFrom);
                DropDownListTicketWhere.DataBind();
            }

        }

        protected void ButtonFindTicket_Click(object sender, EventArgs e)
        {
            LabelSelectOUT.Text = "Please select a flight " + selectedFrom + " to " + selectedTo + " :";
            ButtonGO.Visible = true;
            RadioButtonListOUT.Visible = true;
            RadioButtonListOUT.DataSource = Business.Ticket.getDepartureTicketInformations(selectedFrom, selectedTo, selectedDate);
            RadioButtonListOUT.DataBind();
            
            if(RadioButtonList1.SelectedIndex == 1)
            {
                LabelSelectIN.Text = "Please select a flight " + selectedTo + " to " + selectedFrom + " :";
                RadioButtonListIN.Visible = true;
                RadioButtonListIN.DataSource = Business.Ticket.getReturnTicketInformations(selectedTo, selectedFrom, selectedDate);
                RadioButtonListIN.DataBind();
            }
        }

    }
}