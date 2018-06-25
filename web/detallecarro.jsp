<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>

<c:set var="perfil" scope="page" value="<%= servicio.getPerfil()%>"/>


    <div class="row">
        <div class="col s6 offset-s3">
            <div class="card-panel">
                <form action="control.do" method="post">
                    <h5>Detalle de Compra</h5>
                    <button class="btn-floating right pulse" type="submit" name="boton" value="compra">
                        <i class="material-icons">shopping_cart</i>
                    </button>
                    <input type="text" name="rut" placeholder="RUT CLIENTE"/>
                    <br>
                    <table class="bordered">
                        <tr>
                            <td>Nombre</td>
                            <td>Precio</td>
                            <td>Unidades</td>
                            <td></td> 
                        </tr>
                        <c:forEach items="${carro}" var="p">
                            <tr>
                                <td>${p.nombreProducto}</td>
                                <td>$ ${p.precioProducto}</td>
                                <td>
                                    <select name="unidades${p.idProducto}">
                                        <c:forEach begin="1" end="${p.unidadesProducto}" var="i">
                                            <option>${i}</option>                                    
                                        </c:forEach>                                                                    
                                    </select>
                                </td>
                                <td>
                                    <a href="control.do?boton=deletecar&idProducto=${p.idProducto}"
                                       class="btn-floating red">
                                        <i class="material-icons">delete</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                    </table>
                    <br><br>
                   ${msg} 
                   
                </form>
            </div>
        </div>
    </div>








<%@include file="plantilla/footer.jsp" %>




