<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("pass");

    Connection conexion = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Conexión a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/turismo_db", "root", "n0m3l0");

        String sql = "SELECT id_usuario, nombre FROM usuario WHERE email = ? AND password = ?";
        ps = conexion.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);

        rs = ps.executeQuery();

        if (rs.next()) {
            // Guardar datos en la SESIÓN del servidor
            session.setAttribute("id_usuario", rs.getInt("id_usuario"));
            session.setAttribute("nombre_usuario", rs.getString("nombre"));
            
            response.sendRedirect("cuenta.jsp");
        } else {
            // LOGIN FALLIDO
            response.sendRedirect("cuenta.jsp?error=1");
        }

    } catch (Exception e) {
        out.println("Error en el servidor: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conexion != null) conexion.close();
    }
%>