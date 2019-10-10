var app = angular.module("myAdmin",['ngStorage','angularUtils.directives.dirPagination']);

app.controller("directivaCtrl", function($scope, $http, $window) {
    
    var sesionCodigoUsuario = sessionStorage.getItem('idUsuarioLogged');
    var sesionNombreTipo = sessionStorage.getItem('tipoUsuario');
    var sesionTipoUsuario = sessionStorage.getItem('fkidTipoUsuario');

    //NAVEGA DESDE EL MODULO O EL NAVBAR LLENDO A "MATRICULAR ALUMNO"
    $scope.navegaDirectivaAlumno = function() {
       $window.location.href = '/SIASEP_TP/resources/views/direc_vDirectiva_Alumnos.jsp';
       $scope.getInfoUsuario();
    };
    $scope.navegaAdminMatricula = function() {
       $window.location.href = '/SIASEP_TP/resources/views/direc_vDirectiva_matricula.jsp';
       $scope.getInfoUsuario();
    };
    
    //CONTROLA LOS DEMAS METODOS GET Y CARGA DE DATOS
    $scope.getInfoUsuario = function() {
        $scope.nombre = sessionStorage.getItem('nombreUsuario');
        $scope.apellido = sessionStorage.getItem('apellidoUsuario');
        $scope.tipousuario = sesionNombreTipo;
        $scope.getListaPeriodos();
        $scope.getListaMatHabilitado();
        $scope.getListaMatDeshabilitado();
        $scope.getListaHistorialMatr();
        
        $scope.getListaAlumnosAntiguos();
        $scope.getListaAlumnosRepetidos();
    };

    $scope.sort = function(keyname){
        $scope.sortKey = keyname;   //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    };
    
    $scope.getListaPeriodos = function() {
        $scope.selectedPeriodoIdHabilitado = 1; //ES EL AÑO ACTUAL SEGUN LA BASE DE DATOS
        $scope.selectedPeriodoIdDeshabilitado = 1; //ES EL AÑO ACTUAL SEGUN LA BASE DE DATOS
        $http({
            method: 'GET',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/listaPeriodoSelect',
            data: { }
        }).then(function successCallback(response) {
            $scope.listaPeriodos = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosAntiguos");
        });
    };
    $scope.getListaMatHabilitado = function() {
        var idPeriodo = $scope.selectedPeriodoIdHabilitado;
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/refrescaListaMatrHabilitado',
            data: { fkid_periodo_anual : idPeriodo }
        }).then(function successCallback(response) {
            $scope.listaMatHabilitado = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosAntiguos");
        });
    };
    $scope.getListaMatDeshabilitado = function() {
        var idPeriodo = $scope.selectedPeriodoIdDeshabilitado;
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/refrescaListaMatrDeshabilitado',
            data: { fkid_periodo_anual : idPeriodo }
        }).then(function successCallback(response) {
            $scope.listaMatDeshabilitado = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosAntiguos");
        });
    };
    $scope.getListaHistorialMatr = function() {
//        $http({
//            method: 'GET',
//            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/getListaHistorialMatricula',
//            data: { }
//        }).then(function successCallback(response) {
//            $scope.listaHistorialMatricula = response.data;
//        }, function errorCallback(response) {
//            alert("ERROR getListaAlumnosAntiguos");
//        });
    };
    $scope.abrirModalAgregaObs = function() {
        var dataparaEstado = event.currentTarget.value.split('-');
        var idMatricula = parseInt(dataparaEstado[0]);
        var idEstadoMatricula = parseInt(dataparaEstado[1]);
        
        $scope.cambiaEstadoMatricula = function() {
            var txtObsMatricula = $scope.txtObsMatricula;
            $http({
                method: 'POST',
                url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/cambiaEstadoMatr',
                data: { id_matricula : idMatricula,
                        fkid_estado_matricula : idEstadoMatricula,
                        dscrp_observacion : txtObsMatricula
                }
            }).then(function successCallback(response) {
                alert("Se ejecuto dicho cambio.");
                $scope.getInfoUsuario();
            }, function errorCallback(response) {
                alert("cambiaEstadoMatricula no funciona ERROOR");
            });
        };
    };
    $scope.verObservacion = function() {
        var idMatricula = event.currentTarget.value;
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/verObservacionMatricula',
            data: { id_matricula : idMatricula }
        }).then(function successCallback(response) {
            $scope.datosObservacion = response.data;
        }, function errorCallback(response) {
            alert("cambiaEstadoMatricula no funciona ERROOR");
        });
    };
    
    
    $scope.eliminaMatricula = function() {
        var idMatricula = event.currentTarget.value;
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/eliminarMatriculaAlumno',
            data: { id_matricula : idMatricula  }
        }).then(function successCallback(response) {
            alert("Se elimino correctamente la matricula seleccionada.");
            $scope.getListaMatHabilitado();
            $scope.getListaMatDeshabilitado();
            $scope.getListaHistorialMatr();
        }, function errorCallback(response) {
            alert("cambiaEstadoMatricula no funciona ERROOR");
        });
    };
    
    
    $scope.getListaAlumnosAntiguos = function() {
        $http({
            method: 'GET',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/getListaAlumnosAntiguos',
            data: { }
        }).then(function successCallback(response) {
            $scope.listaAlumnosAntiguos = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosAntiguos");
        });
    };
    $scope.getListaAlumnosRepetidos = function() {
        $http({
            method: 'GET',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/getListaAlumnosRepetido',
            data: { }
        }).then(function successCallback(response) {
            $scope.listaAlumnosRepetidos = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosRepetidos");
        });
    };
    $scope.rellenarDatosAlumno = function() {
        var idPerAlumno = event.currentTarget.value;
        var primeracadena = 'MT';
        var segundacadena = Math.floor(Math.random() * 999999 + 1);
        var res = primeracadena.concat(segundacadena);
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/getDatosGeneradosMatr',
            data: { id_per_alumno : idPerAlumno }
        }).then(function successCallback(response) {
            $scope.modCodAlumno = response.data.codigo_alumno;
            $scope.modNombreAlumno = response.data.nombre_alumno;
            $scope.modCodMatricula = res;
            $scope.modFecRealizada = response.data.fecha_actual;
            $scope.modPeriodoEscolar = response.data.top_periodo;
            $scope.getDatosMatr = response.data;
        }, function errorCallback(response) {
            alert("cambiaEstadoMatricula no funciona ERROOR");
        });
    };
    //Aqui se registra la matricula con los datos obtenidos;
    $scope.insertarMatricula = function() {                 
        var dataPartido = event.currentTarget.value.split('-');
        var idPerAlumno = parseInt(dataPartido[0]);                 //de aca saco la id de periodo escolar     //idusuario->idpersona->idtrabajador
        var idPeriodoAnual = parseInt(dataPartido[1]);              //se setea el estado de matricula
        var codigoAlumno = $scope.modCodAlumno;                     //de aca saco la id per alumno             //observacion
        var codigoMatricula = $scope.modCodMatricula;               //codigo de matricula                      //la fec modificacion es igual de creacion
        var fechaRealizada = $scope.modFecRealizada;               //fecha realizada                          //del id de alumno sacar la id matricula
        var observacionSet = $scope.modObservacionSet;    
        var estadoMatriculaDefault = 1;
                                                            
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/crearMatriculaDatos',
            data: { codigo_matricula : codigoMatricula,
                    fec_realizada : fechaRealizada,
                    id_per_alumno : idPerAlumno,
                    id_estado_matricula : estadoMatriculaDefault,
                    id_periodo_anual : idPeriodoAnual,
                    fec_modificacion : fechaRealizada,
                    dscrp_observacion : observacionSet,
                    id_usuario : sesionCodigoUsuario
                }
        }).then(function successCallback(response) {
            alert("Se registro correctamente la matricula.");
            $window.location.href = '/SIASEP_TP/resources/views/direc_vDirectiva_matricula.jsp';
            $scope.getInfoUsuario();
        }, function errorCallback(response) {
            alert("insertarMatricula no funciona ERROOR");
        });
    };
    
    
    $scope.controlFormAlumno = function() {
        $window.location.href = '/SIASEP_TP/resources/views/forms/direc_formAlumno.jsp';
//        $http({
//            method: 'POST',
//            url: 'http://localhost:8084/SIASEP_TP/webresources/login/loginUsuario',
//            data: { username   : nombreUsuario,
//                    password  :   passwordUsuario
//            }
//        }).then(function successCallback(response) {
//            sessionStorage.setItem('idUsuarioLogged', response.data.id_usuario);
//            sessionStorage.setItem('fkidTipoUsuario', response.data.id_tipo_usuario);
//            if(sessionStorage.getItem("idUsuarioLogged") !== "") {
//                if(sessionStorage.getItem("fkidTipoUsuario") === "5") {
//                    sessionStorage.setItem('nombreUsuario', response.data.primer_nombre);
//                    sessionStorage.setItem('apellidoUsuario', response.data.apellido_paterno);
//                    sessionStorage.setItem('tipoUsuario', response.data.nom_tipo_usuario);
//                    $window.location.href = '/SIASEP_TP/resources/views/alu_vAlumno.jsp';
//                }
//            } else {
//                alert("Nombre de usuario / password invalido.");
//            }
//        });
    };

    
    //LogOut
    $scope.cerrarSesion = function() {
        sessionStorage.clear();
        $window.location.href = '/SIASEP_TP/';
    };
    
});
