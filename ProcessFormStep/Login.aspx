<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProcessFormStep.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td colspan="2" height="200px"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <b>Login Form</b>
            </td>
        </tr>
        <tr>
            <td>Username:
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" />
                <asp:RequiredFieldValidator ID="rfvUser" ErrorMessage="Please enter Username" ControlToValidate="txtUserName" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Password:
            </td>
            <td>
                <asp:TextBox ID="txtPWD" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="rfvPWD" runat="server" ControlToValidate="txtPWD" ErrorMessage="Please enter Password" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Label ID="lblErrorMsg" runat="server" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
