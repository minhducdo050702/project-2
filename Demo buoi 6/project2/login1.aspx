<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login1.aspx.cs" Inherits="pr1.login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>Bạn đã đăng nhập thành công</div>
  <asp:Button ID="btnSubmit" runat="server" Text="Bấm vào đây để tiếp tục" OnClick="btnSubmit_Click" />
</asp:Content>
