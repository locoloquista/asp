<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PruebaMenu._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .menu {
            text-decoration: none;
            color: #008099;
            font-weight: bold;
        }

            .menu:hover {
                color: #000000;
            }

            .menu:focus {
                color: #000000;
            }

            .menu:active {
                color: #000000;
            }

        .table-borderless > tbody > tr > td,
        .table-borderless > tbody > tr > th,
        .table-borderless > tfoot > tr > td,
        .table-borderless > tfoot > tr > th,
        .table-borderless > thead > tr > td,
        .table-borderless > thead > tr > th {
            border: none;
        }
    </style>

    <br />

    <ul class="nav nav-tabs nav-justified" id="ccc" role="tablist">
        <li class="nav-item active"><a id="pestaña1" class="menu" data-toggle="tab" href="#home" aria-selected="true">Planillas Generadas</a></li>
        <li class="nav-item"><a id="pestaña2" class="menu" data-toggle="tab" href="#menu1" aria-selected="false">Pendientes de Aprobar</a></li>
        <li class="nav-item"><a id="pestaña3" class="menu" data-toggle="tab" href="#menu2" aria-selected="false">Pendientes de Autorizar</a></li>
        <li class="nav-item"><a id="pestaña4" class="menu" data-toggle="tab" href="#menu3" aria-selected="false">Notificar a Tesorería</a></li>
        <li class="nav-item"><a id="pestaña5" class="menu" data-toggle="tab" href="#menu4" aria-selected="false">Todas las Planillas</a></li>
    </ul>

    <div class="tab-content">

        <br />
        <div id="home" class="tab-pane in active" role="tabpanel">
            <%--MUESTRA EL GRIDVIEW DE LAS PLANILLAS PENDIENTES DE APROBAR--%>
            <div id="Grid">
                <asp:GridView ID="gvPlanillasGeneradas" runat="server" CssClass="table" AutoGenerateColumns="false" Font-Size="Medium"
                    DataKeyNames="id_lugarVisita"
                    OnRowDeleting="gvPlanillasGeneradas_RowDeleting" OnSelectedIndexChanged="gvPlanillasGeneradas_SelectedIndexChanged" HorizontalAlign="Center">

                    <Columns>

                        <asp:TemplateField HeaderText="Id Lugar" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="id" runat="server" Text='<%#Bind("id_lugarVisita") %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nombre del Lugar" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="fecha" runat="server" Text='<%#Bind("nombre_lugarVisita") %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Direccion" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="trabajo" runat="server" Text='<%#Bind("direccion_lugarVisita") %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:CommandField ButtonType="Button" ShowDeleteButton="true" ShowSelectButton="true" SelectText="Ver Detalle">
                            <ControlStyle CssClass="btn btn-default" />
                        </asp:CommandField>
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>

        <br />

        <div id="menu1" class="tab-pane" role="tabpanel">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div id="Gridview">
                        <asp:GridView ID="gvPlanillasPendientesAprobar" runat="server" CssClass="table" AutoGenerateColumns="false" Font-Size="Medium"
                            DataKeyNames="id_lugarVisita"
                            OnSelectedIndexChanged="gvPlanillasPendientesAprobar_SelectedIndexChanged" HorizontalAlign="Center">

                            <Columns>

                                <asp:TemplateField HeaderText="Id Lugar" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="id" runat="server" Text='<%#Bind("id_lugarVisita") %>'></asp:Label>
                                    </ItemTemplate>

                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nombre Lugar" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="fecha" runat="server" Text='<%#Bind("nombre_lugarVisita") %>'></asp:Label>
                                    </ItemTemplate>

                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Direccion" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="trabajo" runat="server" Text='<%#Bind("direccion_lugarVisita") %>'></asp:Label>
                                    </ItemTemplate>

                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:TemplateField>

                                <asp:CommandField ButtonType="Button" ShowSelectButton="true" ControlStyle-CssClass="btn btn-success" SelectText="Aprobar" ItemStyle-HorizontalAlign="Center" />

                            </Columns>
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>


        <div id="menu2" class="tab-pane fade">
            <h3>Menu 2</h3>
            <p>Some content in menu 2.</p>
        </div>
        <div id="menu3" class="tab-pane fade">
            <h3>Menu 3</h3>
            <p>Some content in menu 3.</p>
        </div>
        <div id="menu4" class="tab-pane fade">
            <h3>Menu 4</h3>
            <p>Some content in menu 4.</p>
        </div>

    </div>

</asp:Content>
