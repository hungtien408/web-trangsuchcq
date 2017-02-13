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

    }
    protected void btnThanhToan_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {

            var dtCart = Session["Cart"] as DataTable;
            if (dtCart != null)
            {
                Session["HoanThanh"] = "true";
                string CreateBy = "admin";
                string OrderNumber = DateTime.Now.ToString("ddMMyy") + Guid.NewGuid().GetHashCode().ToString("X").Substring(0, 4);
                //Session["OrderNumber"] = OrderNumber;
                string strEmail = "";
                string strPhone ="";
                string strFullName = "";
                string strAddress = "";
                string strProvince = "";
                string strDistrict = "";
                string strPhoneNumber = "";
                double strTotalPrice = 0;
                double strSumTotalPrice = 0;
                string strPaymentMethods = "";
                string strOrderQuantity = "0";
                string strOrderStatusID = "";
                string strSavePrice = Session["SavePrice"].ToString();
                Session["OrderNumber"] = OrderNumber;

                strEmail = Session["Email"].ToString();
                strPhone = Session["Phone"].ToString();
                strFullName = Session["FullName"].ToString();
                strAddress = Session["Address"].ToString();
                strProvince = Session["ProvinceName"].ToString();
                strDistrict = Session["DistrictName"].ToString();
                // City = txtTinh.Text.Trim().ToString();
                strPhoneNumber = Session["Phone"].ToString();

                //TotalPrice = Session["tongtien"].ToString();
                //OrderQuantity = Session["Quantity"].ToString();
                strOrderStatusID = "1";
                strPaymentMethods = "Thanh Toán Trực Tiếp";

                string Price = "0";
                // them don hang
                var oOrders = new Orders2();
                oOrders.Orders2Insert(
                    OrderNumber,
                    CreateBy,
                    DateTime.Now.ToString("MM/dd/yyyy"),
                    strPaymentMethods,
                    strFullName,
                    strAddress,
                    strPhoneNumber,
                    "",
                    strEmail,
                    strOrderStatusID);

                // don hang chi tiet
                var oOrderDetail = new OrderDetail2();
                foreach (DataRow dr in dtCart.Rows)
                {
                    string ProductID = dr["ProductID"].ToString();
                    var Quantity = Convert.ToInt32(dr["Quantity"]);
                    if (dr["ProductPrice"] != null)
                    {
                        Price = (Convert.ToInt32(dr["Quantity"]) * (Convert.ToDouble(string.IsNullOrEmpty(dr["ProductPrice"].ToString()) ? 0 : dr["ProductPrice"]))).ToString();
                    }
                    if (Session["UserName"] != null)
                    {
                        CreateBy = Session["UserName"].ToString();
                    }

                    oOrderDetail.OrderDetail2Insert(
                       OrderNumber,
                       ProductID,
                       Quantity.ToString(),
                       Price,
                       CreateBy
                    );
                }

                // hinh thuc thanh toan
                if (rbtMoney.Checked == true)
                {
                    string FullName = strFullName;
                    Session["FullName"] = strFullName;
                    Session["Address"] = strAddress;
                    strPaymentMethods = "Thanh Toán Trực Tiếp";

                    // noi dung mail xac nhan
                    string Body = "<div style='width: 100%; font-size: 14px; font-family: Arial;'>";
                    Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>Cảm ơn bạn đã đặt hàng/Thanks for Your Order!</h3>";
                    Body += "<div style='padding: 10px; background-color: rgb(255,244,234); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'>";
                    Body += "<p>Mã số đơn hàng của bạn là <b>" + Session["OrderNumber"] + "</b>. Chi tiết đơn hàng được liệt kê ở phía dưới. </p>";
                    Body += "</div>";
                    Body += "<p><b>Người nhận</b></p>";
                    Body += "<p>Họ và tên: " + FullName + "</p>";
                    Body += "<p>Email: " + strEmail + "</p>";
                    Body += "<p>Điện thoại: " + strPhone + "</p>";
                    Body += "<p>Địa chỉ: " + strAddress + "</p>";
                    //Body += "<p>Loại địa chỉ: " + dropLoaiDiaChi.SelectedItem.Text + "</p>";
                    Body += "<p>Tỉnh/Thành phố: " + strProvince + "</p>";
                    Body += "<p>Quận/Huyện: " + strDistrict + "</p>";
                    //Body += "<p>Ghi chú: " + txtNote.Text + "</p>";
                    Body += "</div>";
                    Body += "<p><b>* Phương thức thanh toán</b>: " + strPaymentMethods + "</p>";
                    Body += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
                    //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
                    Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Mã sản phẩm/Product Code</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductCode = dr["ProductCode"].ToString();
                        string ProductID = dr["ProductID"].ToString();
                        string ProductName = dr["ProductName"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        Price = dr["ProductPrice"].ToString();
                        //string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        //string ProductLengthName = dr["ProductLengthName"].ToString();
                        double tPrice = Convert.ToDouble(Price) * Convert.ToDouble(Quantity);

                        var itemPrice = string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                        var sPrice = string.Format("{0:##,###.##}", dr["ProductPrice"]).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ";
                        //Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                        Body += "<tr>";
                        Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductCode + "</td>";
                        //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductLengthName + "</td>";
                        //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'><div style='background: " + ProductOptionCategoryName + "; width: 30px; height: 30px;'></div></td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
                        Body += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
                        Body += "</tr>";
                        strTotalPrice += tPrice;
                    }

                    if (!string.IsNullOrEmpty(strSavePrice))
                    {
                        strSumTotalPrice = strTotalPrice - Convert.ToDouble(strSavePrice);
                    }
                    else
                    {
                        strSumTotalPrice = strTotalPrice;
                    }

                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";
                    Body += "<table style='font-size: 13px; font-family: Verdana; text-align: right; margin: 10px 0; width: 100%; float: right;' cellpadding='0' cellspacing='0'>";
                    Body += "<tr><td style='width:85%;'>Thành tiền:</td><td style='width:15%;'>" + string.Format("{0:##,###.##}", strTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</td></tr>";
                    Body += "<tr><td>Giảm:</td><td>" + string.Format("{0:##,###.##}", Convert.ToDouble(strSavePrice)).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</td></tr>";
                    Body += "<tr><td><b>Tổng tiền:</b></td><td><b>" + string.Format("{0:##,###.##}", strSumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</b></td></tr>";
                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";

                    Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", strEmail, "hungtien408@gmail.com", "Đặt Hàng GLAM SPAR", Body, true);
                    /////////////////////////////////////////////////////////////////////////////////
                    Session["FullName"] = "";
                    Session["Phone"] = "";
                    Session["Email"] = "";
                    Session["Address"] = "";
                    var oShoppingCart = new ShoppingCart2();
                    oShoppingCart.DeleteAllItem();
                    Session["Cart"] = null;
                    Session["SavePrice"] = null;
                    //ListView1.DataBind();
                    Response.Redirect("hoan-thanh-dat-hang.aspx");

                }
                else if (rbtEmail.Checked == true)
                {
                    string FullName = strFullName;
                    Session["FullName"] = FullName;
                    Session["Address"] = strAddress;
                    strPaymentMethods = "Thanh Toán Chuyển Khoản";
                    oOrders.Orders2Update(
                        OrderNumber,
                        CreateBy,
                        DateTime.Now.ToString("MM/dd/yyyy"),
                        strPaymentMethods,
                        FullName,
                        strAddress,
                        strPhoneNumber,
                        "",
                        strEmail,
                        strOrderStatusID);

                    // noi dung mail xac nhan
                    string Body = "<div style='width: 100%; font-size: 14px; font-family: Arial;'>";
                    Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>Cảm ơn bạn đã đặt hàng/Thanks for Your Order!</h3>";
                    Body += "<div style='padding: 10px; background-color: rgb(255,244,234); font-family: Verdana;font-size: 11px; margin-bottom: 20px;'>";
                    Body += "<p>Mã số đơn hàng của bạn là <b>" + Session["OrderNumber"] + "</b>. Chi tiết đơn hàng được liệt kê ở phía dưới. </p>";
                    Body += "</div>";
                    Body += "<p><b>Người nhận</b></p>";
                    Body += "<p>Họ và tên: " + FullName + "</p>";
                    Body += "<p>Email: " + strEmail + "</p>";
                    Body += "<p>Điện thoại: " + strPhone + "</p>";
                    Body += "<p>Địa chỉ: " + strAddress + "</p>";
                    //Body += "<p>Loại địa chỉ: " + dropLoaiDiaChi.SelectedItem.Text + "</p>";
                    Body += "<p>Tỉnh/Thành phố: " + strProvince + "</p>";
                    Body += "<p>Quận/Huyện: " + strDistrict + "</p>";
                    //Body += "<p>Ghi chú: " + txtNote.Text + "</p>";
                    Body += "</div>";
                    Body += "<p><b>* Phương thức thanh toán</b>: " + strPaymentMethods + "</p>";
                    Body += "<p>Chủ tài khoản:Công ty Cổ Phần Vàng Bạc Đá Quý Phú Nhuận</p>";
                    Body += "<p>NH Á Châu - ACB : 1036868</p>";
                    Body += "<p>Vietcombank : 0071. 00000.8313</p>";
                    Body += "<p>Sacombank: 0600.1576.0292</p>";
                    Body += "<table style='font-size: 11px; font-family: Verdana; padding: 10px; border: 1px solid #C7D7DB; width: 100%;border-collapse: collapse;' cellpadding='0' cellspacing='0'>";
                    //Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Cỡ/Size</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";
                    Body += "<tr><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Sản phẩm/Cart Items</th><th align='left' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Mã sản phẩm/Product Code</th><th style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Số lượng/Qty</th><th align='center' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Giá/Item Price</th><th align='right' style='padding: 8px 5px; border-collapse: collapse; background-color: rgb(2,11,111);color: #fff;'>Thành tiền/Item Total</th></tr>";

                    foreach (DataRow dr in dtCart.Rows)
                    {
                        string ProductCode = dr["ProductCode"].ToString();
                        string ProductID = dr["ProductID"].ToString();
                        string ProductName = dr["ProductName"].ToString();
                        string Quantity = dr["Quantity"].ToString();
                        Price = dr["ProductPrice"].ToString();
                        //string ProductOptionCategoryName = dr["ProductOptionCategoryName"].ToString();
                        //string ProductLengthName = dr["ProductLengthName"].ToString();
                        double tPrice = Convert.ToDouble(Price) * Convert.ToDouble(Quantity);

                        var itemPrice = string.Format("{0:##,###.##}", tPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                        var sPrice = string.Format("{0:##,###.##}", dr["ProductPrice"]).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VND";
                        //Amount += Convert.ToDouble(Price) * Convert.ToDouble(Quantity);
                        Body += "<tr>";
                        Body += "<td style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductName + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductCode + "</td>";
                        //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + ProductLengthName + "</td>";
                        //Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'><div style='background: " + ProductOptionCategoryName + "; width: 30px; height: 30px;'></div></td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + Quantity + "</td>";
                        Body += "<td align='center' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + sPrice + "</td>";
                        Body += "<td align='right' style='padding: 5px; border-collapse: collapse; border-bottom: 1px solid #C7D7DB;'>" + itemPrice + "</td>";
                        Body += "</tr>";
                        strTotalPrice += tPrice;
                    }

                    if (!string.IsNullOrEmpty(strSavePrice))
                    {
                        strSumTotalPrice = strTotalPrice - Convert.ToDouble(strSavePrice);
                    }
                    else
                    {
                        strSumTotalPrice = strTotalPrice;
                    }

                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";
                    Body += "<table style='font-size: 13px; font-family: Verdana; text-align: right; margin: 10px 0; width: 100%; float: right;' cellpadding='0' cellspacing='0'>";
                    Body += "<tr><td style='width:85%;'>Thành tiền:</td><td style='width:15%;'>" + string.Format("{0:##,###.##}", strTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</td></tr>";
                    Body += "<tr><td>Giảm:</td><td>" + string.Format("{0:##,###.##}", Convert.ToDouble(strSavePrice)).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</td></tr>";
                    Body += "<tr><td><b>Tổng tiền:</b></td><td><b>" + string.Format("{0:##,###.##}", strSumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " VNĐ" + "</b></td></tr>";
                    Body += "</table>";
                    Body += "<div style='clear: both;'></div>";

                    Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", strEmail, "hungtien408@gmail.com", "Đặt Hàng GLAM SPAR", Body, true);
                    /////////////////////////////////////////////////////////////////////////////////
                     Session["FullName"] = "";
                    Session["Phone"] = "";
                    Session["Email"] = "";
                    Session["Address"] = "";
                    var oShoppingCart = new ShoppingCart2();
                    oShoppingCart.DeleteAllItem();
                    Session["Cart"] = null;
                    Session["SavePrice"] = null;
                    //ListView1.DataBind();
                    Response.Redirect("hoan-thanh-dat-hang.aspx");

                }
            }

        }
    }
}