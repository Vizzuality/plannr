// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var ready;
ready = function() {
  $('.datepicker').datepicker({
    autoclose: true,
    format: 'dd-mm-yyyy'
  });
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
};
$(document).ready(ready);
$(document).on('turbolinks:load', ready);
