addressBooks

.controller('mainCtrl', ['$scope', 'addressApi', function($scope, addressApi) {
  $scope.title = "AngularJS";

  addressApi.list({ page: '' }, function(data) {
    angular.forEach(data.address_books, function(d) {
     console.log(d);
    })
  });

}]);
