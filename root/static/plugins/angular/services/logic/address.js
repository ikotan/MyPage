addressBooks

.factory('AddressLogic', ['$window', function($window) {
  return {
    showUrl: function(id) {
      return '/address/' + id;
    },
    editUrl: function(id) {
      return '/address/' + id + '/edit';
    },
    getPathId: function() {
      return $window.location.pathname.split("/")[2];
    }
  };
}])

;
