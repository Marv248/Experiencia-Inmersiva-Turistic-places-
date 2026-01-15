<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Datos de la sesión de Java (LOGIN)
    Integer id_usuario = (Integer) session.getAttribute("id_usuario");

    // Si no hay sesión dirigir al LOGIN
    if (id_usuario == null) {
        response.sendRedirect("cuenta.jsp");
        return; 
    }

    // Formulario
    String nombre_negocio = request.getParameter("nombre_negocio");
    String categoria = request.getParameter("categoria");
    String id_lugar_str = request.getParameter("id_lugar");
    String precio_str = request.getParameter("precio");
    String descripcion = request.getParameter("descripcion");

    Connection conexion = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/turismo_db", "root", "n0m3l0");

        String sql = "INSERT INTO negocio (id_usuario, id_lugar, nombre_negocio, categoria, precio_promedio, descripcion) VALUES (?, ?, ?, ?, ?, ?)";
        
        ps = conexion.prepareStatement(sql);
        ps.setInt(1, id_usuario);
        ps.setInt(2, Integer.parseInt(id_lugar_str));
        ps.setString(3, nombre_negocio);
        ps.setString(4, categoria);
        ps.setDouble(5, Double.parseDouble(precio_str));
        ps.setString(6, descripcion);

        int filasInsertadas = ps.executeUpdate();

        if(filasInsertadas > 0){
            response.sendRedirect("../../index.html");
        }

    } catch (Exception e) {
        out.println("Error en el servidor: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (conexion != null) conexion.close();
    }
%>