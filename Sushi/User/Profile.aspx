﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Sushi.User.Profile" %>

<%@ Import Namespace="Sushi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%
       string imageUrl = Session["imageUrl"] != null ? Session["imageUrl"].ToString() : string.Empty;

    %>

     <section class="book_section layout_padding">
     <div class="container">
         <div class="heading_container">
             <h2>Customer Information</h2>
         </div>

         <div class="row">
             <div class="col-12">
                 <div class="card">
                     <div class="card-body">
                         <div class="card-title mb-4">
                             <div class="d-flex justify-content-start">
                                 <div class="image-container">
                                     <img src="<%= Utils.GetImageUrl(imageUrl)  %>" id="imgProfile" style="width:150px; height:150px;" 
                                         class="img-thumbnail" />
                                     <div class="middle pt-2">
                                         <a href="Registration.aspx?id=<% Response.Write(Session["customerId"]); %>" class="btn btn-warning">
                                             <i class="fa fa-pencil"></i>Edit Details
                                         </a>
                                     </div>
                                 </div>
                                 <div class="userData ml-3">
                                     <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
                                         <a href="javascript:void(0);"><% Response.Write(Session["firstname"]); %> </a>
                                     </h2>
                                     <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
                                        <a href="javascript:void(0);"><% Response.Write(Session["lastname"]); %> </a>
                                    </h2>
                                     <h6 class="d-block">
                                         <a href="javascript:void(0)">
                                             <asp:Label ID="lblUsername" runat="server" ToolTip="Unique Username">
                                                 @<% Response.Write(Session["username"]); %>
                                             </asp:Label>
                                         </a>
                                     </h6>
                                     <h6 class="d-block">
                                         <a href="javascript:void(0)">
                                             <asp:Label ID="lblEmail" runat="server" ToolTip="User Email">
                                                  <% Response.Write(Session["email"]); %>
                                             </asp:Label>
                                         </a>
                                     </h6>
                                     <h6 class="d-block">
                                        <a href="javascript:void(0)">
                                            <asp:Label ID="lblCreatedDate" runat="server" ToolTip="Account created on">
                                                 <% Response.Write(Session["createdDate"]); %>
                                            </asp:Label>
                                        </a>
                                    </h6>

                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-12">
                                 <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                     <li class="nav-item">
                                         <a class="nav-item">
                                             <a class="nav-link active text-info" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab"
                                                 aria-controls="basicInfo" aria-selected="true"><i class="fa fa-id-badge mr-2"></i>Basic info</a>
                                         </a>

                                     </li>
                                     <li class="nav-item">
                                         <a class="nav-link text-info" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab"
                                             aria-control="connectedServices" aria-selected="false"><i class="fa fa-clock-o mr-2"></i>Purchased History</a>
                                     </li>
                                 </ul>

                                 <div class="tab-content ml-1" id="myTabContent">
                                     <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                         <asp:Repeater ID="rUserProfile" runat="server">
                                             <ItemTemplate>
                                                 <div class="row">
                                                     <div class="col-sm-3 col-md-2 col-5">
                                                         <label style="font-weight: bold;">First Name</label>
                                                     </div>
                                                     <div class="col-md-8 col-6">
                                                         <%# Eval("Firstname") %>
                                                     </div>
                                                 </div>
                                                 <hr />
                                                 <div class="row">
                                                    <div class="col-sm-3 col-md-2 col-5">
                                                        <label style="font-weight: bold;">Last Name</label>
                                                    </div>
                                                    <div class="col-md-8 col-6">
                                                        <%# Eval("Lastname") %>
                                                    </div>
                                                </div>
                                                 <hr />
                                                 <div class="row">
                                                    <div class="col-sm-3 col-md-2 col-5">
                                                        <label style="font-weight: bold;">UserName</label>
                                                    </div>
                                                    <div class="col-md-8 col-6">
                                                        <%# Eval("Username") %>
                                                    </div>
                                                </div>
                                                 <hr />
                                                 <div class="row">
                                                    <div class="col-sm-3 col-md-2 col-5">
                                                        <label style="font-weight: bold;">MobileNo</label>
                                                    </div>
                                                    <div class="col-md-8 col-6">
                                                        <%# Eval("Mobile") %>
                                                    </div>
                                                </div>
                                                 <hr />
                                                 <div class="row">
                                                    <div class="col-sm-3 col-md-2 col-5">
                                                        <label style="font-weight: bold;">Email address</label>
                                                    </div>
                                                    <div class="col-md-8 col-6">
                                                        <%# Eval("Email") %>
                                                    </div>
                                                </div>
                                                 <hr />
                                                 <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Favourite menu item</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <%# Eval("Favmenuitem") %>
                                                </div>
                                            </div>
                                                 <hr />
                                                 <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Spice Level</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <%# Eval("Spicelevel") %>
                                                </div>
                                            </div>
                                                 <hr />
                                                 <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Dietary restriction</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <%# Eval("Dietaryrestriction") %>
                                                </div>
                                            </div>
                                                 <hr />
                                             </ItemTemplate>
                                         </asp:Repeater>
                                     </div>
                                     <%--Order history starts--%>
                                     <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedSerices-tab"></div>

                                 </div>
                                 
                                     <%--Order history ends--%>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>

         </div>
         

         </section>

</asp:Content>
