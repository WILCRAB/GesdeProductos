<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Productos"%>
<%
    if (session.getAttribute("listapro") == null) {
        ArrayList<Productos> lisaux = new ArrayList<Productos>();
        session.setAttribute("listapro", lisaux);
    }
    ArrayList<Productos> lista = (ArrayList<Productos>) session.getAttribute("listapro");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Productos</title>
        <style>
            body {
                background: #FEF8F7;

            }
            fieldset{
                width:400px;
                align-content: center;
                align: center;
            }
            table{
                width: 500px;
                border-collapse: collapse;
                border-color: yellow;
            }
            th{
                border-color: yellow;
                font-size: 20px;
                background-color: goldenrod;
            }
            td{
                border-color: yellow;
                background-color: khaki;
            }

        </style> 
    </head>
    <body>
    <center>
        <fieldset >
            <legend></legend>
            <p>SEGUNDO PARCIAL TEM-742 <br>
                Nombre: Williams Quiñajo Fernandez<br>
                Carnet: 7086899<br></p>
        </fieldset>
        <h1>Gestion de Productos</h1>

        <a href="MainServlet?op=nuevo">Nuevo Producto</a>


        <table>
            <tr>
                <th>Id</th>
                <th>Descripcion</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Categoria</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if (lista != null) {
                    for (Productos item : lista) {

            %>
            <tr>
                <td> <%= item.getId()%> </td>
                <td> <%= item.getDescripcion()%> </td>
                <td> <%= item.getCantidad()%> </td>
                <td> <%= item.getPrecio()%> </td>
                <td> <%= item.getCategoria()%> </td>
                <td>
                    <a href="MainServlet?op=editar&id=<%= item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%= item.getId()%>"
                       onclick="return(confirm('Esta seguro de eliminar??'))">Eliminar</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </center>
</body>
</html>
