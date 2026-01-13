<%
    session.invalidate(); // Borra toda la información de la sesión
    response.sendRedirect("../../index.html"); // Regresa al inicio
%>