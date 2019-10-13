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
    .has-search .form-control {
        padding-left: 2.375rem;
    }
    .has-search .form-control-feedback {
        position: absolute;
        z-index: 2;
        display: block;
        width: 2.375rem;
        height: 2.375rem;
        line-height: 2.375rem;
        text-align: center;
        pointer-events: none;
        color: #aaa;
    }
    .btn-circle {
        width: 45px;
        height: 45px;
        line-height: 45px;
        text-align: center;
        padding: 0;
        border-radius: 50%;
    }

    .btn-circle i {
        position: relative;
        top: -1px;
    }

    .btn-circle-sm {
        width: 35px;
        height: 35px;
        line-height: 35px;
        font-size: 0.9rem;
    }

    .btn-circle-lg {
        width: 55px;
        height: 55px;
        line-height: 55px;
        font-size: 1.1rem;
    }

    .btn-circle-xl {
        width: 70px;
        height: 70px;
        line-height: 70px;
        font-size: 1.3rem;
    }
</style>
</head>
<body ng-app="myAdmin" ng-controller="directivaCtrl" class="fixed-sn">
    <div class="page-wrapper chiller-theme toggled">
        <%@include file="direc_navBarDirectiva.jsp"%>
        <!-- sidebar-wrapper  -->
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark default-color">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto"></ul>
                    <ul class="navbar-nav nav-flex-icons">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuB" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-book"></i> <span class="clearfix d-none d-sm-inline-block">Módulos</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuB">
                                <a class="dropdown-item" href="#" ng-click="navegaMatricularAlumno()">Matricular Alumno</a>
                                <a class="dropdown-item" href="#">Modificar Alumno</a>
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
                                <a class="dropdown-item" href="#" ng-click="cerrarSesion()" style="text-align: center;  ">
                                    <i class="fa fa-power-off" style="color: #de5f38;"></i>&nbsp;&nbsp;&nbsp;Cerrar sesión</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <main class="page-content">
            <div class="container">
                <div class="tab-pane fade show active" id="matricular_alumno" role="tabpanel" aria-labelledby="pill_matricular_alumno">

                    <div class="row pt-4" style="padding-bottom: 22px;">
                        <div class="col-lg-10" style="text-align: left;">
                            <h4>PASO #01: <span style="font-weight: lighter;">Seleccione un alumno en específico para la matrícula escolar</span></h4>
                            <label style="margin-top: 5px;">Se recomienda verificar minuciosamente los datos para corroborar la información presente del estudiante</label>
                        </div>
                        <div class="col-lg-2" style="text-align: right; padding-top: 5px;">
                            <button class="btn btn-danger btn-circle btn-circle-lg m-1" onclick="window.history.back();" title="Regresar al anterior paso"><i class="fa fa-arrow-left"></i></button>
                        </div>
                    </div>

                    <ul class="nav nav-tabs md-tabs" id="myTabMD" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="tab_Antiguos1" data-toggle="tab" href="#tab_Antiguos" role="tab" aria-controls="antiguo-md"
                               aria-selected="false">Antiguos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tab_Repetidos1" data-toggle="tab" href="#tab_Repetidos" role="tab" aria-controls="repetido-md"
                               aria-selected="false">Repetidos</a>
                        </li>
                    </ul>

                    <div class="tab-content card pt-5" id="myTabContentMD" style="padding-bottom: 30px;">
                        <div class="tab-pane fade show active" id="tab_Antiguos" role="tabpanel" aria-labelledby="antiguos-tab">
                            <div class="container-fluid" style="padding-bottom: 30px;">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-row" style="margin-bottom: 5px;">
                                            <div class="col-lg-9"></div>
                                            <div class="col-lg-3">
                                                <div class="form-group has-search">
                                                    <span class="fa fa-search form-control-feedback"></span>
                                                    <input type="text" ng-model="searchKeywordA" class="form-control">
                                                </div>

                                            </div>
                                        </div>
                                        <div style="position: relative; overflow: auto; display: block; height: 350px;">
                                            <table id="tablaAlumnoAntiguos" class="table table-bordered table-striped mb-0" style="width: 100%;" role="grid" aria-describedby="tabla-antiguos">
                                                <thead>
                                                    <tr role="row">
                                                        <th class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 75px;">Código</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 130px;">Nro. Documento</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" >Nombre Completo</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1">Grado Anterior</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1">Sección</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1">Nivel Academico</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 180px; text-align: center">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <tr class="even" dir-paginate="antiguo in listaAlumnosAntiguos | filter: searchKeywordA | itemsPerPage : 150">
                                                        <td tabindex="0" class="sorting_1">{{antiguo.codigo_alumno}}</td>
                                                        <td>{{antiguo.numero_documento}}</td>
                                                        <td>{{antiguo.nombre_completo_alumno}}</td>
                                                        <td>{{antiguo.ref_grado_anterior}}</td>
                                                        <td>{{antiguo.ref_seccion}}</td>
                                                        <td>{{antiguo.ref_nivel}}</td>
                                                        <td class="text-center">
                                                            <button class="btn btn-success btn-sm" data-toggle="modal" data-target=".modalMatricula" title="Crear Matricula"
                                                                    data-ng-click="rellenarDatosAlumno($event)" value="{{antiguo.id_per_alumno}}">
                                                                <span class="fa fa-check"></span>&nbsp;&nbsp;&nbsp;Matricular</button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <dir-pagination-controls
                                                    max-size="150"
                                                    direction-links="true"
                                                    boundary-links="true">
                                                </dir-pagination-controls>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab_Repetidos" role="tabpanel" aria-labelledby="repetidos-tab">
                            <div class="container-fluid" style="padding-bottom: 30px;">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-row" style="margin-bottom: 5px;">
                                            <div class="col-lg-9"></div>
                                            <div class="col-lg-3">
                                                <div class="form-group has-search">
                                                    <span class="fa fa-search form-control-feedback"></span>
                                                    <input type="text" ng-model="searchKeywordA" class="form-control">
                                                </div>

                                            </div>
                                        </div>
                                        <div style="position: relative; overflow: auto; display: block; height: 350px;">
                                            <table id="tablaAlumnoRepetidos" class="table table-bordered table-striped mb-0" style="width: 100%;" role="grid" aria-describedby="tabla-repetidos">
                                                <thead>
                                                    <tr role="row">
                                                        <th class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 75px;">Código</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 130px;">Nro. Documento</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" >Nombre Completo</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1">Grado Anterior</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1">Sección</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1">Nivel Academico</th>
                                                        <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 180px; text-align: center">Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <tr class="even" dir-paginate="repetido in listaAlumnosRepetidos | filter: searchKeywordA | itemsPerPage : 150">
                                                        <td tabindex="0" class="sorting_1">{{repetido.codigo_alumno}}</td>
                                                        <td>{{repetido.numero_documento}}</td>
                                                        <td>{{repetido.nombre_completo_alumno}}</td>
                                                        <td>{{repetido.ref_grado_anterior}}</td>
                                                        <td>{{repetido.ref_seccion}}</td>
                                                        <td>{{repetido.ref_nivel}}</td>
                                                        <td class="text-center">
                                                            <button class="btn btn-success btn-sm" data-toggle="modal" data-target=".modalMatricula" title="Crear Matricula"
                                                                    data-ng-click="rellenarDatosAlumno($event)" value="{{repetido.id_per_alumno}}">
                                                                <span class="fa fa-check"></span>&nbsp;&nbsp;&nbsp;Matricular</button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <dir-pagination-controls
                                                    max-size="150"
                                                    direction-links="true"
                                                    boundary-links="true">
                                                </dir-pagination-controls>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </main>

        <div class="modal fade bd-example-modal-lg modalMatricula" tabindex="-1" role="dialog" aria-labelledby="matricula-modal" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="container-fluid text-center">
                            <h4>PASO #02: <span style="font-weight: lighter;">Habilitar la matricula escolar al alumno seleccionado</span></h4>
                            <label style="margin-top: 5px;">Se autogenera los datos de la matricula y las fechas correspondientes de este año.</label>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="formMatricula" novalidate>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="form-row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="txtCodigoEstudiante">Codigo del estudiante (*)</label>
                                            <input type="text" class="form-control" id="txtCodigoEstudiante" aria-describedby="codigoEstudiante" readonly
                                                   ng-model="modCodAlumno">
                                            <small id="emailHelp" class="form-text text-muted">Este casillero es obligatorio.</small>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label for="txtNombreCompleto">Nombre Completo (*)</label>
                                            <input type="text" class="form-control" id="txtNombreCompleto" aria-describedby="nombreCompletoAlumno" readonly 
                                                   ng-model="modNombreAlumno">
                                            <small id="emailHelp" class="form-text text-muted">Este casillero es obligatorio.</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="txtCodigoMatricula">Codigo de matricula(*)</label>
                                            <input type="text" class="form-control" id="txtCodigoMatricula" aria-describedby="codigoMatricula" readonly
                                                   ng-model="modCodMatricula">
                                            <small id="emailHelp" class="form-text text-muted">Este casillero es obligatorio.</small>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="txtFechaRealizada">Fecha realizada (*)</label>
                                            <input type="text" class="form-control" id="txtFechaRealizada" aria-describedby="fechaRealizada" readonly 
                                                   ng-model="modFecRealizada">
                                            <small id="emailHelp" class="form-text text-muted">Este casillero es obligatorio.</small>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="txtPeriodoEscolar">Periodo Escolar</label>
                                            <input type="text" class="form-control" id="txtPeriodoEscolar" aria-describedby="periodoEscolar" readonly 
                                                   ng-model="modPeriodoEscolar">
                                            <small id="date" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="txtObservacion">Observación (*)</label>
                                            <textarea class="form-control" id="txtObservacion" rows="6" required ng-model="modObservacionSet" 
                                                      placeholder="Escribe un comentario.." maxlength="254" minlength="8"></textarea>
                                            <div class="valid-feedback">
                                                Se escribio correctamente este casillero.
                                            </div>
                                            <div class="invalid-feedback">
                                                Debe contener minimo 8 a 200 caracteres para que sea valido la observacion
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-success" data-ng-click="insertarMatricula($event)" value="{{getDatosMatr.id_per_alumno}}-{{getDatosMatr.id_top_periodo}}">Aceptar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

        
        <%@include file="foot.jspf" %>
    <script>
                (function() {
                    'use strict';
                    window.addEventListener('load', function() {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('formMatricula');
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
    <script src="http://localhost:8084/SIASEP_TP/resources/js/directivaController.js" type="text/javascript"></script>
    <script src="http://localhost:8084/SIASEP_TP/resources/js/dirPagination.js" type="text/javascript"></script>     
</body>
</html>
