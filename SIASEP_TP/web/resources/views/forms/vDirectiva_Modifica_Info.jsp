<div class="tab-content" id="v-pills-tabContent">
    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
        <h3 style="font-weight: lighter;">Datos Personales</h3>
        <div class="form-row pt-3">
            <div class="col">
                <div class="form-group">
                    <label for="txtNombreAlumno">Primer Nombre (*)</label>
                    <input type="text" class="form-control" id="txtNombreAlumno" aria-describedby="nombreAlumno" ng-model="modNombreAlumno" required readonly>
                    <div class="valid-feedback">
                        Casillero llenado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere rellenar este casillero.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtApePaternoAlumno">Apellido Paterno (*)</label>
                    <input type="text" class="form-control" id="txtApePaternoAlumno" aria-describedby="apePaternoAlumno" ng-model="modApePaternoAlumno" required readonly>
                    <div class="valid-feedback">
                        Casillero llenado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere rellenar este casillero.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtApeMaternoAlumno">Apellido Materno (*)</label>
                    <input type="text" class="form-control" id="txtApeMaternoAlumno" aria-describedby="apeMaternoAlumno" ng-model="modApeMaternoAlumno" required readonly>
                    <div class="valid-feedback">
                        Casillero llenado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere rellenar este casillero.
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <div class="form-group">
                    <label for="txtTipoDocAlumno">Tipo de Documento (*)</label>
                    <select class="form-control" id="txtTipoDocAlumno" ng-model="modTipoDocAlumno" required disabled>
                        <option value="1">DNI</option>
                        <option value="2">PASAPORTE</option>
                    </select>
                    <div class="valid-feedback">
                        Tipo de documento seleccionado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere seleccionar en este casillero.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtNroDocAlumno">Numero de Documento (*)</label>
                    <input type="text" class="form-control" id="txtNroDocAlumno" aria-describedby="nroDocAlumno" ng-model="modNroDocAlumno" required readonly>
                    <div class="valid-feedback">
                        Casillero llenado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere rellenar este casillero.
                    </div>
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
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <div class="form-group" style="position: relative">
                    <label for="txtFechaNacAlumno">Fecha de Nacimiento (*)</label>
                    <input class="form-control datepicker" type="date" id="txtFechaNacAlumno" ng-model="modFecNacAlumno" required disabled>
                    <div class="valid-feedback">
                        Fecha seleccionada.
                    </div>
                    <div class="invalid-feedback">
                        Requiere seleccionar una fecha en especifico.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtLugarNacAlumno">Lugar Nacimiento (*)</label>
                    <select class="form-control" id="txtLugarNacAlumno" ng-model="modLugarNacAlumno" required disabled>
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
                    <div class="valid-feedback">
                        Lugar de nacimiento seleccionado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere seleccionar en este casillero.
                    </div>
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
                            <select class="form-control" id="txtDistritoAlumno" ng-model="modDistritoAlumno" required disabled>
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
                            <div class="valid-feedback">
                                Distrito seleccionado.
                            </div>
                            <div class="invalid-feedback">
                                Requiere seleccionar en este casillero.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="form-row">
                    <div class="col">
                        <div class="form-group">
                            <label for="txtTelefonoAlumno">Telefono de Casa</label>
                            <input type="text" class="form-control" id="txtTelefonoAlumno" placeholder="No tiene telefono de casa"
                                   aria-describedby="emailHelp" ng-model="modTelefonoAlumno" minlength="7" pattern="\d+" readonly>
                            <div class="invalid-feedback">
                                Debe tener como minimo 7 digitos.
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="txtCelularAlumno">Celular</label>
                            <input type="text" class="form-control" id="txtCelularAlumno" placeholder="No tiene celular"
                                   aria-describedby="emailHelp" ng-model="modCelularAlumno" minlength="9" pattern="\d+" readonly>
                            <div class="invalid-feedback">
                                Debe tener como minimo 9 digitos.
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="form-row" style="padding-top: 10px;">
            <div class="col">
                <div class="form-group">
                    <label for="txtDireccionAlumno">Dirección del hogar (*)</label>
                    <input type="text" class="form-control" id="txtDireccionAlumno" aria-describedby="emailHelp" ng-model="modDireccionAlumno" required readonly>
                    <div class="valid-feedback">
                        Casillero llenado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere rellenar este casillero.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtCorreoAlumno">Correo electrónico</label>
                    <input type="email" class="form-control" id="txtCorreoAlumno" aria-describedby="emailHelp" placeholder="No tiene correo electronico"
                           ng-model="modCorreoAlumno" pattern="([A-Za-z0-9]{1,50}@gmail.com)" readonly>
                    <div class="invalid-feedback">
                        Debe registrar un correo referente al gmail. Ejm: abc@gmail.com
                    </div>
                </div>
            </div>
        </div> 
    </div>

    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
        <h3 style="font-weight: lighter;">Datos Generales</h3>
        <div class="row pt-3" style="padding-bottom: 15px;">
            <div class="col">
                <div class="form-group">
                    <label for="txtLMaternaAlumno">Lengua Materna que domine (*)</label>
                    <input type="text" class="form-control" id="txtLMaternaAlumno" aria-describedby="emailHelp" ng-model="modLMaternaAlumno" required readonly>
                    <div class="valid-feedback">
                        Casillero llenado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere rellenar este casillero.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtLSegundaAlumno">Segunda Lengua Materna</label>
                    <input type="text" class="form-control" id="txtLSegundaAlumno" aria-describedby="emailHelp" placeholder="No domina una segunda lengua."
                           ng-model="modLSegundaAlumno" readonly>
                </div>
            </div>
            <div class="col">
                <div class="form-group" style="text-align: left;">
                    <label for="relSexo">¿Vive con sus padres? (*)</label>
                    <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                        <div class="row" style="padding-top: 8px;">
                            <div class="col-lg-6" style="text-align: right;">
                                <div class="form-check-inline" style="text-align: right;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioB" value="true" ng-model="modVivePadresAlumno" required disabled>SI
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6" style="text-align: left;">
                                <div class="form-check-inline" style="text-align: left;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioB" value="false" ng-model="modVivePadresAlumno" required disabled>NO
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label for="txtNroHermAlumno">Cantidad de Hermanos (*)</label>
                    <input type="number" class="form-control" id="txtNroHermAlumno" aria-describedby="emailHelp" min="0" ng-model="modNroHermAlumno" required disabled>
                    <div class="valid-feedback">
                        Casillero llenado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere rellenar este casillero.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtSanguineoAlumno">Grupo Sanguineo (*)</label>
                    <select class="form-control" id="txtSanguineoAlumno" ng-model="modSanguineoAlumno" required disabled>
                        <option value="A">A</option>
                        <option value="A-">A -</option>
                        <option value="A+">A +</option>
                        <option value="B">B</option>
                        <option value="B-">B -</option>
                        <option value="B+">B +</option>
                        <option value="AB">AB</option>
                        <option value="AB-">AB -</option>
                        <option value="AB+">AB +</option>
                        <option value="O">O</option>
                        <option value="O-">O -</option>
                        <option value="O+">O +</option>
                    </select>
                    <div class="valid-feedback">
                        Grupo sanguineo seleccionado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere seleccionar en este casillero.
                    </div>
                </div>
            </div>
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
                                        <input type="radio" class="form-check-input" name="optradioC" value="true" ng-model="modCopiaDNIAlumno" required disabled>SI
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6" style="text-align: left;">
                                <div class="form-check-inline" style="text-align: left;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioC" value="false" ng-model="modCopiaDNIAlumno" required disabled>NO
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtPonderadoAlumno">Ponderado Referencial (*)</label>
                    <input type="text" class="form-control" id="txtPonderadoAlumno" aria-describedby="emailHelp" ng-model="modPonderadoAlumno" required readonly>
                    <div class="valid-feedback">
                        Ponderado registrado del alumno.
                    </div>
                    <div class="invalid-feedback">
                        Requiere rellenar este casillero.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group" style="text-align: left;">
                    <label for="relSexo">¿Tiene Orden de Mérito? (*)</label>
                    <div class="form-control" id="relSexo" style="padding: 0px 0px 7px 0px;">
                        <div class="row" style="padding-top: 8px;">
                            <div class="col-lg-6" style="text-align: right;">
                                <div class="form-check-inline" style="text-align: right;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioD" value="true" ng-model="modOrdenMerito" required disabled>SI
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6" style="text-align: left;">
                                <div class="form-check-inline" style="text-align: left;">
                                    <label class="form-check-label" style="font-size: 14px;">
                                        <input type="radio" class="form-check-input" name="optradioD" value="false" ng-model="modOrdenMerito" required disabled>NO
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <div class="form-group">
                    <label for="txtNivelAnterior">Nivel Académico Anterior(*)</label>
                    <select class="form-control" id="txtNivelAnterior" ng-model="modNivelAnterior" required disabled>
                        <option value="Primaria">PRIMARIA</option>
                        <option value="Secundaria">SECUNDARIA</option>
                    </select>
                    <div class="valid-feedback">
                        Nivel academico seleccionado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere seleccionar en este casillero.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtGradoAnterior">Grado Anterior(*)</label>
                    <select class="form-control" id="txtGradoAnterior" ng-model="modGradoAnterior" required disabled>
                        <option value="1">PRIMERO</option>
                        <option value="2">SEGUNDO</option>
                        <option value="3">TERCERO</option>
                        <option value="4">CUARTO</option>
                        <option value="5">QUINTO</option>
                        <option value="6">SEXTO</option>
                    </select>
                    <div class="valid-feedback">
                        Grado anterior seleccionado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere seleccionar en este casillero.
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label for="txtSeccionReferente">Sección Referente(*)</label>
                    <select class="form-control" id="txtSeccionReferente" ng-model="modSeccionReferente" required disabled>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                    <div class="valid-feedback">
                        Sección seleccionado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere seleccionar en este casillero.
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <div class="form-group">
                    <label for="txtIEAlumno">Institucion Educativa Anterior (*)</label>
                    <input type="text" class="form-control" id="txtIEAlumno" aria-describedby="emailHelp"
                           ng-model="modIEAlumno" required readonly>
                    <div class="valid-feedback">
                        Nombre del colegio anterior registrado.
                    </div>
                    <div class="invalid-feedback">
                        Requiere rellenar este casillero.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
