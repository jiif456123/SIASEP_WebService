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
        if(document.getElementById("txtAlumnoSelected").value === '') {
            alert("Debe ingresar un codigo de alumno.");
        } else {
            $http({
                method: 'POST',
                url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/listarDatosDelAlumno',
                data: { codigo_alumno: txtAlumnoSelected}
            }).then(function successCallback(response) {
                document.getElementById("btnRealizaCambio").removeAttribute("disabled");
                sessionStorage.setItem("statusFormAlumno", "close");
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
                $scope.modTelefonoAlumno = (response.data.telefono_casa != undefined) ? response.data.telefono_casa : '';
                $scope.modCelularAlumno = (response.data.telefono_celular != undefined) ? response.data.telefono_celular : '';
                $scope.modDireccionAlumno = response.data.direccion;
                $scope.modCorreoAlumno = (response.data.correo != undefined) ? response.data.correo : '';
                //Datos Generales
                $scope.modLMaternaAlumno = response.data.lengua_materna;
                $scope.modLSegundaAlumno = (response.data.segunda_lengua != undefined) ? response.data.segunda_lengua : '';
                $scope.modNroHermAlumno = response.data.nro_hermanos;
                $scope.modVivePadresAlumno = ''+response.data.flg_vive_con_padres;
                $scope.modSanguineoAlumno = response.data.grupo_sanguineo; 
                //Constancia
                $scope.modCopiaDNIAlumno = ''+response.data.flg_copia_dni;
                $scope.modPonderadoAlumno = response.data.ref_ponderado_anterior;
                $scope.modOrdenMerito = ''+response.data.flg_orden_merito;
                $scope.modNivelAnterior = ''+response.data.ref_nivel;
                $scope.modGradoAnterior = ''+response.data.ref_grado_anterior;
                $scope.modSeccionReferente = ''+response.data.ref_seccion;
                $scope.modIEAlumno = response.data.nombre_ie_anterior;
            }, function errorCallback(response) {
                alert("ERROR buscaAlumnoInfo");
            });
        }
    };
    
    //        var dataparaEstado = event.currentTarget.value.split('-');
//        var idMatricula = parseInt(dataparaEstado[0]);
//        var idEstadoMatricula = parseInt(dataparaEstado[1]);
    
    $scope.realizarCambioInfo = function() {
        //Datos Personales
        var modNombreAlumno = $scope.modNombreAlumno;
        var modApePaternoAlumno = $scope.modApePaternoAlumno;
        var modApeMaternoAlumno = $scope.modApeMaternoAlumno;
        var modTipoDocAlumno = $scope.modTipoDocAlumno;
        var modNroDocAlumno = $scope.modNroDocAlumno;
        var modSexoAlumno = $scope.modSexoAlumno;
        var modFecNacAlumno = $scope.modFecNacAlumno;
        var modLugarNacAlumno = $scope.modLugarNacAlumno;
         //Contacto
        var modDistritoAlumno = $scope.modDistritoAlumno;
        var modTelefonoAlumno = $scope.modTelefonoAlumno;
        var modCelularAlumno = $scope.modCelularAlumno;
        var modDireccionAlumno = $scope.modDireccionAlumno;
        var modCorreoAlumno = $scope.modCorreoAlumno;
         //Datos Generales
        var modLMaternaAlumno = $scope.modLMaternaAlumno;
        var modLSegundaAlumno = $scope.modLSegundaAlumno;
        var modNroHermAlumno = $scope.modNroHermAlumno;
        var modVivePadresAlumno = $scope.modVivePadresAlumno;
        var modSanguineoAlumno = $scope.modSanguineoAlumno;
         //Constancia
        var modCopiaDNIAlumno = $scope.modCopiaDNIAlumno;
        var modPonderadoAlumno = $scope.modPonderadoAlumno;
        var modOrdenMerito = $scope.modOrdenMerito;
        var modNivelAnterior = $scope.modNivelAnterior;
        var modGradoAnterior = $scope.modGradoAnterior;
        var modSeccionReferente = $scope.modSeccionReferente;
        var modIEAlumno = $scope.modIEAlumno;
        
        var txtAlumnoSelected = document.getElementById("txtAlumnoSelected").value.toString().substring(0,6);
        if(sessionStorage.getItem("statusFormAlumno") === "close" || sessionStorage.getItem("statusFormAlumno") == null) {
            sessionStorage.setItem("statusFormAlumno", "open");
            return;
        } else if(sessionStorage.getItem("statusFormAlumno") === "open" && document.getElementById("btnBuscarInfoAlumno").disabled == true && 
                document.getElementById("txtNombreAlumno").disabled != true) {
            
            if(modNombreAlumno != null && modApePaternoAlumno != null && modApeMaternoAlumno != null && modTipoDocAlumno != null &&
                modNroDocAlumno != null && modSexoAlumno != null && modFecNacAlumno != null && modLugarNacAlumno != null && modDistritoAlumno != null &&
                modTelefonoAlumno != null && modCelularAlumno != null && modDireccionAlumno != null && modCorreoAlumno != null &&
                modLMaternaAlumno != null && modLSegundaAlumno != null && modNroHermAlumno != null && modVivePadresAlumno != null && 
                modSanguineoAlumno != null && modCopiaDNIAlumno != null && modPonderadoAlumno != null && modOrdenMerito != null && 
                modNivelAnterior != null && modGradoAnterior != null && modSeccionReferente != null && modIEAlumno != null) {

                $http({
                     method: 'POST',
                     url: 'http://localhost:8084/SIASEP_TP/webresources/directiva/modificaDatosAlumno',
                     data: { codigo_alumno: txtAlumnoSelected, primer_nombre : modNombreAlumno, apellido_materno : modApeMaternoAlumno, apellido_paterno : modApePaternoAlumno,
                             fkid_tipo_documento : modTipoDocAlumno, numero_documento : modNroDocAlumno, sexo : modSexoAlumno,
                             fec_nacimiento : modFecNacAlumno, fkid_lugar_nacimiento : modLugarNacAlumno, fkid_distrito : modDistritoAlumno, 
                             telefono_casa : modTelefonoAlumno, telefono_celular : modCelularAlumno, direccion : modDireccionAlumno, 
                             correo : modCorreoAlumno, lengua_materna : modLMaternaAlumno, segunda_lengua : modLSegundaAlumno, 
                             nro_hermanos : modNroHermAlumno, flg_vive_con_padres : modVivePadresAlumno, grupo_sanguineo : modSanguineoAlumno,
                             flg_copia_dni : modCopiaDNIAlumno, ref_ponderado_anterior : modPonderadoAlumno, flg_orden_merito : modOrdenMerito, ref_nivel : modNivelAnterior,
                             ref_grado_anterior : modGradoAnterior, ref_seccion : modSeccionReferente, nombre_ie_anterior : modIEAlumno
                     }
                 }).then(function successCallback(response) {
                     alert("Se ha guardado los cambios");
                     $scope.getInfoUsuario();
                     terminarCambios();
                 }, function errorCallback(response) {
                     alert("realizarCambioInfo no funciona ERROOR");
                 });
            } else {
                alert("Llenar todos los campos obligatorios del formulario.");
            }
            sessionStorage.setItem("statusFormAlumno", "close");
        }
    };
    
    
    
    
    //LogOut
    $scope.cerrarSesion = function() {
        sessionStorage.clear();
        $window.location.href = '/SIASEP_TP/';
    };
    
});
