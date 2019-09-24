<%@include file="head.jspf" %>
<style>
    @keyframes swing {
        0% {
            transform: rotate(0deg);
        }
        10% {
            transform: rotate(10deg);
        }
        30% {
            transform: rotate(0deg);
        }
        40% {
            transform: rotate(-10deg);
        }
        50% {
            transform: rotate(0deg);
        }
        60% {
            transform: rotate(5deg);
        }
        70% {
            transform: rotate(0deg);
        }
        80% {
            transform: rotate(-5deg);
        }
        100% {
            transform: rotate(0deg);
        }
    }

    @keyframes sonar {
        0% {
            transform: scale(0.9);
            opacity: 1;
        }
        100% {
            transform: scale(2);
            opacity: 0;
        }
    }
    body {
        font-size: 0.9rem;
    }
    .page-wrapper .sidebar-wrapper,
    .sidebar-wrapper .sidebar-brand > a,
    .sidebar-wrapper .sidebar-dropdown > a:after,
    .sidebar-wrapper .sidebar-menu .sidebar-dropdown .sidebar-submenu li a:before,
    .sidebar-wrapper ul li a i,
    .page-wrapper .page-content,
    .sidebar-wrapper .sidebar-search input.search-menu,
    .sidebar-wrapper .sidebar-search .input-group-text,
    .sidebar-wrapper .sidebar-menu ul li a,
    #show-sidebar,
    #close-sidebar {
        -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }

    /*----------------page-wrapper----------------*/

    .page-wrapper {
        height: 100vh;
    }

    .page-wrapper .theme {
        width: 40px;
        height: 40px;
        display: inline-block;
        border-radius: 4px;
        margin: 2px;
    }

    .page-wrapper .theme.chiller-theme {
        background: #1e2229;
    }

    /*----------------toggeled sidebar----------------*/

    .page-wrapper.toggled .sidebar-wrapper {
        left: 0px;
    }

    @media screen and (min-width: 768px) {
        .page-wrapper.toggled .page-content {
            padding-left: 300px;
        }
    }
    /*----------------show sidebar button----------------*/
    #show-sidebar {
        position: fixed;
        left: 0;
        top: 10px;
        border-radius: 0 4px 4px 0px;
        width: 35px;
        transition-delay: 0.3s;
    }
    .page-wrapper.toggled #show-sidebar {
        left: -40px;
    }
    /*----------------sidebar-wrapper----------------*/

    .sidebar-wrapper {
        width: 260px;
        height: 100%;
        max-height: 100%;
        position: fixed;
        top: 0;
        left: -300px;
        z-index: 999;
    }

    .sidebar-wrapper ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }

    .sidebar-wrapper a {
        text-decoration: none;
    }

    /*----------------sidebar-content----------------*/

    .sidebar-content {
        max-height: calc(100% - 30px);
        height: calc(100% - 30px);
        overflow-y: auto;
        position: relative;
    }

    .sidebar-content.desktop {
        overflow-y: hidden;
    }

    /*--------------------sidebar-brand----------------------*/

    .sidebar-wrapper .sidebar-brand {
        padding: 10px 20px;
        display: flex;
        align-items: center;
    }

    .sidebar-wrapper .sidebar-brand > a {
        text-transform: uppercase;
        font-weight: bold;
        flex-grow: 1;
    }

    .sidebar-wrapper .sidebar-brand #close-sidebar {
        cursor: pointer;
        font-size: 20px;
    }
    /*--------------------sidebar-header----------------------*/

    .sidebar-wrapper .sidebar-header {
        padding: 20px;
        overflow: hidden;
    }

    .sidebar-wrapper .sidebar-header .user-pic {
        float: left;
        width: 60px;
        padding: 2px;
        border-radius: 12px;
        margin-right: 15px;
        overflow: hidden;
    }

    .sidebar-wrapper .sidebar-header .user-pic img {
        object-fit: cover;
        height: 100%;
        width: 100%;
    }

    .sidebar-wrapper .sidebar-header .user-info {
        float: left;
    }

    .sidebar-wrapper .sidebar-header .user-info > span {
        display: block;
    }

    .sidebar-wrapper .sidebar-header .user-info .user-role {
        font-size: 12px;
    }

    .sidebar-wrapper .sidebar-header .user-info .user-status {
        font-size: 11px;
        margin-top: 4px;
    }

    .sidebar-wrapper .sidebar-header .user-info .user-status i {
        font-size: 8px;
        margin-right: 4px;
        color: #5cb85c;
    }

    /*-----------------------sidebar-search------------------------*/

    .sidebar-wrapper .sidebar-search > div {
        padding: 10px 20px;
    }

    /*----------------------sidebar-menu-------------------------*/

    .sidebar-wrapper .sidebar-menu {
        padding-bottom: 10px;
    }

    .sidebar-wrapper .sidebar-menu .header-menu span {
        font-weight: bold;
        font-size: 14px;
        padding: 15px 20px 5px 20px;
        display: inline-block;
    }

    .sidebar-wrapper .sidebar-menu ul li a {
        display: inline-block;
        width: 100%;
        text-decoration: none;
        position: relative;
        padding: 8px 30px 8px 20px;
    }

    .sidebar-wrapper .sidebar-menu ul li a i {
        margin-right: 10px;
        font-size: 12px;
        width: 30px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        border-radius: 4px;
    }

    .sidebar-wrapper .sidebar-menu ul li a:hover > i::before {
        display: inline-block;
        animation: swing ease-in-out 0.5s 1 alternate;
    }

    .sidebar-wrapper .sidebar-menu .sidebar-dropdown > a:after {
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        content: "\f105";
        font-style: normal;
        display: inline-block;
        font-style: normal;
        font-variant: normal;
        text-rendering: auto;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        background: 0 0;
        position: absolute;
        right: 15px;
        top: 14px;
    }

    .sidebar-wrapper .sidebar-menu .sidebar-dropdown .sidebar-submenu ul {
        padding: 5px 0;
    }

    .sidebar-wrapper .sidebar-menu .sidebar-dropdown .sidebar-submenu li {
        padding-left: 25px;
        font-size: 13px;
    }

    .sidebar-wrapper .sidebar-menu .sidebar-dropdown .sidebar-submenu li a:before {
        content: "\f111";
        font-family: "Font Awesome 5 Free";
        font-weight: 400;
        font-style: normal;
        display: inline-block;
        text-align: center;
        text-decoration: none;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        margin-right: 10px;
        font-size: 8px;
    }

    .sidebar-wrapper .sidebar-menu ul li a span.label,
    .sidebar-wrapper .sidebar-menu ul li a span.badge {
        float: right;
        margin-top: 8px;
        margin-left: 5px;
    }

    .sidebar-wrapper .sidebar-menu .sidebar-dropdown .sidebar-submenu li a .badge,
    .sidebar-wrapper .sidebar-menu .sidebar-dropdown .sidebar-submenu li a .label {
        float: right;
        margin-top: 0px;
    }

    .sidebar-wrapper .sidebar-menu .sidebar-submenu {
        display: none;
    }

    .sidebar-wrapper .sidebar-menu .sidebar-dropdown.active > a:after {
        transform: rotate(90deg);
        right: 17px;
    }

    /*--------------------------side-footer------------------------------*/

    .sidebar-footer {
        position: absolute;
        width: 100%;
        bottom: 0;
        display: flex;
    }

    .sidebar-footer > a {
        flex-grow: 1;
        text-align: center;
        height: 30px;
        line-height: 30px;
        position: relative;
    }

    .sidebar-footer > a .notification {
        position: absolute;
        top: 0;
    }

    .badge-sonar {
        display: inline-block;
        background: #980303;
        border-radius: 50%;
        height: 8px;
        width: 8px;
        position: absolute;
        top: 0;
    }

    .badge-sonar:after {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        border: 2px solid #980303;
        opacity: 0;
        border-radius: 50%;
        width: 100%;
        height: 100%;
        animation: sonar 1.5s infinite;
    }

    /*--------------------------page-content-----------------------------*/

    .page-wrapper .page-content {
        display: inline-block;
        width: 100%;
        padding-left: 0px;
        padding-top: 20px;
    }

    .page-wrapper .page-content > div {
        padding: 20px 40px;
    }

    .page-wrapper .page-content {
        overflow-x: hidden;
    }

    /*------scroll bar---------------------*/

    ::-webkit-scrollbar {
        width: 5px;
        height: 7px;
    }
    ::-webkit-scrollbar-button {
        width: 0px;
        height: 0px;
    }
    ::-webkit-scrollbar-thumb {
        background: #525965;
        border: 0px none #ffffff;
        border-radius: 0px;
    }
    ::-webkit-scrollbar-thumb:hover {
        background: #525965;
    }
    ::-webkit-scrollbar-thumb:active {
        background: #525965;
    }
    ::-webkit-scrollbar-track {
        background: transparent;
        border: 0px none #ffffff;
        border-radius: 50px;
    }
    ::-webkit-scrollbar-track:hover {
        background: transparent;
    }
    ::-webkit-scrollbar-track:active {
        background: transparent;
    }
    ::-webkit-scrollbar-corner {
        background: transparent;
    }


    /*-----------------------------chiller-theme-------------------------------------------------*/

    .chiller-theme .sidebar-wrapper {
        background: #31353D;
    }

    .chiller-theme .sidebar-wrapper .sidebar-header,
    .chiller-theme .sidebar-wrapper .sidebar-search,
    .chiller-theme .sidebar-wrapper .sidebar-menu {
        border-top: 1px solid #3a3f48;
    }

    .chiller-theme .sidebar-wrapper .sidebar-search input.search-menu,
    .chiller-theme .sidebar-wrapper .sidebar-search .input-group-text {
        border-color: transparent;
        box-shadow: none;
    }

    .chiller-theme .sidebar-wrapper .sidebar-header .user-info .user-role,
    .chiller-theme .sidebar-wrapper .sidebar-header .user-info .user-status,
    .chiller-theme .sidebar-wrapper .sidebar-search input.search-menu,
    .chiller-theme .sidebar-wrapper .sidebar-search .input-group-text,
    .chiller-theme .sidebar-wrapper .sidebar-brand>a,
    .chiller-theme .sidebar-wrapper .sidebar-menu ul li a,
    .chiller-theme .sidebar-footer>a {
        color: #818896;
    }

    .chiller-theme .sidebar-wrapper .sidebar-menu ul li:hover>a,
    .chiller-theme .sidebar-wrapper .sidebar-menu .sidebar-dropdown.active>a,
    .chiller-theme .sidebar-wrapper .sidebar-header .user-info,
    .chiller-theme .sidebar-wrapper .sidebar-brand>a:hover,
    .chiller-theme .sidebar-footer>a:hover i {
        color: #b8bfce;
    }

    .page-wrapper.chiller-theme.toggled #close-sidebar {
        color: #bdbdbd;
    }

    .page-wrapper.chiller-theme.toggled #close-sidebar:hover {
        color: #ffffff;
    }

    .chiller-theme .sidebar-wrapper ul li:hover a i,
    .chiller-theme .sidebar-wrapper .sidebar-dropdown .sidebar-submenu li a:hover:before,
    .chiller-theme .sidebar-wrapper .sidebar-search input.search-menu:focus+span,
    .chiller-theme .sidebar-wrapper .sidebar-menu .sidebar-dropdown.active a i {
        color: #16c7ff;
        text-shadow:0px 0px 10px rgba(22, 199, 255, 0.5);
    }

    .chiller-theme .sidebar-wrapper .sidebar-menu ul li a i,
    .chiller-theme .sidebar-wrapper .sidebar-menu .sidebar-dropdown div,
    .chiller-theme .sidebar-wrapper .sidebar-search input.search-menu,
    .chiller-theme .sidebar-wrapper .sidebar-search .input-group-text {
        background: #3a3f48;
    }

    .chiller-theme .sidebar-wrapper .sidebar-menu .header-menu span {
        color: #6c7b88;
    }

    .chiller-theme .sidebar-footer {
        background: #3a3f48;
        box-shadow: 0px -1px 5px #282c33;
        border-top: 1px solid #464a52;
    }

    .chiller-theme .sidebar-footer>a:first-child {
        border-left: none;
    }

    .chiller-theme .sidebar-footer>a:last-child {
        border-right: none;
    }

</style>
</head>
<body ng-app="myFamily" ng-controller="apoderadoCtrl">
    <div class="page-wrapper chiller-theme toggled">
        <%@include file="pfa_navBarPadre.jsp"%>
        <!-- sidebar-wrapper  -->
        <main class="page-content">
            <div class="container-fluid">

                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="prematricula-alumno" role="tabpanel" aria-labelledby="pill_prematricula_alumno">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 style="font-family: Lobster;font-size: 40px; font-style: normal;font-variant: normal;font-weight: 500;
                                    line-height: 15.4px; margin-top: 10px; margin-bottom: 30px;">PRE-MATRICULA 2018 - beta</h1>
                                <p>A continuacion, seleccione aquel alumno responsable suyo que desee matricular por esta modalidad: </p>     
                                <table  id="tabel" class="table table-bordered table table-condensed table table-hover"> 
                                    <thead>
                                        <tr>
                                            <th style="text-align:center;" >Nro. Documento</th>
                                            <th style="text-align:center;" >Nombre completo</th>
                                            <th style="text-align:center;" >Apellido Paterno</th>
                                            <th style="text-align:center;" >Apellido Materno</th>
                                            <th style="text-align:center;" >Estado actual</th>
                                            <th style="text-align:center;" >Pre-Matricular</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr  id="consulta" ng-repeat="listaHijo in listaHijosPorMatricular">
                                            <td>{{listaHijo.numero_documento}}</td>
                                            <td>{{listaHijo.nombre}}</td>
                                            <td>{{listaHijo.apellido_paterno}}</td>
                                            <td>{{listaHijo.apellido_materno}}</td>
                                            <td>{{listaHijo.nombre_estado_matricula}}</td>
                                            <td align="center">
                                                <button type="submit" id="btnSubmit" class="btn btn-danger" ng-value="{{listaHijo.codigo_alumno}}" data-toggle="modal" 
                                                        data-target=".modalFormPrematricula">Matricular <span class="glyphicon glyphicon-education"></span></button>  
                                            </td>
                                        </tr>      
                                    </tbody>
                                </table>
                                <hr>
                                <h2>DEMOSTRACION: </h2>

                                <!--Modal: Login / Register Form-->
                                <div class="modal fade modalFormPrematricula" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="position: fixed;  top: -13%;">
                                    <div class="modal-dialog cascading-modal modal-lg" role="document">
                                        <div class="modal-content">
                                            <div style="background-color: #eeeeee;border-color: #4c4f53; border-style: solid;">
                                                <!--Modal cascading tabs-->
                                                <div class="modal-c-tabs">
                                                    <!-- Nav tabs -->
                                                    <ul class="nav nav-tabs tabs-2 white" role="tablist" style="padding: 11px;">
                                                        <li class="nav-item">
                                                            <a id="hyperlinkLogin" class="nav-link active" data-toggle="tab" href="#panel7" role="tab"
                                                               style="color: #2E2E2E;">Primer Form</a>
                                                        </li>
                                                    </ul>
                                                    <!-- Tab panels -->
                                                    <div class="tab-content">
                                                        <!--LOGIN   -->
                                                        <div class="tab-pane fade in show active" id="panel7" role="tabpanel">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-lg-1">&nbsp;</div>
                                                                    <div class="col-lg-10">
                                                                        <!--Body-->
                                                                        <div class="modal-body mb-1">
                                                                            <hr>
                                                                            <!--PRIMERA RONDA-->
                                                                            <div class="row">
                                                                                <div class="col-lg-4">
                                                                                    <form name="formNombre" ng-submit="formNombre.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' formNombre.nombre.$invalid }">
                                                                                            <label for="forLbName">Nombre Completo</label>
                                                                                            <input type="text" name="nombre" id="forLbName" ng-model="nombre" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formNombre.nombre.$pristine && formNombre.nombre.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    <form name="formApellidoPaterno" ng-submit="formApellidoPaterno.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : formApellidoPaterno.apellido_paterno.$invalid }">
                                                                                            <label for="forLbPassword">Apellido Paterno</label>
                                                                                            <input type="text" name="apellido_paterno" id="forLbPassword" ng-model="apellido_paterno" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formApellidoPaterno.apellido_paterno.$pristine && formApellidoPaterno.apellido_paterno.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    <form name="formApellidoMaterno" ng-submit="formApellidoMaterno.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : formApellidoMaterno.apellido_materno.$invalid }">
                                                                                            <label for="forLbPassword">Apellido Materno</label>
                                                                                            <input type="text" name="apellido_materno" id="forLbPassword" ng-model="apellido_materno" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formApellidoMaterno.apellido_materno.$pristine && formApellidoMaterno.apellido_materno.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <!--SEGUNDA RONDA-->
                                                                            <div class="row">
                                                                                <div class="col-lg-4">
                                                                                    <label for="date-picker">Fecha de Nacimiento</label>
                                                                                    <input type="text" id="date-picker" class="form-control datepicker" readonly>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    <form name="formApellidoPaterno" ng-submit="formApellidoPaterno.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : formApellidoPaterno.apellido_paterno.$invalid }">
                                                                                            <label for="forLbPassword">Lugar de Nacimiento</label>
                                                                                            <input type="text" name="lugar_nacimiento" id="forLbPassword" ng-model="lugar_nacimiento" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formApellidoPaterno.lugar_nacimiento.$pristine && formApellidoPaterno.lugar_nacimiento.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    <form name="formApellidoMaterno" ng-submit="formApellidoMaterno.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : formApellidoMaterno.apellido_materno.$invalid }">
                                                                                            <label for="forLbPassword">Direccion</label>
                                                                                            <input type="text" name="apellido_materno" id="forLbPassword" ng-model="apellido_materno" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formApellidoMaterno.apellido_materno.$pristine && formApellidoMaterno.apellido_materno.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <!--TERCERA RONDA-->
                                                                            <div class="row">
                                                                                <div class="col-lg-4">
                                                                                    <form name="formDistrito">
                                                                                        <div class="md-form form-sm lg-4">
                                                                                            <div class="form-group">
                                                                                                <label for="forLbDistrito">Distrito</label><br><br>
                                                                                                <select class="form-control" id="district">
                                                                                                    <option hidden="">Ancon</option>
                                                                                                    <option>Ancon</option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    <form name="formApellidoPaterno" ng-submit="formApellidoPaterno.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : formApellidoPaterno.apellido_paterno.$invalid }">
                                                                                            <label for="forLbPassword">Telefono de Casa</label>
                                                                                            <input type="text" name="apellido_paterno" id="forLbPassword" ng-model="apellido_paterno" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formApellidoPaterno.apellido_paterno.$pristine && formApellidoPaterno.apellido_paterno.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    <form name="formApellidoMaterno" ng-submit="formApellidoMaterno.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : formApellidoMaterno.apellido_materno.$invalid }">
                                                                                            <label for="forLbPassword">Numero de Celular</label>
                                                                                            <input type="text" name="apellido_materno" id="forLbPassword" ng-model="apellido_materno" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formApellidoMaterno.apellido_materno.$pristine && formApellidoMaterno.apellido_materno.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <!--CUARTA RONDA-->
                                                                            <div class="row">
                                                                                <div class="col-lg-4">
                                                                                    <form name="formNombre" ng-submit="formNombre.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' formNombre.nombre.$invalid }">
                                                                                            <label for="forLbName">I.E. de Origen</label>
                                                                                            <input type="text" name="nombre" id="forLbName" ng-model="nombre" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formNombre.nombre.$pristine && formNombre.nombre.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    <form name="formApellidoPaterno" ng-submit="formApellidoPaterno.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : formApellidoPaterno.apellido_paterno.$invalid }">
                                                                                            <label for="forLbPassword">Vive con sus padres</label>
                                                                                            <input type="text" name="apellido_paterno" id="forLbPassword" ng-model="apellido_paterno" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formApellidoPaterno.apellido_paterno.$pristine && formApellidoPaterno.apellido_paterno.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                <div class="col-lg-4">
                                                                                    <form name="formApellidoMaterno" ng-submit="formApellidoMaterno.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : formApellidoMaterno.apellido_materno.$invalid }">
                                                                                            <label for="forLbPassword">Lengua Materna</label>
                                                                                            <input type="text" name="apellido_materno" id="forLbPassword" ng-model="apellido_materno" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formApellidoMaterno.apellido_materno.$pristine && formApellidoMaterno.apellido_materno.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <!--QUINTA RONDA-->
                                                                            <div class="row">
                                                                                <div class="col-lg-6">
                                                                                    <form name="formNombre" ng-submit="formNombre.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' formNombre.nombre.$invalid }">
                                                                                            <label for="forLbName">Segunda Lengua</label>
                                                                                            <input type="text" name="nombre" id="forLbName" ng-model="nombre" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formNombre.nombre.$pristine && formNombre.nombre.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                <div class="col-lg-6">
                                                                                    <form name="formApellidoMaterno" ng-submit="formApellidoMaterno.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : formApellidoMaterno.apellido_materno.$invalid }">
                                                                                            <label for="forLbPassword">Grupo Sanguineo</label>
                                                                                            <input type="text" name="apellido_materno" id="forLbPassword" ng-model="apellido_materno" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formApellidoMaterno.apellido_materno.$pristine && formApellidoMaterno.apellido_materno.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-1">&nbsp;</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--/.Panel 7-->

                                                        <!--REGISTRO-->
                                                        <div class="tab-pane fade" id="panel8" role="tabpanel">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-lg-1">&nbsp;</div>
                                                                    <div class="col-lg-10">
                                                                        <!--Body-->
                                                                        <div class="mb-1">
                                                                            <div class="row">
                                                                                <div class="col-lg-6">
                                                                                    <form name="formNombreUsuario" ng-submit="formNombreUsuario.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : !formNombreUsuario.name.$pristine && formNombreUsuario.name.$invalid }">
                                                                                            <label for="forLbNombreUsuario">Primer Nombre</label>
                                                                                            <input type="text" name="name" id="forLbNombreUsuario" ng-model="name" class="form-control form-control-sm" required> 
                                                                                            <span ng-show="!formNombreUsuario.name.$pristine && formNombreUsuario.name.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                                <div class="col-lg-6">
                                                                                    <form name="formApellidoUsuario" ng-submit="formApellidoUsuario.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : !formApellidoUsuario.lastname.$pristine && formApellidoUsuario.lastname.$invalid }">
                                                                                            <label for="forLbApellido">Apellido</label>
                                                                                            <input type="text" name="lastname" id="forLbApellido" ng-model="lastname" class="form-control form-control-sm validate" required> 
                                                                                            <span ng-show="!formApellidoUsuario.lastname.$pristine && formApellidoUsuario.lastname.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-7">
                                                                                    <div class="md-form form-sm lg-4">
                                                                                        <label for="date-picker">Fecha de Nacimiento</label>
                                                                                        <input type="text" id="date-picker" class="form-control datepicker" readonly>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-5">
                                                                                    <form name="formDistrito">
                                                                                        <div class="md-form form-sm lg-4">
                                                                                            <div class="form-group">
                                                                                                <label for="forLbDistrito">Distrito</label><br><br>
                                                                                                <select class="form-control" id="district">
                                                                                                    <option>Ancon</option>
                                                                                                    <option>Lince</option>
                                                                                                    <option>Jesus Maria</option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <form name="formDireccion" ng-submit="formDireccion.$valid">
                                                                                        <div class="md-form form-sm lg-4" ng-class="{ 'has-error' : !formDireccion.address.$pristine && formDireccion.address.$invalid }">
                                                                                            <label for="forLbDireccion">Dirección</label>
                                                                                            <input type="text" name="address" id="forLbDistrito" ng-model="address" class="form-control form-control-sm validate" required> 
                                                                                            <span ng-show="!formDireccion.address.$pristine && formDireccion.address.$invalid" class="active red-text">No debe dejar espacio en blanco</span>
                                                                                        </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                            <div class="text-center form-sm mt-2" style="padding-bottom: 18px; padding-top: 10px;">
                                                                                <button class="btn btn-info">Sign up <i class="fa fa-sign-in ml-1"></i></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-1">&nbsp;</div>
                                                                </div>
                                                                <!--/.Panel 8-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                    <button type="submit" class="btn btn-default" ng-click="prematricular()">Close</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>

                                                </div>
                                            </div>
                                            <!--/.Content-->
                                        </div>
                                    </div>
                                </div>   


                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="inscribir-evento" role="tabpanel" aria-labelledby="pill_inscribir_evento">
                        EN DESARROLLO..
                    </div>
                </div>

                <div class="modal fade modalComunicado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="position: fixed;  top: -13%;">
                    <div class="modal-dialog cascading-modal" role="document">
                        <div class="modal-content">
                            <div style="background-color: #eeeeee;border-color: #4c4f53; border-style: solid; padding: 40px;">
                                <!--Modal cascading tabs-->
                                <div class="modal-c-tabs">
                                    <div ng-repeat="comuni in listaComunicado">
                                        <p>{{comuni.encabezado}} - {{comuni.nombre_tipo_comunicado}}</p>
                                        <h4>{{comuni.titulo_principal}}</h4>
                                        <h5>{{comuni.titulo_sub}}</h5>
                                        <p>{{comuni.cuerpo_descripcion}}</p>
                                        <p>{{comuni.pie_pagina}}</p>
                                        <hr>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </main>
        <!-- page-content" -->
    </div>
    <!--Modal: Login / Register Form-->
    <%@include file="foot.jspf" %>
    <script>
        $(".modalComunicado").modal();
        $('.datepicker').pickadate();
        jQuery(function ($) {
        $(".sidebar-dropdown > a").click(function () {
        $(".sidebar-submenu").slideUp(200);
        if (
                $(this)
                .parent()
                .hasClass("active")
                ) {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
                .parent()
                .removeClass("active");
        } else {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
                .next(".sidebar-submenu")
                .slideDown(200);
        $(this)
                .parent()
                .addClass("active");
        }
        });
        $("#close-sidebar").click(function () {
        $(".page-wrapper").removeClass("toggled");
        });
        $("#show-sidebar").click(function () {
        $(".page-wrapper").addClass("toggled");
        });
        });
    </script>
    <script src="http://localhost:8084/ProyectoSIAVIE/resources/js/PFamilyController.js" type="text/javascript"></script>
    <script src="http://localhost:8084/ProyectoSIAVIE/resources/js/dirPagination.js" type="text/javascript"></script>     
</body>
</html>
