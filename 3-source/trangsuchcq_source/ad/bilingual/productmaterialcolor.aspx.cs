using System;
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

    void DeleteImage(string strProductMaterialColorImage)
    {
        if (!string.IsNullOrEmpty(strProductMaterialColorImage))
        {
            string strOldImagePath = Server.MapPath("~/res/ProductMaterialColor/" + strProductMaterialColorImage);
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
            ObjectDataSource1.SelectParameters["ProductMaterialColorName"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "QuickUpdate")
        {
            string ProductMaterialColorID, Priority, IsAvailable;
            var oProductMaterialColor = new ProductMaterialColor();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ProductMaterialColorID = item.GetDataKeyValue("ProductMaterialColorID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oProductMaterialColor.ProductMaterialColorQuickUpdate(
                    ProductMaterialColorID,
                    IsAvailable,
                    Priority
                );
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            var oProductMaterialColor = new ProductMaterialColor();

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                string strProductMaterialColorImage = ((HiddenField)item.FindControl("hdnProductMaterialColorImage")).Value;

                if (!string.IsNullOrEmpty(strProductMaterialColorImage))
                {
                    string strSavePath = Server.MapPath("~/res/ProductMaterialColor/" + strProductMaterialColorImage);
                    if (File.Exists(strSavePath))
                        File.Delete(strSavePath);
                }
            }
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var FileProductMaterialColorImage = (RadUpload)row.FindControl("FileProductMaterialColorImage");

            string strProductMaterialColorName = ((TextBox)row.FindControl("txtProductMaterialColorName")).Text.Trim();
            string strProductMaterialColorNameEn = ((TextBox)row.FindControl("txtProductMaterialColorNameEn")).Text.Trim();
            string strConvertedProductMaterialColorName = Common.ConvertTitle(strProductMaterialColorName);
            string strProductMaterialColorImage = FileProductMaterialColorImage.UploadedFiles.Count > 0 ? FileProductMaterialColorImage.UploadedFiles[0].GetName() : "";
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string strPriority = ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();
            string strProductID = string.IsNullOrEmpty(Request.QueryString["pi"]) ? "" : Request.QueryString["pi"];
            //string strContent = FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContent")).Content.Trim());
            //string strContentEn = FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContentEn")).Content.Trim());

            var oProductMaterialColor = new ProductMaterialColor();

            if (e.CommandName == "PerformInsert")
            {
                strProductMaterialColorImage = oProductMaterialColor.ProductMaterialColorInsert(
                    strProductMaterialColorName,
                    strProductMaterialColorNameEn,
                    strConvertedProductMaterialColorName,
                    strProductMaterialColorImage,
                    strIsAvailable,
                    strPriority,
                    strProductID
                    );
                string strFullPath = "~/res/ProductMaterialColor/" + strProductMaterialColorImage;

                if (!string.IsNullOrEmpty(strProductMaterialColorImage))
                {
                    FileProductMaterialColorImage.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
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
                var strProductMaterialColorID = row.GetDataKeyValue("ProductMaterialColorID").ToString();
                var strOldProductMaterialColorImage = ((HiddenField)row.FindControl("hdnProductMaterialColorImage")).Value;
                var strOldImagePath = Server.MapPath("~/res/ProductMaterialColor/" + strOldProductMaterialColorImage);

                dsUpdateParam["ProductMaterialColorName"].DefaultValue = strProductMaterialColorName;
                dsUpdateParam["ProductMaterialColorNameEn"].DefaultValue = strProductMaterialColorNameEn;
                dsUpdateParam["ConvertedProductMaterialColorName"].DefaultValue = strConvertedProductMaterialColorName;
                dsUpdateParam["ProductMaterialColorImage"].DefaultValue = strProductMaterialColorImage;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
                dsUpdateParam["ProductID"].DefaultValue = strProductID;

                if (!string.IsNullOrEmpty(strProductMaterialColorImage))
                {
                    var strFullPath = "~/res/ProductMaterialColor/" + strConvertedProductMaterialColorName + "-" + strProductMaterialColorID + strProductMaterialColorImage.Substring(strProductMaterialColorImage.LastIndexOf('.'));

                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);

                    FileProductMaterialColorImage.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //string bgColor = "#ffffff";
                    //ResizeCropImage.ResizeWithBackGroundColor(strFullPath, 180, 120, bgColor);
                    ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                    //ResizeCropImage.ResizeByWidth(strFullPath, 180);
                }
            }
        }
        if (e.CommandName == "DeleteImage")
        {
            var oProductMaterialColor = new ProductMaterialColor();
            var lnkDeleteImage = (LinkButton)e.CommandSource;
            var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
            var strProductMaterialColorID = s[0];
            var strProductMaterialColorImage = s[1];

            oProductMaterialColor.ProductMaterialColorImageDelete(strProductMaterialColorID);
            DeleteImage(strProductMaterialColorImage);
            RadGrid1.Rebind();
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            var FileProductMaterialColorImage = (RadUpload)row.FindControl("FileProductMaterialColorImage");

            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileProductMaterialColorImage.ClientID));
        }
    }
    #endregion
}