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
        <spring:url value="/resources/imgs/MuseuPaulista.JPG" var="museu" />
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
                            <li ><a href="${contextPath}/webmuseum/object/hello">Home</a></li>
                            <li  ><a href="${contextPath}/webmuseum/object/galeria">Museu</a></li>
                            <li class="dropdown">
                                <span dropdown on-toggle="toggled(open)">
                                    <a href id="simple-dropdown" dropdown-toggle>Desafios<span class="caret"></span></a>
                                    <ul class="dropdown-menu" aria-labelledby="simple-dropdown">
                                        <li><a href="${contextPath}/webmuseum/object/desafios">Associe as Imagens</a></li>
                                        <li><a href="${contextPath}/webmuseum/object/desafios">Teste seu Conhecimento</a></li>
                                    </ul>
                                </span>
                            </li>
                            <li><a href="${contextPath}/webmuseum/object/perguntas">Perguntas</a></li>
                            <li class="active" ><a href="${contextPath}/webmuseum/object/sobre">Sobre</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="container-fluid" style="margin-left: 100px;">
            <div class="row" id="/museu">
                <h2>Sobre o Museu</h2>
            </div>
            <div class="row" style="padding-top: 30px;">
                <div class="col-sm-3">
                    <img src="${museu}" class="img-circle" alt="Museu Paulista" style="height: 250px; width: 250px;">
                </div>
                <div class="col-sm-7">
                    <p>
                        Este é um museu virtual do Museu Paulista, mais conhecido como Museu da Independência. 
                        Ele está localizado no bairro do Ipiranga em São Paulo e faz parte do conjunto arquitetônico
                        do Parque da Independência. Atualmente encontra-se fechado para reformas. 
                    </p>
                    <p>
                        O Museu Paulista foi inaugurado em 7 de setembro de 1895 como museu de História Natural e marco 
                        representativo da Independência, da História do Brasil e Paulista. Seu primeiro núcleo de acervo 
                        foi a coleção do Coronel Joaquim Sertório, que constituía um museu particular em São Paulo.
                    </p>
                    <p>
                        Atualmente, o Museu Paulista possui um acervo de mais de 125.000 unidades, entre objetos, iconografia 
                        e documentação textual, do século 17 até meados do século 20.
                    </p>
                </div>
            </div>
            <div id="/nos" class="row" style="padding-top: 30px;">
                <h2>Sobre Nós</h2>
            </div>
            <div class="row" style="padding-top: 30px;">
                <div class="col-sm-3">
                    <img src="${logo}" class="img-circle" alt="SoftDesign" style="height: 250px; width: 250px;">
                </div>
                <div class="col-sm-7">
                    <p>
                        Nós somos a SoftDesign, uma fábrica de software especializada em sistemas de museus virtuais. 
                        Temos como missão o desenvolvimento eficiente, adotando técnicas de engenharia de software e o reúso de software.
                    </p> 
                    <p>
                        Neste projeto, a proposta principal é criar um museu virtual interativo sobre a política brasileira, onde alunos do ensino fundamental II
                        possam responder desafios, fazer perguntas ao prefessor e comentários sobre as obras afim de reter melhor o conhecimento e aprender de forma lúdica.
                    </p>
                    <h3>Nossa Equipe</h3>
                    
                    <div  class="row" style="padding-top: 10px;">
                        <div class="col-sm-4">
                            <img src="${gabriela}" class="img-circle" alt="Gabriela Martins" style="height: 100px; width: 100px; margin-left: 100px;">
                        </div>
                        <div class="col-sm-4">
                            <img src="${mauricio}" class="img-circle" alt="Mauricio Spinardi" style="height: 100px; width: 100px; margin-left: 100px;">
                        </div>
                        <div class="col-sm-4">
                            <img src="${monique}" class="img-circle" alt="Monique Spessoto" style="height: 100px; width: 100px; margin-left: 100px;">
                        </div> 
                    </div>
                    <div  class="row" style="padding-top: 10px;">
                         <div class="col-sm-4">
                             <h4 style="text-align: center">Gabriela Martins</h4>
                        </div>
                        <div class="col-sm-4">
                            <h4 style="text-align: center">Maurício Spinardi</h4>
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
