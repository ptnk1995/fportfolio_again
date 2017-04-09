// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree ./admin
//= require bootstrap-sprockets
//= require main.js.coffee
//= require jquery.purr
//= require best_in_place
//= require social-share-button
//= require ckeditor/init
//= require nprogress
//= require nprogress-turbolinks

function alert_message(title, text, type){
  swal({
    title: title,
    text: text,
    type: type
  });
}

$(document).ready(function() {
  function validation() {

        alert_message('', I18n.t('dashboard.request.errors_date'), 'warning');

  }
})

NProgress.configure({
  showSpinner: false
});
