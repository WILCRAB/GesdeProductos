package com.emergentes.controlador;

import com.emergentes.modelo.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        
        Productos objpro = new Productos();
        int id, pos;
        
        HttpSession ses = request.getSession();
        ArrayList<Productos> lista = (ArrayList<Productos>)ses.getAttribute("listapro");
        
        switch (op) {
            case "nuevo":
                //Enviar objeto vacio a editar
                request.setAttribute("miobjpro", objpro);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                //Enviar objeto a editar pero con contenido
                id = Integer.parseInt(request.getParameter("id"));
                //Averiguar la posicion del elemento en la lista
                pos = BuscarPorIndice(request,id);
                //obtener el objeto
                objpro = lista.get(pos);
                request.setAttribute("miobjpro", objpro);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break; 
            case "eliminar":
                //Eliminar el registro de la coleccion segun el ID
                id = Integer.parseInt(request.getParameter("id"));
                //Averiguar la posicion del elemento en la lista
                pos = BuscarPorIndice(request,id);
                if(pos >= 0){
                    lista.remove(pos);
                }
                request.setAttribute("listapro", lista);
                response.sendRedirect("index.jsp");
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Productos> lista = (ArrayList<Productos>)ses.getAttribute("listapro");
        Productos objpro = new Productos();
        objpro.setId(id);
        objpro.setDescripcion(request.getParameter("descripcion"));
        objpro.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
        objpro.setPrecio(Integer.parseInt(request.getParameter("precio")));
        objpro.setCategoria(request.getParameter("categoria"));
        if(id == 0){
            //NUEVO REGISTRO
            int idNuevo = obtenerId(request);
            objpro.setId(idNuevo);
            lista.add(objpro);
        }
        else{
            //EDICION DE REGISTRO
            int pos = BuscarPorIndice(request, id);
            lista.set(pos, objpro);
        }
        request.setAttribute("listapro", lista);
        response.sendRedirect("index.jsp");
    }
    
    public int BuscarPorIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Productos> lista = (ArrayList<Productos>) ses.getAttribute("listapro");
        
        int pos = -1;
        
        if(lista != null){
            for (Productos ele : lista) {
                ++pos;
                if(ele.getId()==id){
                    break;
                }
            }
        }
        return pos;
    }
    
    public int obtenerId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Productos> lista = (ArrayList<Productos>) ses.getAttribute("listapro");
        
        //buscar el ultimo id
        int idn = 0;
        if (lista != null){
        for (Productos ele : lista) {
            idn = ele.getId();
        }
        }
        return idn + 1;
    }

}
