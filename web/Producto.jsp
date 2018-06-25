
<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>


   <c:set var="categorias" scope="page" value="<%= servicio.getCategorias() %>"/>
    <c:set var="productos" scope="page" value="<%= servicio.getProductos() %>"/>
    <%@taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="xx" uri="/WEB-INF/tlds/tagImg.tld" %>
    
   <div class="container">
       <div class="row">
             <h1 class="center-align">Gestión de Productos</h1>
       </div>
     
   </div>     
 <div class="row">
     <div class="col s6  offset-s3 ">
         <div class="card-panel">
             
             <form action="control.do" method="POST">
                 <label> Nombre </label>
                 <input type="text" name="nombre"/>
                 
                 <label> Precio</label>
                 <input type="text" name="precio"/>
                 
                 <label> Unidad</label>
                 <input type="text" name="unidad"/>
                 
                 <label> Descripcion</label>
                 <textarea name="descripcion" class="materialize-textarea"></textarea>
                 
                 <select name="idcategoria">
                     <c:forEach items="${pageScope.categorias}" var="c">
                          <option value="${c.idCategoria}" var="c">${c.nombreCategoria}</option>
                     </c:forEach>
                 </select>
                 
                 <button name="boton" value="nuevoproducto" class="btn">Crear</button>
                 <br>

             </form>
                   
             ${requestScope.msg}
             <hr>
         </div>

     </div>
   <div class="row">
     <div class="col s6  offset-s3 ">
             <div class="card-panel cyan lighten-1"> 
                  <table class="bordered">
                 <thead>
                     <tr ><th>ID</th>
                         <th>Nombre</th>
                         <th>Unidad</th>
                         <th>Precio</th>
                         <th>Categoria</th>
                         <th>Foto</th>
                     
                     </tr>
                     
                 </thead>
                 <tbody >
                     <c:forEach items="${pageScope.productos}" var="p">
                         <tr>
                             <td>${p.idProducto}</td> 
                             <td>${p.nombreProducto}</td>
                             <td>${p.unidadesProducto}</td>
                             <td>$ ${p.precioProducto}</td>
                             <td>${p.categoria.nombreCategoria}</td>
                             <td> <xx:TagImg arreglo="${p.fotoProducto}" entero="50"/> 
                             
                             </td>
                         </tr>
                     </c:forEach>
                 </tbody>
             </table> 
             </div>
     </div>
   </div>
 </div>
      
   <%@include file="plantilla/footer.jsp" %>
