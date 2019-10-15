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
    <body ng-app="myTeacher" ng-controller="docenteCtrl">
        <div class="page-wrapper chiller-theme toggled">
            <%@include file="doc_navBarDocente.jsp"%>
            
            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <div class="container-fluid">

                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="califica-alumno" role="tabpanel" aria-labelledby="pill_calificar_alumno">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form action="#" th:action="@{/loginUsuario/actualizaHilo}" th:object="${formHilo}" method="post">
                                        <h3>Modulo Academico - Calificar Alumnos</h3>
                                        <div class="row text-center" style="padding-bottom: 15px; font-size: 10px; padding-top: 10px;">
                                            <div class="col-lg-3">
                                                <select class="form-control" required>
                                                    <option hidden value="0">Cursos del docente</option>
                                                    <option ng-repeat="cursos in listaCursos" value="{{cursos.codigo_curso_docente}}-{{cursos.codigo_curso}}">{{cursos.nombre_curso}}</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-1">
                                                <span style="font-size: 25px; font-weight: bold;"> > </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <select class="form-control" th:field="*{id_Asignacion}" required>
                                                    <option hidden value="0">Grado/Nivel/Seccion</option>
                                                    <option th:each="gns : ${listaGNS}" th:value="${gns.id_Asignacion}" th:text="${gns.salonCompleto}" value="0"></option>
                                                </select>
                                            </div>
                                            <div class="col-lg-1">
                                                <span style="font-size: 25px; font-weight: bold;"> > </span>
                                            </div>
                                            <div class="col-lg-2">
                                                <select class="form-control" th:field="*{id_Trimestre}" required>
                                                    <option hidden value="0"># Ciclo trimestral</option>
                                                    <option th:each="trim : ${listaTrimestre}" th:value="${trim.id_Trimestre}" th:text="${trim.nombre_Trimestre}" value="0"></option>
                                                </select>
                                            </div>
                                            <div class="col-lg-2">
                                                <button type="submit" name="noReq" value="actualizaHilo" class="btn btn-warning">Actualizar hilo</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="container-fluid" style="padding-top: 30px;">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="row" style="padding-bottom: 12px;">
                                                <div class="col-lg-12">
                                                    <form action="#" th:action="@{/loginUsuario/abrirTrimestre}" th:object="${formTrimestre}" method="post">
                                                        <h4 class="font-weight-light" th:text="${datoAsigCurso}" style="margin-bottom: 10px;"></h4>
                                                        <button type="submit" name="noReq" value="nuevoTrimestre" class="btn btn-info" th:disabled="${condicion == 2}">
                                                                Nuevo Trimestre&nbsp;<span class="fa fa-plus-circle"></span></button>
                                                    </form> 
                                                </div>
                                            </div>
                                            <div class="card" style="height: 250px;">
                                                <div class="card-body">
                                                    <div class="form-group text-center" style="padding-top: 8px;">
                                                        <form action="#" th:action="@{/loginUsuario/setEvaluacionTrim}" th:object="${formEvaluacion}" method="post">
                                                            <div class="form-row">
                                                                <div class="form-group col-lg-2" style="padding-left: 15px;">
                                                                    <p class="font-weight-light" style="text-align: left;">Ingrese en el formulario: <br>
                                                                        - Tema del curso <br>
                                                                        - Tipo de evaluacion <br>
                                                                        - Fecha a realizar <br>
                                                                        - Descripcion</p>
                                                                </div>  
                                                                <div class="form-group col-lg-3">
                                                                    <input class="form-control" type="text" placeholder="Tema del Curso" required th:field="*{especificacion_Tema}"> 
                                                                    <select class="form-control" style="margin-top: 10px; margin-bottom: 10px;" required th:field="*{nombre_Tipo_Evaluacion}">
                                                                        <option hidden value="0">Tipo de evaluación</option>
                                                                        <option th:each="lte : ${listaTipoEvaluacion}" th:value="${lte.idTipoEvaluacion}" th:text="${lte.nombreTipoEvaluacion}" value="0"></option>
                                                                    </select>
                                                                    <input class="form-control" type="date" value="" id="example-datetime-local-input" required th:field="*{fecha_Evalua}">
                                                                </div>
                                                                <div class="form-group col-lg-5" style="text-align: center;">
                                                                    <textarea type="text" class="form-control" id="descripcion" 
                                                                              placeholder="Escribe una descripcion acerca de la evaluacion." style="height: 136px;" 
                                                                              required th:field="*{descripcion_Evaluacion}"></textarea>
                                                                </div>
                                                                <div class="form-group col-lg-2" style="padding-top: 10px;">
                                                                    <button type="submit" name="action" value="insertarColumna" class="btn btn-primary" style="margin-top: 5px;">Insertar Columna</button>
                                                                    <hr>
                                                                    <button type="submit" name="action" value="agregarNota" class="btn btn-success">Agregar Nota</button>
                                                                </div>  
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <table class="table" style="margin-top: 40px; font-size: 14px;">
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th scope="col">Nombre completo del alumno</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr th:each="alumr : ${listaRegistroAlumnos}">
                                                                <td th:text="${alumr.nombreCompleto}"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-lg-9">
                                                    <table class="table" style="margin-top: 40px; font-size: 14px;">
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th th:each="nomb : ${listaNombreNotas}" scope="col" th:text="${nomb.nombre_Corto}"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr th:each="alumr : ${listaRegistroAlum}">
                                                                <td th:each="nta : ${listaNotasAlumno}" th:text="${nta.nota}">Mark</td>
                                                            </tr>
                                                        </tbody>

                                                    </table>
                                                </div>
                                            </div>

                                            <div class="row" style="padding-top: 30px;">
                                                <div class="col-lg-12">
                                                    <h5 class="font-weight-light">Lista de evaluaciones registrados</h5>
                                                    <table class="table" style="margin-top: 15px;">
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th scope="col">Termino</th>
                                                                <th scope="col">Tipo de Evaluacion</th>
                                                                <th scope="col">Especificacion del Tema</th>
                                                                <th scope="col">Descripción de la evaluación</th>
                                                                <th scope="col">Fecha de evaluación</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr th:each="eval : ${listaResumenEvaluaciones}">
                                                                <td th:text="${eval.nombre_Corto}"></td>
                                                                <td th:text="${eval.nombre_Tipo_Evaluacion}"></td>
                                                                <td th:text="${eval.especificacion_Tema}"></td>
                                                                <td th:text="${eval.descripcion_Evaluacion}"></td>
                                                                <td th:text="${eval.fecha_Evalua}"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="registra-asistencia" role="tabpanel" aria-labelledby="pill_registrar_asistencia">
                            EN DESARROLLO..
                        </div>
                    </div>
                                                            
                    <div class="modal fade modalComunicado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="position: fixed;  top: -13%;">
                        <div class="modal-dialog cascading-modal" role="document">
                            <div class="modal-content">
                                <div style="background-color: #eeeeee;border-color: #4c4f53; border-style: solid; padding: 40px;">
                                    <!--Modal cascading tabs-->
                                    <div class="modal-c-tabs" style="overflow-y: scroll;">
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
        <script src="http://localhost:8084/ProyectoSIAVIE/resources/js/docenteController.js" type="text/javascript"></script>
        <script src="http://localhost:8084/ProyectoSIAVIE/resources/js/dirPagination.js" type="text/javascript"></script>     
    </body>
</html>
