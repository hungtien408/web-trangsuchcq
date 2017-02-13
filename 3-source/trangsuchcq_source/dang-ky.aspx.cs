using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class dang_ky : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        var txtEmail = (TextBox)sender;
        var strEmail = txtEmail.Text;
        //var CustomValidator2 = (CustomValidator)txtEmail.Parent.FindControl("CustomValidator2");
        //var lblMessage = (Label)txtEmail.Parent.FindControl("lblEmailMessage");

        if (!string.IsNullOrEmpty(strEmail))
        {
            if (Membership.FindUsersByEmail(strEmail).Count > 0)
            {
                CustomValidator2.ErrorMessage = "Email <b>\"" + strEmail + "\"</b> đã tồn tại!";
                CustomValidator2.IsValid = false;
                lblEmailMessage.Text = "";
            }
            else
            {
                string[] stringArray = strEmail.Split(Convert.ToChar(";"));
                foreach (string s in stringArray)
                {
                    if (!Regex.IsMatch(s, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
                    {
                        CustomValidator1.IsValid = false;
                        CustomValidator1.ErrorMessage = "Email <b>\"" + strEmail + "\"</b> sai định dạng email.";
                        lblEmailMessage.Text = "";
                    }
                    else
                    {
                        CustomValidator2.IsValid = true;
                        //CustomValidator2.ForeColor = Color.Green;
                        CustomValidator1.IsValid = true;
                        lblEmailMessage.Text = "Email <b>\"" + strEmail + "\"</b> có thể sử dụng.";
                    }
                }
            }
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.log img').trigger('click');});", true);
        }
        else
            lblEmailMessage.Text = "";
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            var oAddressBook = new AddressBook();
            var FirstName = txtFullNameRegister.Text.Trim();
            var Email = txtEmailRegister.Text.Trim();
            var UserName = txtEmailRegister.Text.Trim();
            var Password = txtPasswordRegister.Text.Trim();
            var Address = txtAddressRegister.Text.Trim();
            var Phone = txtPhoneRegister.Text.Trim();
            var IsPrimary = "True";
            var IsPrimaryBilling = "True";
            var IsPrimaryShipping = "True";
            var RoleName = "member";
            //var Gender = rdbGender.SelectedValue;
            //DateTime strDateOfBirth = new DateTime(Convert.ToInt32(ddlYear.SelectedItem.Text), Convert.ToInt32(ddlMonth.SelectedItem.Text), Convert.ToInt32(ddlDay.SelectedItem.Text));
            //string Birthday = strDateOfBirth.ToString("MM/dd/yyyy");
            bool bError = false;
            if (!string.IsNullOrEmpty(UserName))
            {
                if (Membership.GetUser(UserName) != null)
                {
                    CustomValidator2.ErrorMessage = "<b>+ Tên truy cập " + UserName + " đã được đăng ký sử dụng, vui lòng chọn tên khác</b>";
                    CustomValidator2.IsValid = false;
                    bError = true;
                }
                else
                    CustomValidator2.IsValid = true;
            }
            if (!bError)
            {
                Membership.CreateUser(UserName, Password, Email);
                Roles.AddUserToRole(UserName, RoleName);
                //var oUser = new User();
                //oUser.UserInsert(UserName, Password, Email, Role);
                oAddressBook.AddressBookInsert(
                    FirstName,
                    "",
                    Email,
                    Phone,
                    "",
                    "",
                    //ReceiveEmail,
                    UserName,
                    "",
                    Address,
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    IsPrimary,
                    IsPrimaryBilling,
                    IsPrimaryShipping,
                    RoleName,
                    "",
                    ""
                    );
                //if (ckbNewsletter.Checked)
                //{
                //    var oNewletter = new Newsletter();
                //    oNewletter.NewsletterInsert(Email);
                //}
                FormsAuthentication.SetAuthCookie(UserName, true);
                //pnlSuccess.Visible = true;
                Session["UserName"] = UserName;
                //var CC = "order@pandemos.vn";
                var Subject = "Đăng ký tài khoản thành công/Thanks for Registering";
                //var OrderCode = OrderID;
                string Host = "smtp.gmail.com";
                int Port = 587;
                string From = "webmastersendmail0401@gmail.com";
                string mPassword = "web123master";
                string Body = "<div style='width: 100%; font-size: 11px; font-family: Arial;'>";
                Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>";
                Body += "Cảm ơn bạn đã đăng ký tài khoản/Thanks for Registering";
                Body += "</h3>";
                Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'>";
                Body += "<p>Xin chào " + FirstName + "/Hi " + FirstName + ",</p>";
                Body += "<p>Cảm ơn bạn đã đăng ký tài khoản tại EZStore/ Many thanks for registering at EZStore</p>";
                Body += "<p>Thông tin đăng nhập của bạn như sau/ Your login detail is as follow:</p>";
                Body += "<p>Email: <b>" + Email + "</b></p>";
                Body += "<p>Mật khẩu/Password: <b>" + Password + "</b></p>";
                Body += "<p>Mọi thắc mắc, xin vui lòng liên hệ với chúng tôi qua email: <a href='mailto:info@glam.spark.vn'>info@glam.spark.vn</a> /If you have any enquiries, please email us on <a href='mailto:info@glam.spark.vn'>info@glam.spark.vn</a></p>";
                Body += "<p>Chúc bạn có những thời khắc ngọt ngào với Lady fashion/ We hope you have great expericences with Lady fashion</p>";
                Body += "</div>";
                Body += "<div style='font-family:Verdana;font-size:12px;margin-top:10px;'>";
                Body += "<div style='font-size:16px;font-weight:bold;'>=================</div>";
                Body += "<h4 style='font-size:14px;font-family:Verdana;margin:0;padding:0;'>Lady fashion</h4>";
                Body += "<div style='font-size:11px;font-family:Verdana;margin-top:5px;padding:0;margin:0;'>";
                Body += "<p>Add: 1278 Quang Trung, Phường 14, Quận Gò Vấp, TP.HCM</p>";
                Body += "<p>Tel: 08 386 569 - 0906 211 611</p>";
                //Body += "<p>M: +84 908 xxx xxx>";

                //Body += "<p>W: <a href='http://www.pandemos.vn'>www.pandemos.vn</a></p>";
                //Body += "<p>E: <a href='mailto:support@zanado.com'>support@zanado.com</a></p>";
                Body += "</div>";
                Body += "</div>";
                Body += "</div>";
                Common.SendMail(Host, Port, From, mPassword, Email, "", Subject, Body, false);

                //txtUserNameRegister.Text =

                txtEmailRegister.Text = "";
                txtPasswordRegister.Text = "";
                txtVerifyCode.Text = "";
                txtConfirmPassWordRegister.Text = "";
                //ddlYear.SelectedIndex = ddlDay.SelectedIndex = ddlMonth.SelectedIndex = -1;
                lblEmailMessage.Text = "";
                ckbSuccess.Checked = false;
                //ckbNewsletter.Checked = false;
                //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "alert('Bạn đã đăng ký thành công!')", true);
                Response.Redirect("~/");
            }
        }
        //else
        //{
        //    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.log img').trigger('click');});", true);
        //}
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string UserName = txtUserName.Text;
        MembershipUser mu = Membership.GetUser(UserName);
        bool bValid = Membership.ValidateUser(UserName, txtPassword.Text);
        var oAddressBook = new AddressBook();
        //Session["PWD"] = Login1.Password;
        if (UserName != null)
        {
            if (bValid)
            {
                Session["UserName"] = UserName;
                Session["IsLogin"] = "True";
                var a = oAddressBook.AddressBookSelectAll("", "", "", "", "", "", "", UserName, "", "", "", "", "", "", "", "", "", "", "", "member").DefaultView;
                Session["FullNameUser"] = a[0]["FirstName"].ToString();

                if (Request.QueryString["ReturnURL"] != null)
                {
                    Response.Redirect(Request.QueryString["ReturnURL"]);
                }
                else
                {
                    string[] roleUser = Roles.GetRolesForUser(UserName.ToString());
                    for (int i = 0; i < roleUser.Length; i++)
                    {
                        if (roleUser[i] == "admin")
                        {
                            Response.Redirect("ad/bilingual/");
                        }
                        else
                        {
                            Response.Redirect("~/");
                        }
                    }
                }
            }
            else
            {
                lblErrorLogin.Text = "Đăng nhập không thành công, vui lòng thử lại.";
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.log img').trigger('click');});", true);
            }
        }
    }
}