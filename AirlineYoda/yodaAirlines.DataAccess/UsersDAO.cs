using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace yodaAirlines.DataAccess
{
    public class UsersDAO
    {
        public static List<UsersEntity> GetAllUsers()
        {
            List<UsersEntity> usersList = null;
            SqlCommand com = new SqlCommand("spSelectUsers", Connection.Con);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                usersList = new List<UsersEntity>();
                while (reader.Read())
                {
                    usersList.Add(new UsersEntity
                    {
                        Id = Convert.ToInt32(reader["UId"]),
                        NationalId = Convert.ToInt32(reader["UNId"]),
                        Name = reader["UName"].ToString(),
                        Surname = reader["USurname"].ToString(),
                        Gender = reader["UGender"].ToString(),
                        Nationality = reader["UNationality"].ToString(),
                        Language = reader["ULanguage"].ToString(),
                        Profession = reader["UProfession"].ToString(),
                        DateOfBirth = Convert.ToDateTime(reader["UDateOfBirth"]),
                        Phone = reader["UPhone"].ToString(),
                        Email = reader["UEmail"].ToString(),
                        Password = reader["UPassword"].ToString()
                    });
                }
            }
            com.Dispose();
            com.Connection.Close();
            return usersList;
        }
        public static void AddUser(int uNId, string uN, string uSN, string uG, string uNat, string uLang, string uPro, DateTime uB, string uP, string uE, string pw)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand com = new SqlCommand("SP_UserAdd", Connection.Con);
            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@UName", uN);
            com.Parameters.AddWithValue("@USurname", uSN);
            com.Parameters.AddWithValue("@Gender", uG);
            com.Parameters.AddWithValue("@NationalId", uNId);
            com.Parameters.AddWithValue("@Nationality", uNat);
            com.Parameters.AddWithValue("@Language", uLang);
            com.Parameters.AddWithValue("@Profession", uPro);
            com.Parameters.AddWithValue("@DateOfBirth", uB);
            com.Parameters.AddWithValue("@Phone", uP);
            com.Parameters.AddWithValue("@Email", uE);
            com.Parameters.AddWithValue("@Password", pw);

            if (com.Connection.State != ConnectionState.Open)
            {
                com.Connection.Open();
            }
            adapter.InsertCommand = com;
            com.ExecuteNonQuery();

            com.Dispose();
            com.Connection.Close();
        }

        public static void DeleteUserByID(int Id)
        {
            SqlCommand com = new SqlCommand("SP_DeleteById @UId", Connection.Con);
            com.Parameters.AddWithValue("@UId", Id);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            com.ExecuteNonQuery();

            com.Dispose();
            com.Connection.Close();

        }
        public static UsersEntity SelectUserByID(int Id)
        {
            SqlCommand com = new SqlCommand("SP_GetUserById @UId", Connection.Con);
            com.Parameters.AddWithValue("@UId", Id);

            if (com.Connection.State == ConnectionState.Closed)
            {
                com.Connection.Open();
            }
            UsersEntity ue = null;
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {               
                reader.Read();
                ue = new UsersEntity
                {
                    Id = Convert.ToInt32(reader["UId"]),
                    NationalId = Convert.ToInt32(reader["UNId"]),
                    Name = reader["UName"].ToString(),
                    Surname = reader["USurname"].ToString(),
                    Gender = reader["UGender"].ToString(),
                    Nationality = reader["UNationality"].ToString(),
                    Language = reader["ULanguage"].ToString(),
                    Profession = reader["UProfession"].ToString(),
                    DateOfBirth = Convert.ToDateTime(reader["UDateOfBirth"]),
                    Phone = reader["UPhone"].ToString(),
                    Email = reader["UEmail"].ToString(),
                    Password = reader["UPassword"].ToString()
                };
            }
            com.Dispose();
            com.Connection.Close();

            return ue;
        }
    }
}
