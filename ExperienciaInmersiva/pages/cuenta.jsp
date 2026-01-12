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
                <li><a href="index.html">Inicio</a></li>
                <li><a href="lugares.jsp">Sitios Turísticos</a></li>
                <li><a href="negocios.jsp">Explora Negocios</a></li>
                <li><a href="/ExperienciaInmersiva/pages/registro_negocio.jsp">Registra tu Local</a></li>
                <li><a href="/ExperienciaInmersiva/pages/cuenta.jsp">Mi Cuenta</a></li>
            </ul>
        </nav>
    </header>

    <main class="section">
        <%
            // Simulación de ID de usuario (En un login real, este vendría de la sesión)
            int idUsuarioLogueado = 1; 
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/turismo_db", "root", "n0m3l0");
             
                PreparedStatement psUser = conexion.prepareStatement("SELECT * FROM usuario WHERE id_usuario = ?");
                psUser.setInt(1, idUsuarioLogueado);
                ResultSet rsUser = psUser.executeQuery();

                if(rsUser.next()) {
            %>
                    <section class="tarjeta" style="width: 80%; margin-bottom: 30px;">
                        <h2>Bienvenido, <span id="userName"><%= rsUser.getString("nombre") %></span></h2>
                        <p><strong>Email:</strong> <%= rsUser.getString("email") %></p>
                        <p><strong>Ciudad:</strong> <%= rsUser.getString("ciudad") %></p>
                    </section>

                    <h3>Tus Negocios Registrados</h3>
                    <div id="elemento_t">
                <%}
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
                        out.println("<p>Aún no tienes negocios registrados.</p>");
                    }
                %>
            </div>
        <%
                conexion.close();
            } catch(Exception e) {
                out.println("<p>Error al cargar el perfil: " + e.getMessage() + "</p>");
            }
        %>
    </main>

    <script>
        const nombre = document.getElementById('userName').innerText;
        localStorage.setItem('ultimoUsuario', nombre);
        console.log("Usuario guardado en localStorage para la experiencia inmersiva.");
    </script>
</body>
</html>