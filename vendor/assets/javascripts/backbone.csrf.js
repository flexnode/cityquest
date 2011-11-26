Backbone.Model.prototype.toJSON = function() {
  return _(_.clone(this.attributes)).extend({
   'authenticity_token' : $('meta[name="csrf-token"]').attr('content')
  });
 }