using ProcessFormStep.Edmx;
using ProcessFormStep.Models;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace ProcessFormStep
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        #region Property
        ProcessWizardEntities db = new ProcessWizardEntities();
        EmployeeDetails employeeDetails = new EmployeeDetails();
        int employeeId;
        #endregion

        #region Page Event
        /// <summary>
        /// Page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageLoad();
            }
        }
        #endregion

        #region Private Method
        /// <summary>
        /// Step Process check
        /// </summary>
        private void StepProcess()
        {
            int workFlowStep = db.EmployeeDetails.Where(x => x.Id == employeeId).Select(x => x.WorkFlowStage).FirstOrDefault().Value;
            var empDetails = db.EmployeeDetails.Where(x => x.Id == employeeId).FirstOrDefault();
            if (workFlowStep == 10)
            {
                wzd.ActiveStepIndex = 0;
                txtBranchNo.Text = empDetails.BranchNo;
                txtBranchName.Text = empDetails.Name;
            }
            else if (workFlowStep == 20)
            {
                wzd.ActiveStepIndex = 0;
                txtBranchNo.Text = empDetails.BranchNo;
                txtBranchName.Text = empDetails.Name;

                txtFirstName.Text = empDetails.FirstName;
                txtLastName.Text = empDetails.LastName;
            }
            else if (workFlowStep == 30)
            {
                wzd.ActiveStepIndex = 0;

                txtBranchNo.Text = empDetails.BranchNo;
                txtBranchName.Text = empDetails.Name;

                txtFirstName.Text = empDetails.FirstName;
                txtLastName.Text = empDetails.LastName;

                txtCity.Text = empDetails.City;
                txtState.Text = empDetails.State;
                txtCountry.Text = empDetails.Country;
            }
        }

        /// <summary>
        /// Page load 
        /// </summary>
        private void PageLoad()
        {
            if (Session["IsLogin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["EmployeeId"] != null)
            {
                employeeId = Convert.ToInt32(Session["EmployeeId"].ToString());
                StepProcess();
            }
        }
        #endregion

        #region Button Click
        /// <summary>
        /// Button Cancle
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["EmployeeId"] = null;
            Response.Redirect("EmployeeDetails.aspx");
        }

        /// <summary>
        /// Final button click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnFinish_Click(object sender, EventArgs e)
        {
            EmployeeDetail employee = new EmployeeDetail()
            {
                Id = Session["EmployeeId"] == null ? 0 : Convert.ToInt32(Session["EmployeeId"]),
                City = txtCity.Text,
                State = txtState.Text,
                Country = txtCountry.Text,
                IsCompleted = true,
                WorkFlowStage = 30
            };

            var result = employeeDetails.Add(employee);
            if (result.IsSucceed)
            {
                Session["EmployeeId"] = null;
                Response.Redirect("EmployeeDetails.aspx");
            }
        }

        /// <summary>
        /// First step click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNextStep1_Click(object sender, EventArgs e)
        {
            EmployeeDetail employee = new EmployeeDetail()
            {
                Id = Session["EmployeeId"] == null ? 0 : Convert.ToInt32(Session["EmployeeId"]),
                BranchNo = txtBranchNo.Text,
                Name = txtBranchName.Text,
                IsCompleted = false,
                WorkFlowStage = 10,
            };

            var result = employeeDetails.Add(employee);
            if (result.IsSucceed)
            {
                Session["EmployeeId"] = result.Id;
            }
        }

        /// <summary>
        /// Second step click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNextStep2_Click(object sender, EventArgs e)
        {
            EmployeeDetail employee = new EmployeeDetail()
            {
                Id = Session["EmployeeId"] == null ? 0 : Convert.ToInt32(Session["EmployeeId"]),
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                IsCompleted = false,
                WorkFlowStage = 20,
            };

            var result = employeeDetails.Add(employee);
            if (result.IsSucceed)
            {
                Session["EmployeeId"] = result.Id;
            }
        }
        #endregion

        #region Text Event
        /// <summary>
        /// Textbox change
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtBranchNo_TextChanged(object sender, EventArgs e)
        {
            var user = db.EmployeeDetails.Where(x => x.BranchNo.ToLower().Trim() == txtBranchNo.Text.ToLower().Trim()).Select(x => x.Id).FirstOrDefault();

            if (user == 0)
            {
                Button btnStep1Next = (Button)wzd.FindControl("StartNavigationTemplateContainerID$btnStep1Next");
                btnStep1Next.Enabled = true;
                lblBranchErrorMsg.Text = string.Empty;
                lblBranchErrorMsg.Visible = false;
            }
            else
            {
                Button btnStep1Next = (Button)wzd.FindControl("StartNavigationTemplateContainerID$btnStep1Next");
                btnStep1Next.Enabled = false;
                lblBranchErrorMsg.Text = "Branch Number Alredy Exits...Please Enter Other Branch Number";
                lblBranchErrorMsg.Visible = true;
            }
        }
        #endregion
    }
}