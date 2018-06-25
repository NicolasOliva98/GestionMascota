<%@include file="plantilla/header.jsp" %>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
 
<c:set var="usuarios" scope="page" value="<%= servicio.getUsuarios()%>"/>
<c:set var="perfil" scope="page" value="<%= servicio.getPerfil()%>"/>
<div class="container col s3 z-depth-3">    
    <div class="row">
        <div class="col s10  offset-s1 cyan-text accent-4-text">
            <center><h2>Regristro de Usuario </h2> </center>

                              <form action="control.do" method="POST">
                        <div class="input-field">
                            <input id="rutUser" type="text" name="rutUser" placeholder="11.111.111-1" class="black-text">
                            <label for="rutUser"></label>
                        </div>

                        <div class="input-field">
                            <input id="nombreUser" type="text" name="nombreUser" placeholder="Ingrese su Nombre" class="black-text">
                            <label for="nombreUser"></label>
                        </div>

                        <div class="input-field">
                            <input id="apellidoUser" type="text" name="apellidoUser" placeholder="Ingrese su Apellido" class="black-text">
                            <label for="apellidoUser"></label>
                        </div>

                        <div class="input-field">
                            <input id="emailUser" type="email" name="emailUser" placeholder="Ingrese su correo" class="black-text">
                            <label for="emailUser"></label>
                        </div>

                        <div class="input-field">
                            <input id="clave" type="password" name="clave" placeholder="Ingrese su contraseña" class="black-text">
                            <label for="clave"></label>
                        </div>
                        <select name="idPerfil">
                            <c:forEach items="${pageScope.perfil}" var="c">
                                <option value="${c.idPerfil}" var="c">${c.nombrePerfil}</option>
                            </c:forEach>
                        </select>


                        <button class="btn right" name="boton" value="adduser" type="submit">Registrarse</button>
                        <br><br>
                    </form>
                    ${requestScope.msg}
            <br>
            <p class="red-text"> ${requestScope.msg}</p>
        </div>
    </div>
</div>
      
   <%@include file="plantilla/footer.jsp" %>