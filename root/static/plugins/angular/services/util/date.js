addressBooks

.factory('UtilDate', [function() {
  return {
    toDate: function(dateObj) {
      return [ dateObj.getFullYear(), dateObj.getMonth(), dateObj.getDate() ].join("-");
    },
  };
}])

;
