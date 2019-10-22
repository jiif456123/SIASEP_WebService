var app = angular.module("myMatricula",['ngStorage','angularUtils.directives.dirPagination']);

app.controller("matriculaCtrl", function($scope, $http, $window) {
    
//    var sesionCodigoUsuario = sessionStorage.getItem('idUsuarioLogged');
//    var sesionNombreTipo = sessionStorage.getItem('tipoUsuario');
//    var sesionTipoUsuario = sessionStorage.getItem('fkidTipoUsuario');

    var sesionCodigoUsuario = '2';
    var sesionNombreTipo = 'Dpto. Secretaria';
    var sesionTipoUsuario = sessionStorage.getItem('fkidTipoUsuario');

    //NAVEGA DESDE EL MODULO O EL NAVBAR LLENDO A "MATRICULAR ALUMNO"
    $scope.navegaPasoNro1 = function() {
        $window.location.href = '/SIASEP_TP/resources/views/forms/vDirectiva_Matricula_Paso1.jsp';
        $scope.getInfoUsuario();
    };
    
    //CONTROLA LOS DEMAS METODOS GET Y CARGA DE DATOS
    $scope.getInfoUsuario = function() {
        $scope.nombre = 'Ricardo';
        $scope.apellido = 'Villanueva';   
//        $scope.nombre = sessionStorage.getItem('nombreUsuario');
//        $scope.apellido = sessionStorage.getItem('apellidoUsuario');
        $scope.tipousuario = sesionNombreTipo;
        $scope.getListaPeriodos();
        $scope.getListaMatHabilitado();
        $scope.getListaMatDeshabilitado();
        $scope.getListaHistorialMatr();
        
        $scope.getListaAlumnosAntiguos();
        $scope.getListaAlumnosRepetidos();
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
            alert("ERROR getListaMatDeshabilitado");
        });
    };
    
    $scope.getListaHistorialMatr = function() {
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/getListaHistorialMatricula',
            data: { id_usuario : sesionCodigoUsuario }
        }).then(function successCallback(response) {
            $scope.listaHistorialMatricula = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaHistorialMatr");
        });
    };
    
    $scope.abrirModalAgregaObs = function() {
        var dataparaEstado = event.currentTarget.value.split('-');
        var idMatricula = parseInt(dataparaEstado[0]);
        var idEstadoMatricula = parseInt(dataparaEstado[1]);
        
        $scope.cambiaEstadoMatricula = function() {
            var txtObservacionAnterior = $scope.txtObservacionAnterior;
            if(txtObservacionAnterior != null && txtObservacionAnterior != '' && txtObservacionAnterior != undefined) {
                $http({
                    method: 'POST',
                    url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/cambiaEstadoMatr',
                    data: { id_matricula : idMatricula,
                            fkid_estado_matricula : idEstadoMatricula,
                            dscrp_observacion : txtObservacionAnterior,
                            id_usuario : sesionCodigoUsuario
                    }
                }).then(function successCallback(response) {
                    alert("Se ejecuto dicho cambio.");
                    $scope.getInfoUsuario();
                    $scope.txtObservacionAnterior = "";
                }, function errorCallback(response) {
                    alert("cambiaEstadoMatricula no funciona ERROOR");
                });
            } else {
                console.log("Excepcion controlada (cambiaEstadoMatricula)");
            }
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
    
    $scope.abrirModalEliminarMatr = function() {
        var idMatricula = event.currentTarget.value;
        $scope.eliminaMatricula = function() {
            $http({
                method: 'POST',
                url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/eliminarMatriculaAlumno',
                data: { id_matricula : idMatricula  }
            }).then(function successCallback(response) {
                alert("Se elimino correctamente la matricula seleccionada.");
                $scope.getInfoUsuario();
            }, function errorCallback(response) {
                alert("cambiaEstadoMatricula no funciona ERROOR");
            });
        };
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
        var idPerAlumno = parseInt(dataPartido[0]);          
        var idPeriodoAnual = parseInt(dataPartido[1]);              
        var codigoMatricula = $scope.modCodMatricula;               
        var fechaRealizada = $scope.modFecRealizada;               
        var observacionSet = $scope.modObservacionSet;    
        var estadoMatriculaDefault = 1;
        
        if(observacionSet != null && observacionSet != '' && observacionSet != undefined) {
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
//                $window.location.href = '/SIASEP_TP/resources/views/vDirectiva_Matricula.jsp';
                $window.location.href = '/SIASEP_TP/';
                $scope.getInfoUsuario();
            }, function errorCallback(response) {
                alert("insertarMatricula no funciona ERROOR");
            });
        } else {
            console.log("Excepcion controlada (insertarMatricula)");
        }
    };
    
    //LogOut
    $scope.cerrarSesion = function() {
        sessionStorage.clear();
        $window.location.href = '/SIASEP_TP/';
    };
    
});
