addressBooks

.factory('addressResource', ['$resource', function($resource) {
  return $resource('/api/address/:addressId', { addressId: '@id' }, {
    'list': { method: 'GET', url: '/api/address/list', params: { page: '@page', rows: '@rows' } },
    'prefectures': { method: 'GET', url: '/api/address/prefectures' },
    'create': { method: 'POST', url: '/api/address/create' },
    'delete': { method: 'DELETE', url: '/api/address/:addressId/delete' },
  });
}])

;
