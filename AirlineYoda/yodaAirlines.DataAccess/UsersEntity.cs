using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace yodaAirlines.DataAccess
{
    public class UsersEntityBase
    {
        private int _UId;
        private int _NationalId;
        private string _UName;
        private string _USurname;
        private string _Gender;
        private string _Nationality;
        private string _Language;
        private string _Profession;
        private DateTime _DateOfBirth;
        private string _Phone;
        private string _Email;
        private string _Password;

        public int Id
        {
            get { return _UId; }
            set { _UId = value; }
        }
        public int NationalId
        {
            get { return _NationalId; }
            set { _NationalId = value; }
        }
        public string Name
        {
            get { return _UName; }
            set { _UName = value; }
        }
        public string Surname
        {
            get { return _USurname; }
            set { _USurname = value; }
        }
        public string Gender
        {
            get { return _Gender; }
            set { _Gender = value; }
        }
        public string Nationality
        {
            get { return _Nationality; }
            set { _Nationality = value; }
        }
        public string Language
        {
            get { return _Language; }
            set { _Language = value; }
        }
        public string Profession
        {
            get { return _Profession; }
            set { _Profession = value; }
        }
        public DateTime DateOfBirth
        {
            get { return _DateOfBirth; }
            set { _DateOfBirth = value; }
        }
        public string Phone
        {
            get { return _Phone; }
            set { _Phone = value; }
        }
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }
    }
    public class UsersEntity : UsersEntityBase
    {
        public string INFO
        {
            get
            {
                return Name + " " + Surname;
            }
        }
        public string BirthdayStr
        {
            get
            {
                return DateOfBirth.ToString("dd.MM.yyyy dddd");
            }
        }
    }
}
