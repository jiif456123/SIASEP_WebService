<!-- Navbar -->
<a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
    <i class="fas fa-bars"></i>
</a>
<nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
        <div class="sidebar-brand">
            <a href="#">SIAVIE &nbsp;<span class="badge badge-pill badge-primary">Beta</span></a>
            <div id="close-sidebar">
                <i class="fas fa-times"></i>
            </div>
        </div>
        <div class="sidebar-header" ng-init="getInfoUsuario()">
            <div class="user-pic">
                <img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="User picture" style="height: 59px;">
            </div>
            <div class="user-info">
                <span class="user-name">
                    <strong>{{nombre}}</strong>&nbsp;<strong>{{apellido}}</strong>
                </span>
                <span class="user-role">{{tipousuario}}</span>
                <span class="user-status">
                    <i class="fa fa-circle"></i>
                    <span>En linea</span>
                </span>
            </div>
        </div>
        <!-- sidebar-header  -->
        <div class="sidebar-search">
            <div>
                <div class="input-group">
                    <input type="text" class="form-control search-menu" placeholder="Buscar algo...">
                    <div class="input-group-append">
                        <span class="input-group-text">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- sidebar-search  -->
        <div class="sidebar-menu">
            <ul class="nav nav-pills">
                <li class="header-menu">
                    <span>General</span>
                </li>
                <li><a id="pill_calificar_alumno active" data-toggle="pill" href="#califica-alumno">
                        <i class="fa fa-book"></i><span>Calificar Alumnos</span><span class="badge badge-pill badge-warning">Nuevo</span></a>
                </li>
                <li><a id="pill_registrar_asistencia" data-toggle="pill" href="#registra-asistencia">
                        <i class="fa fa-book"></i><span>Registrar Asistencia</span></a>
                </li>
                <li><a href="#">
                        <i class="fa fa-folder"></i><span>Reportar Incidencia</span></a>
                </li>
                <li><a href="#">
                        <i class="fa fa-book"></i><span>Gestionar Q&A del Foro</span></a>
                </li>
                <li><a href="#">
                        <i class="fa fa-folder"></i><span>Reservar Aula de Innovación</span></a>
                </li>
                <li><a href="#">
                        <i class="fa fa-folder"></i><span>Reportar Incidencia</span></a>
                </li>
                <li><a href="#">
                        <i class="fa fa-calendar"></i><span>Organizar Agenda Virtual</span></a>
                </li>
                <li><a href="#">
                        <i class="fa fa-book"></i><span>Usar Repositorio SIAVIE</span></a>
                </li>
            </ul>
        </div>
        <!-- sidebar-menu  -->
    </div>
    <!-- sidebar-content  -->
    <div class="sidebar-footer" style="padding-top: 12px;">
        <a href="#">
            <i class="fa fa-bell"></i>
        </a>
        <a href="#">
            <i class="fa fa-envelope"></i>
        </a>
        <a href="#">
            <i class="fa fa-cog"></i>
        </a>
        <a ng-click="cerrarSesion()">
            <i class="fa fa-power-off" style="color: #de5f38;"></i>
        </a>
    </div>
</nav>
<!-- Navbar -->