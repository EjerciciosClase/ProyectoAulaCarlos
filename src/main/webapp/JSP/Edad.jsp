<%-- 
    Document   : Edad
    Created on : 06-oct-2018, 10:20:13
    Author     : Carlos
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.Period" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/edad.css" media="all" />
        <title>Edad</title>
    </head>
    <body>
        <%
            String resultado = "Hola "+request.getParameter("nombre")+" tienes " ;
            LocalDate actual = LocalDate.now();
            String fecha = request.getParameter("fecha");
            String fechaArray[] = fecha.split("-");
            LocalDate fechaN = LocalDate.of(Integer.parseInt(fechaArray[0]), Integer.parseInt(fechaArray[1]), Integer.parseInt(fechaArray[2]));
            Period periodo = Period.between(fechaN, actual);
            Boolean bandera = false;
            int dias = periodo.getDays();
            int meses = periodo.getMonths();
            int años = periodo.getYears();
            
            if( dias<0 || meses<0 || años<0){
                resultado="La fecha introducida todavia no ha llegado, introduzca una fecha correcta.";
            } else{
                if(dias>0){
                resultado+=(dias==1 ?"  "+dias+" dia":"  "+dias+" dias");
                bandera=true;
                }
                if(meses>0){
                    resultado+=(bandera==true ?", ":"");
                    resultado+=(meses==1 ?"  "+meses+" mes":"  "+meses+" meses");
                    bandera=true;
                }
                if(años>0){
                    resultado+=(bandera==true ?" y ":"");
                    resultado+=(años==1 ?"  "+años+" año":"  "+años+" años");
                }
                resultado+=".";
            }         
        %>
         <h2> <%= resultado%> </h2>
         <a href="<%=request.getContextPath() %>/index.html">Volver al index</a>
    </body>
</html>
