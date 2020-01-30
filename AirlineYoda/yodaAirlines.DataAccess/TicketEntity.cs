using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace yodaAirlines.DataAccess
{
    public class TicketEntity
    {
        private string _DEPARTURE;
        private string _ARRIVAL;
        private string _AIRPLANE;
        private string _DATE;
        private string _TIME;

        public string departure
        {
            get { return _DEPARTURE; }
            set { _DEPARTURE = value; }
        }
        public string arrival
        {
            get { return _ARRIVAL; }
            set { _ARRIVAL = value; }
        }
        public string airplane
        {
            get { return _AIRPLANE; }
            set { _AIRPLANE = value; }
        }
        public string date
        {
            get { return _DATE; }
            set { _DATE = value; }
        }
        public string time
        {
            get { return _TIME; }
            set { _TIME = value; }
        }

        public string toString()
        {
            return "Departure: " + _DEPARTURE + " Arrival: " + _ARRIVAL + " Date: " + _DATE + " Time: " + _TIME + " Airplane: " + _AIRPLANE;
        }
    }
}
