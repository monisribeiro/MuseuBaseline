<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <spring:url value="/resources/style.css" var="styleCss" />
        <spring:url value="/resources/styleMobile.css" var="styleMobileCss" />
        <spring:url value="/resources/bootstrap-theme.css" var="bootstrapThemeCss" />
        <spring:url value="/resources/bootstrap-theme.min.css" var="bootstrapThemeMinCss" />
        <spring:url value="/resources/bootstrap.css" var="bootstrap" />
        <spring:url value="/resources/bootstrap.min.css" var="bootstrapMin" />
        <spring:url value="/resources/js/bootstrap.min.css" var="bootstrapMinCss" />
	<spring:url value="/resources/js/jquery/jquery.min.js" var="jquery" />
        <spring:url value="/resources/js/lib/bootstrap.min.js" var="bootstrapMin" />
	<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapMinJs" />
        <spring:url value="/resources/js/lib/angular.js" var="angularJs" />
	<spring:url value="/resources/js/lib/angular-route.js" var="angularRouteJs" />
        <spring:url value="/resources/js/lib/angular-resource.js" var="angularResourceJs" />
	<spring:url value="/resources/js/lib/angular-animate.js" var="angularAnimateJs" />
        <spring:url value="/resources/ui-bootstrap-tpls-0.13.4.js" var="bootstrapUi" />
        <spring:url value="/resources/js/ngDraggable.js" var="ngDraggable" />
        <spring:url value="/resources/js/app.js" var="appJs" />
        <spring:url value="/resources/imgs/proc.jpg" var="image" />
        <spring:url value="/resources/imgs/sobre.jpg" var="museu" />
        <spring:url value="/resources/imgs/logo.jpg" var="logo" />
        <spring:url value="/resources/imgs/Gabriela.jpg" var="gabriela" />
        <spring:url value="/resources/imgs/Mauricio.jpg" var="mauricio" />
        <spring:url value="/resources/imgs/Monique.jpg" var="monique" />
	
        <link href="${bootstrapMinCss}" rel="stylesheet" />
        <link href="${bootstrapThemeCss}" rel="stylesheet" />
        <link href="${bootstrapThemeMinCss}" rel="stylesheet" />
        <link href="${bootstrap}" rel="stylesheet" />
        <link href="${bootstrapMin}" rel="stylesheet" />
	<link href="${styleCss}" rel="stylesheet" />
	<link href="${styleMobileCss}" rel="stylesheet" />
        <script src="${jquery}"></script>
        <script src="${bootstrapMin}"></script>
        <script src="${bootstrapMinJs}"></script>
        <script src="${angularJs}"></script>
        <script src="${angularRouteJs}"></script>
        <script src="${angularResourceJs}"></script>
        <script src="${angularAnimateJs}"></script>
        <script src="${bootstrapUi}"></script>
        <script src="${ngDraggable}"></script>
        <script src="${appJs}"></script>
    </head>
    <body>
        <div class="row" style="margin:0px;" ng-app="app" ng-controller="AboutCtrl">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-horiz">
                            <li ><a href="${contextPath}/MuseuBaseline/object/hello">Home</a></li>
                            <li  ><a href="${contextPath}/MuseuBaseline/object/galeria">Museu</a></li>
                            <li  ><a href="${contextPath}/MuseuBaseline/object/desafios">Desafios</a></li>
                            <li><a href="${contextPath}/MuseuBaseline/object/perguntas">Pergunte ao professor</a></li>
                            <li class="active" ><a href="${contextPath}/MuseuBaseline/object/sobre">Sobre o museu</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="container-fluid pageAbout" style="margin-left: 100px;">
            <div class="row" id="/museu">
                <h2>Sobre o Museu</h2>
            </div>
            <div class="row sobreNos" style="padding-top: 30px;">
                <div class="col-sm-3 imagem">
                    <img src="${museu}" class="img-circle" alt="Museu Paulista" style="height: 250px; width: 250px;">
                </div>
                <div class="col-sm-7" style="text-align:justify">
                    <p>
                        O Pal�cio Nova Friburgo, atual Pal�cio do Catete fica no Rio de Janeiro e foi constru�do 
                        entre 1858 e 1867 pelo comerciante e fazendeiro de caf� Ant�nio Clemente Pinto, Bar�o de Nova Friburgo. 
                        Em 18 de abril de 1896, durante o mandato do presidente Prudente de Moraes, 
                         � �poca exercido em car�ter interino pelo vice Manuel Vitorino, o Pal�cio foi adquirido pelo Governo Federal
                         para sediar a Presid�ncia da Rep�blica, anteriormente instalada no Pal�cio do Itamaraty.
                       
                    </p>
                    <p>
                         
                         O Pal�cio consagrou-se como um monumento de grande import�ncia hist�rica, arquitet�nica e art�stica. 
                         Do Pal�cio emergem, mem�rias de momentos de consterna��o e como��o nacional, como o vel�rio do presidente Afonso Pena, 
                         em 1909, e o suic�dio de Get�lio Vargas, em 1954, desfecho de uma das mais contundentes crises pol�tico-militares republicanas. 
                    </p>
                    <p>
                         
                         Com a transfer�ncia da Capital Federal para Bras�lia em 21 de abril de 1960, o Pal�cio do Catete, 
                         com base em Decreto Presidencial de 08 de mar�o de 1960, passou ent�o a ser organizado para abrigar o Museu da Rep�blica,
                         inaugurado a 15 de novembro do mesmo ano.
                        
                    </p>
                </div>
            </div>
            <div id="nos" class="row " style="padding-top: 30px;">
                <h2>Sobre N�s</h2>
            </div>
            <div class="row sobreNos" style="padding-top: 30px;">
                <div class="col-sm-3 imagem">
                    <img src="${logo}" class="img-circle" alt="SoftDesign" style="height: 250px; width: 250px;">
                </div>
                <div class="col-sm-7">
                    <p>
                        N�s somos a SoftDesign, uma f�brica de software especializada em sistemas de museus virtuais. 
                        Temos como miss�o o desenvolvimento eficiente, adotando t�cnicas de engenharia de software e o re�so de software.
                    </p> 
                    <p>
                        Neste projeto, a proposta principal � criar um museu virtual interativo sobre a pol�tica brasileira, onde alunos do ensino fundamental II
                        possam responder desafios, fazer perguntas ao prefessor e coment�rios sobre as obras afim de reter melhor o conhecimento e aprender de forma l�dica.
                    </p>
                    <h3>Nossa Equipe</h3>
                    
                    <div  class="row fotos" style="padding-top: 10px;">
                        <div class="col-sm-4">
                            <img src="${gabriela}" class="img-circle imgNos" alt="Gabriela Martins" style="height: 100px; width: 100px; margin-left: 100px;">
                        </div>
                        <div class="col-sm-4">
                            <img src="${mauricio}" class="img-circle imgNos" alt="Mauricio Spinardi" style="height: 100px; width: 100px; margin-left: 100px;">
                        </div>
                        <div class="col-sm-4">
                            <img src="${monique}" class="img-circle imgNos" alt="Monique Spessoto" style="height: 100px; width: 100px; margin-left: 100px;">
                        </div> 
                    </div>
                    <div  class="row nomes" style="padding-top: 10px;">
                         <div class="col-sm-4">
                             <h4 style="text-align: center">Gabriela Martins</h4>
                        </div>
                        <div class="col-sm-4">
                            <h4 style="text-align: center">Maur�cio Spinardi</h4>
                        </div>
                        <div class="col-sm-4">
                            <h4 style="text-align: center">Monique Spessoto</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
