angular.module('app', ['ngRoute', 'ngResource', 'ngAnimate', 'ui.bootstrap'])
        .config(['$routeProvider',
  function($routeProvider) {
     console.log($routeProvider);
    $routeProvider.
      when('/object/hello', {
        templateUrl: 'partials/main.html'
      }).
      when('/galeria', {
        templateUrl: 'partials/galeria.html'
      }).
      when('/galeria/imagem', {
        templateUrl: 'partials/visualizacaoImagem.html'
      }).
      when('/desafios', {
        templateUrl: 'partials/desafios.html'
      }).
      when('/perguntas', {
        templateUrl: 'partials/perguntas.html'
      }).
      when('/sobreMuseu', {
        templateUrl: 'partials/sobreMuseu.html'
      }).
      when('/sobreNos', {
        templateUrl: 'partials/sobreNos.html'
      });
  }])
  .controller('TestController', ['$scope', '$location', function($scope, $location){
          alert($location.url);
  }])
      .controller('MainController', ['$scope', '$location', function($scope, $location){
          $scope.redirectDesafios = redirectDesafios;
          $scope.redirectGaleria = redirectGaleria;
          
          function redirectDesafios(){
              
              $location.path("desafios");
          }
          
          function redirectGaleria(){
              $location.path("galeria");
          }
  }])
    .controller('GalleryController', ['$scope', '$modal', '$http', function($scope, $modal, $http){
           
          $scope.openImage = function(img, text, name, size){
            var modalInstance = $modal.open({
               animation: $scope.animationsEnabled,
               size:size, 
               templateUrl: 'myModalContent.html', 
               controller: 'ModalController', 
               resolve: {
                   image: function(){
                       return img;
                   },
                   text: function(){
                       return text;
                   },
                   name: function(){
                       return name;
                   }
               }
             });
           };
   }])
   .controller('ModalController', ['$scope', 'image', '$modalInstance', '$modal', 'text', 'name', function($scope, image, $modalInstance, $modal, text, name){
          
                   $scope.title = name;
           $scope.image = image;
          $scope.text = text;
          $scope.openSecondModal = function(){
               var modalInstance = $modal.open({
               animation: $scope.animationsEnabled,
               size:'lg', 
               templateUrl: 'myModalDesafio.html', 
               controller: 'DesafioController', 
               resolve: {
                   image: function(){
                       return image;
                   }
               }
               
             });
          }
          
          $scope.closeModal = function(){
                $modalInstance.dismiss('closeModal');
           };
   }])
   .controller('DesafioController', ['$scope',  '$modalInstance', '$modal', 'image', function($scope, $modalInstance, $modal, image){
          
           $scope.image = image;
          
          $scope.closeModal = function(){
                $modalInstance.dismiss('closeModal');
           };
   }]);