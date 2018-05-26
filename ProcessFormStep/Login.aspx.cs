using ProcessFormStep.Edmx;
using System;
using System.Linq;

namespace ProcessFormStep
{
    public partial class Login : System.Web.UI.Page
    {
        #region Property
        ProcessWizardEntities ProcessWizardEntities = new ProcessWizardEntities();
        #endregion

        #region Page load
        /// <summary>
        /// Page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IsLogin"] != null)
                {
                    Response.Redirect("EmployeeProcess.aspx");
                }
            }
        }
        #endregion

        #region Button Event
        /// <summary>
        /// Button click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var user = ProcessWizardEntities.Employees.FirstOrDefault(u => u.Email == txtUserName.Text && u.Password == txtPWD.Text);

            if (user != null)
            {
                Session["UserName"] = txtUserName.Text;
                Session["Password"] = txtPWD.Text;
                Session["IsLogin"] = true;
                Response.Redirect("EmployeeDetails.aspx");
            }
            else
            {
                lblErrorMsg.Text = "Invalid UserName & Password";
                lblErrorMsg.Visible = true;
            }
        }
        #endregion
    }
}