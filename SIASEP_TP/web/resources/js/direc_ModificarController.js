var app = angular.module("myModificaMatr",['ngStorage','angularUtils.directives.dirPagination']);

app.controller("modificaMatrCtrl", function($scope, $http, $window) {
    
    //    var sesionCodigoUsuario = sessionStorage.getItem('idUsuarioLogged');
//    var sesionNombreTipo = sessionStorage.getItem('tipoUsuario');
//    var sesionTipoUsuario = sessionStorage.getItem('fkidTipoUsuario');

    var sesionCodigoUsuario = '2';
    var sesionNombreTipo = 'Dpto. Secretaria';
    var sesionTipoUsuario = sessionStorage.getItem('fkidTipoUsuario');

    //CONTROLA LOS DEMAS METODOS GET Y CARGA DE DATOS
    $scope.getInfoUsuario = function() {
        $scope.nombre = 'Ricardo';
        $scope.apellido = 'Villanueva';   
//        $scope.nombre = sessionStorage.getItem('nombreUsuario');
//        $scope.apellido = sessionStorage.getItem('apellidoUsuario');
        $scope.tipousuario = sesionNombreTipo;
        $scope.obtenerListaAlumno();

    };

    $scope.obtenerListaAlumno = function() {
        $http({
            method: 'GET',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/listarAlumnosBusqueda',
            data: { }
        }).then(function successCallback(response) {
            $scope.listaAlumnosBusqueda = response.data;
        }, function errorCallback(response) {
            alert("ERROR getListaAlumnosAntiguos");
        });
    };

    $scope.buscaAlumnoInfo = function() {
        var txtAlumnoSelected = document.getElementById("txtAlumnoSelected")
                                .value.toString()
                                .substring(0,6);
        $http({
            method: 'POST',
            url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/listarDatosDelAlumno',
            data: { codigo_alumno: txtAlumnoSelected}
        }).then(function successCallback(response) {
            //Datos Personales
            $scope.modNombreAlumno = response.data.primer_nombre;
            $scope.modApePaternoAlumno = response.data.apellido_paterno;
            $scope.modApeMaternoAlumno = response.data.apellido_materno;
            $scope.modTipoDocAlumno = ''+response.data.fkid_tipo_documento;
            $scope.modNroDocAlumno = response.data.numero_documento;
            $scope.modSexoAlumno = response.data.sexo;
            $scope.modFecNacAlumno = response.data.fec_nacimiento;
            $scope.modLugarNacAlumno = ''+response.data.fkid_lugar_nacimiento;
            //Contacto
            $scope.modDistritoAlumno = ''+response.data.fkid_distrito;
            $scope.modTelefonoAlumno = response.data.telefono_casa;
            $scope.modCelularAlumno = response.data.telefono_celular;
            $scope.modDireccionAlumno = response.data.direccion;
            $scope.modCorreoAlumno = (response.data.correo != undefined) ? response.data.correo : 'No tiene correo electronico.';
            //Datos Generales
            $scope.modLMaternaAlumno = response.data.lengua_materna;
            $scope.modLSegundaAlumno = (response.data.segunda_lengua != undefined) ? response.data.segunda_lengua : 'No domina una segunda lengua.';
            $scope.modNroHermAlumno = response.data.nro_hermanos;
            $scope.modVivePadresAlumno = response.data.flg_vive_con_padres;
            //Constancia
            $scope.modCopiaDNIAlumno = response.data.flg_copia_dni;
            $scope.modPonderadoAlumno = response.data.ref_ponderado_anterior;
            $scope.modTercioAlumno = response.data.flg_tercio_superior;
            $scope.modNivelAnterior = ''+response.data.ref_nivel;
            $scope.modGradoAnterior = ''+response.data.ref_grado_anterior;
            $scope.modSeccionReferente = ''+response.data.ref_seccion;
            $scope.modIEAlumno = response.data.nombre_ie_anterior;
            $scope.modSanguineoAlumno = response.data.grupo_sanguineo;
        }, function errorCallback(response) {
            alert("ERROR buscaAlumnoInfo");
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
            if(txtObservacionAnterior != null) {
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
        
        if(observacionSet != null) {
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
                $window.location.href = '/SIASEP_TP/resources/views/vDirectiva_Matricula.jsp';
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
