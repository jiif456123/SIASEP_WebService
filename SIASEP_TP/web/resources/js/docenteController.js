var app = angular.module("myTeacher",['ngStorage','angularUtils.directives.dirPagination']);

app.controller("docenteCtrl", function($scope, $http, $window) {
    
    var sesionCodigoUsuario = sessionStorage.getItem('idUsuarioLogged');
    var sesionNombreTipo = sessionStorage.getItem('tipoUsuario');
    var sesionTipoUsuario = sessionStorage.getItem('fkidTipoUsuario');
    
    $scope.getInfoUsuario = function() {
        $scope.nombre = sessionStorage.getItem('nombreUsuario');
        $scope.apellido = sessionStorage.getItem('apellidoUsuario');
        $scope.tipousuario = sesionNombreTipo;
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/docente/getContenidoComunicado',
            data: {  codigo_tipo_usuario : sesionTipoUsuario  }
        }).then(function successCallback(response) {
            $scope.listaComunicado = response.data;
            $scope.getListaCursos();
        }, function errorCallback(response) {
            alert("no funciona ERROOR");
        });

    };
    
    $scope.getListaCursos = function() {
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/docente/getListaCursos',
            data: {  codigo_usuario : sesionCodigoUsuario  }
        }).then(function successCallback(response) {
            
            $scope.listaCursos = response.data;
            
        }, function errorCallback(response) {
            alert("no funciona ERROOR");
        });

    };
    
    //LogOut
    $scope.cerrarSesion = function() {
        sessionStorage.clear();
        $window.location.href = '/SIASEP_TP/';
    };
    
});
