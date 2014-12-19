$(function() {
  $.each($('.vacancy'), function(i, element) {
    new Vacancy(element);
  });
});

