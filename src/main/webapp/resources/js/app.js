angular.module('app', ['ngRoute', 'ngResource', 'ngAnimate', 'ui.bootstrap', 'ngDraggable'])
        .constant('user', {points : 0}) 
        .constant('perg1Disabled', {state: false})
        .constant('perg2Disabled', {state: false})
        .constant('perg3Disabled', {state: false})  
        .constant('contGuia', {cont: 0})  
        .constant('galeryImages', {images : []})
        .config(['$routeProvider', '$compileProvider',
  function($routeProvider, $compileProvider) {
      
        $compileProvider.debugInfoEnabled(false);
     console.log($routeProvider);
    
  }])
  .controller('TestController', ['$scope', '$location', function($scope, $location){
          alert($location.url);
  }])
      .controller('MainController', ['$scope', function($scope){
          
         
  }])
    .controller('GalleryController', ['$scope', '$modal', 'contGuia', 'galeryImages', '$rootScope', '$location', '$window' ,
    function($scope, $modal, contGuia, galeryImages, $rootScope, $location, $window){
        
        var opened = false;
        
        var location = $window.location.pathname.split('/'); 
        if(location[location.length-1] == 'tour'){ opened = true;  
            console.log("open");
        }
                    
                    
        console.log("oi");
            $scope.initList = initList;
            $scope.checkOpened = checkOpened;
          var cont = 0 ;
          var images = [];
          
           $rootScope.$on("OpenTour", function(){
                openTour();
             });
 
            function checkOpened(){
                if(opened){
                openTour();
                }
            }
            function initList(url, text, name){
                console.log("init");
             var image = {url: url, text:text, name:name, id:cont, comments:[]} ;
              images.push(image);
              cont += 1; 
             galeryImages.images = images;
              
          }
          
          $scope.openTour = openTour;
          
        function openTour(){
              console.log("openTour" + galeryImages.images.length);
              angular.forEach(galeryImages.images, function(value, key){
                if(value.id == contGuia.cont){
                  console.log("log");
                  openImage('/webmuseum/resources/' + value.url, '', value.name, 'lg');
               }
            });
          };
          
          $scope.openImage = openImage;
              
            
            function openImage(img, text, name, size){
            console.log("open" + img);
            angular.forEach(galeryImages.images, function(value, key){
                if(value.name == name){
                  contGuia.cont = value.id;
               }
            });
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
             
             
           }
   }])
       .controller('MainCtrl', function ($scope) {
        $scope.centerAnchor = true;
        $scope.toggleCenterAnchor = function () {$scope.centerAnchor = !$scope.centerAnchor}
        $scope.draggableObjects = [{name:'one'}, {name:'two'}, {name:'three'}];
        $scope.droppedObjects1 = [];
        $scope.droppedObjects2= [];
        $scope.onDropComplete1=function(data,evt){
            var index = $scope.droppedObjects1.indexOf(data);
            if (index == -1)
            $scope.droppedObjects1.push(data);
        }
        $scope.onDragSuccess1=function(data,evt){
            console.log("133","$scope","onDragSuccess1", "", evt);
            var index = $scope.droppedObjects1.indexOf(data);
            if (index > -1) {
                $scope.droppedObjects1.splice(index, 1);
            }
        }
        $scope.onDragSuccess2=function(data,evt){
            var index = $scope.droppedObjects2.indexOf(data);
            if (index > -1) {
                $scope.droppedObjects2.splice(index, 1);
            }
        }
        $scope.onDropComplete2=function(data,evt){
            var index = $scope.droppedObjects2.indexOf(data);
            if (index == -1) {
                $scope.droppedObjects2.push(data);
            }
        }
        var inArray = function(array, obj) {
            var index = array.indexOf(obj);
        }
      })
   .controller('ModalController', ['$scope', 'image', '$modalInstance', '$modal', 'text', 'name', 'contGuia', 'galeryImages', '$rootScope',  
       function($scope, image, $modalInstance, $modal, text, name,contGuia, galeryImages, $rootScope){
          
          $scope.title = name;
          $scope.image = image;
          $scope.text = text;
          
          
          $scope.comments = galeryImages.images[contGuia.cont].comments;
          
          $scope.leaveComment = function(){
              $scope.comments.push({name: "An�nimo",comment: $scope.user.comment});
              $scope.user.comment = "";
              galeryImages.images[contGuia.cont].comments = $scope.comments;
          };
          
          $scope.contZero = contGuia.cont == 0;
          $scope.contFull = contGuia.cont == galeryImages.images.length-1;
          
          if($scope.contFull) contGuia.cont = 0;
          
          $scope.prev = function(){
              contGuia.cont--;
              closeModal();
             $rootScope.$emit("OpenTour", {});
          };
          
          $scope.next = function(){
              contGuia.cont++;
              closeModal();
             $rootScope.$emit("OpenTour", {});
          };
   
          
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
          };
          
          changeText();
          
          function changeText(){
              console.log("changeText" 
                      + name)
              switch(name.trim()){
                  case "A Independ�ncia do Brasil. Independence of Brazil, 1888 - Pedro Am�rico.":
                      $scope.text = "A Independ�ncia � um processo ocorrido de 1821 a 1825 e coloca em violenta oposi��o os Reinos do Brasil e de Portugal. Depois de anos de conflito armado, Portugal finalmente cedeu, e em 29 de agosto de 1825 foi assinado o Tratado de Amizade e Alian�a.";
                      $scope.desafioExiste=true;
                  break;
                  case "Primeiro reinado. Abdica��o de Pedro I do Brasil - Aur�lio de Figueiredo.":
                      $scope.text = "O primeiro reinado do Brasil � o nome dado ao per�odo em que D. Pedro I governou o Brasil como Imperador, entre 1822 e 1831, ano de sua abdica��o.  Foi marcado por uma grande crise econ�mica, financeira, social e pol�tica.";
                      $scope.desafioExiste=true;
                break;
                  case "Per�odo regencial. A primeira caricatura do Brasil reg�ncia - Manuel de Ara�jo.":
                      $scope.desafioExiste=false;
                      $scope.text = "O per�odo regencial � como ficou conhecido o dec�nio de 1831 a 1840. Nele se firmaram a unidade territorial do pa�s e a estrutura��o das For�as Armadas, al�m de serem discutidos o grau de autonomia das prov�ncias e a centraliza��o do poder.";
                  break;
                  case "Segundo reinado. D. Pedro II na abertura da Assembl�ia Geral - Pedro Am�rico.":
                      $scope.desafioExiste=false;
                      $scope.text = "Per�odo que vai do final do regencial (1831-1840) � proclama��o da rep�blica (1889). Iniciou em 23 de julho de 1840, com a maioridade de Pedro de Alc�ntara, e teve o seu t�rmino em 15 de novembro de 1889, com a proclama��o da rep�blica brasileira.";
                  break;
                  case "Proclama��o da Rep�blica - Benedito Calixto.":
                      $scope.desafioExiste=true;
                      $scope.text = "A Proclama��o da Rep�blica Brasileira foi um levante pol�tico-militar ocorrido em 15 de novembro de 1889 que derrubou a monarquia constitucional parlamentarista e, por conseguinte, encerrou a soberania do imperador D. Pedro II.";
                  break;
                  case "A Bandeira dos Estado Unidos do Brasil.":
                      $scope.desafioExiste=false;
                      $scope.text = "A Primeira Rep�blica Brasileira, normalmente chamada de Rep�blica Velha, foi o per�odo da hist�ria do Brasil que se estendeu da proclama��o da Rep�blica at� a Revolu��o de 1930.";
                  break;
                  case "Get�lio Vargas aos 27 anos.":
                      $scope.desafioExiste=false;
                      $scope.text = "Era Vargas � o per�odo da hist�ria do Brasil entre 1930 e 1945, quando Get�lio Vargas governou o Brasil por 15 anos e de forma cont�nua. Compreende a Segunda e Terceira Rep�blica (Estado Novo).";
                  break;
                  case "Esplanada dos Minist�rios de Bras�lia, em 1959.":
                      $scope.desafioExiste=true;
                      $scope.text = "O per�odo conhecido como Rep�blica Populista se inicia com a ren�ncia for�ada do Presidente Get�lio Vargas, em outubro de 1945, e termina em 31 de mar�o de 1964, pelas for�as militares que iniciaram o regime militar no Brasil.";
                  break;
                  case "Golpe de 1964.":
                      $scope.desafioExiste=true;
                      $scope.text = "A Ditadura militar no Brasil foi o regime instaurado em 1 de abril de 1964, e durou at� 15 de mar�o de 1985. De car�ter autorit�rio e nacionalista, acabou quando J. Sarney assumiu a presid�ncia, o que deu in�cio � Nova Rep�blica.";
                  break;
                  case "A Constitui��o de 1988.":
                      $scope.desafioExiste=true;
                      $scope.text = "A Nova Rep�blica � o nome do per�odo da Hist�ria do Brasil que se seguiu ao fim da ditadura militar. � caracterizado pela ampla democratiza��o pol�tica do Brasil e sua estabiliza��o econ�mica.";
                  break;
              default: 
                  $scope.text = "";
              }
          }
          
          $scope.closeModal = closeModal;
                  
           function closeModal(){
                $modalInstance.dismiss('closeModal');
           }
   }])
   .controller('DesafioController', ['$scope',  '$modalInstance', '$modal', 'image', 'name', 'user', 'perg1Disabled', 'perg2Disabled', 'perg3Disabled', 
       function($scope, $modalInstance, $modal, image, name, user, perg1Disabled, perg2Disabled, perg3Disabled){
            $scope.centerAnchor = true;
        $scope.toggleCenterAnchor = function () {$scope.centerAnchor = !$scope.centerAnchor}
        $scope.draggableObjects = [{name : '/webmuseum/resources/imgs/resp1.png'}, {name : '/webmuseum/resources/imgs/resp2.png'},
            {name : '/webmuseum/resources/imgs/resp3.png'},{name : '/webmuseum/resources/imgs/resp4.png'}];
        $scope.droppedObjects1 = [];
           $scope.respostasDisabled = false;
          $scope.resp1model = false;
          $scope.resp2model = false;
          $scope.resp3model = false;
          $scope.resp4model = false;
          $scope.draggableDiv = false;
          $scope.perguntaImagem = false; 
          $scope.perguntaTeorica = false; 
          $scope.alertmsg = "Resposta correta";
          $scope.alerttype = "alert alert-danger"
           $scope.image = image;
           $scope.imageResp = '/webmuseum/resources/imgs/drag-and-drop.png';
        $scope.showAlert = true; 
          $scope.name = name;
          
           $scope.onDragComplete=function(data,evt){
                console.log("drag success, data:", data);
             }
             $scope.onDropComplete=function(data,evt){
                 console.log("drop success, data:", data);
             }
            
          
          $scope.closeModal = function(){
                $modalInstance.dismiss('closeModal');
           };
           $scope.points = 0;
           
          changeText();
          
          function changeText(){
              switch(name.trim()){
                  case "Per�odo regencial. A primeira caricatura do Brasil reg�ncia - Manuel de Ara�jo.":
                      $scope.question = "Qual o dec�nio conhecido como per�odo regencial?";
                      $scope.resp1 = "1861-1870";
                      $scope.resp2 = "1931-1940";
                      $scope.resp3 = "1911-1921";
                      $scope.resp4 = "1831-1840";
                      $scope.respostasDisabled = perg1Disabled.state;
                      $scope.perguntaTeorica = true; 
                      $scope.perguntaImagem = false; 
                  break;
                  case "Segundo reinado. D. Pedro II na abertura da Assembl�ia Geral - Pedro Am�rico.":
                      $scope.question = "Quando se encerrou o per�odo regencial?";
                      $scope.resp1 = "15 de outubro de 1999";
                      $scope.resp2 = "15 de setembro de 1939";
                      $scope.resp3 = "15 de setembro de 1879";
                      $scope.resp4 = "15 de setembro de 1889";
                      $scope.respostasDisabled = perg2Disabled.state;
                      $scope.perguntaTeorica = true; 
                      $scope.perguntaImagem = false; 
                  break;
                  case "Get�lio Vargas aos 27 anos.":
                      $scope.question = " Quantos anos Vargas ficou no poder?";
                      $scope.resp1 = "11 anos";
                      $scope.resp2 = "12 anos";
                      $scope.resp3 = "13 anos";
                      $scope.resp4 = "15 anos";
                      $scope.respostasDisabled = perg3Disabled.state;
                      $scope.perguntaTeorica = true; 
                      $scope.perguntaImagem = false; 
                  break;
                  case "A Bandeira dos Estado Unidos do Brasil.":
                      $scope.question = " Qual a atual bandeira do brasil? (Arraste a imagem correta ao local indicado)";
                      $scope.respostas = [{resp1 : "/webmuseum/resources/imgs/resp1.png", resp2 : "/webmuseum/resources/imgs/resp2.png",
                          resp3 : "/webmuseum/resources/imgs/resp3.png",resp4 : "/webmuseum/resources/imgs/resp4.png"}]
                      $scope.resp1 = "/webmuseum/resources/imgs/resp1.png";
                      $scope.resp2 = "/webmuseum/resources/imgs/resp2.jpg";
                      $scope.resp3 = "/webmuseum/resources/imgs/resp3.jpg";
                      $scope.resp4 = "/webmuseum/resources/imgs/resp4.png";
                      $scope.respostasDisabled = perg3Disabled.state;
                      
                      $scope.perguntaTeorica = false; 
                      $scope.perguntaImagem = true; 
                      console.log("pergunta" + $scope.perguntaImagem);
                  break;
              default: 
                  $scope.question = "";
              }
              if($scope.respostasDisabled){
                    $scope.showAlert = false; 
                  $scope.alertmsg = "Voc� j� respondeu corretamente a essa quest�o";
                 $scope.alerttype = "alert alert-warning";
              }
          }
      
           $scope.confereRespostas = function(){
               if($scope.resp4model && !$scope.respostasDisabled) { 
                    $scope.showAlert = false; 
                    user.points += 10;
                    $scope.alertmsg = "Sua resposta est� correta, parab�ns! Sua pontua��o � " + user.points;
                    $scope.alerttype = "alert alert-success";
                    $scope.respostasDisabled = true;
                    switch(name.trim()){
                            case "Per�odo regencial. A primeira caricatura do Brasil reg�ncia - Manuel de Ara�jo.":
                                perg1Disabled.state = true;
                                console.log(perg1Disabled.state);
                            break;
                            case "Segundo reinado. D. Pedro II na abertura da Assembl�ia Geral - Pedro Am�rico.":
                                perg2Disabled.state = true;
                            break;
                            case "Get�lio Vargas aos 27 anos.":
                                perg3Disabled.state = true;
                            break;
                        }
                    
                    
                } else if(!$scope.respostasDisabled){ 
                    $scope.showAlert = false; 
                    $scope.alertmsg = "Sua resposta est� incorreta, tente novamente!";
                    $scope.alerttype = "alert alert-danger";
                    user.points -= 1;
                }
           }
           
           
           
   }])
   .controller('AboutCtrl', function ($scope, $location) {
       
      })
      .controller('QuestionsCtrl', function ($scope, $location) {
       $scope.nome = "";
       $scope.pergunta = "";
       
       $scope.perguntas = [];
       
       console.log("oi");
       $scope.enviarPergunta = function(){
           var d = new Date();
           $scope.perguntas.push({"nome" : $scope.nome, "pergunta" : $scope.pergunta, "resposta" : "Aguardando resposta do professor...", "data" : d.getDate() + "/" + d.getMonth() + "/" + d.getFullYear()});
           console.log($scope.perguntas);
           $scope.nome="";
           $scope.pergunta="";
       };
      });
