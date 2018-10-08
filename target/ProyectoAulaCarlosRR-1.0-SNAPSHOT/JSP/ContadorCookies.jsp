<%-- 
    Document   : ContadorCookies
    Created on : 05-oct-2018, 21:13:37
    Author     : Carlos
--%>

<%@  page  language="java"  contentType="text/html;  charset=UTF-8" pageEncoding="UTF-8"  %>
<%@page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="formulario" action="ContadorCookies.jsp" method="post">
            <%
                Cookie[] todas = request.getCookies();
                Boolean bandera = true;
                if(request.getParameter("borrar")!=null){
                 for (int i = 0; i < todas.length; i++) {
                        if (todas[i].getName().equals("Contador")) {
                            Cookie mia = todas[i];
                            mia.setValue("");
                            mia.setPath("/");
                            mia.setMaxAge(0);
                            response.addCookie(mia);
                        }
                }
                }
                if (todas != null) {
                    for (int i = 0; i < todas.length; i++) {
                        if (todas[i].getName().equals("Contador")) {
                            Cookie mia = todas[i];
                            bandera = false;
                            int suma = Integer.parseInt(mia.getValue()) + 1;
                            mia.setValue(Integer.toString(suma));
                            response.addCookie(mia);
            %><h1>Has visitado la pagina <%= mia.getValue()%> veces.</h1><%
            %> <input   name = "enviar" type = "submit" value = "Enviar" />
            <input name = "borrar" type = "submit" value = "Borrar informacion">
            <h3><a href="<%=request.getContextPath()%>/index.html">Volver al index</a></h3><%
                            break;
                        }
                    }
                }
                if (bandera) {
                    Cookie mia = new Cookie("Contador", "1");
                    mia.setMaxAge(-1);
                    mia.setSecure(false);
                    mia.setVersion(0);
                    response.addCookie(mia);

                    String nombre = mia.getName();

            %>
            <h1>Has visitado la pagina <%= mia.getValue()%> vez</h1>
            <h3>Informacion de la cookie</h3>
            <h4>Caducidad:<%= mia.getMaxAge()%>, hasta que se cierre el navegador. </h4>
            <h4>Nombre:<%= nombre%></h4>
            <h4>Segura:<%= mia.getSecure()%> </h4>
            <h4>Version:<%= mia.getVersion()%> </h4>   
            <input  name="enviar" type="submit" value="Enviar" />
            <input name="borrar" type="submit" value="Borrar informacion">
        </form>
        <h4><a href="<%=request.getContextPath()%>/index.html">Volver al index</a></h4>
        <%
            }
        %>
    </body>
</html>
