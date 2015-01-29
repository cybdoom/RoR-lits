function Vacancy(html) {
  var body = $(html),
      self = this;

  this.ui = {
    body:     body,
    head:     body.find('.head'),
    details:  body.find('.details'),
    actions:  body.find('.actions-panel')
  }

  function ToggleActionsPanel() {
    self.ui.actions.fadeToggle(64);
  }

  function ToggleDetails() {
    self.ui.details.fadeToggle(64);
  }

  function SetEventHandlers() {
    self.ui.body.off().on('mouseenter mouseleave', ToggleActionsPanel);
    self.ui.head.off().on('click', ToggleDetails);
  }

  function InitializeUI() {
    self.ui.actions.hide();
  }

  SetEventHandlers();
  InitializeUI();
}
