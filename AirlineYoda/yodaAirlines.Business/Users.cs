using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using yodaAirlines.DataAccess;

namespace yodaAirlines.Business
{
    public class Users
    {
        public static void DeleteUser(int Id)
        {
            UsersDAO.DeleteUserByID(Id);
        }
        public static void AddUser(int uNId, string uN, string uSN, string uG, string uNat, string uLang, string uPro, DateTime uB, string uP, string uE, string pw)
        {
            UsersDAO.AddUser(uNId, uN, uSN, uG, uNat, uLang, uPro, uB, uP, uE, pw);
        }
        public static List<UsersEntity> GetAllUsers()
        {
            return UsersDAO.GetAllUsers();
        }
        public static UsersEntity SelectUser(int Id)
        {
            if (Id > 0)
            {
                return UsersDAO.SelectUserByID(Id);
            }
            else
            {
                return null;
            }
        }
    }
}
