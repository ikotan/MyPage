addressBooks

.controller('mainCtrl', ['$scope', 'addressApi', function($scope, addressApi) {
  $scope.title = "AngularJS";

  addressApi.list({ page: '' }, function(data) {
    $scope.data = data;
  });

}]);
