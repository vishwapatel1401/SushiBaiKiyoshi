﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Sushi.User.Cart" %>
<%@ Import Namespace="Sushi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server"  Visible="false"></asp:Label>
                </div>
                <h2>
              Your Shopping Cart
            </h2>
            </div>
        </div>

        <div class="container">
            <asp:Repeater ID="rCartItem" runat="server" OnItemCommand="rCartItem_ItemCommand" OnItemDataBound="rCartItem_ItemDataBound">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total Amount</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                        
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </td>
                        <td>
                            <img width="60" src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" alt=""/>
                        </td>
                        <td>$<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            <asp:HiddenField ID="hdnMenuId" runat="server" Value='<%# Eval("MenuId") %>' />
                            <asp:HiddenField ID="hdnQuantity" runat="server" Value ='<%# Eval("Qty") %>' />
                            <asp:HiddenField ID="hdnMenuQuantity" runat="server" Value ='<%# Eval("MenuQty") %>'/>

                        </td>
                        <td>
                            <div class="product__details__option">
                                <div class="quantity">
                                    <div class="menu-qty">
                                        <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revQuantity" runat="server" ErrorMessage="*"
                                            ForeColor="Red" Font-Size="Small" ValidationExpression="[1-9]*" ControlToValidate="txtQuantity"
                                            Display="Dynamic"  SetFocusOnError="true" EnableClientScript="true"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                            </div>
                        </td>
                        <td>
                            $<asp:Label ID="lblTotalPrice" runat="server"></asp:Label></td>
                        <td>
                            <asp:LinkButton ID="lbDelete" runat="server" Text="Remove" CommandName="remove"
                                CommandArgument='<%# Eval("MenuId") %>' 
                                onClientClick="return confirm('Do you want to remove this item from cart?');"><i class="fa fa-close"></i></asp:LinkButton>
                        </td>
                    </tr>
                                   </ItemTemplate>
           </asp:Repeater>
         
                    <FooterTemplate>
                        <tr>
                            <td colspan="3"> </td>
                            <td class="pl-lg-5">
                                <b>Total Amount:-</b>

                            </td>
                            <td>$<% Response.Write(Session["grandTotalPrice"]); %></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="continue__btn">
                                <a href="Menu.aspx" class="btn btn-info"> <i class="fa fa-arrow-circle-left mr-2"> Continue Shopping</i></a>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbUpdateCart" runat="server" CommandName="updateCart" CssClass="btn btn-warning">
                                    <i class="fa fa-refresh mr-2"> Update Cart</i>

                                </asp:LinkButton>
                            </td>
                            <td colspan="2" class="checkout__btn">
                                <a href="Payment.aspx" class="btn btn-info"> <i class="fa fa-arrow-circle-right mr-2"> Checkout</i></a>

                                <%--<asp:LinkButton ID="lbCheckout" runat="server" CommandName="checkout" CssClass="btn btn-success">
                                   CheckOut <i class="fa fa-arrow-circle-right mr-2"></i>

                                </asp:LinkButton>--%>

                            </td>
                        </tr>
                       
                    </FooterTemplate>
                        </tbody>
</table>
               
        </div>


    </section>

</asp:Content>
