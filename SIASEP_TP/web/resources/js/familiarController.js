var app = angular.module("myFamily",['ngStorage','angularUtils.directives.dirPagination']);
app.controller("apoderadoCtrl", function($scope, $http, $window) {
    
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
            $scope.getListadoHijos();
            
        }, function errorCallback(response) {
            alert("no funciona ERROOR");
        });
    };
    
    $scope.getListadoHijos = function() {
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/apoderado/getListaDeHijos',
            data: {  codigo_usuario : sesionCodigoUsuario  }
        }).then(function successCallback(response) {
            $scope.listaHijosPorMatricular = response.data;
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




