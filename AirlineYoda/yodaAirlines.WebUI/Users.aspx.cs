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
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewUser.DataSource = Business.Users.GetAllUsers();
            GridViewUser.DataBind();
        }

        protected void ButtonGetUser_OnClick(object sender, EventArgs e)
        {
            UsersEntity user = Business.Users.SelectUser(Convert.ToInt32(TextBoxId.Text));
            if (user != null)
            {
                TextBoxUNId.Text = user.NationalId.ToString();
                TextBoxUName.Text = user.Name;
                TextBoxUSurname.Text = user.Surname;
                TextBoxUGender.Text = user.Gender;
                TextBoxUNationality.Text = user.Nationality;
                TextBoxULanguage.Text = user.Language;
                TextBoxUProfession.Text = user.Profession;
                TextBoxUBirthday.Text = user.BirthdayStr;
                TextBoxUPhone.Text = user.Phone;
                TextBoxUEmail.Text = user.Email;
                TextBoxUPassword.Text = user.Password;
            }
        }

        protected void ButtonAddUser_OnClick(object sender, EventArgs e)
        {
            Business.Users.AddUser(Convert.ToInt32(TextBoxUserNId.Text), TextBoxUserName.Text, TextBoxUserSurname.Text, TextBoxUserGender.Text, TextBoxUserNationality.Text,
                TextBoxUserLanguage.Text, TextBoxUserProfession.Text, Convert.ToDateTime(TextBoxUserBirthday.Text), TextBoxUserPhone.Text, TextBoxUserEmail.Text, TextBoxUserPassword.Text);
            GridViewUser.DataSource = Business.Users.GetAllUsers();
            GridViewUser.DataBind();
        }

        protected void ButtonDelete_OnClick(object sender, EventArgs e)
        {
            Business.Users.DeleteUser(Convert.ToInt32(TextBoxId.Text));
            GridViewUser.DataSource = Business.Users.GetAllUsers();
            GridViewUser.DataBind();
        }
    }
}