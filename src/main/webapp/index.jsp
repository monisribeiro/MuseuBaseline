<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">

        <!--
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/lib/angular.js"></script>
        <script type="text/javascript" src="js/lib/angular-route.js"></script>
        <script type="text/javascript" src="js/lib/angular-resource.js"></script>
        <script type="text/javascript" src="js/app.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular-animate.js"></script>
        <script src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.13.4.js"></script>

        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
        <link href="bootstrap-theme.css" rel="stylesheet" />
        <link href="bootstrap-theme.min.css" rel="stylesheet" />
        <link href="bootstrap.css" rel="stylesheet" />
        <link href="bootstrap.min.css" rel="stylesheet" />
        <link href="style.css" rel="stylesheet">
        -->
        <spring:url value="/resources/style.css" var="styleCss" />
        <spring:url value="/resources/bootstrap-theme.css" var="bootstrapThemeCss" />
        <spring:url value="/resources/bootstrap-theme.min.css" var="bootstrapThemeMinCss" />
        <spring:url value="/resources/bootstrap.css" var="bootstrap" />
        <spring:url value="/resources/bootstrap.min.css" var="bootstrapMin" />
	<spring:url value="/resources/js/jquery/jquery.min.js" var="jquery" />
        <spring:url value="/resources/js/lib/bootstrap.min.js" var="bootstrapMin" />
	<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapMinJs" />
        <spring:url value="/resources/js/lib/angular.js" var="angularJs" />
	<spring:url value="/resources/js/lib/angular-route.js" var="angularRouteJs" />
        <spring:url value="/resources/js/lib/angular-resource.js" var="angularResourceJs" />
	<spring:url value="/resources/js/lib/angular-animate.js" var="angularAnimateJs" />
        <spring:url value="/resources/ui-bootstrap-tpls-0.13.4.js" var="bootstrapUi" />
        <spring:url value="/resources/js/app.js" var="appJs" />
	
	<link href="${styleCss}" rel="stylesheet" />
        <link href="${bootstrapCss}" rel="stylesheet" />
        <link href="${bootstrapThemeCss}" rel="stylesheet" />
        <link href="${bootstrapThemeMinCss}" rel="stylesheet" />
        <link href="${bootstrap}" rel="stylesheet" />
        <link href="${bootstrapMin}" rel="stylesheet" />
        <script src="${jquery}"></script>
        <script src="${bootstrapMin}"></script>
        <script src="${bootstrapMinJs}"></script>
        <script src="${angularJs}"></script>
        <script src="${angularRouteJs}"></script>
        <script src="${angularResourceJs}"></script>
        <script src="${angularAnimateJs}"></script>
        <script src="${bootstrapUi}"></script>
        <script src="${appJs}"></script>

    </head>
    <body>
        <!--menu-->
        <div  class="container-fluid" ng-app="app" ng-controller='TestController'>
            <div class="well">OI</div>
            <div ng-view></div>
        </div>
    </body>
</html>
