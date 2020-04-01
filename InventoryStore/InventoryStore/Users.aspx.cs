using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace InventoryStore
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        [WebMethod]
        public static dynamic GetUsers()
        {
            InventoryBL bl = new InventoryBL();
            var users = bl.GetUsers().Select(x => new
            {
                User_Id = x.User_Id,
                FirstName = x.FirstName,
                LastName = x.LastName,
                Gender = x.Gender,
                Phone = x.Phone,
                Email_Id = x.Email_Id,
                IsActive = x.IsActive,
                GroupId = x.Group_Id
            });
            return users;
        }
    }
}