<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Sushi.AdminPanel.Menu" %>
<%@ Import Namespace="Sushi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script>
     window.onload = function() {
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
                 $('#<%=imgMenu.ClientID%>').prop('src', e.target.result)
                     .width(200)
                     .height(200);
             };
             reader.readAsDataURL(input.files[0]);
         }
     }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="pcoded-inner-content pt-0">
     <div class="align-align-self-end<asp:Label runat=" label="" server="">
         <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
     </div>
     <div class="main-body">
         <div class="page-wrapper">

             <div class="page-body">
                 <div class="row">
                     <div class="col-sm-12 ">
                                             <div class="card">
                                                 <div class="card-header">
                                                 </div>
                                                 <div class="card-block">
                                                     <div class="row">

                                                         <div class="col-sm-6 col-md-4 col-lg-4">
                                                             <h4 class="sub-title">Menu</h4>
                                                             <div>
                                                                 <div class="form-group">
                                                                     <label>Menu name</label>
                                                                     <div>
                                                                         <asp:Textbox ID="txtName" runat="server" CssClass="form-control"
                                                                             placeholder="Enter Menu name" ></asp:Textbox>
                                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                             ErrorMessage="Menu name is required." ForeColor="Red" Display="Dynamic"
                                                                              SetFocusOnError="true"  ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                                                         <asp:HiddenField Id="hdnId" runat="server" Value="0" />
                                                                     </div>
                                                                 </div>
                                                                 <div class="form-group">
                                                                     <label>Menu description</label>
                                                                  <div>
                                                                         <asp:Textbox ID="txtDescription" runat="server" CssClass="form-control"
                                                                             placeholder="Enter Menu description" TextMode="MultiLine"></asp:Textbox>
                                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                                             ErrorMessage="Menu Description is required." ForeColor="Red" Display="Dynamic"
                                                                              SetFocusOnError="true"  ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                                                                        
                                                                     </div>
                                                                </div>
                                                                    <div class="form-group">
                                                                    <label>Menu Price($)</label>
                                                                    <div>
                                                                        <asp:Textbox ID="txtPrice" runat="server" CssClass="form-control"
                                                                            placeholder="Enter Menu Price" ></asp:Textbox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                                            ErrorMessage="Menu Price is required." ForeColor="Red" Display="Dynamic"
                                                                             SetFocusOnError="true"  ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                            ErrorMessage="Price must be in decimal." ForeColor="Red" Display="Dynamic"
                                                                           SetFocusOnError="true"  ControlToValidate="txtPrice"
                                                                             ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ></asp:RegularExpressionValidator>
                                                                        
                                                                    </div>
                                                                </div>

                                                                     <div class="form-group">
                                                                    <label>Menu Quantity</label>
                                                                    <div>
                                                                        <asp:Textbox ID="txtQuantity" runat="server" CssClass="form-control"
                                                                            placeholder="Enter Menu Quantity" ></asp:Textbox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                                            ErrorMessage="Menu Quantity is required." ForeColor="Red" Display="Dynamic"
                                                                             SetFocusOnError="true"  ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                                            ErrorMessage="Quantity should not be in negative number." ForeColor="Red" Display="Dynamic"
                                                                           SetFocusOnError="true"  ControlToValidate="txtQuantity"
                                                                             ValidationExpression="^([1-9]\d*|0)$"></asp:RegularExpressionValidator>
        
                                                                    </div>
                                                                </div>
                                                                 <div class="form-group">
                                                                      <label>Menu Image</label>
                                                                     <div>
                                                                         <asp:FileUpload ID="fuMenuImage" runat="server" CssClass="form-control"
                                                                             onChange="ImagePreview(this);" />
                                                                     </div>
                                                                 </div>
                                                                  <div class="form-group">
                                                                         <label>Menu Category</label>
                                                                      <div>
                                                                          <asp:DropDownList ID="ddlCategories" CssClass="form-control" runat="server" 
                                                                              DataTextField="Name" DataValueField="categoryId" DataSourceID="SqlDataSource1"
                                                                               AppendDataBoundItems="true">
                                                                              <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                                          </asp:DropDownList>
                                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                                                 ErrorMessage="Category is required." ForeColor="Red" Display="Dynamic"
                                                                                  SetFocusOnError="true"  ControlToValidate="ddlCategories"
                                                                                  InitialValue="0"></asp:RequiredFieldValidator>
                                                                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [categoryId], [Name] FROM [Categories]"></asp:SqlDataSource>
        
                                                                         </div>
                                                                    </div>

                                                                 <div class="form-check pl-4">
                                                                     <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive" 
                                                                         CssClass="form-check-input" />
                                                                 </div>
                                                                 <div class="pb-5">
                                                                     <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary"
                                                                        OnClick="btnAddOrUpdate_Click" />
                                                                      &nbsp;
                                                                     <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary"
                                                                         CausesValidation="false" OnClick="btnClear_Click" />
                                                                 </div>
                                                                 <div>
                                                                     <asp:Image ID="imgMenu" runat="server" CssClass="img-thumbnail" />
                                                                 </div>
                                                             </div>
                                                         </div>

                                                         <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                                            <h4 class="sub-title">Category List</h4>
                                                             <div class="card-block table-border-style">
                                                                 <div class="table-responsive">
                                                                     <asp:Repeater ID="rMenu" runat="server" OnItemCommand="rMenu_ItemCommand"
                                                                          OnItemDataBound="rMenu_ItemDataBound">
                                                                         <HeaderTemplate>
                                                                             <table class="table data-table-export table-hover nowrap">
                                                                                 <tr>
                                                                                     <th class="table-plus">Name</th>
                                                                                     <th>Image</th>
                                                                                     <th>Price($)</th>
                                                                                     <th>Qty</th>
                                                                                     <th>Description</th>
                                                                                     <th>IsActive</th>
                                                                                     <th>CategoryName</th>
                                                                                     <th>CreatedDate</th>
                                                                                     <th class="datatable-nosort">Action</th>
                                                                                 </tr>
                                                                             </thead>
                                                                                 <tbody>
                                                                         </HeaderTemplate>
                                                                         <ItemTemplate>
                                                                             <tr>
                                                                                 <td class="table-plus"> <%# Eval("Name") %> </td>

                                                                                 <td> 
                                                                                     <img alt="" width="40" src="<%# Utils.GetImageUrl( Eval("ImageUrl")) %>" />
                                                                                 </td>
                                                                                  <td> <%# Eval("Price") %> </td>
                                                                                  <td>
                                                                                 <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                                 </td>
                                                                                 <td> <%# Eval("Description") %> </td>

                                                                                 <td>
                                                                                     <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                                                     </td>
                                                                                 <td> <%# Eval("CategoryName") %> </td>
                                                                                  
                                                                                 <td> <%# Eval("CreatedDate") %> </td>
                                                                                 <td>
                                                                                     <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" CausesValidation="false"
                                                                                         CommandArgument='<%# Eval("MenuId") %>' CommandName="edit">
                                                                                         <i class="ti-pencil"></i>
                                                                                     </asp:LinkButton>
                                                                                     <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                                         CssClass="badge bg-danger" CommandArgument='<%# Eval("MenuId") %>'
                                                                                         OnClientClick="return confirm('Do you want to delete this menu item?');" CausesValidation="false">
                                                                                         <i class="ti-trash"></i>
                                                                                     </asp:LinkButton>
                                                                                 </td>
                                                                                 
                                                                             </tr>
                                                                         </ItemTemplate>
                                                                         <FooterTemplate>
                                                                             </tbody>
                                                                         </FooterTemplate>
                                                                     </asp:Repeater>

                                                                 </div>
                                                             </div>
                                                             </div>

                                                     </div>
                                                 </div>
                                             </div>
                                         </div>


                 </div>
             </div>
         </div>
     </div>
 </div>
</asp:Content>
