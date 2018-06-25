<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>



<c:set var="categorias" scope="page" value="<%= servicio.getCategorias()%>"/>
<c:set var="productos" scope="page" value="<%= servicio.getProductos()%>"/>
    <%@taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="xx" uri="/WEB-INF/tlds/tagImg.tld" %>

    <div class="row">
        <c:forEach items="${pageScope.productos}" var="p">
            <c:if test="${p.unidadesProducto >= 1}">
                <div class="col s3">
                    <div class="card-panel z-depth-3">

                        <form action="control.do" method="post">
                            <input type="hidden" name="idProducto" value="${p.idProducto}"/> 
                      <div class="card-image">
                          <center>
                            <xx:TagImg arreglo="${p.fotoProducto}" entero="300"/> 
                            <span class="card-title"><b>${p.nombreProducto}</b></span> </center>
                     </div>
                         <center>
                            <h4>$ ${p.precioProducto}</h4>
                              <h5>${p.categoria.nombreCategoria}</h5>
                              </center>
                            <button class="btn-floating right blue " type="submit" name="boton" value="addcar">
                        <i class="material-icons">add</i>
                            </button><br><br>
                        </form>
                    </div>
                </div>
            </c:if>

        </c:forEach>

    </div>






<%@include file="plantilla/footer.jsp" %>