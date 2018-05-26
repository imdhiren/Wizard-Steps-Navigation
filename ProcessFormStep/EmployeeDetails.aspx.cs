using ProcessFormStep.Edmx;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProcessFormStep
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        #region Property
        ProcessWizardEntities ProcessWizardEntities = new ProcessWizardEntities();
        #endregion

        #region Page Event
        /// <summary>
        /// Page load event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["IsLogin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                GridBind();
                rdoButton1.Checked = true;
            }
        }
        #endregion

        #region Private Method
        /// <summary>
        /// Bind grid
        /// </summary>
        private void GridBind()
        {
            ProcessWizardEntities db = new ProcessWizardEntities();
            GridView1.DataSource = (from em in db.EmployeeDetails
                                    select new { em.BranchNo, em.Name, em.IsCompleted, em.Id }).Where(em => em.IsCompleted == false).ToList();
            GridView1.DataBind();
        }
        #endregion

        #region Grid Event
        /// <summary>
        /// Grid Command click event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                HiddenField hdnEmployeeId = (((e.CommandSource as LinkButton).Parent.FindControl("hdnEmployeeId")) as HiddenField);
                Session["EmployeeId"] = hdnEmployeeId.Value;
                Response.Redirect("EmployeeProcess.aspx");
            }
        }
        #endregion

        #region Radio button Event
        /// <summary>
        /// Radion button click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rdoButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoButton1.Checked)
            {
                ProcessWizardEntities db = new ProcessWizardEntities();
                GridView1.DataSource = (from em in db.EmployeeDetails
                                        select new { em.BranchNo, em.Name, em.IsCompleted, em.Id }).Where(em => em.IsCompleted == false).ToList();
                GridView1.DataBind();
            }

            if (rdoButton2.Checked)
            {
                ProcessWizardEntities db = new ProcessWizardEntities();
                GridView1.DataSource = (from em in db.EmployeeDetails
                                        select new { em.BranchNo, em.Name, em.IsCompleted, em.Id }).Where(em => em.IsCompleted == true).ToList();
                GridView1.DataBind();
            }
        }
        #endregion

        #region BUtton click
        /// <summary>
        /// Add button click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session["EmployeeId"] = null;
            Response.Redirect("EmployeeProcess.aspx");
        }
        #endregion

    }
}