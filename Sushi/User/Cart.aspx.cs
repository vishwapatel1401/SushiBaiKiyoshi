using Sushi.AdminPanel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sushi.User
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        decimal grandTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["customerId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    getCardItems();
                }
            }
        }

        void getCardItems()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@CustomerId", Session["customerId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCartItem.DataSource = dt;
            if (dt.Rows.Count == 0)
            {
                rCartItem.FooterTemplate = null;
                rCartItem.FooterTemplate = new CustomTemplate(ListItemType.Footer);
                
            }
            rCartItem.DataBind();
        }

        protected void rCartItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Utils utils = new Utils();
            if(e.CommandName == "remove")
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Cart_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@MenuId", e.CommandArgument);
                cmd.Parameters.AddWithValue("@CustomerId", Session["customerId"]);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    getCardItems();
                    //cart count
                    Session["cartCount"] = utils.cartCount(Convert.ToInt32(Session["customerId"]));
                   
                }
                catch (Exception ex)
                {
                   
                    Response.Write("<script>alert('Error - " + ex.Message + " ');<script>");
                }
                finally
                {
                    con.Close();
                }
            }

            if(e.CommandName == "updateCart")
            {
                bool isCartUpdated = false;
                for(int item = 0;item < rCartItem.Items.Count; item++)
                {
                    if (rCartItem.Items[item].ItemType == ListItemType.Item || rCartItem.Items[item].ItemType == ListItemType.AlternatingItem)
                    {
                        TextBox quantity = rCartItem.Items[item].FindControl("txtQuantity") as TextBox;
                        HiddenField _menuId = rCartItem.Items[item].FindControl("hdnMenuId") as HiddenField;
                        HiddenField _quantity = rCartItem.Items[item].FindControl("hdnQuantity") as HiddenField;
                        int quantityFromCart = Convert.ToInt32(quantity.Text);
                        int MenuId = Convert.ToInt32(_menuId.Value);
                        int quantityFromDB = Convert.ToInt32(_quantity.Value);
                        bool isTrue = false;
                        int updatedQuantity = 1;
                        if(quantityFromCart > quantityFromDB)
                        {
                            updatedQuantity = quantityFromCart;
                            isTrue = true;
                        }
                        else if(quantityFromCart < quantityFromDB)
                        {
                            updatedQuantity = quantityFromCart;
                            isTrue = true;
                        }
                        if (isTrue)
                        {
                            //update cart item quantity in database
                            isCartUpdated = utils.updateCartQuantity(updatedQuantity, MenuId, Convert.ToInt32(Session["customerId"]));
                        }
                    }
                }
                getCardItems();
            }
            //if(e.CommandName == "checkout")
            //{
            //    bool isTrue = false;
            //    string mName = string.Empty;
            //    //first will check quantity
            //    for (int item = 0; item < rCartItem.Items.Count; item++)
            //    {
            //        if (rCartItem.Items[item].ItemType == ListItemType.Item || rCartItem.Items[item].ItemType == ListItemType.AlternatingItem)
            //        {
                        
            //            HiddenField _menuId = rCartItem.Items[item].FindControl("hdnMenuId") as HiddenField;
            //            HiddenField _cartQuantity = rCartItem.Items[item].FindControl("hdnQuantity") as HiddenField;
            //            HiddenField _menuQuantity = rCartItem.Items[item].FindControl("hdnMenuQuantity") as HiddenField;
            //            Label menuName = rCartItem.Items[item].FindControl("lblName") as Label;
            //            int MenuId = Convert.ToInt32(_menuId.Value);
            //            int cartQuantity = Convert.ToInt32(_cartQuantity.Value);
            //            int menuQuantity = Convert.ToInt32(_menuQuantity.Value);
            //            if (menuQuantity > cartQuantity && menuQuantity > 2)
            //            {
                            
            //                isTrue = true;
            //            }
            //            else 
            //            {
                            
            //                isTrue = false;
            //                mName = menuName.Text.ToString();
            //                break;
            //            }
                      
            //        }
            //    }
            //    if (isTrue)
            //    {
            //        Response.Redirect("Payment.aspx");
            //    }
            //    else
            //    {
            //        lblMsg.Visible = true;
            //        lblMsg.Text = "Item <b>'" + mName + "'is out of stock!!!";
            //        lblMsg.CssClass = "alert alert-warning";
            //    }
            //}
        }

        protected void rCartItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label totalPrice = e.Item.FindControl("lblTotalPrice") as Label;
                Label menuPrice = e.Item.FindControl("lblPrice") as Label;
                TextBox quantity = e.Item.FindControl("txtQuantity") as TextBox;
                    decimal calTotalPrice = Convert.ToDecimal(menuPrice.Text) * Convert.ToDecimal(quantity.Text);
                    totalPrice.Text = calTotalPrice.ToString();
                    grandTotal += calTotalPrice;
                
                   
            }
            Session["grandTotalPrice"] = grandTotal;
        }

        private sealed class CustomTemplate : ITemplate
        {
            private ListItemType ListItemType { get; set; }

            public CustomTemplate(ListItemType type) {
                ListItemType = type;
            }

            public void InstantiateIn(Control container)
            {
                if(ListItemType == ListItemType.Footer)
                {
                    var footer = new LiteralControl("<tr><td colspan='5'><b>Your cart is empty.</b><a href='Menu.aspx' class='badge badge-info ml-2'>Continue shopping</a></td></tr></tbody></table>");
                    container.Controls.Add(footer);
                }
            }
        }
    }
}