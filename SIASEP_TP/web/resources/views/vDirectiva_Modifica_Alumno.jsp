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

</style>
</head>
<body ng-app="myModificaMatr" ng-controller="modificaMatrCtrl" class="fixed-sn">
    <div class="page-wrapper chiller-theme toggled">
        <%@include file="navBarDirectiva.jsp"%>
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
                                <a class="dropdown-item" href="#" ng-click="cerrarSesion()" style="text-align: center;">
                                     <i class="fa fa-power-off" style="color: #de5f38;"></i>&nbsp;&nbsp;&nbsp;Cerrar sesión</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <form class="formularioMatricula">
            <main class="page-content">
                <div class="container-fluid">
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="Administrar_matricula" role="tabpanel" aria-labelledby="pill_administrar_matricula">

                            <div class="row ">
                                <div class="col-lg-1">&nbsp;</div>
                                <div class="col-lg-9">
                                    <ul class="nav nav-tabs md-tabs" id="myTabMD" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="datos-alumno-md" data-toggle="tab" href="#datos-alumno" role="tab" aria-controls="datos-alumno"
                                               aria-selected="true" style="font-weight: bold; color: #1e2229;">DATOS DEL ALUMNO</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="datos-familiar-md" data-toggle="tab" href="#datos-familiar" role="tab" aria-controls="datos-familiar"
                                               aria-selected="false" style="font-weight: bold; color: #1e2229;">DATOS DEL FAMILIAR</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content card pt-4" id="myTabContentMD" style="padding: 0px 10px 0px 10px;">
                                        <div class="tab-pane fade show active" id="datos-alumno" role="tabpanel" aria-labelledby="datos-alumno-md" style="padding-bottom: 30px;">
                                            <div class="container-fluid">
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
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="datos-familiar" role="tabpanel" aria-labelledby="datos-familiar-md">
                                            <div class="container-fluid">
                                                <div class="form-row pt-3">
                                                    <div class="col" style="text-align: left;">
                                                        <button class="btn btn-info btn-md" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="fa fa-plus"></i>&nbsp;&nbsp;&nbsp;Agregar un vinculo</button>
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
                                                                    <th scope="col">Celular de Emergencia</th>
                                                                    <th scope="col">Ocupación</th>
                                                                    <th scope="col">¿Es Apoderado?</th>
                                                                    <th scope="col">Acciones</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>Mark</td>
                                                                    <td>Otto</td>
                                                                    <td>@mdo</td>
                                                                    <td>@mdo</td>
                                                                    <td>@mdo</td>
                                                                    <td>@mdo</td>
                                                                    <td class="text-center"><button class="btn btn-mdb-color btn-sm"><span class="fa fa-pencil-square-o"></span></button> <button class="btn btn-danger btn-sm"><span class="fa fa-trash"></span></button></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <p style="font-weight: lighter;">*Nota: Solo se considera un apoderado por alumno matriculado</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2 text-center" style="padding-top: 32px;">
                                    <button type="submit" class="btn btn-lg btn-success">MATRICULAR</button>
                                    <br>
                                    <a class="btn btn-lg btn-danger" href = "javascript:history.back()">CANCELAR</a>
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

            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="form-group row">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Ingrese:</label>
                                <div class="col-sm-7">
                                    <input type="email" class="form-control" id="inputEmail3" placeholder="Nro. Documento">
                                </div>
                                <div class="col-sm-3">
                                    <button type="submit" class="btn btn-outline-light-blue btn-sm">Buscar</button>
                                </div>
                            </div>
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
                                               aria-controls="v-pills-messages" aria-selected="false">Datos Laborales y Otros</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-10">
                                        <div class="tab-content" id="v-pills-tabContent">
                                            <div class="tab-pane fade show active" id="datos_personales" role="tabpanel" aria-labelledby="datos_personales-tab">
                                                <div class="form-row">
                                                    <div class="col">
                                                        <h3 style="font-weight: lighter;">Datos Personales</h3>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">¿ES APODERADO? (*)</label>
                                                            <input type="checkbox" checked data-toggle="toggle" data-style="ios" data-on="SI" data-off="NO">
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleSelect1">Tipo de Documento (*)</label>
                                                            <select class="md-form" id="exampleSelect1">
                                                                <option>DNI</option>
                                                                <option>PASAPORTE</option>
                                                            </select>
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Numero de Documento (*)</label>
                                                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleSelect1">Estado Civil (*)</label>
                                                            <select class="form-control" id="exampleSelect1">
                                                                <option>A -</option>
                                                                <option>A +</option>
                                                                <option>B -</option>
                                                                <option>B +</option>
                                                                <option>AB -</option>
                                                                <option>AB +</option>
                                                                <option>O -</option>
                                                                <option>O +</option>
                                                            </select>
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Primer Nombre (*)</label>
                                                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Apellido Paterno (*)</label>
                                                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Apellido Materno (*)</label>
                                                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="example-date-input">Fecha de Nacimiento (*)</label>
                                                            <input class="form-control" type="date" value="2011-08-19" id="example-date-input">
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleSelect1">Lugar de Nacimiento (*)</label>
                                                            <select class="form-control" id="exampleSelect1">
                                                                <option>A -</option>
                                                                <option>A +</option>
                                                                <option>B -</option>
                                                                <option>B +</option>
                                                                <option>AB -</option>
                                                                <option>AB +</option>
                                                                <option>O -</option>
                                                                <option>O +</option>
                                                            </select>
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group" style="text-align: left;">
                                                            <label for="relSexo">Sexo (*)</label>
                                                            <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                                                                <div class="row" style="padding-top: 8px;">
                                                                    <div class="col-lg-6" style="text-align: right;">
                                                                        <div class="form-check-inline" style="text-align: right;">
                                                                            <label class="form-check-label" style="font-size: 13px;">
                                                                                <input type="radio" class="form-check-input" name="optradio">Hombre
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6" style="text-align: left;">
                                                                        <div class="form-check-inline" style="text-align: left;">
                                                                            <label class="form-check-label" style="font-size: 13px;">
                                                                                <input type="radio" class="form-check-input" name="optradio">Mujer
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
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
                                                                    <label for="exampleSelect1">Distrito (*)</label>
                                                                    <select class="selectpicker form-control" data-live-search="true" 
                                                                            id="exampleSelect1" data-width="96%" data-size="7">
                                                                        <option>San Juan de Miraflores</option>
                                                                        <option>San Juan de Miraflores</option>
                                                                        <option>San Juan de Miraflores</option>
                                                                        <option>San Juan de Miraflores</option>
                                                                        <option>San Juan de Miraflores</option>
                                                                        <option>San Juan de Miraflores</option>
                                                                        <option>San Juan de Miraflores</option>
                                                                        <option>San Juan de Miraflores</option>
                                                                        <option>San Juan de Miraflores</option>
                                                                    </select>
                                                                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-7">
                                                        <div class="form-row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label for="exampleInputEmail1">Telefono de Casa</label>
                                                                    <input type="text" class="form-control" id="exampleInputEmail1" style="margin-top: 12px;"
                                                                           aria-describedby="emailHelp" placeholder="Enter email">
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label for="exampleInputEmail1">Celular de Emergencia (*)</label>
                                                                    <input type="text" class="form-control" id="exampleInputEmail1" style="margin-top: 12px;"
                                                                           aria-describedby="emailHelp" placeholder="Enter email">
                                                                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="form-row" style="padding-top: 10px;">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Dirección del hogar (*)</label>
                                                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Correo electrónico</label>
                                                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="example123@gmail.com">
                                                        </div>
                                                    </div>
                                                </div> 
                                            </div>
                                            <div class="tab-pane fade" id="datos_laborales" role="tabpanel" aria-labelledby="datos_laborales-tab">
                                                <h3 style="font-weight: lighter;">Datos Laborales</h3>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleSelect1">Tipo de Familiar (*)</label>
                                                            <select class="form-control" id="exampleSelect1">
                                                                <option>A -</option>
                                                                <option>A +</option>
                                                                <option>B -</option>
                                                                <option>B +</option>
                                                                <option>AB -</option>
                                                                <option>AB +</option>
                                                                <option>O -</option>
                                                                <option>O +</option>
                                                            </select>
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group" style="text-align: left;">
                                                            <label for="relSexo">¿Entregó Copia de DNI? (*)</label>
                                                            <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                                                                <div class="row" style="padding-top: 8px;">
                                                                    <div class="col-lg-6" style="text-align: right;">
                                                                        <div class="form-check-inline" style="text-align: right;">
                                                                            <label class="form-check-label" style="font-size: 14px;">
                                                                                <input type="radio" class="form-check-input" name="optradio">SI
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6" style="text-align: left;">
                                                                        <div class="form-check-inline" style="text-align: left;">
                                                                            <label class="form-check-label" style="font-size: 14px;">
                                                                                <input type="radio" class="form-check-input" name="optradio">NO
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio marcar una de las opciones.</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleSelect1">Grado de instruccion (*)</label>
                                                            <select class="form-control" id="exampleSelect1" style="margin-top: 12px;">
                                                                <option>A -</option>
                                                                <option>A +</option>
                                                                <option>B -</option>
                                                                <option>B +</option>
                                                                <option>AB -</option>
                                                                <option>AB +</option>
                                                                <option>O -</option>
                                                                <option>O +</option>
                                                            </select>
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Ocupación</label>
                                                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
                                                                   placeholder="example123@gmail.com" style="margin-top: 12px;">
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label for="exampleSelect1">Centro de Labores (*)</label>
                                                            <select class="selectpicker form-control" data-live-search="true" 
                                                                    id="exampleSelect1" data-width="96%" data-size="7">
                                                                <option>San Juan de Miraflores</option>
                                                                <option>San Juan de Miraflores</option>
                                                                <option>San Juan de Miraflores</option>
                                                                <option>San Juan de Miraflores</option>
                                                                <option>San Juan de Miraflores</option>
                                                                <option>San Juan de Miraflores</option>
                                                                <option>San Juan de Miraflores</option>
                                                                <option>San Juan de Miraflores</option>
                                                                <option>San Juan de Miraflores</option>
                                                            </select>
                                                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
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
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary">Vincular existente</button>
                            <button type="button" class="btn btn-primary">Registrar nuevo</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>                                         

    </div>
    <!--Modal: Login / Register Form-->
    <%@include file="foot.jspf" %>
    <script>
        (function() {
            'use strict';
            window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('formularioMatricula');
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
