<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        
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
        <!--menu-->
        <div  class="container-fluid" ng-app="app">
            

<div class="mainClass" ng-controller="GalleryController">
    <c:forEach items="${list}" var="object">
        <div ng-init="initList('${object.getUrlAddress()}', '${object.getText()}', '${object.getName()}')"></div>
    </c:forEach> 
        <div ng-init="checkOpened()" ></div>
    <script type="text/ng-template" id="myModalContent.html">
        <div class="modal-header" style=" background-color:#195E63;" >
            <button ng-click="closeModal()" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" style="color:#ECE1C3">{{title}}</h4>
        </div>
        <div class="modal-body imageShown" style="height:80%;">
            <div class="left-arrow" style="width:5%;display:inline-block !important; height:350px;padding-top:15%;">
               <button class="button button-hide" ng-click="prev()" ng-hide="contZero"> < </button>
            </div>
            <div style="width:95%;float:right;display:inline-block !important;">
                <div class="left-modal"> 
                        <img  src="<c:url value="{{image}}" />" class="thumbnail img-responsive">
                        <div class="right-modal-p " style="height:130px;margin-top:10px;" >
                            <input type="text" name="search" ng-model="user.comment" class="form-control" style="display:block; float:left; width:80%" placeholder="Deixe seu comentário">
                            <input type="submit" class="btn btn-default" value="Enviar" style="display:block; float:right; width:20%" ng-click="leaveComment()"/>
                           <div class="coments pre-scrollable" style="float:left; width:100%;" >
                                <div class="comments" ng-repeat="c in comments"> 
                                {{c.name}} : {{c.comment}} 
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="right-modal" >
                    <div class="right-modal-p pre-scrollable" style="float:left; width:90%;" >
                        <p> {{text}} </p>
                    </div>
                    <div class="right-arrow" style="float:right;width:10%; height:350px;padding-top:30%;">
                       <button class="button button-hide" ng-click="next()" ng-hide="contFull"> > </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button ng-disabled="{{desafioExiste}}" ng-click="openSecondModal()" type="button" class="btn btn-primary" style=" background-color:#195E63;">
                Desafio
            </button>
        </div>
    </script>
    <script type="text/ng-template" id="myModalDesafio.html">
        <div class="modal-header" style=" background-color:#195E63">
            <button ng-click="closeModal()" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel" style="color:#ECE1C3">{{name}}</h4>
        </div>
        <div class="modal-body modal-body-challenge">
            <div class="row" ng-show="{{perguntaTeorica}}">
                <div class="col-sm-6">
                    <h5 style="text-align: left; color:#000;"><b>Sobre a imagem, responda:</b></h5>
                    <div class="pre-scrollable">
                    <p style="text-align: justify; margin-right:10px; height:120px;">{{question}}</p>
                    </div>    
                    <form >
                        <div class="radio">
                            <label><input type="radio" name="resposta" value="resp1" ng-disabled="respostasDisabled" ng-value="true" ng-model="resp1model"> {{resp1}}</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="resposta" value="resp2" ng-disabled="respostasDisabled" ng-value="true" ng-model="resp2model"> {{resp2}}</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="resposta" value="resp3" ng-disabled="respostasDisabled" ng-value="true" ng-model="resp3model"> {{resp3}}</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="resposta" value="resp4" ng-disabled="respostasDisabled" ng-value="true" ng-model="resp4model"> {{resp4}}</label>
                        </div>
                    </form> 
                    <div class="{{alerttype}}" ng-hide="showAlert">{{alertmsg}}</div>

                </div>
                 <div class="col-sm-6 image-desafio">
                    <img ng-drag="true" src="{{image}}" class="thumbnail img-responsive">
                </div>
                
            </div>
                
                <div class="row" ng-show="{{perguntaImagem}}">
                <div class="col-sm-6">
                    <h5 style="text-align: left; color:#000;"><b>Sobre a imagem, responda:</b></h5>
                    <div class="pre-scrollable">
                    <p style="text-align: justify; margin-right:10px; height:120px;">{{question}}</p>
                    </div>    
                    <form >
                    
                     <ul class="draggable-objects">
                        <li  ng-repeat="obj in draggableObjects" >
                            <div ng-drag="true" ng-drag-data="obj" data-allow-transform="true"> {{obj.name}} </div>
                        </li>
                    </ul>
                   </form>
                    <div class="{{alerttype}}" ng-hide="showAlert">{{alertmsg}}</div>

                </div>
                 <div class="col-sm-6 image-desafio-img">
                    <img  src="{{image}}" class="thumbnail img-responsive">
                    
                    <div ng-drop="true" ng-drop-success="onDropComplete($data,$event)" >
                        Drop area
                      </div>
                </div>
            </div>


        </div>
        <div class="modal-footer">
                <button type="button" class="btn btn-primary" ng-click="confereRespostas()" style=" background-color:#195E63;">
                    Confira a resposta
                </button>
        </div>
    </script>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
    <div class="row" style="margin:0px;">
    <nav class="navbar navbar-default">
                <div   class="container-fluid">
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
                            <li ><a href="${contextPath}/object/hello">Home</a></li>
                            <li class="active" ><a href="${contextPath}/object/galeria">Museu</a></li>
                            <li class="dropdown">
                                <span dropdown on-toggle="toggled(open)">
                                <a href id="simple-dropdown" dropdown-toggle>Desafios<span class="caret"></span></a>
                                <ul class="dropdown-menu" aria-labelledby="simple-dropdown">
                                     <li><a href="${contextPath}/object/desafios">Associe as Imagens</a></li>
                                     <li><a href="${contextPath}/object/desafios">Teste seu Conhecimento</a></li>
                                 </ul>
                                </span>
                            </li>
                            <li><a href="${contextPath}/object/perguntas">Perguntas</a></li>
                            <li><a href="${contextPath}/object/sobre">Sobre o Museu</a></li>
                            <li><a href="${contextPath}/object/sobre#nos">Sobre Nós</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
    
            </div>

            <div class="row mainClass" style="background-color: #fff">
                <div class="col-sm-7">
                    <h2>Museu da Política Brasileira</h2>
                </div>
                <div class="col-sm-5">
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-default btnTour" ng-click="openTour()">Iniciar Tour</button>
                    </div>
                    <div class="col-sm-8" >
                        <div style="display:inline-block;margin-top:20px;width:100%;padding-left:10px;">
                            
                           <form  action="search" method="post">
                                 <input type="text" name="search" class="form-control" style="display:block; float:left; width:80%" placeholder="Buscar por..">
                                <input type="submit" class="btn btn-default" value="Ok" style="display:block; float:right; width:20%"/>
                              </form>
                        </div>
                     </div><!-- /input-group -->
                </div>
            </div>
           <div class="row galleryRow" >
                <c:forEach items="${list}" var="object">
                 <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <a title="Proclamação da República" href="">
                        <img ng-drag="true" ng-click="openImage('<c:url value="/resources/${object.getUrlAddress()}" />', '${object.getText()}', '${object.getName()}', 'lg')" src="<c:url value="/resources/${object.getUrlAddress()}" />" class="thumbnail img-responsive">
                      </a>
                      <div class="caption">
                        <h3>${object.getName()}</h3>
                      </div>
                    </div>
                  </div> 
                </c:forEach> 
            </div>
        </div>
    </body>
</html>