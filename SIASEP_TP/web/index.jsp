<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <title>SIASEP</title>
        <link rel="icon" href="img/favicon-16x16.png" type="image/png" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <!--===============================================================================================-->	
        <link rel="icon" type="./image/png" href="/SIASEP_TP/stylemain/imgs/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/css/util.css">
        <link rel="stylesheet" type="text/css" href="/SIASEP_TP/stylemain/css/main.css">
        <!--===============================================================================================-->
    </head>
    <body style="background-color: #666666;" ng-app="myLogin" ng-controller="loginCtrl">

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12" style="text-align: center;">
                                    <h3 style="font-weight: lighter; margin-bottom: 35px;">I.E. Sulpicio Garcia Peñaloza</h3>
                                    <span class="login100-form-title p-b-43">
                                        <img src="/SIASEP_TP/stylemain/imgs/simboloesc.png" alt="" style="width: 150px; height: 150px"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Usuario: Espacio en blanco">
                            <input class="input100" type="text" ng-model="txtUsername">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Nombre de Usuario</span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Contraseña: Espacio en blanco" style="margin-bottom: 20px;">
                            <input class="input100" type="password" ng-model="txtPassword">
                            <span class="focus-input100"></span>
                            <span class="label-input100">Contraseña</span>
                        </div>
                        <!--<div class="alert alert-danger" role="alert" style="font-size: medium; margin-top: 15px;">Nombre de usuario o contraseña no valida</div>-->
                        
                        <div class="flex-sb-m w-full p-t-3 p-b-32">
                            <div class="contact100-form-checkbox">
                                <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                                <label class="label-checkbox100" for="ckb1">Recuerdame</label>
                            </div>
                            <div>
                                <a href="#" class="txt1">¿Olvidaste tu contraseña?</a>
                            </div>
                        </div>
                        <div class="container-login100-form-btn">
                            <button type="submit" class="login100-form-btn" ng-click="loginRegistro()">Ingresar</button>
                        </div>
                    </form>
                    <div class="login100-more" style="background-image: url('stylemain/imgs/home-bg.jpg');">
                    </div>
                </div>
            </div>
        </div>




        <!--===============================================================================================-->
        <script src="/SIASEP_TP/stylemain/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="/SIASEP_TP/stylemain/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="/SIASEP_TP/stylemain/vendor/bootstrap/js/popper.js"></script>
        <script src="/SIASEP_TP/stylemain/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="/SIASEP_TP/stylemain/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="/SIASEP_TP/stylemain/vendor/daterangepicker/moment.min.js"></script>
        <script src="/SIASEP_TP/stylemain/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="/SIASEP_TP/stylemain/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="/SIASEP_TP/stylemain/js/main.js"></script>

        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.0/angular-material.min.js"></script>
        <script src="https://cdn.jsdelivr.net/ngstorage/0.3.6/ngStorage.min.js"></script>
        
        <script src="http://localhost:8084/SIASEP_TP/resources/js/loginController.js" type="text/javascript"></script>
        <script src="http://localhost:8084/SIASEP_TP/resources/js/dirPagination.js" type="text/javascript"></script>  
        
    </body>
</html>
