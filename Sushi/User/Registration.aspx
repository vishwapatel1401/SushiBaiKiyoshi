<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Sushi.User.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
         window.onload = function () {
             var seconds = 5;
             setTimeout(function () {
                 document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
          }, seconds * 1000);
         };
     </script>
  <script>
      function ImagePreview(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function (e) {
                  $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                      .width(200)
                      .height(200);
              };
              reader.readAsDataURL(input.files[0]);
          }
      }
  </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class ="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                 <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration Page</h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <asp:RequiredFieldValidator ID="rfvFname" runat="server" ErrorMessage="First name is required" ControlToValidate="txtFname"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revFname" runat="server" ErrorMessage="First name must be in characters only."
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"
                                ControlToValidate="txtFname"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtFname" runat="server" CssClass="form-control" placeholder="Enter Your First Name"
                                ToolTip="First Name"></asp:TextBox>
                        </div>
                         <div>
                             <asp:RequiredFieldValidator ID="rfvLname" runat="server" ErrorMessage="Last name is required" ControlToValidate="txtLname"
                                  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="revLname" runat="server" ErrorMessage="Last name must be in characters only."
                                  ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"
                                  ControlToValidate="txtLname"></asp:RegularExpressionValidator>
                             <asp:TextBox ID="txtLname" runat="server" CssClass="form-control" placeholder="Enter Your Last Name"
                                 ToolTip="Last Name"></asp:TextBox>
                         </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="User name is required" ControlToValidate="txtUsername"
                                  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                             <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Your Username"
                                  ToolTip="Username"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail"
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email must be in proper format."
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"
                                 ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Your Emailid"
                                 ToolTip="Email" ></asp:TextBox>
     
                        </div>
                        
                        <div>
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Mobile Number is required" ControlToValidate="txtMobile"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Mobile number must  have 10 digits only."
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$"
                                ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Your Mobile Number"
                                ToolTip="Mobile Number"></asp:TextBox>
                        </div>
                     </div>
                </div>
                <div class="col-md-6">
                  <div class="form_container">
                      
                        <div>
                            <asp:RegularExpressionValidator ID="revFav" runat="server" ErrorMessage="Menu item must be in characters only."
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"
                                ControlToValidate="txtFav"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtFav" runat="server" CssClass="form-control" placeholder="Enter Your favourite item from the menu"
                                ToolTip="Favourite item"></asp:TextBox>
                        </div>
                         <div>
                             <asp:RegularExpressionValidator ID="revDiet" runat="server" ErrorMessage="Diet restrictions must be in characters only."
                                  ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"
                                  ControlToValidate="txtDiet"></asp:RegularExpressionValidator>
                             <asp:TextBox ID="txtDiet" runat="server" CssClass="form-control" placeholder="Enter Your Dietary Restrictions"
                                 ToolTip="If you have any diet restrictions, just enter it here." ></asp:TextBox>
                         </div>
                        <div>
                                <asp:RegularExpressionValidator ID="revSpice" runat="server" ErrorMessage="Spice level must be in a single digit."
                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{1}$"
                                    ControlToValidate="txtSpice"></asp:RegularExpressionValidator>
                             <asp:TextBox ID="txtSpice" runat="server" CssClass="form-control" placeholder="Enter Your Spice level"
                                  ToolTip="Spice level: 1-mild,2-medium, 3-hot"></asp:TextBox>
                        </div>
                      <div>
                          <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="Customer Image" onchange="ImagePreview(this);" />
                      </div>
                       
                       <div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Your Password"
                                ToolTip="Password" TextMode="Password"></asp:TextBox>
                           
                        </div>
                      </div>
                    </div>
               
                    <div class="row pl-4">
                        <div class="btn_box">
                            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                                OnClick="btnRegister_Click1"/>

                            <asp:Label ID="lblAlreadyCustomer" runat="server" CssClass="pl-3 text-black-100"
                                Text="Already registered? <a href='Login.aspx' class='badge badge-info'>Login here...</a>">
                            </asp:Label>

                    </div>
                  </div>
                <div class="row p-5">
                    <div style ="align-items:center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>
                </div>
             </div>
       
    </section>

</asp:Content>
