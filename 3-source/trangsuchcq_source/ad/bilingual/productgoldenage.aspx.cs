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

    void DeleteImage(string strProductGoldenAgeImage)
    {
        if (!string.IsNullOrEmpty(strProductGoldenAgeImage))
        {
            string strOldImagePath = Server.MapPath("~/res/ProductGoldenAge/" + strProductGoldenAgeImage);
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
            ObjectDataSource1.SelectParameters["ProductGoldenAgeName"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "QuickUpdate")
        {
            string ProductGoldenAgeID, Priority, IsAvailable;
            var oProductGoldenAge = new ProductGoldenAge();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ProductGoldenAgeID = item.GetDataKeyValue("ProductGoldenAgeID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oProductGoldenAge.ProductGoldenAgeQuickUpdate(
                    ProductGoldenAgeID,
                    IsAvailable,
                    Priority
                );
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            var oProductGoldenAge = new ProductGoldenAge();

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                string strProductGoldenAgeImage = ((HiddenField)item.FindControl("hdnProductGoldenAgeImage")).Value;

                if (!string.IsNullOrEmpty(strProductGoldenAgeImage))
                {
                    string strSavePath = Server.MapPath("~/res/ProductGoldenAge/" + strProductGoldenAgeImage);
                    if (File.Exists(strSavePath))
                        File.Delete(strSavePath);
                }
            }
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var FileProductGoldenAgeImage = (RadUpload)row.FindControl("FileProductGoldenAgeImage");

            string strProductGoldenAgeName = ((TextBox)row.FindControl("txtProductGoldenAgeName")).Text.Trim();
            string strProductGoldenAgeNameEn = ((TextBox)row.FindControl("txtProductGoldenAgeNameEn")).Text.Trim();
            string strConvertedProductGoldenAgeName = Common.ConvertTitle(strProductGoldenAgeName);
            string strProductGoldenAgeImage = FileProductGoldenAgeImage.UploadedFiles.Count > 0 ? FileProductGoldenAgeImage.UploadedFiles[0].GetName() : "";
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string strPriority = ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();
            string strProductID = string.IsNullOrEmpty(Request.QueryString["pi"]) ? "" : Request.QueryString["pi"];
            //string strContent = FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContent")).Content.Trim());
            //string strContentEn = FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContentEn")).Content.Trim());

            var oProductGoldenAge = new ProductGoldenAge();

            if (e.CommandName == "PerformInsert")
            {
                strProductGoldenAgeImage = oProductGoldenAge.ProductGoldenAgeInsert(
                    strProductGoldenAgeName,
                    strProductGoldenAgeNameEn,
                    strConvertedProductGoldenAgeName,
                    strProductGoldenAgeImage,
                    strIsAvailable,
                    strPriority,
                    strProductID
                    );
                string strFullPath = "~/res/ProductGoldenAge/" + strProductGoldenAgeImage;

                if (!string.IsNullOrEmpty(strProductGoldenAgeImage))
                {
                    FileProductGoldenAgeImage.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
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
                var strProductGoldenAgeID = row.GetDataKeyValue("ProductGoldenAgeID").ToString();
                var strOldProductGoldenAgeImage = ((HiddenField)row.FindControl("hdnProductGoldenAgeImage")).Value;
                var strOldImagePath = Server.MapPath("~/res/ProductGoldenAge/" + strOldProductGoldenAgeImage);

                dsUpdateParam["ProductGoldenAgeName"].DefaultValue = strProductGoldenAgeName;
                dsUpdateParam["ProductGoldenAgeNameEn"].DefaultValue = strProductGoldenAgeNameEn;
                dsUpdateParam["ConvertedProductGoldenAgeName"].DefaultValue = strConvertedProductGoldenAgeName;
                dsUpdateParam["ProductGoldenAgeImage"].DefaultValue = strProductGoldenAgeImage;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
                dsUpdateParam["ProductID"].DefaultValue = strProductID;

                if (!string.IsNullOrEmpty(strProductGoldenAgeImage))
                {
                    var strFullPath = "~/res/ProductGoldenAge/" + strConvertedProductGoldenAgeName + "-" + strProductGoldenAgeID + strProductGoldenAgeImage.Substring(strProductGoldenAgeImage.LastIndexOf('.'));

                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);

                    FileProductGoldenAgeImage.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //string bgColor = "#ffffff";
                    //ResizeCropImage.ResizeWithBackGroundColor(strFullPath, 180, 120, bgColor);
                    ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                    //ResizeCropImage.ResizeByWidth(strFullPath, 180);
                }
            }
        }
        if (e.CommandName == "DeleteImage")
        {
            var oProductGoldenAge = new ProductGoldenAge();
            var lnkDeleteImage = (LinkButton)e.CommandSource;
            var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
            var strProductGoldenAgeID = s[0];
            var strProductGoldenAgeImage = s[1];

            oProductGoldenAge.ProductGoldenAgeImageDelete(strProductGoldenAgeID);
            DeleteImage(strProductGoldenAgeImage);
            RadGrid1.Rebind();
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            var FileProductGoldenAgeImage = (RadUpload)row.FindControl("FileProductGoldenAgeImage");

            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileProductGoldenAgeImage.ClientID));
        }
    }
    #endregion
}