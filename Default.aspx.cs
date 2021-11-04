using PruebaMenu.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PruebaMenu
{
    public partial class _Default : Page
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

                gvPlanillasGeneradas.DataSource = listado;
                gvPlanillasGeneradas.DataBind();

                gvPlanillasPendientesAprobar.DataSource = listado;
                gvPlanillasPendientesAprobar.DataBind();

                //ManejoMenuActiva();
            }
        }

        protected void gvPlanillasGeneradas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvPlanillasGeneradas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvPlanillasPendientesAprobar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int topSeleccionado = gvPlanillasPendientesAprobar.SelectedRow.DataItemIndex;

            int idLugar = Convert.ToInt32(gvPlanillasPendientesAprobar.DataKeys[topSeleccionado].Value);

            LUGARES lugar = new LUGARES();
            using (ViaticosPruebaEntities db = new ViaticosPruebaEntities())
            {
                lugar = db.LUGARES.Where(x => x.id_lugarVisita == idLugar).FirstOrDefault();
                lugar.direccion_lugarVisita = "Calle por ahi";
                db.SaveChanges();
            }
            Session["Pestaña"] = "pestaña2";
            LlenarGridView();
        }

        private void ManejoMenuActiva()
        {
            try
            {
                if(Session["Pestaña"] != null)
                {
                    string pestañaActiva = Session["Pestaña"].ToString();

                    string scriptAbrrir = @"<script>
                            $(document).ready(function(){
                              const id = '#" + pestañaActiva + "';" +
                                      "console.log('Cargue'); " +
                                      "$(id).tab('show') }); " +
                                      "</script> ";

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", scriptAbrrir, false);
                }
                else
                {
                    Session["Pestaña"] = "pestaña1";
                    string pestañaActiva = Session["Pestaña"].ToString();

                    string scriptAbrrir = @"<script>
                            $(document).ready(function(){
                              const id = '#" + pestañaActiva + "';" +
                                      "console.log('Cargue'); " +
                                      "$(id).tab('show') }); " +
                                      "</script> ";

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", scriptAbrrir, false);
                }
                

            }
            catch (Exception ex)
            {
                Session["Pestaña"] = "pestaña1";
                string pestañaActiva = Session["Pestaña"].ToString();

                string scriptAbrrir = @"<script>
                            $(document).ready(function(){
                              const id = '#" + pestañaActiva + "';" +
                                  "console.log('Cargue'); " +
                                  "$(id).tab('show') }); " +
                                  "</script> ";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", scriptAbrrir, false);
            }
           

            //$(document).ready(function(){
            //   const id = '#pestaña2'
            //                       console.log('Cargue')
            //                       $(id).tab('show')
            //                     })



        }
    }
}