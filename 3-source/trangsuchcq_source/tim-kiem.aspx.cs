using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class cau_hoi_thuong_gap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (((DataView)odsProduct.Select()).Count <= DataPager1.PageSize)
            {
                DataPager1.Visible = false;
            }
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pci"]))
            {
                var oProductCategory = new ProductCategory();
                var dv = oProductCategory.ProductCategorySelectOne(Request.QueryString["pci"]).DefaultView;
                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];
                strTitle = Server.HtmlDecode(row["ProductCategoryName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());
                //hdnSanPhamDetails.Value = progressTitle(dv[0]["ProductCategoryName"].ToString()) + "-pci-" + dv[0]["ProductCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Sản Phẩm";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta()
            {
                Name = "description",
                Content = !string.IsNullOrEmpty(strMetaDescription) ?
                    strMetaDescription : strDescription
            };
            Header.Controls.Add(meta);
            lblName.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int liStartIndex = DropDownList1.SelectedItem.Value.IndexOf(":") + 1;
        //int liLength = DropDownList1.SelectedItem.Value.Length - liStartIndex;
        var dsSelectParam = odsProduct.SelectParameters;

        if (DropDownList1.SelectedItem.Value == "2")
        {
            dsSelectParam["IsNew"].DefaultValue = "";
            dsSelectParam["IsBestSeller"].DefaultValue = "";
            dsSelectParam["IsHot"].DefaultValue = "True";

        }
        else if (DropDownList1.SelectedItem.Value == "3")
        {
            dsSelectParam["IsNew"].DefaultValue = "True";
            dsSelectParam["IsBestSeller"].DefaultValue = "";
            dsSelectParam["IsHot"].DefaultValue = "";
        }
        else if (DropDownList1.SelectedItem.Value == "4")
        {
            dsSelectParam["IsNew"].DefaultValue = "";
            dsSelectParam["IsBestSeller"].DefaultValue = "True";
            dsSelectParam["IsHot"].DefaultValue = "";
        }
        else
        {
            dsSelectParam["IsNew"].DefaultValue = "";
            dsSelectParam["IsBestSeller"].DefaultValue = "";
            dsSelectParam["IsHot"].DefaultValue = "";
        }

        if (((DataView)odsProduct.Select()).Count <= DataPager1.PageSize)
        {
            DataPager1.Visible = false;
        }
        else
        {
            DataPager1.Visible = true;
        }
    }
}