var app = angular.module("myAdmin",['ngStorage','angularUtils.directives.dirPagination']);

app.controller("directivaCtrl", function($scope, $http, $window) {
    
    var sesionCodigoUsuario = sessionStorage.getItem('idUsuarioLogged');
    var sesionNombreTipo = sessionStorage.getItem('tipoUsuario');
    var sesionTipoUsuario = sessionStorage.getItem('fkidTipoUsuario');

    //NAVEGA DESDE EL MODULO O EL NAVBAR LLENDO A "MATRICULAR ALUMNO"
    $scope.navegaAdminMatricula = function() {
       $window.location.href = '/SIASEP_TP/resources/views/direc_vDirectiva.jsp';
       $scope.getInfoUsuario();
    };

    //CONTROLA LOS DEMAS METODOS GET Y CARGA DE DATOS
    $scope.getInfoUsuario = function() {
        $scope.nombre = sessionStorage.getItem('nombreUsuario');
        $scope.apellido = sessionStorage.getItem('apellidoUsuario');
        $scope.tipousuario = sesionNombreTipo;
        $scope.getListaAlumnosNuevos();
        $scope.getListaAlumnosAntiguos();
        $scope.getListaAlumnosRepetidos();
        $scope.getListaAlumnosIntercambio();
    };
    
    $scope.getListaAlumnosNuevos = function() {
        $http({
            method: 'GET',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/listaAlumnosNuevos',
            data: { }
        }).then(function successCallback(response) {
            $scope.listaAlumnosNuevos = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosNuevos");
        });
    };
    $scope.getListaAlumnosAntiguos = function() {
        $http({
            method: 'GET',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/listaAlumnosAntiguos',
            data: { }
        }).then(function successCallback(response) {
            $scope.listaAlumnosAntiguos = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosAntiguos");
        });
    };
    $scope.getListaAlumnosIntercambio = function() {
        $http({
            method: 'GET',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/listaAlumnosIntercambio',
            data: { }
        }).then(function successCallback(response) {
            $scope.listaAlumnosIntercambio = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosIntercambio");
        });
    };
    $scope.getListaAlumnosRepetidos = function() {
        $http({
            method: 'GET',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/listaAlumnosRepetido',
            data: { }
        }).then(function successCallback(response) {
            $scope.listaAlumnosRepetidos = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosRepetidos");
        });
    };
    
    $scope.controlFormAlumno = function() {
        $window.location.href = '/SIASEP_TP/resources/views/direc_formAlumno.jsp';
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
