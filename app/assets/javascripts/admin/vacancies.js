function OnVacanciesPageReady() {
  $.each($('.vacancy'), function(i, element) {
    new Vacancy(element);
  });

  $('.sf-menu a').on('click', function(e) {
    location.reload();
  });
}

$(function() {
  OnVacanciesPageReady();
});


