/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controller;

import cl.beans.ServicioBeanLocal;
import cl.beans.TransactionException;
import cl.entities.Categoria;
import cl.entities.Perfil;
import cl.entities.Producto;
import cl.entities.Usuario;
import cl.util.Hash;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author clrubilarc
 */
@WebServlet(name = "Controlador", urlPatterns = {"/control.do"})
public class Controlador extends HttpServlet {

    @EJB
    private ServicioBeanLocal servicio;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String boton = request.getParameter("boton");
        switch (boton) {
            case "login":
                login(request, response);
                break;
            case "nuevacategoria":
                nuevaCategoria(request, response);
                break;
            case "nuevoproducto":
                nuevoProducto(request, response);
                break;
            case "editardatos":
                editarDatos(request, response);
                break;
            case "adduser":
                adduser(request, response);
                break;
            case "addcar":
                addcar(request, response);
                break;
            case "deletecar":
                deletecar(request, response);
                break;
            case "compra":
                compra(request, response);
                break;
            //  case "addcarro":
            //     addCarro(request, response);
            //    break;

        }
    }

    private void compra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rut = request.getParameter("rut");
        Usuario user = servicio.buscarUsuario(rut);

        if (user != null && user.getPerfil().getNombrePerfil().equals("cliente") ) {
            ArrayList<Producto> carro = (ArrayList) request.getSession().getAttribute("carro");

            ArrayList<String> data = new ArrayList<>();
            for (Producto p : carro) {
                String unidad = request.getParameter("unidadesProducto" + p.getIdProducto());
                data.add(p.getIdProducto() + "," + unidad);
            }

            try {
                servicio.compra(rut, data);
                request.setAttribute("msg", "Compra Registrada con Exito");
                //limpiar el carrito
                
                request.getRequestDispatcher("detallecarro.jsp").forward(request, response);
            } catch (TransactionException ex) {
                request.setAttribute("msg", "Hubo un error en la compra");
                //actualizar carrito con la info de la base de datos
                
                request.getRequestDispatcher("detallecarro.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("msg", "usuario no encontrado");
            request.getRequestDispatcher("detallecarro.jsp").forward(request, response);
        }
    }

    private void deletecar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idProducto = request.getParameter("idProducto");
        Producto p = servicio.buscarProducto(Integer.parseInt(idProducto));
        ArrayList<Producto> carro = (ArrayList) request.getSession().getAttribute("carro");

        carro.remove(p);
        request.getSession().setAttribute("carro", carro);
        response.sendRedirect("detallecarro.jsp");

    }

    private void addcar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idProducto = request.getParameter("idProducto");
        Producto p = servicio.buscarProducto(Integer.parseInt(idProducto));
        ArrayList<Producto> carro = (ArrayList) request.getSession().getAttribute("carro");
        if (carro == null) {
            carro = new ArrayList<>();
        }
        if (!carro.contains(p)) {
            carro.add(p);
            request.getSession().setAttribute("carro", carro);
        }
        response.sendRedirect("venta.jsp");
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rut = request.getParameter("rut");
        String clave = request.getParameter("clave");
        Usuario user = servicio.iniciarSesion(rut, Hash.md5(clave));

        if (user != null) {
            if (user.getPerfil().getNombrePerfil().equals("administrador")) {
                request.getSession().setAttribute("admin", user);

            } else {
                request.getSession().setAttribute("person", user);
            }

            response.sendRedirect("inicio.jsp");
        } else {
            request.setAttribute("msg", "usuario no encontrado");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    protected void nuevoProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String s_precio = request.getParameter("precio");
        String s_unidad = request.getParameter("unidad");
        String descripcion = request.getParameter("descripcion");
        String s_id = request.getParameter("idcategoria");

        String errores = "";
        int precio = 0, unidad = 0, id = 0;

        if (nombre.isEmpty()) {
            errores = errores.concat("falta nombre<br>");
        }
        if (descripcion.isEmpty()) {
            errores = errores.concat("falta descripcion<br>");
        }
        try {
            precio = Integer.parseInt(s_precio);
            unidad = Integer.parseInt(s_unidad);
        } catch (Exception e) {
            errores = errores.concat("falta unidad<br>");
        }
        if (errores.isEmpty()) {
            id = Integer.parseInt(s_id);
            Categoria cat = servicio.buscarCategoria(id);
            Producto nuevo = new Producto();
            nuevo.setNombreProducto(nombre);
            nuevo.setPrecioProducto(precio);
            nuevo.setUnidadesProducto(unidad);
            nuevo.setDescripcionProducto(descripcion);
            nuevo.setCategoria(cat);
            servicio.guardar(nuevo);

            cat.getProductoList().add(nuevo);
            servicio.sincronizar(cat);
            request.setAttribute("msg", "Producto creado con exito");
        } else {
            request.setAttribute("msg", errores);
        }
        request.getRequestDispatcher("Producto.jsp").forward(request, response);

    }

    private void nuevaCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        if (nombre.isEmpty()) {
            request.setAttribute("msg", "completa el nombre");
        } else {
            Categoria nueva = new Categoria();
            nueva.setNombreCategoria(nombre);
            servicio.guardar(nueva);
            request.setAttribute("msg", "Categoria creada con exito");
        }
        request.getRequestDispatcher("Categoria.jsp").forward(request, response);

    }

    private void editarDatos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rut = request.getParameter("rut");
        String clave = request.getParameter("clave");
        String correo = request.getParameter("correo");

        //validar datos
        Usuario user = new Usuario();
        user = servicio.buscarUsuario(rut);
        user.setClave(Hash.md5(clave));
        user.setEmailUser(correo);

        servicio.sincronizar(user);
        request.getSession().setAttribute("admin", user);

    }

    private void adduser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rutUser = request.getParameter("rutUser");
        String nombreUser = request.getParameter("nombreUser");
        String apellidoUser = request.getParameter("apellidoUser");
        String emailUser = request.getParameter("emailUser");
        String clave = request.getParameter("clave");
        String idPerfil = request.getParameter("idPerfil");

        int id = 0;
        if (servicio.buscarUsuario(rutUser) == null) {
            id = Integer.parseInt(idPerfil);
            Perfil per = servicio.buscarPerfil(id);
            Usuario newuser = new Usuario();
            newuser.setRutUser(rutUser);
            newuser.setNombreUser(nombreUser);
            newuser.setApellidoUser(apellidoUser);
            newuser.setEmailUser(emailUser);
            newuser.setClave(Hash.md5(clave));
            newuser.setPerfil(per);
            servicio.guardar(newuser);

            per.getUsuarioList().add(newuser);
            servicio.sincronizar(per);
            response.sendRedirect("addUsuer.jsp");
        } else {
            request.setAttribute("msg", "Usuario ya está registrado");
            request.getRequestDispatcher("addUsuer.jsp").forward(request, response);

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
