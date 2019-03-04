// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self

// this brings in the channels
//= require_tree ./channels


// js starting with parenthesis '(' means it's an immediately invoked function.
(function () {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);