addressBooks

.factory('apiResource', ['$resource', function($resource) {
  return $resource('/api/address', null, {
    'list': { method: 'GET', url: '/api/address/list', params: { page: '@page' } },
  });
}])

.factory('addressResource', ['$resource', function($resource) {
  return $resource('/address/:addressId', { addressId: '@id' }, {
    'delete': { method: 'DELETE', url: '/address/:addressId/delete' }
  });
}])

;
