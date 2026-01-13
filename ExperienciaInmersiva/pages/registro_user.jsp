<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario | TurismoLocal</title>
    <link rel="stylesheet" href="../styles/style.css">
</head>
<body>
    <header class="title">
        <h1>Crea tu propia cuenta</h1>
        <p>Completa la información para que tus negocios aparezcan en los mapas turísticos</p>
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
        <section class="formulario">
            <div class="tarjetaForm">
                <h2>Crear Nueva Cuenta</h2>
                <form action="procesar_registro_usuario.jsp" method="POST">
                    <label>Nombre Completo:</label>
                    <input type="text" name="nombre" required class="campoForm">
                    <label>Email:</label>
                    <input type="email" name="email" required class="campoForm">
                    <label>Ciudad:</label>
                    <input type="text" name="ciudad" class="campoForm">
                    <label>Contraseña:</label>
                    <input type="password" name="pass" required class="campoForm">
                    <button type="submit" class="boton">Registrarme</button>
                </form>
                <p><a href="cuenta.jsp">Volver al login</a></p>
            </div>
        </section>
    </main>
    <footer>
        Developed by <b><i>RVMA</i></b> 2026&copy
        <br>
        Contacto: <i>marcorebollo@gmail.com</i>
    </footer>
</body>
</html>