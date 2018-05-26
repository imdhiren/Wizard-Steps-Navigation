<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="ProcessFormStep.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"/>
    <br />
    <asp:RadioButton ID="rdoButton1" GroupName="Group1" Text="Pending" Value="Pending" runat="server" OnCheckedChanged="rdoButton1_CheckedChanged" AutoPostBack="true" />
    <asp:RadioButton ID="rdoButton2" GroupName="Group1" Text="Complete" Value="Complete" runat="server" OnCheckedChanged="rdoButton1_CheckedChanged" AutoPostBack="true" />

    <table style="width: 100%;">
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found">
                    <Columns>
                        <asp:BoundField DataField="BranchNo" HeaderText="Branch No" ItemStyle-Width="150px" />
                        <asp:BoundField DataField="Name" HeaderText="Branch Name" ItemStyle-Width="150px" />
                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("IsCompleted").ToString() == "True" ? "Completed" : "Pending" %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdnEmployeeId" runat="server" Value='<%# Eval("Id") %>' />
                                <asp:LinkButton Text="Edit" runat="server" CommandName="Edit" CommandArgument="<%# Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>
