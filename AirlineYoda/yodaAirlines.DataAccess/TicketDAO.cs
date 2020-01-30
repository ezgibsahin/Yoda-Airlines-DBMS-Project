using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace yodaAirlines.DataAccess
{
    public class TicketDAO
    {
        public static List<string> GetTicketFrom()
        {
            List<string> fromCities = null;
            SqlCommand com = new SqlCommand("SP_GetFrom", Connection.Con);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                fromCities = new List<string>();
                while (reader.Read())
                {
                    fromCities.Add(reader.GetString(0));
                }
            }
            return fromCities;
        }

        public static List<string> GetDepartureTicketInfo(string selectedFrom, string selectedTo, string selectedDate)
        {
            List<string> departureTicketList = null;
            SqlCommand com = new SqlCommand("SP_GetFlightsBySelection @selectedCityFrom, @selectedCityWhere, @selectedDate", Connection.Con);
            com.Parameters.AddWithValue("@selectedCityFrom", selectedFrom);
            com.Parameters.AddWithValue("@selectedCityWhere", selectedTo);
            com.Parameters.AddWithValue("@selectedDate", selectedDate);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                departureTicketList = new List<string>();
                while (reader.Read())
                {
                    TicketEntity te = new TicketEntity
                    {
                        departure = reader["DEPARTURE"].ToString(),
                        arrival = reader["ARRIVAL"].ToString(),
                        airplane = reader["AIRPLANE"].ToString(),
                        date = reader["DATE"].ToString(),
                        time = reader["TIME"].ToString()
                    };
                    departureTicketList.Add(te.toString());
                }
            }
            com.Dispose();
            com.Connection.Close();
            return departureTicketList;
        }

        public static List<string> GetTicketOUTseat(string selectedAirplane)
        {
            List<string> seats = null;
            SqlCommand com = new SqlCommand("SP_GetSeat @selectedAirplane", Connection.Con);
            com.Parameters.AddWithValue("@selectedAirplane", selectedAirplane);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                seats = new List<string>();
                while (reader.Read())
                {
                    seats.Add(reader.GetString(0));
                }
            }
            return seats;
        }

        public static List<TicketEntity> GetReturnTicketInfoList(string selectedTo, string selectedFrom, string selectedDate)
        {
            List<TicketEntity> returnTicketList = null;
            SqlCommand com = new SqlCommand("SP_GetReturnFligthsBySelection @selectedFrom, @selectedTo, @selectedDate", Connection.Con);
            com.Parameters.AddWithValue("@selectedFrom", selectedTo);
            com.Parameters.AddWithValue("@selectedTo", selectedFrom);
            com.Parameters.AddWithValue("@selectedDate", selectedDate);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                returnTicketList = new List<TicketEntity>();
                while (reader.Read())
                {
                    TicketEntity te = new TicketEntity
                    {
                        departure = reader["DEPARTURE"].ToString(),
                        arrival = reader["ARRIVAL"].ToString(),
                        airplane = reader["AIRPLANE"].ToString(),
                        date = reader["DATE"].ToString(),
                        time = reader["TIME"].ToString()
                    };
                    returnTicketList.Add(te);
                }
            }
            com.Dispose();
            com.Connection.Close();
            return returnTicketList;
        }

        public static List<string> GetRoundTripTicketDate(string selectedFrom, string selectedTo)
        {
            List<string> ticketDate = null;
            SqlCommand com = new SqlCommand("SP_GetRoundTripDateByFromTo @selectedFrom, @selectedWhere", Connection.Con);
            com.Parameters.AddWithValue("@selectedFrom", selectedFrom);
            com.Parameters.AddWithValue("@selectedWhere", selectedTo);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                ticketDate = new List<string>();
                ticketDate.Add("-");
                while (reader.Read())
                {
                    ticketDate.Add(reader.GetString(0));
                }
            }
            return ticketDate;
        }

        public static List<string> GetRoundTripTicketWhere(string selectedFrom)
        {
            List<string> whereCities = null;
            SqlCommand com = new SqlCommand("SP_GetRoundTripToByFrom @selectedFrom", Connection.Con);
            com.Parameters.AddWithValue("@selectedFrom", selectedFrom);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                whereCities = new List<string>();
                whereCities.Add("-");
                while (reader.Read())
                {
                    whereCities.Add(reader.GetString(0));
                }
            }
            return whereCities;
        }

        public static List<string> GetRoundTripTicketFrom()
        {
            List<string> fromCities = null;
            SqlCommand com = new SqlCommand("SP_GetRoundTripFrom", Connection.Con);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                fromCities = new List<string>();
                while (reader.Read())
                {
                    fromCities.Add(reader.GetString(0));
                }
            }
            return fromCities;
        }

        public static List<string> GetTicketWhere(string selectedFrom)
        {
            List<string> whereCities = null;
            SqlCommand com = new SqlCommand("SP_GetToByFrom @selectedFrom", Connection.Con);
            com.Parameters.AddWithValue("@selectedFrom", selectedFrom);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                whereCities = new List<string>();
                whereCities.Add("-");
                while (reader.Read())
                {
                    whereCities.Add(reader.GetString(0));
                }
            }
            return whereCities;
        }

        public static List<string> GetReturnTicketInfo(string selectedTo, string selectedFrom, string selectedDate)
        {
            List<string> returnTicketList = null;
            SqlCommand com = new SqlCommand("SP_GetReturnFligthsBySelection @selectedFrom, @selectedTo, @selectedDate", Connection.Con);
            com.Parameters.AddWithValue("@selectedFrom", selectedTo);
            com.Parameters.AddWithValue("@selectedTo", selectedFrom);
            com.Parameters.AddWithValue("@selectedDate", selectedDate);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                returnTicketList = new List<string>();
                while (reader.Read())
                {
                    TicketEntity te = new TicketEntity
                    {
                        departure = reader["DEPARTURE"].ToString(),
                        arrival = reader["ARRIVAL"].ToString(),
                        airplane = reader["AIRPLANE"].ToString(),
                        date = reader["DATE"].ToString(),
                        time = reader["TIME"].ToString()
                    };
                    returnTicketList.Add(te.toString());
                }
            }
            com.Dispose();
            com.Connection.Close();
            return returnTicketList;
        }

        public static List<string> GetTicketDate(string selectedFrom, string selectedTo)
        {
            List<string> ticketDate = null;
            SqlCommand com = new SqlCommand("SP_GetFlightDateByFromWhere @selectedFrom, @selectedWhere", Connection.Con);
            com.Parameters.AddWithValue("@selectedFrom", selectedFrom);
            com.Parameters.AddWithValue("@selectedWhere", selectedTo);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {    
                ticketDate = new List<string>();
                ticketDate.Add("-");
                while (reader.Read())
                {
                    ticketDate.Add(reader.GetString(0));
                }
            }
            return ticketDate;
        }
    }
}
