<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Sushi.User.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- about section -->

  <section class="about_section layout_padding">
    <div class="container  ">

      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="../TemplateFiles/images/about-img.png" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box ">
            <div class="heading_container">
              <h2>
                 We Are the Sushi Maker
              </h2>
            </div>
            <p>
              Sushi is a traditional Japanese dish that typically consists of vinegared rice, various ingredients like seafood and vegetables, and sometimes tropical fruits, all rolled together using a sheet of seaweed called nori. The preparation process involves seasoned rice as the base, which is often mixed with rice vinegar, sugar, and salt. The rice is then spread onto a sheet of nori, and a combination of fresh fish, vegetables, or other ingredients is placed at the center. The entire assembly is tightly rolled using a bamboo mat called a makisu. Afterward, the roll is sliced into bite-sized pieces, resulting in the familiar cylindrical shapes we associate with sushi. Sushi can also be presented in other forms, such as nigiri (a small bed of rice with a slice of fish on top) or sashimi (slices of raw fish without rice). The artful combination of flavors, textures, and presentation makes sushi a culinary delight enjoyed worldwide.

            </p>
            <a href="">
              Read More
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end about section -->
</asp:Content>
