﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Sushi.User.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- book section -->
  <section class="book_section layout_padding">
    <div class="container">
      <div class="row justify-content-center"> <!-- Center align the row -->
        <div class="col-md-6">
          <div class="form_container">
              <div class="heading_container">
        <h2>
          We value your feedback!!
        </h2>
      </div>
            <form action="">
              <div>
                <input type="text" class="form-control" placeholder="Your Name" />
              </div>
              <div>
                <input type="text" class="form-control" placeholder="Phone Number" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Your Email" />
              </div>
              
              <div>
                <input type="text" class="form-control" placeholder="Your feedback">
              </div>
              <div class="btn_box text-center"> <!-- Center align the button -->
                <button>
                  Submit
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end book section -->
</asp:Content>
