<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeProcess.aspx.cs" Inherits="ProcessFormStep.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Wizard ID="wzd" runat="Server" Width="100%" DisplaySideBar="false">
            <WizardSteps>
                <asp:WizardStep ID="step1" runat="server" StepType="Start">
                    <table>
                        <tr>
                            <th>Branch Information
                            </th>
                        </tr>
                        <tr>
                            <td>Branch No:</td>
                            <td>
                                <asp:TextBox ID="txtBranchNo" runat="server" Width="240px" OnTextChanged="txtBranchNo_TextChanged" AutoPostBack="true"></asp:TextBox>
                                &nbsp;&nbsp;
                                <asp:Label ID="lblBranchErrorMsg" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                <asp:RequiredFieldValidator runat="server" ID="reqBranchNo" ControlToValidate="txtBranchNo" ErrorMessage="Please enter branch number!" ForeColor="Red" />
                            </td>
                        </tr>
                        <tr>
                            <td>Name :</td>
                            <td>
                                <asp:TextBox ID="txtBranchName" runat="server" Width="240px"></asp:TextBox>
                                <asp:HiddenField ID="hdnEmployeeId" Value="0" runat="server" />
                                <asp:RequiredFieldValidator runat="server" ID="reqBranchName" ControlToValidate="txtBranchName" ErrorMessage="Please enter branch name!" ForeColor="Red" />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="step2" runat="server" StepType="Step">
                    <table>
                        <tr>
                            <th>Employee Information
                            </th>
                        </tr>
                        <tr>
                            <td>First Name :</td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" Width="240px"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="reqFirstName" ControlToValidate="txtFirstName" ErrorMessage="Please enter first name!" ForeColor="Red" />
                            </td>
                        </tr>
                        <tr>
                            <td>Last Name :</td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" Width="240px"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="reqLastName" ControlToValidate="txtLastName" ErrorMessage="Please enter last name!" ForeColor="Red" />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="step3" runat="server" StepType="Finish">
                    <table>
                        <tr>
                            <th>Employee Address Information
                            </th>
                        </tr>
                        <tr>
                            <td>City :</td>
                            <td>
                                <asp:TextBox ID="txtCity" runat="server" Width="240px"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="reqCityName" ControlToValidate="txtCity" ErrorMessage="Please enter city!" ForeColor="Red" />
                            </td>
                        </tr>

                        <tr>
                            <td>State :</td>
                            <td>
                                <asp:TextBox ID="txtState" runat="server" Width="240px"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="reqStateName" ControlToValidate="txtState" ErrorMessage="Please enter state!" ForeColor="Red" />
                            </td>
                        </tr>

                        <tr>
                            <td>Country :</td>
                            <td>
                                <asp:TextBox ID="txtCountry" runat="server" Width="240px"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="reqCounrryName" ControlToValidate="txtCountry" ErrorMessage="Please enter country!" ForeColor="Red" />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
            </WizardSteps>
            <StartNavigationTemplate>
                <table cellpadding="1" cellspacing="1" id="Step1Table" runat="server">
                    <tr>
                        <td>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                                CausesValidation="false"
                                OnClientClick="return confirm('Are you sure you want to cancel');"
                                OnClick="btnCancel_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnStep1Next" runat="server" Text="Next >>"
                                CausesValidation="true"
                                CommandName="MoveNext" OnClick="btnNextStep1_Click" />
                        </td>
                    </tr>
                </table>
            </StartNavigationTemplate>
            <StepNavigationTemplate>
                <table cellpadding="3" cellspacing="3" id="Step2Table" runat="server">
                    <tr>
                        <td>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                                CausesValidation="false"
                                OnClientClick="return confirm('Are you sure you want to cancel');"
                                OnClick="btnCancel_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnPrevious" runat="server" Text="<< Previous"
                                CausesValidation="false"
                                CommandName="MovePrevious" />
                            <asp:Button ID="btnStep2Next" runat="server" Text="Next >>"
                                CausesValidation="true"
                                CommandName="MoveNext" OnClick="btnNextStep2_Click" />
                        </td>
                    </tr>
                </table>
            </StepNavigationTemplate>
            <FinishNavigationTemplate>
                <table cellpadding="3" cellspacing="3" id="Step3Table" runat="server">
                    <tr>
                        <td>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                                CausesValidation="false"
                                OnClientClick="return confirm('Are you sure you want to cancel');"
                                OnClick="btnCancel_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnPrevious" runat="server" Text="<< Previous"
                                CausesValidation="false"
                                CommandName="MovePrevious" />
                            <asp:Button ID="btnFinish" runat="server" Text="Finish"
                                CausesValidation="true"
                                CommandName="MoveComplete" OnClick="btnFinish_Click" />
                        </td>
                    </tr>
                </table>
            </FinishNavigationTemplate>
        </asp:Wizard>
    </div>
</asp:Content>
