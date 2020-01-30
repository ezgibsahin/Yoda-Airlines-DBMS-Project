using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using yodaAirlines.DataAccess;

namespace yodaAirlines.Business
{
    public class Ticket
    {
        public static List<string> getTicketFrom()
        {
            return DataAccess.TicketDAO.GetTicketFrom();
        }

        public static List<string> getTicketWhere(string selectedFrom)
        {
            return DataAccess.TicketDAO.GetTicketWhere(selectedFrom);
        }
        public static List<string> getTicketDate(string selectedFrom, string selectedTo)
        {
            return DataAccess.TicketDAO.GetTicketDate(selectedFrom, selectedTo);
        }

        public static List<string> getDepartureTicketInformations(string selectedFrom, string selectedTo, string selectedDate)
        {
            return DataAccess.TicketDAO.GetDepartureTicketInfo(selectedFrom, selectedTo, selectedDate);
        }

        public static object getReturnTicketFrom()
        {
            return DataAccess.TicketDAO.GetRoundTripTicketFrom();
        }

        public static List<string> getReturnTicketInformations(string selectedTo, string selectedFrom, string selectedDate)
        {
            return DataAccess.TicketDAO.GetReturnTicketInfo(selectedTo, selectedFrom, selectedDate);
        }

        public static List<string> getRoundTripTicketWhere(string selectedFrom)
        {
            return DataAccess.TicketDAO.GetRoundTripTicketWhere(selectedFrom);
        }

        public static List<string> getRoundTripTicketDate(string selectedFrom, string selectedTo)
        {
            return DataAccess.TicketDAO.GetRoundTripTicketDate(selectedFrom, selectedTo);
        }

        public static List<TicketEntity> getReturnTicketInformationsList(string selectedTo, string selectedFrom, string selectedDate)
        {
            return DataAccess.TicketDAO.GetReturnTicketInfoList(selectedTo, selectedFrom, selectedDate);
        }

        public static List<string> getTicketSeat(string selectedAirplane)
        {
            return DataAccess.TicketDAO.GetTicketOUTseat(selectedAirplane);
        }
    }
}
