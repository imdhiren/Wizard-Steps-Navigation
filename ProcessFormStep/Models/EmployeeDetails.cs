using ProcessFormStep.Edmx;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ProcessFormStep.Models
{
    public class EmployeeDetails
    {
        #region Variables
        ProcessWizardEntities _context = null;
        #endregion
        #region Constructors
        public EmployeeDetails()
        {
            _context = new ProcessWizardEntities();
        }
        #endregion
        #region Public Method
        /// <summary>
        /// Add employee detail
        /// </summary>
        /// <param name="employeeDetail">Employee Object</param>
        /// <returns></returns>
        public Result<int> Add(EmployeeDetail employeeDetail)
        {
            var result = new Result<int>();
            try
            {
                var emp = _context.EmployeeDetails.Where(x => x.Id == employeeDetail.Id).FirstOrDefault();

                if (emp == null)
                {
                    var app = new EmployeeDetail()
                    {
                        Id = employeeDetail.Id,
                        BranchNo = employeeDetail.BranchNo,
                        Name = employeeDetail.Name,
                        FirstName = employeeDetail.FirstName,
                        LastName = employeeDetail.LastName,
                        City = employeeDetail.City,
                        State = employeeDetail.State,
                        Country = employeeDetail.Country,
                        WorkFlowStage = employeeDetail.WorkFlowStage,
                        IsCompleted = employeeDetail.IsCompleted
                    };
                    _context.EmployeeDetails.Add(app);
                    _context.SaveChanges();
                    result.IsSucceed = true;
                    result.Id = app.Id;
                }
                else
                {

                    emp.Id = employeeDetail.Id;
                    emp.BranchNo = employeeDetail.BranchNo == null ? emp.BranchNo : employeeDetail.BranchNo;
                    emp.Name = employeeDetail.Name == null ? emp.Name : employeeDetail.Name;
                    emp.FirstName = employeeDetail.FirstName == null ? emp.FirstName : employeeDetail.FirstName;
                    emp.LastName = employeeDetail.LastName == null ? emp.LastName : employeeDetail.LastName;
                    emp.City = employeeDetail.City == null ? emp.City : employeeDetail.City;
                    emp.State = employeeDetail.State == null ? emp.State : employeeDetail.State;
                    emp.Country = employeeDetail.Country == null ? emp.Country : employeeDetail.Country;
                    emp.WorkFlowStage = employeeDetail.WorkFlowStage == 30 ? 30 : employeeDetail.WorkFlowStage;
                    emp.IsCompleted = employeeDetail.IsCompleted == true ? true : employeeDetail.IsCompleted;
                    _context.EmployeeDetails.Attach(emp);
                    _context.Entry(emp).State = EntityState.Modified;
                    _context.SaveChanges();
                    result.IsSucceed = true;
                    result.Id = emp.Id;
                }
            }
            catch (Exception ex)
            {
                result.IsSucceed = false;
                result.Exception = ex;
            }
            return result;
        }
        #endregion
    }
}