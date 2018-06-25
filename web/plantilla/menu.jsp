<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
    <div class="nav-wrapper cyan accent-4">
       
            <c:if test="${not empty sessionScope.admin}">
                <a href="inicio.jsp" class="brand-logo">Bienvenido ${sessionScope.admin.nombreUser}</a>

            </c:if>

            <c:if test="${not empty sessionScope.person}">
                <a href="inicio.jsp" class="brand-logo"> Bienvenido ${sessionScope.person.nombreUser}</a>

                <!-- accedemos al atributo del nombre en la base de datos -->

            </c:if>
       
        <ul id="nav-mobile" class="right hide-on-med-and-down">

            <c:if test="${not empty sessionScope.admin}">
                <li><a href="datosAdmin.jsp">Mis Datos</a></li>
                <li> <a href="Categoria.jsp">Modulo Categoria</a></li>
                <li><a href="addUsuer.jsp">Modulo Usuario</a></li>
                <li> <a href="Producto.jsp">Modulo Producto</a></li>
                <li> <a href="venta.jsp">Catalogo de Productos</a></li>
                    <c:if test="${carro.size()> 0}">
                    <li><a href="detallecarro.jsp">Carrito(${carro.size()})</a></li>
                    </c:if>

                <li> <a href="Salir.jsp">Cerrar Sesión</a></li>

            </c:if>

            <c:if test="${not empty sessionScope.person}">
                <li><a href="datoscliente.jsp">Mis Datos</a></li>
                <li> <a href="venta.jsp">Catalogo de Productos</a></li>
                <li> <a href="venta.jsp">Mis Compras</a></li>
                    <c:if test="${carro.size()> 0}">
                    <li><a href="detallecarro.jsp">Carrito(${carro.size()})</a></li>
                    </c:if>
                <li> <a href="Salir.jsp">Cerrar Sesión</a></li>

            </c:if>



        </ul>
    </div>
</nav>