<div class="tab-content" id="v-pills-tabContent">
    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
        <h3 style="font-weight: lighter;">Datos Personales</h3>
        <div class="form-row pt-3">
            <div class="col">
                <div class="form-group">
                    <label for="txtNombreAlumno">Primer Nombre (*)</label>
                    <input type="text" class="form-control" id="txtNombreAlumno" aria-describedby="nombreAlumno" ng-model="modNombreAlumno" readonly>
                    <small id="nombreAlumno" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtApePaternoAlumno">Apellido Paterno (*)</label>
                    <input type="text" class="form-control" id="txtApePaternoAlumno" aria-describedby="apePaternoAlumno" ng-model="modApePaternoAlumno" readonly>
                    <small id="apePaternoAlumno" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtApeMaternoAlumno">Apellido Materno (*)</label>
                    <input type="text" class="form-control" id="txtApeMaternoAlumno" aria-describedby="apeMaternoAlumno" ng-model="modApeMaternoAlumno" readonly>
                    <small id="apeMaternoAlumno" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <div class="form-group">
                    <label for="txtTipoDocAlumno">Tipo de Documento (*)</label>
                    <select class="form-control" id="txtTipoDocAlumno" ng-model="modTipoDocAlumno" disabled>
                        <option value="1">DNI</option>
                        <option value="2">PASAPORTE</option>
                    </select>
                    <small class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtNroDocAlumno">Numero de Documento (*)</label>
                    <input type="text" class="form-control" id="txtNroDocAlumno" aria-describedby="nroDocAlumno" ng-model="modNroDocAlumno" readonly>
                    <small id="nroDocAlumno" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group" style="text-align: left;">
                    <label for="relSexo">Sexo (*)</label>
                    <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                        <div class="row" style="padding-top: 8px;">
                            <div class="col-lg-6" style="text-align: right;">
                                <div class="form-check-inline" style="text-align: right;">
                                    <label class="form-check-label" style="font-size: 13px;">
                                        <input type="radio" class="form-check-input" name="optradioA" required ng-model="modSexoAlumno" value="M" disabled>Hombre
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6" style="text-align: left;">
                                <div class="form-check-inline" style="text-align: left;">
                                    <label class="form-check-label" style="font-size: 13px;">
                                        <input type="radio" class="form-check-input" name="optradioA" required ng-model="modSexoAlumno" value="F" disabled>Mujer
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <div class="form-group" style="position: relative">
                    <label for="txtFechaNacAlumno">Fecha de Nacimiento (*)</label>
                    <input class="form-control datepicker" type="text" id="txtFechaNacAlumno" ng-model="modFecNacAlumno" disabled>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtLugarNacAlumno">Lugar Nacimiento (*)</label>
                    <select class="form-control" id="txtLugarNacAlumno" ng-model="modLugarNacAlumno" disabled>
                        <option value="1">Amazonas</option>
                        <option value="2">Ancash</option>
                        <option value="3">Apurimac</option>
                        <option value="4">Arequipa</option>
                        <option value="5">Ayacucho</option>
                        <option value="6">Cajamarca</option>
                        <option value="7">Callao</option>
                        <option value="8">Cuzco</option>
                        <option value="9">Huancavelica</option>
                        <option value="10">Huanuco</option>
                        <option value="11">Ica</option>
                        <option value="12">Junin</option>
                        <option value="13">La Libertad</option>
                        <option value="14">Lambayeque</option>
                        <option value="15">Lima</option>
                        <option value="16">Loreto</option>
                        <option value="17">Madre de Dios</option>
                        <option value="18">Moquegua</option>
                        <option value="19">Pasco</option>
                        <option value="20">Piura</option>
                        <option value="21">Puno</option>
                        <option value="22">San Martin</option>
                        <option value="23">Tacna</option>
                        <option value="24">Tumbes</option>
                        <option value="25">Ucayali</option>
                    </select>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
        </div>
    </div>

    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
        <h3 style="font-weight: lighter;">Datos de Contacto</h3>
        <div class="row pt-3">
            <div class="col-lg-5">
                <div class="form-row">
                    <div class="col">
                        <div class="form-group">
                            <label for="txtDistritoAlumno">Distrito (*)</label>
                            <select class="form-control" id="txtDistritoAlumno" ng-model="modDistritoAlumno" disabled>
                                <option value="1">Callao</option>
                                <option value="2">Bellavista</option>
                                <option value="3">Carmen de la Legua</option>
                                <option value="4">La Perla</option>
                                <option value="5">La Punta</option>
                                <option value="6">Mi Peru</option>   
                                <option value="7">Ventanilla</option>
                                <option value="8">Lima</option>
                                <option value="9">Ancon</option>
                                <option value="10">Ate</option>
                                <option value="11">Barranco</option>
                                <option value="12">Breña</option>     
                                <option value="13">Carabayllo</option>
                                <option value="14">Cieneguilla</option>
                                <option value="15">Chaclacayo</option>
                                <option value="16">Chomillos</option>
                                <option value="17">Comas</option>
                                <option value="18">El Agustino</option>
                                <option value="19">Indepenndencia</option>
                                <option value="20">Jesus Maria</option>
                                <option value="21">La Molina</option>
                                <option value="22">La Victoria</option>
                                <option value="23">Lince</option>   
                                <option value="24">Los Olivos</option>
                                <option value="25">Lurigancho</option>
                                <option value="26">Lurin</option>
                                <option value="27">Magdalena del Mar</option>
                                <option value="28">Miraflores</option>
                                <option value="29">Pachacamac</option>     
                                <option value="30">Pucusana</option>
                                <option value="31">Pueblo Libre</option>
                                <option value="32">Puente Piedra</option>
                                <option value="33">Punta Hermosa</option>
                                <option value="34">Punta Negra</option>
                                <option value="35">Rimac</option>
                                <option value="36">San Bartolo</option>
                                <option value="37">San Borja</option>
                                <option value="38">San Isidro</option>
                                <option value="39">San Juan de Lurigancho</option>
                                <option value="40">San Juan de Miraflores</option>   
                                <option value="41">San Luis</option>
                                <option value="42">San Martin de Porres</option>
                                <option value="43">San Miguel</option>
                                <option value="44">Santa Anita</option>
                                <option value="45">Santa Maria del Mar</option>
                                <option value="46">Santa Rosa</option>     
                                <option value="47">Santiago de Surco</option>
                                <option value="48">Surquillo</option>
                                <option value="49">Villa el Salvador</option>
                                <option value="50">Villa Maria del Triunfo </option>
                            </select>
                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="form-row">
                    <div class="col">
                        <div class="form-group">
                            <label for="txtTelefonoAlumno">Telefono de Casa</label>
                            <input type="text" class="form-control" id="txtTelefonoAlumno"
                                   aria-describedby="emailHelp" ng-model="modTelefonoAlumno" readonly>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="txtCelularAlumno">Celular</label>
                            <input type="text" class="form-control" id="txtCelularAlumno" 
                                   aria-describedby="emailHelp" ng-model="modCelularAlumno" readonly>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="form-row" style="padding-top: 10px;">
            <div class="col">
                <div class="form-group">
                    <label for="txtDireccionAlumno">Dirección del hogar (*)</label>
                    <input type="text" class="form-control" id="txtDireccionAlumno" aria-describedby="emailHelp" ng-model="modDireccionAlumno" readonly>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtCorreoAlumno">Correo electrónico</label>
                    <input type="email" class="form-control" id="txtCorreoAlumno" aria-describedby="emailHelp" ng-model="modCorreoAlumno" readonly>
                </div>
            </div>
        </div> 
    </div>
    
    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
        <h3 style="font-weight: lighter;">Datos Generales</h3>
        <div class="row pt-3" style="padding-bottom: 15px;">
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="txtLMaternaAlumno">Lengua Materna que domine (*)</label>
                    <input type="text" class="form-control" id="txtLMaternaAlumno" aria-describedby="emailHelp" ng-model="modLMaternaAlumno" readonly>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
                <div class="form-group">
                    <label for="txtLSegundaAlumno">Segunda Lengua Materna</label>
                    <input type="text" class="form-control" id="txtLSegundaAlumno" aria-describedby="emailHelp" ng-model="modLSegundaAlumno" readonly>
                </div>
                <div class="form-group">
                    <label for="txtNroHermAlumno">Cantidad de Hermanos (*)</label>
                    <input type="number" class="form-control" id="txtNroHermAlumno" aria-describedby="emailHelp" min="0" ng-model="modNroHermAlumno" disabled>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
                <div class="form-group" style="text-align: left;">
                    <label for="relSexo">¿Vive con sus padres? (*)</label>
                    <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                        <div class="row" style="padding-top: 8px;">
                            <div class="col-lg-6" style="text-align: right;">
                                <div class="form-check-inline" style="text-align: right;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioB" value="0" ng-model="modVivePadresAlumno" disabled>SI
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6" style="text-align: left;">
                                <div class="form-check-inline" style="text-align: left;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioB" value="1" ng-model="modVivePadresAlumno" disabled>NO
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio marcar una de las opciones.</small>
                </div>
            </div>
            <div class="col-lg-1">&nbsp;</div>
            <div class="col-lg-4">
                <div class="card" style="margin-top: 15px;">
                    <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/43.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title"><a>Perfil del Estudiante</a></h4>
                        <p class="card-text">Se requiere una foto de perfil del matriculado para completar la autenticidad de la información y de sus datos personales.</p>
                        <div class="form-group">
                            <label for="txtImagenAlumno">Seleccionar la foto a subir</label>
                            <input type="file" class="form-control-file" id="txtImagenAlumno" aria-describedby="fileHelp" disabled>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-1">&nbsp;</div>
        </div>
    </div>
    <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
        <h3 style="font-weight: lighter;">Record Academico</h3>
        <div class="form-row pt-3">
            <div class="col">
                <div class="form-group" style="text-align: left;">
                    <label for="relSexo">¿Entregó Copia de DNI? (*)</label>
                    <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                        <div class="row" style="padding-top: 8px;">
                            <div class="col-lg-6" style="text-align: right;">
                                <div class="form-check-inline" style="text-align: right;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioC" value="0" ng-model="modCopiaDNIAlumno" disabled>SI
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6" style="text-align: left;">
                                <div class="form-check-inline" style="text-align: left;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioC" value="1" ng-model="modCopiaDNIAlumno" disabled>NO
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio marcar una de las opciones.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtPonderadoAlumno">Ponderado Referencial (*)</label>
                    <input type="text" class="form-control" id="txtPonderadoAlumno" aria-describedby="emailHelp" ng-model="modPonderadoAlumno" readonly>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group" style="text-align: left;">
                    <label for="relSexo">¿Pertenecio Tercio Superior? (*)</label>
                    <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                        <div class="row" style="padding-top: 8px;">
                            <div class="col-lg-6" style="text-align: right;">
                                <div class="form-check-inline" style="text-align: right;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioD" value="0" ng-model="modTercioAlumno" disabled>SI
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6" style="text-align: left;">
                                <div class="form-check-inline" style="text-align: left;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioD" value="1" ng-model="modTercioAlumno" disabled>NO
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio marcar una de las opciones.</small>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <div class="form-group">
                    <label for="txtNivelAnterior">Nivel Académico Anterior(*)</label>
                    <select class="form-control" id="txtNivelAnterior" ng-model="modNivelAnterior" disabled>
                        <option value="Primaria">PRIMARIA</option>
                        <option value="Secundaria">SECUNDARIA</option>
                    </select>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtGradoAnterior">Grado Anterior(*)</label>
                    <select class="form-control" id="txtGradoAnterior" ng-model="modGradoAnterior" disabled>
                        <option value="1">PRIMERO</option>
                        <option value="2">SEGUNDO</option>
                        <option value="3">TERCERO</option>
                        <option value="4">CUARTO</option>
                        <option value="5">QUINTO</option>
                        <option value="6">SEXTO</option>
                    </select>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtSeccionReferente">Sección Referente(*)</label>
                    <select class="form-control" id="txtSeccionReferente" ng-model="modSeccionReferente" disabled>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                    <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <div class="form-group">
                    <label for="txtIEAlumno">Institucion Educativa Anterior</label>
                    <input type="text" class="form-control" id="txtIEAlumno" aria-describedby="emailHelp" ng-model="modIEAlumno" readonly>
                </div>
            </div>
        </div>
        <hr>
        <h3 style="font-weight: lighter;">Constancia Médica</h3>
        <div class="row pt-2">
            <div class="col-lg-12">
                <div class="form-row">
                    <div class="col">
                        <div class="form-group">
                            <label for="txtSanguineoAlumno">Grupo Sanguineo (*)</label>
                            <select class="form-control" id="txtSanguineoAlumno" ng-model="modSanguineoAlumno" disabled>
                                <option value="A-">A -</option>
                                <option value="A+">A +</option>
                                <option value="B-">B -</option>
                                <option value="B+">B +</option>
                                <option value="AB-">AB -</option>
                                <option value="AB+">AB +</option>
                                <option value="O-">O -</option>
                                <option value="O+">O +</option>
                            </select>
                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col">
                        <div class="selectpicker form-group">
                            <label for="exampleSelect1">Alergia (*)</label>
                            <select class="selectpicker form-control" id="exampleSelect1" multiple data-live-search="true" 
                                    data-width="97%" data-selected-text-format="count">
                                <option>A -</option>
                                <option>A +</option>
                                <option>O +</option>
                            </select>
                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                        </div>
                    </div>
                    <div class="col">
                        <div class="selectpicker form-group">
                            <label for="exampleSelect1">Enfermedad (*)</label>
                            <select class="selectpicker form-control" id="exampleSelect1" multiple data-live-search="true" 
                                    data-width="97%" data-selected-text-format="count">
                                <option>A -</option>
                                <option>A +</option>
                                <option>O +</option>
                            </select>
                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                        </div>
                    </div>
                    <div class="col">
                        <div class="selectpicker form-group">
                            <label for="exampleSelect1">Discapacidad (*)</label>
                            <select class="selectpicker form-control" id="exampleSelect1" multiple data-live-search="true" 
                                    data-width="97%" data-selected-text-format="count">
                                <option>A -</option>
                                <option>A +</option>
                                <option>O +</option>
                            </select>
                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                        </div>
                    </div>
                    <div class="col">
                        <div class="selectpicker form-group">
                            <label for="exampleSelect1">Religión (*)</label>
                            <select class="selectpicker form-control" id="exampleSelect1" multiple data-live-search="true" 
                                    data-width="97%" data-selected-text-format="count">
                                <option>A -</option>
                                <option>A +</option>
                                <option>O +</option>
                            </select>
                            <small id="emailHelp" class="form-text text-muted">Es requisitorio rellenar este casillero.</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-1">&nbsp;</div>
            <div class="col-lg-5">
                &nbsp;
                
            </div>
            <div class="col-lg-1">&nbsp;</div>
        </div>
    </div>
</div>
