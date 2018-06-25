<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>


<c:set var="usuarios" scope="page" value="<%= servicio.getUsuarios()%>"/>
<c:set var="perfil" scope="page" value="<%= servicio.getPerfil()%>"/>



<div class="row">
    <div class="col s6 offset-s3 ">
        <div class="card-panel">
            <div class="row">
                <h3><center>Agregar Usuarios</center></h3>
                <div class="col s12">

                    <form action="control.do" method="POST">
                        <div class="input-field">
                            <input id="rutUser" type="text" name="rutUser" placeholder="11.111.111-1">
                            <label for="rutUser"></label>
                        </div>

                        <div class="input-field">
                            <input id="nombreUser" type="text" name="nombreUser" placeholder="Ingrese su Nombre">
                            <label for="nombreUser"></label>
                        </div>

                        <div class="input-field">
                            <input id="apellidoUser" type="text" name="apellidoUser" placeholder="Ingrese su Apellido">
                            <label for="apellidoUser"></label>
                        </div>

                        <div class="input-field">
                            <input id="emailUser" type="email" name="emailUser" placeholder="Ingrese su correo">
                            <label for="emailUser"></label>
                        </div>

                        <div class="input-field">
                            <input id="clave" type="password" name="clave" placeholder="Ingrese su contraseña">
                            <label for="clave"></label>
                        </div>
                        <select name="idPerfil">
                            <c:forEach items="${pageScope.perfil}" var="c">
                                <option value="${c.idPerfil}" var="c">${c.nombrePerfil}</option>
                            </c:forEach>
                        </select>


                        <button class="btn right" name="boton" value="adduser" type="submit">Guardar</button>
                    </form>
                    ${requestScope.msg}

                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col s6  offset-s3 ">
        <div class="card-panel red ">     
            <table class="bordered">
                <tr>
                    <td>Rut</td>
                    <td>Nombre</td>
                    <td>Apellido</td>
                    <td>Email</td>
                    <td>Clave</td>
                    <td>Perfil</td>
                </tr>
                <c:forEach items="${pageScope.usuarios}" var="u">

                    <tr>
                        <td>${u.rutUser}</td>
                        <td>${u.nombreUser}</td>
                        <td>${u.apellidoUser}</td>
                        <td>${u.emailUser}</td>
                        <td>${u.clave}</td>
                        <td>${u.perfil.nombrePerfil}</td>
                    </tr>

                </c:forEach>

            </table>
            <!--     <button class="btn left" name="boton" value="" type="submit">Borrar</button>
                  <button class="btn right" name="boton" value="" type="submit">Modificar</button> -->

        </div>
    </div>
</div>  
<%@include file="plantilla/footer.jsp" %>