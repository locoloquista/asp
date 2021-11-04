<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PruebaMenu.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />

    <asp:GridView runat="server" ID="gvlistado" AutoGenerateColumns="false" DataKeyNames="id_lugarVisita" CssClass="table"
        OnRowCancelingEdit="gvlistado_RowCancelingEdit" OnRowDeleting="gvlistado_RowDeleting" 
        OnRowEditing="gvlistado_RowEditing" OnRowUpdating="gvlistado_RowUpdating">

        <Columns>
            <asp:TemplateField HeaderText="Id Lugar">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblIdLugar" Text='<%#Bind("id_lugarVisita") %>'/>
                </ItemTemplate>

                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="txtIdLugar" Text='<%#Bind("id_lugarVisita") %>' CssClass="form-control" AutoCompleteType="Enabled" ReadOnly="true"/>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Id Lugar">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblNombreLugar" Text='<%#Bind("nombre_lugarVisita") %>'/>
                </ItemTemplate>

                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="txtLugarVista" Text='<%#Bind("nombre_lugarVisita") %>' CssClass="form-control" AutoCompleteType="Enabled"/>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Id Lugar">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblDireccionLugar" Text='<%#Bind("direccion_lugarVisita") %>'/>
                </ItemTemplate>

                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="txtDireccionLugar" Text='<%#Bind("direccion_lugarVisita") %>' CssClass="form-control" AutoCompleteType="Enabled"/>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" />
        </Columns>

        

    </asp:GridView>

</asp:Content>
