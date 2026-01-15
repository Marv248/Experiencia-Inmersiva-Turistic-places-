<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Mi Negocio | TurismoLocal</title>
    <link rel="stylesheet" href="../styles/style.css">
    <script src="../scripts/validaciones.js" defer></script>
</head>
<body>
    <header class="title">
        <h1>Impulsa tu Negocio</h1>
        <p>Completa la información para aparecer en los mapas turísticos</p>
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

    <main class="section">
        <form action="procesar_registro_negocio.jsp" method="POST" id="formNegocio" class="tarjeta" style="min-width: 600px;">
            <h2 style="text-align: center; margin-bottom: 20px;">Datos del Establecimiento</h2>
            
            <div style="margin-bottom: 15px;">
                <label>Nombre del Negocio:</label><br>
                <input type="text" name="nombre_negocio" id="nombre_negocio" required style="width: 100%; padding: 8px; color: black;">
            </div>

            <div style="margin-bottom: 15px;">
                <label>Categoría:</label><br>
                <select name="categoria" id="categoria">
                    <option id="opcion" value="Restaurante">Restaurante</option>
                    <option id="opcion" value="Souvenirs">Recuerdos / Souvenirs</option>
                    <option id="opcion" value="Tours">Tours y Guías</option>
                    <option id="opcion" value="Hospedaje">Hospedaje</option>
                </select>
            </div>

            <div style="margin-bottom: 15px;">
                <label>Lugar Turístico Cercano:</label><br>
                <select name="id_lugar" id="id_lugar" style="width: 100%; padding: 8px; color: black;">
                <% 
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/turismo_db", "root", "n0m3l0");
                        Statement st = conexion.createStatement();
                        ResultSet rs = st.executeQuery("SELECT id_lugar, nombre FROM lugar_turistico");

                        boolean hayDatos = false;

                        while(rs.next()) {
                            hayDatos = true;
                %>
                            <option style="color: black;" value="<%= rs.getInt("id_lugar") %>"><%= rs.getString("nombre") %></option>
                <% 
                        }

                        
                        if (!hayDatos) {
                %>
                            <option value="">NO HAY SITIOS DISPONIBLES</option>
                <%
                        }
                        
                        conexion.close();
                    } catch(Exception e) { 
                %>
                        <option value="">Error al cargar lugares: <%= e.getMessage() %></option>
                <% } %>
                </select>
            </div>

            <div style="margin-bottom: 15px;">
                <label>Precio Promedio ($):</label><br>
                <input type="number" name="precio" id="precio" step="0.01" style="width: 100%; padding: 8px; color: black;">
            </div>

            <div style="margin-bottom: 15px;">
                <label>Descripción:</label><br>
                <textarea name="descripcion" class="campo" id="descripcion" rows="4"></textarea>
            </div>

            <button type="submit" class="boton">
                REGISTRAR NEGOCIO
            </button>
        </form>
    </main>
    <footer>
        Developed by <b><i>RVMA</i></b> 2026&copy
        <br>
        Contacto: <i>marcorebollo@gmail.com</i>
    </footer>

    <script src="/ExperienciaInmersiva/scripts/movimiento.js"></script> 
</body>
</html>