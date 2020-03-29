using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace InventoryStore
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadUsers();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        public void LoadUsers()
        {
            InventoryBL bl = new InventoryBL();
            var users = bl.GetUsers();

            //foreach(var user in users)
            //{
            //    TableRow row = new TableRow();
            //    TableCell cell1 = new TableCell();
            //    cell1.Text = user.FirstName;

            //    TableCell cell2 = new TableCell();
            //    cell2.Text = user.LastName;

            //    TableCell cell3 = new TableCell();
            //    cell3.Text = user.Gender;

            //    TableCell cell4 = new TableCell();
            //    cell4.Text = user.Phone;

            //    TableCell cell5 = new TableCell();
            //    cell5.Text = user.Email_Id;

            //    TableCell cell6 = new TableCell();
            //    cell6.Text = user.IsActive ? "Active" : "Inactive";

            //    row.Cells.Add(cell1);
            //    row.Cells.Add(cell2);
            //    row.Cells.Add(cell3);
            //    row.Cells.Add(cell4);
            //    row.Cells.Add(cell5);
            //    row.Cells.Add(cell6);
            //    dataTable.Rows.Add(row);
            //}

            DataTable dtUsers = new DataTable();
            dtUsers.Columns.Add("User_Id");
            dtUsers.Columns.Add("FirstName");
            dtUsers.Columns.Add("LastName");
            dtUsers.Columns.Add("Gender");
            dtUsers.Columns.Add("Phone");
            dtUsers.Columns.Add("Email");
            dtUsers.Columns.Add("Status");

            DataRow dr1 = dtUsers.NewRow();
            dr1["User_Id"] = "1";
            dr1["FirstName"] = "John";
            dr1["LastName"] = "Gireesham";
            dr1["Gender"] = "Male";
            dr1["Phone"] = "123456";
            dr1["Email"] = "123@asd.com";
            dr1["Status"] = "Active";
            dtUsers.Rows.Add(dr1);

            DataSet ds = new DataSet();
            ds.Tables.Add(dtUsers);

            dataTable.DataSource = ds;
            dataTable.DataBind();
        }

        protected void dataTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                //Reference the GridView Row.
                GridViewRow row = dataTable.Rows[rowIndex];

            }
        }
    }
}