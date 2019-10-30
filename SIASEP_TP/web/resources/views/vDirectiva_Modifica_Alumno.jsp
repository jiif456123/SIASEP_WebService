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

    .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
    .toggle.ios .toggle-handle { border-radius: 20px; }

    .custom-combobox {
        position: relative;
        display: inline-block;
    }
    .custom-combobox-toggle {
        position: absolute;
        top: 0;
        bottom: 0;
        margin-left: -1px;
        padding: 0;
    }
    .custom-combobox-input {
        margin: 0;
        padding: 5px 10px;
        width: 330px;
    }
    
</style>
</head>
<body ng-app="myModificaMatr" ng-controller="modificaMatrCtrl" class="fixed-sn">
    <div class="page-wrapper chiller-theme toggled">
        <%@include file="navBarDirectiva.jsp"%>
        <!-- sidebar-wrapper  -->
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark default-color">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto" style="padding-left: 85px;">
                        <a href="#" class="nav-item" style="font-weight: bold; color: #ffffff;"
                           onclick="window.location.href = 'http://localhost:8084/SIASEP_TP/'">INICIO</a>
                    </ul>
                    <ul class="navbar-nav nav-flex-icons">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuB" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-book"></i> <span class="clearfix d-none d-sm-inline-block">Módulos</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuB">
                                <a class="dropdown-item" href="#" onclick="window.location.href = 'http://localhost:8084/SIASEP_TP/'">Matricular Alumno</a>
                                <a class="dropdown-item" href="#" onclick="window.location.href = 'http://localhost:8084/SIASEP_TP/resources/views/vDirectiva_Modifica_Alumno.jsp'">Modificar Alumno</a>
                                <a class="dropdown-item" href="#">Generar Horario</a>
                                <a class="dropdown-item" href="#">Generar Libreta</a>
                                <hr>
                                <a class="dropdown-item" href="#">Gestionar Roles</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuA" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-folder"></i> <span class="clearfix d-none d-sm-inline-block">Generar Reportes</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuA">
                                <a class="dropdown-item" href="#">Matricula</a>
                                <a class="dropdown-item" href="#">Record Academico</a>
                                <a class="dropdown-item" href="#">Asistencia</a>
                                <a class="dropdown-item" href="#">Ficha Conductual</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user"></i> <span class="clearfix d-none d-sm-inline-block">Cuenta</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#">Ver perfil&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-pill badge-warning">Nuevo</span></a>
                                <a class="dropdown-item" href="#">Configurar Cuenta</a>
                                <hr>
                                <a class="dropdown-item" href="#" ng-click="cerrarSesion()" style="text-align: center;">
                                     <i class="fa fa-power-off" style="color: #de5f38;"></i>&nbsp;&nbsp;&nbsp;Cerrar sesión</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <main class="page-content">
            <div class="container">
                <div class="tab-content" id="pills-tabContent" style="margin-bottom: 50px;">
                    <div class="tab-pane fade show active" id="Administrar_matricula" role="tabpanel" aria-labelledby="pill_administrar_matricula">
                        <div class="row ">
                            <div class="col-lg-12">
                                <div class="pt-4" style="padding-bottom: 35px; text-align: center;">
                                    <h2><strong>MODIFICAR INFORMACIÓN DEL ALUMNO</strong></h2>
                                    <h6>Modulo de información detallado del alumno y sus vinculos familiares</h6>
                                </div>


                                <ul class="nav nav-tabs md-tabs" id="myTabMD" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="datos-alumno-md" data-toggle="tab" href="#datos-alumno" role="tab" aria-controls="datos-alumno"
                                           aria-selected="true" style="font-weight: bold; color: #1e2229;">DATOS DEL ALUMNO</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="datos-familiar-md" data-toggle="tab" href="#datos-familiar" role="tab" aria-controls="datos-familiar"
                                           aria-selected="false" style="font-weight: bold; color: #1e2229;">VINCULO FAMILIAR</a>
                                    </li>
                                </ul>
                                <div class="tab-content card pt-4" id="myTabContentMD" style="padding: 0px 10px 0px 10px;">
                                    <div class="tab-pane fade show active" id="datos-alumno" role="tabpanel" aria-labelledby="datos-alumno-md" style="padding-bottom: 30px;">
                                        <div class="container-fluid">
                                            <form class="formModificarAlumno" novalidate>
                                                <p style="font-weight: lighter; font-size: 15px;">Seleccione un alumno en especifico para consultar o modificar su información en detalle.<br>
                                                                                                  Recomendación: No olvide ACEPTAR despues de realizar tantos cambios.</p>
                                                <div class="row" style="padding-bottom: 22px;">
                                                    <div class="col-lg-6">
                                                        <div class=" ui-widget">
                                                            <div class="form-group" style="margin-top: 15px;">
                                                                <label for="txtAlumnoBuscar">Buscar al alumno:&nbsp;&nbsp;&nbsp;</label>
                                                                <select class="form-control" id="comboboxAlumno" ng-model="selAlumnoSeleccionado" 
                                                                        ng-options="labusq.id_per_alumno as labusq.codigo_alumno+' - '+labusq.nombre_alumno for labusq in listaAlumnosBusqueda">
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2" style="text-align: left; padding-top: 6px;">
                                                        <button id="btnBuscarInfoAlumno" class="btn btn-info btn-md" ng-click="buscaAlumnoInfo()"><i class="fa fa-search"></i>&nbsp;&nbsp;&nbsp;Buscar</button>
                                                    </div>
                                                    <div class="col-lg-4" style="text-align: right; padding-top: 2px;">
                                                        <button type="submit" id="btnRealizaCambio" class="btn btn-amber" onclick="desbloqueaFormulario()" ng-click="realizarCambioInfo()" disabled>
                                                            <i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;&nbsp;Realizar Cambios</button>
                                                    </div>
                                                </div> 
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" 
                                                               aria-controls="v-pills-home" aria-selected="true">Datos Personales</a>
                                                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
                                                               aria-controls="v-pills-profile" aria-selected="false">Contacto</a>
                                                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" 
                                                               aria-controls="v-pills-messages" aria-selected="false">Datos Generales</a>
                                                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" 
                                                               aria-controls="v-pills-settings" aria-selected="false">Constancia</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-10">
                                                        <%@include file="forms/vDirectiva_Modifica_Info.jsp"%>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="datos-familiar" role="tabpanel" aria-labelledby="datos-familiar-md">
                                        <div class="container-fluid">
                                            <p style="font-weight: lighter; font-size: 15px;">Seleccione un alumno en especifico para consultar la información mas relevante de sus relaciones familiares; así mismo, 
                                                                                              poder asignarle a un apoderado entre sus familiares para el resto del año escolar. <br>
                                                                                              </p>
                                            <div class="row pt-2" style="padding-bottom: 22px;">
                                                <div class="col-lg-6">
                                                    <div class=" ui-widget">
                                                        <div class="form-group" style="margin-top: 15px;">
                                                            <label for="txtAlumnoBuscar">Buscar al alumno:&nbsp;&nbsp;&nbsp;</label>
                                                            <select class="form-control" id="comboboxVinculo" ng-model="selAlumnoSeleccionado" 
                                                                    ng-options="labusq.id_per_alumno as labusq.codigo_alumno+' - '+labusq.nombre_alumno for labusq in listaAlumnosBusqueda">
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2" style="text-align: left; padding-top: 6px;">
                                                    <button class="btn btn-info btn-md" ng-click="obtenerListaFamiliares()"><i class="fa fa-search"></i>&nbsp;&nbsp;&nbsp;Buscar</button>
                                                </div>
                                                <div class="col-lg-4" style="text-align: right; padding-top: 6px;">
                                                    <button id="btnAsignarApoderado" class="btn btn-outline-blue-grey btn-md" data-toggle="modal" data-target=".modalAsignarApoderado"
                                                            ng-click="mostrarVinculosFamiliares()" disabled><i class="fa fa-plus"></i>&nbsp;&nbsp;&nbsp;Asignar nuevo apoderado</button>
                                                </div>
                                            </div>
                                            <div class="row pt-3">
                                                <div class="col-lg-12">
                                                    <table class="table table-bordered table-sm">
                                                        <thead>
                                                            <tr class="table-secondary">
                                                                <th scope="col">Nro. Documento</th>
                                                                <th scope="col">Tipo de Familiar</th>
                                                                <th scope="col">Nombre Completo</th>
                                                                <th scope="col">Telefono de Emergencia</th>
                                                                <th scope="col">¿Es Apoderado?</th>
                                                                <th scope="col">Acciones</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr ng-repeat="fam in listaFamiliares">
                                                                <td>{{fam.numero_documento}}</td>
                                                                <td>{{fam.nom_tipo_familiar}}</td>
                                                                <td>{{fam.nombre_familiar}}</td>
                                                                <td>{{fam.telefono_emergencia}}</td>
                                                                <td>{{fam.es_apoderado}}</td>
                                                                <td class="text-center">
                                                                    <button type="button" class="btn-floating btn-mdb-color btn-lg" value="{{fam.id_per_familiar}}" data-ng-click="mostrarInfoFamiliar($event)"
                                                                        title="Ver información" data-toggle="modal" data-target=".modalViewFamiliar"><span class="fa fa-address-book"></span></button>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <p style="font-weight: lighter;">*Nota: Solo se considera la relación de un apoderado para el alumno matriculado</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="Generar_horario" role="tabpanel" aria-labelledby="pill_generar_horario">
                        EN DESARROLLO..
                    </div>
                    <div class="tab-pane fade" id="Generar_Libreta" role="tabpanel" aria-labelledby="pill_generar_libreta">
                        EN DESARROLLO..aaaaa
                    </div>
                    <div class="tab-pane fade" id="Gestionar_Roles" role="tabpanel" aria-labelledby="pill_gestionar_roles">
                        EN DESARROLLO..wwwww
                    </div>                                    
                </div>
            </div>
        </main>

        <div class="modal fade modalViewFamiliar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                        <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#datos_personales" role="tab" 
                                           aria-controls="v-pills-home" aria-selected="true">Datos Personales</a>
                                        <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#datos_contacto" role="tab"
                                           aria-controls="v-pills-profile" aria-selected="false">Contacto</a>
                                        <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#datos_laborales" role="tab" 
                                           aria-controls="v-pills-messages" aria-selected="false">Datos Generales</a>
                                    </div>
                                </div>
                                <div class="col-lg-10">
                                    <div class="tab-content" id="v-pills-tabContent">
                                        <div class="tab-pane fade show active" id="datos_personales" role="tabpanel" aria-labelledby="datos_personales-tab">
                                            <h3 style="font-weight: lighter;">Datos Personales</h3>
                                            <div class="form-row pt-3">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtNombreFamiliar">Primer Nombre</label>
                                                        <input type="text" class="form-control" id="txtNombreFamiliar" aria-describedby="emailHelp" ng-model="modNombreFamiliar" disabled>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtApePaternoFamiliar">Apellido Paterno</label>
                                                        <input type="text" class="form-control" id="txtApePaternoFamiliar" aria-describedby="emailHelp" ng-model="modApePaternoFamiliar" disabled>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtApeMaternoFamiliar">Apellido Materno</label>
                                                        <input type="text" class="form-control" id="txtApeMaternoFamiliar" aria-describedby="emailHelp" ng-model="modApeMaternoFamiliar" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtTipoDocFamiliar">Tipo de Documento</label>
                                                        <select class="form-control" id="txtTipoDocFamiliar" ng-model="modTipoDocFamiliar" disabled>
                                                            <option value="1">DNI</option>
                                                            <option value="2">PASAPORTE</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtNroDocFamiliar">Numero de Documento</label>
                                                        <input type="text" class="form-control" id="txtNroDocFamiliar" aria-describedby="emailHelp" ng-model="modNroDocFamiliar" disabled>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtEstadoCivil">Estado Civil</label>
                                                        <select class="form-control" id="txtEstadoCivil" ng-model="modEstadoCivil" disabled>
                                                            <option value="1">Casado(a)</option>
                                                            <option value="2">Divorciado(a)</option>
                                                            <option value="3">Soltero(a)</option>
                                                            <option value="4">Viudo(a)</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtFecNacFamiliar">Fecha de Nacimiento</label>
                                                        <input class="form-control" type="text" id="txtFecNacFamiliar" ng-model="modFecNacFamiliar" disabled>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtLugarNacFamiliar">Lugar de Nacimiento</label>
                                                        <select class="form-control" id="txtLugarNacFamiliar" ng-model="modLugarNacFamiliar" disabled>
                                                            <option value="1">Amazonas</option>
                                                            <option value="2">Ancash</option>
                                                            <option value="3">Apurimac</option>
                                                            <option value="4">Arequipa</option>
                                                            <option value="5">Ayacucho</option>
                                                            <option value="6">Cajamarca</option>
                                                            <option value="7">Callao</option>
                                                            <option value="8">Cuzco</option>
                                                            <option value="9">Huancavelica</option>
                                                            <option value="10">Huanuco</option>
                                                            <option value="11">Ica</option>
                                                            <option value="12">Junin</option>
                                                            <option value="13">La Libertad</option>
                                                            <option value="14">Lambayeque</option>
                                                            <option value="15">Lima</option>
                                                            <option value="16">Loreto</option>
                                                            <option value="17">Madre de Dios</option>
                                                            <option value="18">Moquegua</option>
                                                            <option value="19">Pasco</option>
                                                            <option value="20">Piura</option>
                                                            <option value="21">Puno</option>
                                                            <option value="22">San Martin</option>
                                                            <option value="23">Tacna</option>
                                                            <option value="24">Tumbes</option>
                                                            <option value="25">Ucayali</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group" style="text-align: left;">
                                                        <label for="relSexo">Sexo</label>
                                                        <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                                                            <div class="row" style="padding-top: 8px; text-align: center;">
                                                                <div class="col-lg-6" style="text-align: right;">
                                                                    <div class="form-check-inline">
                                                                        <label class="form-check-label" style="font-size: 13px;">
                                                                            <input type="radio" class="form-check-input" name="optradioA" ng-model="modSexoFamiliar" value="M" disabled>Hombre
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6" style="text-align: left;">
                                                                    <div class="form-check-inline">
                                                                        <label class="form-check-label" style="font-size: 13px;">
                                                                            <input type="radio" class="form-check-input" name="optradioA" ng-model="modSexoFamiliar" value="F" disabled>Mujer
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="datos_contacto" role="tabpanel" aria-labelledby="datos_contacto-tab">
                                            <h3 style="font-weight: lighter;">Datos de Contacto</h3>
                                            <div class="row pt-3">
                                                <div class="col-lg-5">
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="txtDistritoFamiliar">Distrito</label>
                                                                <select class="form-control" id="txtDistritoFamiliar" ng-model="modDistritoFamiliar" disabled>
                                                                    <option value="1">Callao</option>
                                                                    <option value="2">Bellavista</option>
                                                                    <option value="3">Carmen de la Legua</option>
                                                                    <option value="4">La Perla</option>
                                                                    <option value="5">La Punta</option>
                                                                    <option value="6">Mi Peru</option>   
                                                                    <option value="7">Ventanilla</option>
                                                                    <option value="8">Lima</option>
                                                                    <option value="9">Ancon</option>
                                                                    <option value="10">Ate</option>
                                                                    <option value="11">Barranco</option>
                                                                    <option value="12">Breña</option>     
                                                                    <option value="13">Carabayllo</option>
                                                                    <option value="14">Cieneguilla</option>
                                                                    <option value="15">Chaclacayo</option>
                                                                    <option value="16">Chomillos</option>
                                                                    <option value="17">Comas</option>
                                                                    <option value="18">El Agustino</option>
                                                                    <option value="19">Indepenndencia</option>
                                                                    <option value="20">Jesus Maria</option>
                                                                    <option value="21">La Molina</option>
                                                                    <option value="22">La Victoria</option>
                                                                    <option value="23">Lince</option>   
                                                                    <option value="24">Los Olivos</option>
                                                                    <option value="25">Lurigancho</option>
                                                                    <option value="26">Lurin</option>
                                                                    <option value="27">Magdalena del Mar</option>
                                                                    <option value="28">Miraflores</option>
                                                                    <option value="29">Pachacamac</option>     
                                                                    <option value="30">Pucusana</option>
                                                                    <option value="31">Pueblo Libre</option>
                                                                    <option value="32">Puente Piedra</option>
                                                                    <option value="33">Punta Hermosa</option>
                                                                    <option value="34">Punta Negra</option>
                                                                    <option value="35">Rimac</option>
                                                                    <option value="36">San Bartolo</option>
                                                                    <option value="37">San Borja</option>
                                                                    <option value="38">San Isidro</option>
                                                                    <option value="39">San Juan de Lurigancho</option>
                                                                    <option value="40">San Juan de Miraflores</option>   
                                                                    <option value="41">San Luis</option>
                                                                    <option value="42">San Martin de Porres</option>
                                                                    <option value="43">San Miguel</option>
                                                                    <option value="44">Santa Anita</option>
                                                                    <option value="45">Santa Maria del Mar</option>
                                                                    <option value="46">Santa Rosa</option>     
                                                                    <option value="47">Santiago de Surco</option>
                                                                    <option value="48">Surquillo</option>
                                                                    <option value="49">Villa el Salvador</option>
                                                                    <option value="50">Villa Maria del Triunfo </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-7">
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="txtTelefonoFamiliar">Telefono de Casa</label>
                                                                <input type="text" class="form-control" id="txtTelefonoFamiliar" aria-describedby="emailHelp" 
                                                                       placeholder="No tiene telefono de casa" ng-model="modTelefonoFamiliar" disabled>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="txtCelularFamiliar">Telefono Celular</label>
                                                                <input type="text" class="form-control" id="txtCelularFamiliar" aria-describedby="emailHelp" 
                                                                       placeholder="No tiene celular" ng-model="modCelularFamiliar" disabled>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-row" style="padding-top: 10px;">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtDireccionFamiliar">Dirección del hogar</label>
                                                        <input type="text" class="form-control" id="txtDireccionFamiliar" aria-describedby="emailHelp" ng-model="modDireccionFamiliar" disabled>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtCorreoFamiliar">Correo electrónico</label>
                                                        <input type="email" class="form-control" id="txtCorreoFamiliar" aria-describedby="emailHelp" 
                                                               placeholder="No tiene correo electronico" ng-model="modCorreoFamiliar" disabled>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>
                                        <div class="tab-pane fade" id="datos_laborales" role="tabpanel" aria-labelledby="datos_laborales-tab">
                                            <h3 style="font-weight: lighter;">Datos Generales y Laborales</h3>
                                            <div class="form-row pt-3">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtTipoFamiliar">Tipo de Familiar </label>
                                                        <select class="form-control" id="txtTipoFamiliar" ng-model="modTipoFamiliar" disabled>
                                                            <option value="1">Padre</option>
                                                            <option value="2">Madre</option>
                                                            <option value="3">Tio(a)</option>
                                                            <option value="4">Padrino</option>
                                                            <option value="5">Vecino(o)</option>
                                                            <option value="6">Otros</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group" style="text-align: left;">
                                                        <label for="relSexo">¿Entregó Copia de DNI?</label>
                                                        <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                                                            <div class="row" style="padding-top: 8px;">
                                                                <div class="col-lg-6" style="text-align: right;">
                                                                    <div class="form-check-inline" style="text-align: right;">
                                                                        <label class="form-check-label" style="font-size: 14px;">
                                                                            <input type="radio" class="form-check-input" name="optradioB" value="true" ng-model="modCopiaDNIFamiliar" disabled>SI
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6" style="text-align: left;">
                                                                    <div class="form-check-inline" style="text-align: left;">
                                                                        <label class="form-check-label" style="font-size: 14px;">
                                                                            <input type="radio" class="form-check-input" name="optradioB" value="false" ng-model="modCopiaDNIFamiliar" disabled>NO
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtGradoInstruccion">Grado de instruccion</label>
                                                        <select class="form-control" id="txtGradoInstruccion" ng-model="modGradoInstruccion" disabled>
                                                            <option value="1">Sin Estudios</option>
                                                            <option value="2">Primario</option>
                                                            <option value="3">Secundarios</option>
                                                            <option value="4">Medio-Superior</option>
                                                            <option value="5">Superior</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="txtOcupacionFamiliar">Ocupación</label>
                                                        <input type="text" class="form-control" id="txtOcupacionFamiliar" aria-describedby="emailHelp" 
                                                               ng-model="modOcupacionFamiliar" placeholder="Sin ocupación" disabled>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade modalAsignarApoderado" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <h3 style="font-weight: lighter; margin-bottom: 15px;">Asigne un apoderado a uno de los familiares del alumno</h3>
                            <br>
                            <h5 style="margin-bottom: 20px; margin-left: 11px;">Nombre del Alumno:&nbsp;&nbsp;&nbsp;<label ng-bind="modNomAlumnoApo"></label></h5>
                            <table class="table table-borderless">
                                <thead>
                                    <tr class="text-center">
                                        <th scope="col" style="font-size: 13px;">Nro. Documento</th>
                                        <th scope="col" style="font-size: 13px;">Nombre Completo</th>
                                        <th scope="col" style="font-size: 13px;">Fecha Inicial</th>
                                        <th scope="col" style="font-size: 13px;">Fecha Fin</th>
                                        <th scope="col" style="font-size: 13px;">Establecer relación como apoderado</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
                                    <tr ng-repeat="fam in listaFamiliaresAsignar">
                                        <td style="font-size: 13px;">{{fam.numero_documento}}</td>
                                        <td style="font-size: 13px;">{{fam.nombre_familiar}}</td>
                                        <td style="font-size: 13px;">{{fam.fec_inicio_new}}</td>
                                        <td style="font-size: 13px;">{{fam.fec_fin_new}}</td>
                                        <td>
                                            <button type="button" class="btn btn-floating btn-mdb-color btn-md" value="{{fam.id_per_familiar}}-{{fam.es_apoderado}}" 
                                                    data-ng-click="seleccionaApoderado($event)"><span class="fa fa-address-book"></span>&nbsp;&nbsp;&nbsp;Asignar</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
                                                    
                                                    
    </div>
    <!--Modal: Login / Register Form-->
    <%@include file="foot.jspf" %>
    <script>
        function desbloqueaBtnAsignarApo() {
            $("#btnAsignarApoderado").removeAttr("disabled");
        }
    
        function desbloqueaFormulario() {
            $('.datepicker').attr("style","background-color: white");
            $("#txtNombreAlumno").removeAttr("readonly");
            $("#txtApePaternoAlumno").removeAttr("readonly");
            $("#txtApeMaternoAlumno").removeAttr("readonly");
            $("#txtTipoDocAlumno").removeAttr("disabled");
            $("#txtNroDocAlumno").removeAttr("readonly");
            $("#txtFechaNacAlumno").removeAttr("readonly");
            $("#txtFechaNacAlumno").removeAttr("disabled");
            $("#txtLugarNacAlumno").removeAttr("disabled");
            $("#txtDistritoAlumno").removeAttr("disabled");
            $("#txtTelefonoAlumno").removeAttr("readonly");
            $("#txtCelularAlumno").removeAttr("readonly");
            $("#txtDireccionAlumno").removeAttr("readonly");
            $("#txtCorreoAlumno").removeAttr("readonly");
            $("#txtLMaternaAlumno").removeAttr("readonly");
            $("#txtLSegundaAlumno").removeAttr("readonly");
            $("#txtNroHermAlumno").removeAttr("disabled");
            $("#txtPonderadoAlumno").removeAttr("readonly");
            $("#txtNivelAnterior").removeAttr("disabled");
            $("#txtGradoAnterior").removeAttr("disabled");
            $("#txtSeccionReferente").removeAttr("disabled");
            $("#txtIEAlumno").removeAttr("readonly");
            $("#txtSanguineoAlumno").removeAttr("disabled");
            $("input[name='optradioA']").removeAttr("disabled");
            $("input[name='optradioB']").removeAttr("disabled");
            $("input[name='optradioC']").removeAttr("disabled");
            $("input[name='optradioD']").removeAttr("disabled");
            
            $("#btnBuscarInfoAlumno").attr("disabled", "disabled");
            $("#txtAlumnoSelected").attr("readonly", "readonly");
            $("#hptFormAlumno").addClass("disabled");
            
            $("#btnRealizaCambio").removeClass("btn-success");
            $("#btnRealizaCambio").addClass("btn-outline-orange");
            $("#btnRealizaCambio").html("<i class=\"fa fa-check\"></i>&nbsp;&nbsp;&nbsp;ACEPTAR");
            $("#btnRealizaCambio").removeAttr("onclick");
            $("#btnRealizaCambio").attr("ng-click","realizarCambioInfo()");
            $("#btnBuscarInfoAlumno").trigger("click");
        }
        
        function terminarCambios() {
            $('.datepicker').removeAttr("style");
            $("#txtNombreAlumno").attr("readonly", "readonly");
            $("#txtApePaternoAlumno").attr("readonly", "readonly");
            $("#txtApeMaternoAlumno").attr("readonly", "readonly");
            $("#txtTipoDocAlumno").attr("disabled", "disabled");
            $("#txtNroDocAlumno").attr("readonly", "readonly");
            $("#txtFechaNacAlumno").attr("readonly", "readonly");
            $("#txtFechaNacAlumno").attr("disabled", "disabled");
            $("#txtLugarNacAlumno").attr("disabled", "disabled");
            $("#txtDistritoAlumno").attr("disabled", "disabled");
            $("#txtTelefonoAlumno").attr("readonly", "readonly");
            $("#txtCelularAlumno").attr("readonly", "readonly");
            $("#txtDireccionAlumno").attr("readonly", "readonly");
            $("#txtCorreoAlumno").attr("readonly", "readonly");
            $("#txtLMaternaAlumno").attr("readonly", "readonly");
            $("#txtLSegundaAlumno").attr("readonly", "readonly");
            $("#txtNroHermAlumno").attr("disabled", "disabled");
            $("#txtPonderadoAlumno").attr("readonly", "readonly");
            $("#txtNivelAnterior").attr("disabled", "disabled");
            $("#txtGradoAnterior").attr("disabled", "disabled");
            $("#txtSeccionReferente").attr("disabled", "disabled");
            $("#txtIEAlumno").attr("readonly", "readonly");
            $("#txtSanguineoAlumno").attr("disabled", "disabled");
            $("input[name='optradioA']").attr("disabled", "disabled");
            $("input[name='optradioB']").attr("disabled", "disabled");
            $("input[name='optradioC']").attr("disabled", "disabled");
            $("input[name='optradioD']").attr("disabled", "disabled");

            $("#btnBuscarInfoAlumno").removeAttr("disabled");
            $("#txtAlumnoSelected").removeAttr("readonly");
            $("#hptFormAlumno").removeClass("disabled");

            $("#btnRealizaCambio").removeClass("btn-outline-orange");
            $("#btnRealizaCambio").addClass("btn-amber");
            $("#btnRealizaCambio").html("<i class=\"fa fa-pencil-square-o\"></i>&nbsp;&nbsp;&nbsp;REALIZAR CAMBIOS");
            $("#btnRealizaCambio").attr("onclick","desbloqueaFormulario()");
        }
        
        $('.datepicker').pickadate({
            format: 'mmmm d, yyyy',
            monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            selectYears: 50,
            selectMonths: true
        });
        
        $( function() {
            $.widget( "custom.combobox", {
              _create: function() {
                this.wrapper = $( "<span>" )
                  .addClass( "custom-combobox" )
                  .insertAfter( this.element );
                this.element.hide();
                this._createAutocomplete();
                this._createShowAllButton();
              },
              _createAutocomplete: function() {
                var selected = this.element.children( ":selected" ),
                  value = selected.val() ? selected.text() : "";
                
                this.input = $( "<input>" )
                  .appendTo( this.wrapper )
                  .attr("id", "txtAlumnoSelected")
                  .val( value )
                  .attr( "title", "" )
                  .addClass( "custom-combobox-input ui-widget ui-widget-content ui-state ui-corner-left" )
                  .autocomplete({
                    delay: 0,
                    minLength: 0,
                    source: $.proxy( this, "_source" )
                  })
                  .tooltip({
                    classes: {
                      "ui-tooltip": "ui-state-highlight"
                    }
                  });

                this._on( this.input, {
                  autocompleteselect: function( event, ui ) {
                    ui.item.option.selected = true;
                    this._trigger( "select", event, {
                      item: ui.item.option
                    });
                  },

                  autocompletechange: "_removeIfInvalid"
                });
              },

              _createShowAllButton: function() {
                var input = this.input,
                  wasOpen = false;

                $( "<a>" )
                  .attr( "tabIndex", -1 )
                  .attr( "title", "Mostrar Todo" )
                  .attr( "id", "hptFormAlumno" )
                  .tooltip()
                  .appendTo( this.wrapper )
                  .button({
                    icons: {
                      primary: "ui-icon-triangle-1-s"
                    },
                    text: false
                  })
                  .removeClass( "ui-corner-all" )
                  .addClass( "custom-combobox-toggle ui-corner-right" )
                  .on( "mousedown", function() {
                    wasOpen = input.autocomplete( "widget" ).is( ":visible" );
                  })
                  .on( "click", function() {
                    input.trigger( "focus" );

                    // Close if already visible
                    if ( wasOpen ) {
                      return;
                    }

                    // Pass empty string as value to search for, displaying all results
                    input.autocomplete( "search", "" );
                  });
              },

              _source: function( request, response ) {
                var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
                response( this.element.children( "option" ).map(function() {
                  var text = $( this ).text();
                  if ( this.value && ( !request.term || matcher.test(text) ) )
                    return {
                      label: text,
                      value: text,
                      option: this
                    };
                }) );
              },

              _removeIfInvalid: function( event, ui ) {

                // Selected an item, nothing to do
                if ( ui.item ) {
                  return;
                }

                // Search for a match (case-insensitive)
                var value = this.input.val(),
                  valueLowerCase = value.toLowerCase(),
                  valid = false;
                this.element.children( "option" ).each(function() {
                  if ( $( this ).text().toLowerCase() === valueLowerCase ) {
                    this.selected = valid = true;
                    return false;
                  }
                });
                // Found a match, nothing to do
                if ( valid ) {
                  return;
                }
                // Remove invalid value
                this.input
                  .val( "" )
                  .attr( "title", "No se encontro la busqueda \""+value+"\"." )
                  .tooltip( "open" );
                this.element.val( "" );
                this._delay(function() {
                  this.input.tooltip( "close" ).attr( "title", "" );
                }, 2500 );
                this.input.autocomplete( "instance" ).term = "";
              },
              _destroy: function() {
                this.wrapper.remove();
                this.element.show();
              }
            });
            $( "#comboboxAlumno" ).combobox();
        } );

        $( function() {
            $.widget( "custom.combobox", {
              _create: function() {
                this.wrapper = $( "<span>" )
                  .addClass( "custom-combobox" )
                  .insertAfter( this.element );
                this.element.hide();
                this._createAutocomplete();
                this._createShowAllButton();
              },
              _createAutocomplete: function() {
                var selected = this.element.children( ":selected" ),
                  value = selected.val() ? selected.text() : "";
                
                this.input = $( "<input>" )
                  .appendTo( this.wrapper )
                  .attr("id", "txtAlumnoForFamiliar")
                  .val( value )
                  .attr( "title", "" )
                  .addClass( "custom-combobox-input ui-widget ui-widget-content ui-state ui-corner-left" )
                  .autocomplete({
                    delay: 0,
                    minLength: 0,
                    source: $.proxy( this, "_source" )
                  })
                  .tooltip({
                    classes: {
                      "ui-tooltip": "ui-state-highlight"
                    }
                  });

                this._on( this.input, {
                  autocompleteselect: function( event, ui ) {
                    ui.item.option.selected = true;
                    this._trigger( "select", event, {
                      item: ui.item.option
                    });
                  },

                  autocompletechange: "_removeIfInvalid"
                });
              },

              _createShowAllButton: function() {
                var input = this.input,
                  wasOpen = false;

                $( "<a>" )
                  .attr( "tabIndex", -1 )
                  .attr( "title", "Mostrar Todo" )
                  .attr( "id", "hptFormAlumno" )
                  .tooltip()
                  .appendTo( this.wrapper )
                  .button({
                    icons: {
                      primary: "ui-icon-triangle-1-s"
                    },
                    text: false
                  })
                  .removeClass( "ui-corner-all" )
                  .addClass( "custom-combobox-toggle ui-corner-right" )
                  .on( "mousedown", function() {
                    wasOpen = input.autocomplete( "widget" ).is( ":visible" );
                  })
                  .on( "click", function() {
                    input.trigger( "focus" );

                    // Close if already visible
                    if ( wasOpen ) {
                      return;
                    }

                    // Pass empty string as value to search for, displaying all results
                    input.autocomplete( "search", "" );
                  });
              },

              _source: function( request, response ) {
                var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
                response( this.element.children( "option" ).map(function() {
                  var text = $( this ).text();
                  if ( this.value && ( !request.term || matcher.test(text) ) )
                    return {
                      label: text,
                      value: text,
                      option: this
                    };
                }) );
              },

              _removeIfInvalid: function( event, ui ) {

                // Selected an item, nothing to do
                if ( ui.item ) {
                  return;
                }

                // Search for a match (case-insensitive)
                var value = this.input.val(),
                  valueLowerCase = value.toLowerCase(),
                  valid = false;
                this.element.children( "option" ).each(function() {
                  if ( $( this ).text().toLowerCase() === valueLowerCase ) {
                    this.selected = valid = true;
                    return false;
                  }
                });
                // Found a match, nothing to do
                if ( valid ) {
                  return;
                }
                // Remove invalid value
                this.input
                  .val( "" )
                  .attr( "title", "No se encontro la busqueda \""+value+"\"." )
                  .tooltip( "open" );
                this.element.val( "" );
                this._delay(function() {
                  this.input.tooltip( "close" ).attr( "title", "" );
                }, 2500 );
                this.input.autocomplete( "instance" ).term = "";
              },
              _destroy: function() {
                this.wrapper.remove();
                this.element.show();
              }
            });
            $( "#comboboxVinculo" ).combobox();
        } );

        (function() {
            'use strict';
            window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('formModificarAlumno');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
            }, false);
        })(); 
        
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
    <script src="http://localhost:8084/SIASEP_TP/resources/js/direc_ModificarController.js" type="text/javascript"></script>
    <script src="http://localhost:8084/SIASEP_TP/resources/js/dirPagination.js" type="text/javascript"></script>     
</body>
</html>
