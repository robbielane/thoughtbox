// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require lodash
//= require_tree .

$(document).ready(function () {
  passwordConfirmation();
  linkReadStaus();
  search();
});

var passwordConfirmation = function () {
  var $pass  = $('#password');
  var $pass1 = $('#p_match');
  var $signUpButton = $('#sign-up');

  $('#p_match, #password').on('keyup', function(e) {
    if ($pass.val() === '' || $pass1.val() === '') {
      $signUpButton.prop('disabled', true);
    } else if ($pass.val() === $pass1.val()) {
      $signUpButton.removeAttr('disabled');
    } else {
      $signUpButton.prop('disabled', true);
    }
  });
};

var linkReadStaus = function () {
  $('tr').delegate('#read', 'click', function(e) {
    $link = $(this).closest('tr');
    toggleReadStatus($link.data('id'));
    $link.toggleClass('true');
    if ($link.hasClass('true')) {
      $(this).text('Mark as Unread');
    } else {
      $(this).text('Mark as Read');
    }
  });
};

var toggleReadStatus = function (id) {
  $.ajax({
    type: 'PATCH',
    url: '/api/v1/links/' + id + '/toggle_read',
    success: function(link) {
      console.log("success");
    }
  });
};

var search = function() {
  $('#search').on('keyup', function (e) {
    var searchTerm = $('#search').val();
    var $links = $('.link');
    $links.hide();
    var filteredLinks = _.filter($links, function(link) {
      return $(link).data('title').includes(searchTerm);
    });
    $(filteredLinks).show();
    if (!searchTerm) { $links.show(); }
  });
};
