using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class dat_hang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["Cart"] == null)
            {
                Response.Redirect("~/");
            }
            if (Session["UserName"] == null)
            {
                pnlDangNhap.Visible = false;
                pnlKhongDangNhap.Visible = true;
            }
            else
            {
                pnlDangNhap.Visible = true;
                pnlKhongDangNhap.Visible = false;
            }
        }
    }
    protected void lstCart_DataBound(object sender, EventArgs e)
    {
        var dtCart = Session["Cart"] as DataTable;
        if (dtCart != null)
        {
            //var lblTotalPrice = ListView1.FindControl("lblTotalPrice") as Label;
            //var hdnTotalPrice = ListView1.FindControl("hdnTotalPrice") as HiddenField;

            //var lblSumTotalPrice = ListView1.FindControl("lblSumTotalPrice") as Label;
            //var hdnSumTotalPrice = ListView1.FindControl("hdnSumTotalPrice") as HiddenField;

            //var lblShippingPrice = ListView1.FindControl("lblShippingPrice") as Label;
            //var hdnShippingPrice = ListView1.FindControl("hdnShippingPrice") as HiddenField;
            //var odsProvince = ListView1.FindControl("odsProvince") as ObjectDataSource;
            //var dv = (DataView)odsProvince.Select();
            var iShippingPrice = "0";// Convert.ToDouble(string.IsNullOrEmpty(dv[0]["ShippingPrice"].ToString()) ? "0" : dv[0]["ShippingPrice"].ToString());
            double TotalPrice = 0;
            double SumTotalPrice = 0;
            double ShippingPrice = 0;
            double VoucherPrice = 0;
            //var productVoucher = new ProductVoucher();

            if (lblTotalPrice != null)
            {
                foreach (DataRow dr in dtCart.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? 0 : dr["Quantity"]);
                    var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["ProductPrice"].ToString()) ? 0 : dr["ProductPrice"]);
                    TotalPrice += Quantity * Price;
                }

                ShippingPrice = Convert.ToDouble(iShippingPrice);
                //ShippingPrice = 20000;
                if (Session["SavePrice"] != null)
                {
                    VoucherPrice = Convert.ToDouble(Session["SavePrice"].ToString());
                    SumTotalPrice = TotalPrice + ShippingPrice - VoucherPrice;
                }
                else
                {
                    SumTotalPrice = TotalPrice + ShippingPrice;
                }

                hdnTotalPrice.Value = TotalPrice.ToString();
                hdnSumTotalPrice.Value = SumTotalPrice.ToString();
                lblTotalPrice.Text = string.IsNullOrEmpty(TotalPrice.ToString()) ? "<strong>0</strong> <sup>đ</sup>" : "<strong>" + (string.Format("{0:##,###.##}", TotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> <sup>đ</sup>";
                lblSumTotalPrice.Text = string.IsNullOrEmpty(SumTotalPrice.ToString()) ? "<strong>0</strong> <sup>đ</sup>" : "<strong>" + (string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> <sup>đ</sup>";
                lblShippingPrice.Text = iShippingPrice.ToString() == "0" ? "<strong>0</strong> <sup>đ</sup>" : "<strong>" + (string.Format("{0:##,###.##}", iShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> <sup>đ</sup>";
                hdnShippingPrice.Value = ShippingPrice.ToString();
                lblSavePrice.Text = VoucherPrice.ToString() == "0" ? "<strong>0</strong> <sup>đ</sup>" : "<strong>" + (string.Format("{0:##,###.##}", VoucherPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> <sup>đ</sup>";
                hdnSavePrice.Value = VoucherPrice.ToString();
            }
        }
    }
    protected void lstAddressBook_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        var ProvinceID = e.Item.FindControl("hdnProvinceID") as HiddenField;
        var ddlProvince = e.Item.FindControl("ddlProvince") as DropDownList;
        var DistrictID = e.Item.FindControl("hdnDistrictID") as HiddenField;
        var ddlDistrict = e.Item.FindControl("ddlDistrict") as DropDownList;

        if (!string.IsNullOrEmpty(ProvinceID.Value))
            ddlProvince.SelectedValue = ProvinceID.Value;
        if (!string.IsNullOrEmpty(DistrictID.Value))
            ddlDistrict.SelectedValue = DistrictID.Value;
    }
    protected void btnDatHangKhongDangNhap_Click(object sender, EventArgs e)
    {
        Session["FullName"] = txtFullName2.Text;
        Session["Phone"] = txtPhone2.Text;
        Session["Email"] = txtEmail2.Text;
        Session["Address"] = txtAddress2.Text;
        Session["ProvinceName"] = ddlProvince2.SelectedItem.Text;
        Session["DistrictName"] = ddlDistrict2.SelectedItem.Text;
        Response.Redirect("thanh-toan.aspx");
    }
    protected void btnDatHangDangNhap_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            var oAddressBook = new AddressBook();
            var dtAddressBook = oAddressBook.AddressBookSelectAll("", "", "", "", "", "", "", Session["UserName"].ToString(), "", "", "", "", "", "", "", "", "", "", "", "").DefaultView;
            Session["FullName"] = dtAddressBook[0]["FirstName"].ToString(); ;
            Session["Phone"] = dtAddressBook[0]["HomePhone"].ToString(); ;
            Session["Email"] = dtAddressBook[0]["Email"].ToString();
            Session["Address"] = dtAddressBook[0]["Address1"].ToString();
            Session["ProvinceName"] = dtAddressBook[0]["ProvinceName"].ToString();
            Session["DistrictName"] = dtAddressBook[0]["DistrictName"].ToString();
            Response.Redirect("thanh-toan.aspx");
        }
    }
    protected void btnVoucher_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtInputVoucher.Text))
        {
            var productVoucher = new ProductVoucher();

            if (productVoucher.ProductVoucherSelectAll("", txtInputVoucher.Text, "", "", "", "", "", "", "", "1", "1").DefaultView.Count > 0)
            {
                validateVoucher.ErrorMessage = "Voucher <b>\"" + txtInputVoucher.Text + "\"</b> đã sử dụng!";
                validateVoucher.IsValid = false;
                txtInputVoucher.Text = "";
            }
            else if (productVoucher.ProductVoucherSelectAll("", txtInputVoucher.Text, "", "", "", "", "", "", "", "0", "0").DefaultView.Count > 0)
            {
                validateVoucher.IsValid = true;
                double ShippingPrice = 0;
                double VoucherPrice = 0;
                // check voucher da nhap su dung co gia giam chua
                if (Session["SavePrice"] == null)
                {
                    var dataVoucher = productVoucher.ProductVoucherSelectAll("", txtInputVoucher.Text, "", "", "", "", "", "", "", "0", "0").DefaultView;
                    VoucherPrice = Convert.ToDouble(dataVoucher[0]["VoucherPrice"].ToString());
                    Session["SavePrice"] = VoucherPrice;
                }
                else
                {
                    VoucherPrice = Convert.ToDouble(Session["SavePrice"].ToString());
                }


                double TotalPrice = 0;
                double SumTotalPrice = 0;
                var dtCart = Session["Cart"] as DataTable;
                if (dtCart != null)
                {
                    foreach (DataRow dr in dtCart.Rows)
                    {
                        var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? 0 : dr["Quantity"]);
                        var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["ProductPrice"].ToString()) ? 0 : dr["ProductPrice"]);
                        TotalPrice += Quantity * Price;
                    }
                    SumTotalPrice = TotalPrice + ShippingPrice - VoucherPrice;
                    lblSavePrice.Text = VoucherPrice.ToString() == "0" ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", VoucherPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                    hdnSavePrice.Value = VoucherPrice.ToString();
                    hdnSumTotalPrice.Value = SumTotalPrice.ToString();
                    lblSumTotalPrice.Text = string.IsNullOrEmpty(SumTotalPrice.ToString()) ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                }
                productVoucher.ProductVoucherQuickUpdate(txtInputVoucher.Text, "", "1", "1");
                //ListView1.DataBind();
            }
            else
            {
                validateVoucher.ErrorMessage = "Mã Voucher <b>\"" + txtInputVoucher.Text + "\"</b> không đúng!";
                validateVoucher.IsValid = false;
                txtInputVoucher.Text = "";
            }
        }
    }
}