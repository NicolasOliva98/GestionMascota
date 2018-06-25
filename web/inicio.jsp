<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>






<c:if test="${not empty sessionScope.admin}">    
    <div class="row">
        <h1 class="center-align ">Panel de Administración</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col s10 offset-s1 z-depth-4">
                <ul class="collection">
                    <li class="collection-item avatar">
                        <a href="addUsuer.jsp"><i class="material-icons circle red black-text">account_circle</i></a>
                        <span class="title"><b>Agregar Usuario</B></span>
                        <p>Modulo para Agregar nuevos usuarios<br>Como Administradores o Clientes.</p>
                        <a href="addUsuer.jsp" class="secondary-content"><i class="material-icons blue-text">grade</i></a>
                    </li>
                    <li class="collection-item avatar">
                        <a href="Producto.jsp"><i class="material-icons circle orange black-text">add</i></a>
                        <span class="title"><b>Agregar Productos</b></span>
                        <p>Modulo para Agregar productos<br>Tanto como en la base de datos como en el catalogo.</p>
                        <a href="Producto.jsp" class="secondary-content"><i class="material-icons blue-text">grade</i></a>
                    </li>
                    <li class="collection-item avatar">
                        <a href="Categoria.jsp"><i class="material-icons circle yellow black-text">category</i></a>
                        <span class="title"><b>Agregar Categoria</b></span>
                        <p>Modulo para Agregar categorias nuevas.</p>
                        <a href="Categoria.jsp" class="secondary-content"><i class="material-icons blue-text">grade</i></a>
                    </li>
                    <li class="collection-item avatar">
                        <a href="venta.jsp">   <i class="material-icons circle green black-text">view_comfy</i></a>
                        <span class="title"><b>Catalogo de Productos</b></span>
                        <p>Vea el stock de los productos.</p>
                        <a href="venta.jsp" class="secondary-content"><i class="material-icons blue-text">grade</i></a>
                    </li>
                    <li class="collection-item avatar">
                        <a href="datosAdmin.jsp">   <i class="material-icons circle blue black-text">wb_cloudy</i></a>
                        <span class="title"><b>Ver Datos</b></span>
                        <p>Muestra sus datos de sessión.</p>
                        <a href="datosAdmin.jsp" class="secondary-content"><i class="material-icons blue-text">grade</i></a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${not empty sessionScope.person}">
        <div class="row">
        <h1 class="center-align ">Panel de Usuario</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col s10 offset-s1 z-depth-4 grey darken-3">
                <ul class="collection">
                    <li class="collection-item avatar">
                        <a href="venta.jsp">   <i class="material-icons circle orange black-text">view_comfy</i></a>
                        <span class="title"><b>Catalogo de Productos</b></span>
                        <p>Vea el stock de los productos.</p>
                        <a href="venta.jsp" class="secondary-content"><i class="material-icons blue-text">grade</i></a>
                    </li>
                     <li class="collection-item avatar">
                        <a href="datoscliente.jsp">   <i class="material-icons circle green black-text">assignment</i></a>
                        <span class="title"><b>Mis Compras</b></span>
                        <p>Muestra su historial de compras.</p>
                        <a href="datoscliente.jsp" class="secondary-content"><i class="material-icons blue-text">grade</i></a>
                    </li>
                    <li class="collection-item avatar">
                        <a href="datoscliente.jsp">   <i class="material-icons circle red black-text">wb_cloudy</i></a>
                        <span class="title"><b>Ver Datos</b></span>
                        <p>Muestra sus datos de sessión.</p>
                        <a href="datoscliente.jsp" class="secondary-content"><i class="material-icons blue-text">grade</i></a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</c:if>





<%@include file="plantilla/footer.jsp" %>
