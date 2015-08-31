addressBooks.controller('mainCtrl', ['$scope', 'addressApi', function($scope, addressApi) {
  $scope.title = "AngularJS";
  addressApi.query(function(data) {
    angular.forEach(data, function(d) {
     console.log(d);
    })
  });
}]);



