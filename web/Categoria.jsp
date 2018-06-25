
<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>


<c:set var="categorias" scope="page" value="<%= servicio.getCategorias()%>"/>

<div class="container">
    <div class="row"></div>
    <h1 class="center-align">Modulo Categorias</h1>
</div>   


<div class="row">
    <div class="col s4 offset-s4 ">
        <div class="card-panel">

            <form action="control.do" method="POST">
                <label class="black-text">Nombre Categoria</label>
                <input type="text" placeholder="Ingrese Nombre de categoria" name="nombre"/>               
                
                <button name="boton" value="nuevacategoria"  class="btn right">Crear</button>
                  <button name="boton" value="nuevacategoria"  class="btn left">Modificar</button>
                <div class="col s6 offset-s4">
                <button name="boton" value="nuevacategoria"  class="btn">Eliminar</button>
                </div>
              
                <br>  <br> <br>  <br>
            </form>
            ${requestScope.msg}

            <br>
        </div>
    </div>
    <div class="row">
        <div class="col s4 offset-s4 ">
            <div class="card-panel cyan lighten-4">
                <table class="bordered centered responsive-table">
                    <thead>
                        <tr><th>ID</th>
                            <th>Nombre Categoria</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pageScope.categorias}" var="c">
                            <tr>
                                <td>${c.idCategoria}</td> 
                                <td>${c.nombreCategoria}</td>
                            </tr>
                        </c:forEach>

                    </tbody>

                </table>     
            </div>
        </div>
    </div>
</div>

<%@include file="plantilla/footer.jsp" %>

