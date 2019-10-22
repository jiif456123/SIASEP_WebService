var app = angular.module("myLogin",['ngStorage','angularUtils.directives.dirPagination']);

app.controller("loginCtrl", function($scope, $http, $window) {
    //Login Nuevo Usuario
    $scope.loginRegistro = function() {
        var nombreUsuario = $scope.txtUsername;
        var passwordUsuario = $scope.txtPassword;
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/login/loginUsuario',
            data: { username   : nombreUsuario,
                    password  :   passwordUsuario
            }
        }).then(function successCallback(response) {
            sessionStorage.setItem('idUsuarioLogged', response.data.id_usuario);
            sessionStorage.setItem('fkidTipoUsuario', response.data.id_tipo_usuario);
            if(response.data.id_usuario != null) {
                if(sessionStorage.getItem("fkidTipoUsuario") === "1") {
                    sessionStorage.setItem('nombreUsuario', response.data.primer_nombre);
                    sessionStorage.setItem('apellidoUsuario', response.data.apellido_paterno);
                    sessionStorage.setItem('tipoUsuario', response.data.nom_tipo_usuario);
                    $window.location.href = '/SIASEP_TP/resources/views/vDirectiva_Matricula.jsp';
                }
                if(sessionStorage.getItem("fkidTipoUsuario") === "3") {
                    sessionStorage.setItem('nombreUsuario', response.data.primer_nombre);
                    sessionStorage.setItem('apellidoUsuario', response.data.apellido_paterno);
                    sessionStorage.setItem('tipoUsuario', response.data.nom_tipo_usuario);
                    $window.location.href = '/SIASEP_TP/resources/views/vDocente_Asistencia.jsp';
                }
                if(sessionStorage.getItem("fkidTipoUsuario") === "4") {
                    sessionStorage.setItem('nombreUsuario', response.data.primer_nombre);
                    sessionStorage.setItem('apellidoUsuario', response.data.apellido_paterno);
                    sessionStorage.setItem('tipoUsuario', response.data.nom_tipo_usuario);
//                    $window.location.href = '/SIASEP_TP/resources/views/vPadreFamilia.jsp';
                }
                if(sessionStorage.getItem("fkidTipoUsuario") === "5") {
                    sessionStorage.setItem('nombreUsuario', response.data.primer_nombre);
                    sessionStorage.setItem('apellidoUsuario', response.data.apellido_paterno);
                    sessionStorage.setItem('tipoUsuario', response.data.nom_tipo_usuario);
//                    $window.location.href = '/SIASEP_TP/resources/views/alu_vAlumno.jsp';
                }
            } else {
                alert("Nombre de usuario / password invalido.");
            }
        }, function errorCallback(response) {
            alert("ERROR EN loginRegistro");
        });
    };
});