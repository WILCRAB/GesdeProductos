<%@page import="com.emergentes.modelo.Productos"%>
<%
    Productos prod = (Productos) request.getAttribute("miobjpro");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edicion de Producto</title>

        <style>
            body {
                background: #FEF8F7;

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
        <h1>Edicion de Producto</h1>
        <br>
        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" value="<%= prod.getId()%>" size="2" readonly></td>
                </tr>
                <tr>
                    <td>Descripcion</td>
                    <td><input type="text" name="descripcion" value="<%= prod.getDescripcion()%>"></td>
                </tr>
                <tr>
                    <td>Cantidad</td>
                    <td><input type="text" name="cantidad" value="<%= prod.getCantidad()%>"></td>
                </tr>   
                <tr>
                    <td>Precio</td>
                    <td><input type="text" name="precio" value="<%= prod.getPrecio()%>"></td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td><input type="text" name="categoria" value="<%= prod.getCategoria()%>"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="Enviar"></td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
