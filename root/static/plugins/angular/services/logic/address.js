addressBooks

.factory('AddressLogic', ['$window', function($window) {
  return {
    editUrl: function(id) {
      return '/address/' + id + '/edit';
    },
    getPathId: function() {
      return $window.location.pathname.split("/")[2];
    }
  };
}])

;
