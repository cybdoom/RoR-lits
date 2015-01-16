function VacanciesViewer(html) {
  var self = this,
      body = $(html);

  this.ui = {
    userFilter: body.find('#user_filter')
  };

  function FilterByUser(userId) {
    var oldUrl = window.location.href;
    if (!/\?/.test(oldUrl)) oldUrl += '?';
    var filterString = 'user_filter=' + userId,
        newUrl = /user_filter=/.test(oldUrl) ? oldUrl.replace(/user_filter=\d+/, filterString) : oldUrl + filterString;

    window.location.href = newUrl;
  }

  function SetEventHandlers() {
    self.ui.userFilter.off().on('change', function(e) {
      userId = $(this).val();
      FilterByUser(userId);
    });
  }

  SetEventHandlers();

  $.each($('.vacancy'), function(i, element) {
    new Vacancy(element);
  });
}

$.each($('.vacancies'), function(i, e) { new VacanciesViewer(e); });
