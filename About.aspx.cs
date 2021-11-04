using PruebaMenu.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PruebaMenu
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGridView();

            }
        }


        private void LlenarGridView()
        {
            List<LUGARES> listado = new List<LUGARES>();
            using (ViaticosPruebaEntities db = new ViaticosPruebaEntities())
            {
                listado = db.LUGARES.ToList();

                gvlistado.DataSource = listado;
                gvlistado.DataBind();

                //ManejoMenuActiva();
            }
        }

        //cancelar edicion
        protected void gvlistado_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvlistado.EditIndex = -1;
            LlenarGridView();
        }


        protected void gvlistado_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int codigo = Convert.ToInt32(gvlistado.DataKeys[e.RowIndex].Values[0]);

            //codigo para dar de baja el registro con el codigo capturado

            LlenarGridView();
        }

        protected void gvlistado_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvlistado.EditIndex = e.NewEditIndex;

            LlenarGridView();
        }

        //metodo que guarda la edicion
        protected void gvlistado_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int codigo = Convert.ToInt32(gvlistado.DataKeys[e.RowIndex].Values[0]);

            GridViewRow fila = gvlistado.Rows[e.RowIndex];

            string nombreLugar = ((fila.FindControl("txtLugarVista")) as TextBox).Text;
            string direccionLugar = ((fila.FindControl("txtDireccionLugar")) as TextBox).Text;

            LUGARES lugar = new LUGARES();

            using (ViaticosPruebaEntities db = new ViaticosPruebaEntities())
            {
                lugar = db.LUGARES.Where(x => x.id_lugarVisita == codigo).FirstOrDefault();

                lugar.nombre_lugarVisita = nombreLugar;
                lugar.direccion_lugarVisita = direccionLugar;
                db.SaveChanges();
            }

            gvlistado.EditIndex = -1;
            LlenarGridView();

        }


        //metodo para cargar ddl cuando se va editar
        //usar OnRowDataBound
        //protected void gvlistado_RowDataBound(object sender, GridViewUpdateEventArgs e)
        //{
        //    if(e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex == gvlistado.EditIndex)
        //    {
        //        DropDownList list = e.Row.FindControl("ddlACargar") as DropDownList;

        //        //metodo que carga el ddl con el,listado obtenido de la BD
        //    }
        //}
    }
}