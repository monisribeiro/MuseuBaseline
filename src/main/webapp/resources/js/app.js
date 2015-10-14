angular.module('app', ['ngRoute', 'ngResource', 'ngAnimate', 'ui.bootstrap'])
        .constant('user', {points : 0}) 
        .constant('perg1Disabled', {state: false})
        .constant('perg2Disabled', {state: false})
        .constant('perg3Disabled', {state: false})  
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
                   },
                   name: function(){
                       return name;
                   }
               }
               
             });
          }
          
          changeText();
          
          function changeText(){
              switch(name.trim()){
                  case "A Independência do Brasil. Independence of Brazil, 1888 - Pedro Américo.":
                      $scope.text = "A Independência é um processo ocorrido de 1821 a 1825 e coloca em violenta oposição os Reinos do Brasil e de Portugal. Depois de anos de conflito armado, Portugal finalmente cedeu, e em 29 de agosto de 1825 foi assinado o Tratado de Amizade e Aliança.";
                      $scope.desafioExiste=true;
                  break;
                  case "Primeiro reinado. Abdicação de Pedro I do Brasil - Aurélio de Figueiredo.":
                      $scope.text = "O primeiro reinado do Brasil é o nome dado ao período em que D. Pedro I governou o Brasil como Imperador, entre 1822 e 1831, ano de sua abdicação.  Foi marcado por uma grande crise econômica, financeira, social e política.";
                      $scope.desafioExiste=true;
                break;
                  case "Período regencial. A primeira caricatura do Brasil regência - Manuel de Araújo.":
                      $scope.desafioExiste=false;
                      $scope.text = "O período regencial é como ficou conhecido o decênio de 1831 a 1840. Nele se firmaram a unidade territorial do país e a estruturação das Forças Armadas, além de serem discutidos o grau de autonomia das províncias e a centralização do poder.";
                  break;
                  case "Segundo reinado. D. Pedro II na abertura da Assembléia Geral - Pedro Américo.":
                      $scope.desafioExiste=false;
                      $scope.text = "Período que vai do final do regencial (1831-1840) à proclamação da república (1889). Iniciou em 23 de julho de 1840, com a maioridade de Pedro de Alcântara, e teve o seu término em 15 de novembro de 1889, com a proclamação da república brasileira.";
                  break;
                  case "Proclamação da República - Benedito Calixto.":
                      $scope.desafioExiste=true;
                      $scope.text = "A Proclamação da República Brasileira foi um levante político-militar ocorrido em 15 de novembro de 1889 que derrubou a monarquia constitucional parlamentarista e, por conseguinte, encerrou a soberania do imperador D. Pedro II.";
                  break;
                  case "A Bandeira dos Estado Unidos do Brasil.":
                      $scope.desafioExiste=true;
                      $scope.text = "A Primeira República Brasileira, normalmente chamada de República Velha, foi o período da história do Brasil que se estendeu da proclamação da República até a Revolução de 1930.";
                  break;
                  case "Getúlio Vargas aos 27 anos.":
                      $scope.desafioExiste=false;
                      $scope.text = "Era Vargas é o período da história do Brasil entre 1930 e 1945, quando Getúlio Vargas governou o Brasil por 15 anos e de forma contínua. Compreende a Segunda e Terceira República (Estado Novo).";
                  break;
                  case "Esplanada dos Ministérios de Brasília, em 1959.":
                      $scope.desafioExiste=true;
                      $scope.text = "O período conhecido como República Populista se inicia com a renúncia forçada do Presidente Getúlio Vargas, em outubro de 1945, e termina em 31 de março de 1964, pelas forças militares que iniciaram o regime militar no Brasil.";
                  break;
                  case "Golpe de 1964.":
                      $scope.desafioExiste=true;
                      $scope.text = "A Ditadura militar no Brasil foi o regime instaurado em 1 de abril de 1964, e durou até 15 de março de 1985. De caráter autoritário e nacionalista, acabou quando J. Sarney assumiu a presidência, o que deu início à Nova República.";
                  break;
                  case "A Constituição de 1988.":
                      $scope.desafioExiste=true;
                      $scope.text = "A Nova República é o nome do período da História do Brasil que se seguiu ao fim da ditadura militar. É caracterizado pela ampla democratização política do Brasil e sua estabilização econômica.";
                  break;
              default: 
                  $scope.text = "";
              }
          }
          
          $scope.closeModal = function(){
                $modalInstance.dismiss('closeModal');
           };
   }])
   .controller('DesafioController', ['$scope',  '$modalInstance', '$modal', 'image', 'name', 'user', 'perg1Disabled', 'perg2Disabled', 'perg3Disabled',
       function($scope, $modalInstance, $modal, image, name, user, perg1Disabled, perg2Disabled, perg3Disabled){
          $scope.respostasDisabled = false;
          $scope.resp1model = false;
          $scope.resp2model = false;
          $scope.resp3model = false;
          $scope.resp4model = false;
          $scope.alertmsg = "Resposta correta";
          $scope.alerttype = "alert alert-danger"
           $scope.image = image;
        $scope.showAlert = true; 
          $scope.name = name;
          $scope.closeModal = function(){
                $modalInstance.dismiss('closeModal');
           };
           $scope.points = 0;
           
          changeText();
          
          function changeText(){
              switch(name.trim()){
                  case "Período regencial. A primeira caricatura do Brasil regência - Manuel de Araújo.":
                      $scope.question = "Qual o decênio conhecido como período regencial?";
                      $scope.resp1 = "1861-1870";
                      $scope.resp2 = "1931-1940";
                      $scope.resp3 = "1911-1921";
                      $scope.resp4 = "1831-1840";
                      $scope.respostasDisabled = perg1Disabled.state;
                  break;
                  case "Segundo reinado. D. Pedro II na abertura da Assembléia Geral - Pedro Américo.":
                      $scope.question = "Quando se encerrou o período regencial?";
                      $scope.resp1 = "15 de outubro de 1999";
                      $scope.resp2 = "15 de setembro de 1939";
                      $scope.resp3 = "15 de setembro de 1879";
                      $scope.resp4 = "15 de setembro de 1889";
                      $scope.respostasDisabled = perg2Disabled.state;
                  break;
                  case "Getúlio Vargas aos 27 anos.":
                      $scope.question = " Quantos anos Vargas ficou no poder?";
                      $scope.resp1 = "11 anos";
                      $scope.resp2 = "12 anos";
                      $scope.resp3 = "13 anos";
                      $scope.resp4 = "15 anos";
                      $scope.respostasDisabled = perg3Disabled.state;
                  break;
              default: 
                  $scope.question = "";
              }
              if($scope.respostasDisabled){
                    $scope.showAlert = false; 
                  $scope.alertmsg = "Você já respondeu corretamente a essa questão";
                 $scope.alerttype = "alert alert-warning";
              }
          }
      
           $scope.confereRespostas = function(){
               if($scope.resp4model && !$scope.respostasDisabled) { 
                    $scope.showAlert = false; 
                    user.points += 10;
                    $scope.alertmsg = "Sua resposta está correta, parabéns! Sua pontuação é " + user.points;
                    $scope.alerttype = "alert alert-success";
                    $scope.respostasDisabled = true;
                    switch(name.trim()){
                            case "Período regencial. A primeira caricatura do Brasil regência - Manuel de Araújo.":
                                perg1Disabled.state = true;
                                console.log(perg1Disabled.state);
                            break;
                            case "Segundo reinado. D. Pedro II na abertura da Assembléia Geral - Pedro Américo.":
                                perg2Disabled.state = true;
                            break;
                            case "Getúlio Vargas aos 27 anos.":
                                perg3Disabled.state = true;
                            break;
                        }
                    
                    
                } else if(!$scope.respostasDisabled){ 
                    $scope.showAlert = false; 
                    $scope.alertmsg = "Sua resposta está incorreta, tente novamente!";
                    $scope.alerttype = "alert alert-danger";
                    user.points -= 1;
                }
           }
           
           
           
   }]);