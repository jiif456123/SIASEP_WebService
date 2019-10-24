<!-- Navbar -->
<a id="show-sidebar" class="btn btn-sm btn-light" href="#">
    <i class="fas fa-bars"></i>
</a>
<nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
        <div class="sidebar-brand">
            <a href="#">SIASEP &nbsp;<span class="badge badge-pill badge-primary">Beta</span></a>
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
                    <input type="text" disabled class="form-control search-menu">
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
                <li><a id="pill_matricular_alumno" class="active" data-toggle="pill" href="#" onclick="window.location.href = 'http://localhost:8084/SIASEP_TP/resources/views/vDirectiva_Matricula.jsp'">
                        <i class="fa fa-book"></i><span>Matricular Alumno</span></a>
                </li>
                <li><a id="pill_generar_horario" data-toggle="pill" href="#" onclick="window.location.href = 'http://localhost:8084/SIASEP_TP/resources/views/vDirectiva_Modifica_Alumno.jsp'">
                        <i class="fa fa-book"></i><span>Modificar Alumno</span></a>
                </li>
                <li><a id="pill_generar_horario" data-toggle="pill" href="#Generar_horario">
                        <i class="fa fa-book"></i><span>Generar Horario</span></a>
                </li>
                <li><a id="pill_generar_libreta" data-toggle="pill" href="#Generar_Libreta">
                        <i class="fa fa-book"></i><span>Generar Libreta</span></a>
                </li>
                <li class="header-menu">
                    <span>Plan administrativo</span>
                </li>
                <li><a id="pill_gestionar_roles" data-toggle="pill" href="#Gestionar_Roles">
                        <i class="fa fa-folder"></i><span>Gestionar Roles</span></a>
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
            <i class="fa fa-power-off" style="color: #de5f38;" title="Cerrar Sesion"></i>
        </a>
    </div>
</nav>
<!-- Navbar -->