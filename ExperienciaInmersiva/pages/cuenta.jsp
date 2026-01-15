<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi Perfil | TurismoLocal</title>
    <link rel="stylesheet" href="../styles/style.css">
</head>
<body>
    <header class="title">
        <h1>Panel de Usuario</h1>
        <nav id="navegacion">
            <ul>
                <li><a href="../../index.html">Inicio</a></li>
                <li><a href="#">Sitios Turísticos</a></li>
                <li><a href="#">Explora Negocios</a></li>
                <li><a href="/ExperienciaInmersiva/pages/registro_negocio.jsp">Registra tu Local</a></li>
                <li><a href="/ExperienciaInmersiva/pages/cuenta.jsp">Mi Cuenta</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <%
            Integer idUsuarioLogueado = (Integer) session.getAttribute("id_usuario");
            
            if (idUsuarioLogueado != null) { 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/turismo_db", "root", "n0m3l0");
                
                    PreparedStatement psUser = conexion.prepareStatement("SELECT * FROM usuario WHERE id_usuario = ?");
                    psUser.setInt(1, idUsuarioLogueado);
                    ResultSet rsUser = psUser.executeQuery();

                    if(rsUser.next()) {
            %>
                        <section class="section" id="datosUsuario">
                            <h2>Bienvenido, <span id="userName"><%= rsUser.getString("nombre") %></span></h2>
                            <p><strong>Email:</strong> <%= rsUser.getString("email") %></p>
                            <p><strong>Ciudad:</strong> <%= rsUser.getString("ciudad") %></p>
                        </section>
                        <section class="tarjetas_noticias">
                            <h2>Tus Negocios Registrados</h2>
                            <div class="section"  style="margin-top: 20px; padding: 20px;">
                                <%
                                    PreparedStatement psNeg = conexion.prepareStatement(
                                        "SELECT n.*, l.nombre as lugar FROM negocio n " +
                                        "JOIN lugar_turistico l ON n.id_lugar = l.id_lugar " +
                                        "WHERE n.id_usuario = ?");
                                    psNeg.setInt(1, idUsuarioLogueado);
                                    ResultSet rsNeg = psNeg.executeQuery();

                                    boolean tieneNegocios = false;
                                    while(rsNeg.next()) {
                                        tieneNegocios = true;
                                %>
                                        <div class="tarjeta">
                                            <div class="texto">
                                                <h2><%= rsNeg.getString("nombre_negocio") %></h2>
                                                <p><strong>Ubicación:</strong> Cerca de <%= rsNeg.getString("lugar") %></p>
                                                <p><strong>Categoría:</strong> <%= rsNeg.getString("categoria") %></p>
                                                <p><strong>Precio prom:</strong> $<%= rsNeg.getDouble("precio_promedio") %></p>
                                            </div>
                                        </div>
                                <% 
                                    } 
                                    if(!tieneNegocios) {
                                        out.println("<h4>Aún no tienes negocios registrados.</h4>");
                                    }
                                %>
                            </div>
                        </section>
                        <button class="botonPeligro" onclick="window.location.href='logout.jsp'">Cerrar Sesión</button>
            <%
                    }
                    conexion.close();
                } catch(Exception e) {
                    out.println("<p>Error al cargar el perfil: " + e.getMessage() + "</p>");
                }
            } else { 
        %>
                <section class="formulario">
                    <div class="tarjetaForm">
                        <h2>Iniciar Sesión</h2>
                        <form action="procesar_login.jsp" method="POST">
                            <label>Email:</label>
                            <input type="email" name="email" required class="campoForm">
                            <label>Contraseña:</label>
                            <input type="password" name="pass" required class="campoForm">
                            <button type="submit" class="boton">Entrar</button>
                        </form>
                        <hr>
                        <p>¿No tienes cuenta? <a href="registro_user.jsp">Regístrate aquí</a></p>
                    </div>
                </section>
        <% } %>
    </main>
    <footer>
        Developed by <b><i>RVMA</i></b> 2026&copy
        <br>
        Contacto: <i>marcorebollo@gmail.com</i>
    </footer>
</body>
</html>