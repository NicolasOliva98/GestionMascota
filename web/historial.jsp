<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>

<c:set var="perfil" scope="page" value="<%= servicio.getPerfil()%>"/>


<div class="row">
    <div class="col s6 offset-s3">
        <div class="card-panel">
            <form action="control.do" method="post">
                <h3 class='center-align'>Historial de compras</h3   >

                <br><br>
                <table class="bordered">
                    <tr>
                        <td>Nombre</td>
                        <td>Precio</td>
                        <td>Unidades</td>
                        <td>Total de compra</td> 
                        <td> </td> 
                    </tr>

                    <tr>
                        <td>Collar de Cachorro</td>
                        <td>$ 2000 </td>
                        <td>2 Unidades </td>
                        <td>$ 4000</td>
                        <td><a href class="btn-floating red"><i class="material-icons">delete</i></a></td>
                    </tr> 
                    <tr>
                        <td>Cama de Gatito</td>
                        <td>$ 3000</td>
                        <td>1 Unidades </td>
                        <td>$ 3000</td>
                          <td><a href class="btn-floating red"><i class="material-icons">delete</i></a></td>
                    </tr>  
                    <tr>
                        <td>Peluche de goma</td>
                        <td>$ 1500 </td>
                        <td>2 Unidades </td>
                        <td>$ 3000</td>
                          <td><a href class="btn-floating red"><i class="material-icons">delete</i></a></td>
                    </tr>  
                    <tr>
                        <td>Collar de gatos azules</td>
                        <td>$ 2500 </td>
                        <td>3 Unidades </td>
                        <td>$ 7500</td>
                          <td><a href class="btn-floating red"><i class="material-icons">delete</i></a></td>
                    </tr>  



                </table>
                <br><br>


            </form>
        </div>
    </div>
</div>








<%@include file="plantilla/footer.jsp" %>




