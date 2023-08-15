using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSocketSharp.Server;

namespace pr1
{
   

    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    LinkButton1.Visible = true;
                    LinkButton3.Visible = false;
                    LinkButton7.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;

                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; // user login link button
                    LinkButton3.Visible = true; // logout link button
                    LinkButton7.Visible = true; // hello user link button
                    LinkButton7.Text = "Xin chào Quản trị viên";
                    LinkButton9.Visible = true; // book issuing link button
                    LinkButton10.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("quanlydanhmucungdung.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("quanlydanhmucnguoidung.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.html");
            Session["role"] = "admin";
        }



        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["role"] = "";
            LinkButton1.Visible = true; // user login link button
            LinkButton3.Visible = false; // logout link button
            LinkButton7.Visible = false; // hello user link button
            LinkButton9.Visible = false; // book issuing link button
            LinkButton10.Visible = false; // member management link button
            Response.Redirect("homePage.aspx");
        }
    }
}