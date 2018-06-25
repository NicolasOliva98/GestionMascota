<%@include file="plantilla/header.jsp" %>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
 
<div class="container col s3 z-depth-3">    
    <div class="row">
        <div class="col s10  offset-s1 cyan-text accent-4-text">
            <center>
                <h2>Inicio de Sesión </h2> </center>

            <form action="control.do" method="post" >
                <label class="black-text"   >RUT</label>
                <input class="grey-text" type="text" name="rut" placeholder="11.111.111-1"> <br>

                <label class="black-text" >CONTRASEÑA</label>
                <input class="grey-text" type="password" name="clave" placeholder="&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226&#8226"> <br>                 


                <button class="btn pulse right orange darken-3" name="boton" type="submit" value="login">Aceptar</button>

                <br>
                <p class="center-align"><a href="registro.jsp">Si no tiene cuenta registrar Aquí</a>




            </form>
            <br>
            <p class="red-text"> ${requestScope.msg}</p>
        </div>
    </div>
</div>
      
   <%@include file="plantilla/footer.jsp" %>