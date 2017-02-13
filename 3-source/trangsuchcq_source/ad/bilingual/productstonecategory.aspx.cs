﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TLLib;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;


public partial class ad_single_partner : System.Web.UI.Page
{
    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    void DeleteImage(string strProductStoneCategoryImage)
    {
        if (!string.IsNullOrEmpty(strProductStoneCategoryImage))
        {
            string strOldImagePath = Server.MapPath("~/res/ProductStoneCategory/" + strProductStoneCategoryImage);
            if (File.Exists(strOldImagePath))
                File.Delete(strOldImagePath);
        }
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridCommandItem)
        {
            GridCommandItem commandItem = (e.Item as GridCommandItem);
            PlaceHolder container = (PlaceHolder)commandItem.FindControl("PlaceHolder1");
            Label label = new Label();
            label.Text = "&nbsp;&nbsp;";

            container.Controls.Add(label);

            for (int i = 65; i <= 65 + 25; i++)
            {
                LinkButton linkButton1 = new LinkButton();

                LiteralControl lc = new LiteralControl("&nbsp;&nbsp;");

                linkButton1.Text = "" + (char)i;

                linkButton1.CommandName = "alpha";
                linkButton1.CommandArgument = "" + (char)i;

                container.Controls.Add(linkButton1);
                container.Controls.Add(lc);
            }

            LiteralControl lcLast = new LiteralControl("&nbsp;");
            container.Controls.Add(lcLast);

            LinkButton linkButtonAll = new LinkButton();
            linkButtonAll.Text = "Tất cả";
            linkButtonAll.CommandName = "NoFilter";
            container.Controls.Add(linkButtonAll);
        }
    }
    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "alpha" || e.CommandName == "NoFilter")
        {
            String value = null;
            switch (e.CommandName)
            {
                case ("alpha"):
                    {
                        value = string.Format("{0}%", e.CommandArgument);
                        break;
                    }
                case ("NoFilter"):
                    {
                        value = "%";
                        break;
                    }
            }
            ObjectDataSource1.SelectParameters["ProductStoneCategoryName"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "QuickUpdate")
        {
            string ProductStoneCategoryID, Priority, IsAvailable;
            var oProductStoneCategory = new ProductStoneCategory();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ProductStoneCategoryID = item.GetDataKeyValue("ProductStoneCategoryID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oProductStoneCategory.ProductStoneCategoryQuickUpdate(
                    ProductStoneCategoryID,
                    IsAvailable,
                    Priority
                );
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            var oProductStoneCategory = new ProductStoneCategory();

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                string strProductStoneCategoryImage = ((HiddenField)item.FindControl("hdnProductStoneCategoryImage")).Value;

                if (!string.IsNullOrEmpty(strProductStoneCategoryImage))
                {
                    string strSavePath = Server.MapPath("~/res/ProductStoneCategory/" + strProductStoneCategoryImage);
                    if (File.Exists(strSavePath))
                        File.Delete(strSavePath);
                }
            }
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var FileProductStoneCategoryImage = (RadUpload)row.FindControl("FileProductStoneCategoryImage");

            string strProductStoneCategoryName = ((TextBox)row.FindControl("txtProductStoneCategoryName")).Text.Trim();
            string strProductStoneCategoryNameEn = ((TextBox)row.FindControl("txtProductStoneCategoryNameEn")).Text.Trim();
            string strConvertedProductStoneCategoryName = Common.ConvertTitle(strProductStoneCategoryName);
            string strProductStoneCategoryImage = FileProductStoneCategoryImage.UploadedFiles.Count > 0 ? FileProductStoneCategoryImage.UploadedFiles[0].GetName() : "";
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string strPriority = ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();
            string strProductID = string.IsNullOrEmpty(Request.QueryString["pi"]) ? "" : Request.QueryString["pi"];
            //string strContent = FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContent")).Content.Trim());
            //string strContentEn = FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContentEn")).Content.Trim());

            var oProductStoneCategory = new ProductStoneCategory();

            if (e.CommandName == "PerformInsert")
            {
                strProductStoneCategoryImage = oProductStoneCategory.ProductStoneCategoryInsert(
                    strProductStoneCategoryName,
                    strProductStoneCategoryNameEn,
                    strConvertedProductStoneCategoryName,
                    strProductStoneCategoryImage,
                    strIsAvailable,
                    strPriority,
                    strProductID
                    );
                string strFullPath = "~/res/ProductStoneCategory/" + strProductStoneCategoryImage;

                if (!string.IsNullOrEmpty(strProductStoneCategoryImage))
                {
                    FileProductStoneCategoryImage.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //string bgColor = "#ffffff";
                    //ResizeCropImage.ResizeWithBackGroundColor(strFullPath, 190, 120, bgColor);
                    //ResizeCropImage.ResizeByWidth(strFullPath, 180);
                    ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                }
                RadGrid1.Rebind();
            }
            else
            {
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;
                var strProductStoneCategoryID = row.GetDataKeyValue("ProductStoneCategoryID").ToString();
                var strOldProductStoneCategoryImage = ((HiddenField)row.FindControl("hdnProductStoneCategoryImage")).Value;
                var strOldImagePath = Server.MapPath("~/res/ProductStoneCategory/" + strOldProductStoneCategoryImage);

                dsUpdateParam["ProductStoneCategoryName"].DefaultValue = strProductStoneCategoryName;
                dsUpdateParam["ProductStoneCategoryNameEn"].DefaultValue = strProductStoneCategoryNameEn;
                dsUpdateParam["ConvertedProductStoneCategoryName"].DefaultValue = strConvertedProductStoneCategoryName;
                dsUpdateParam["ProductStoneCategoryImage"].DefaultValue = strProductStoneCategoryImage;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
                dsUpdateParam["ProductID"].DefaultValue = strProductID;

                if (!string.IsNullOrEmpty(strProductStoneCategoryImage))
                {
                    var strFullPath = "~/res/ProductStoneCategory/" + strConvertedProductStoneCategoryName + "-" + strProductStoneCategoryID + strProductStoneCategoryImage.Substring(strProductStoneCategoryImage.LastIndexOf('.'));

                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);

                    FileProductStoneCategoryImage.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //string bgColor = "#ffffff";
                    //ResizeCropImage.ResizeWithBackGroundColor(strFullPath, 180, 120, bgColor);
                    ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                    //ResizeCropImage.ResizeByWidth(strFullPath, 180);
                }
            }
        }
        if (e.CommandName == "DeleteImage")
        {
            var oProductStoneCategory = new ProductStoneCategory();
            var lnkDeleteImage = (LinkButton)e.CommandSource;
            var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
            var strProductStoneCategoryID = s[0];
            var strProductStoneCategoryImage = s[1];

            oProductStoneCategory.ProductStoneCategoryImageDelete(strProductStoneCategoryID);
            DeleteImage(strProductStoneCategoryImage);
            RadGrid1.Rebind();
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            var FileProductStoneCategoryImage = (RadUpload)row.FindControl("FileProductStoneCategoryImage");

            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileProductStoneCategoryImage.ClientID));
        }
    }
    #endregion
}