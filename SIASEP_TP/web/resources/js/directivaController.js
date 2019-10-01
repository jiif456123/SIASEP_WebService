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
        $scope.selectedPeriodoIdHabilitado = 4; //ES EL AÑO ACTUAL SEGUN LA BASE DE DATOS
        $scope.selectedPeriodoIdDeshabilitado = 4; //ES EL AÑO ACTUAL SEGUN LA BASE DE DATOS
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
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/refrescaListaMatHabilitado',
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
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/refrescaListaMatDeshabilitado',
            data: { fkid_periodo_anual : idPeriodo }
        }).then(function successCallback(response) {
            $scope.listaMatDeshabilitado = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosAntiguos");
        });
    };
    $scope.getListaHistorialMatr = function() {
        $http({
            method: 'GET',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/getListaHistorialMatricula',
            data: { }
        }).then(function successCallback(response) {
            $scope.listaHistorialMatricula = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosAntiguos");
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
