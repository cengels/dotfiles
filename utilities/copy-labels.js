 [
  {
    "name": "bug",
    "description": "Something isn't working",
    "color": "d73a4a"
  },
  {
    "name": "critical",
    "description": "A critical issue that must be resolved as soon as possible",
    "color": "ed1111"
  },
  {
    "name": "duplicate",
    "description": "This issue or pull request already exists",
    "color": "D2DAE1"
  },
  {
    "name": "feature",
    "description": "New feature or request",
    "color": "756fe8"
  },
  {
    "name": "gui",
    "description": "The issue concerns the graphical user-interface",
    "color": "f444a8"
  },
  {
    "name": "in progress",
    "description": "Currently being worked on",
    "color": "fbca04"
  },
  {
    "name": "other",
    "description": "The issue concerns another part of the application",
    "color": "f444a8"
  },
  {
    "name": "proposal",
    "description": "A tentative issue that may or may not be completed",
    "color": "e89bbb"
  },
  {
    "name": "question",
    "description": "Further information is requested",
    "color": "b2e89b"
  },
  {
    "name": "refactor",
    "description": "Improvements to the code that are not visible to the user.",
    "color": "a30e2c"
  },
  {
    "name": "resolved",
    "description": "The issue's problem is now resolved",
    "color": "8bbf39"
  },
  {
    "name": "waiting",
    "description": "This issue cannot currently be resolved and depends on external dependencies to update.",
    "color": "e8b67d"
  }
].forEach(function(label) {
addLabel(label)
})

function updateLabel (label) {
  var flag = false;
  [].slice.call(document.querySelectorAll(".js-labels-list-item"))
  .forEach(function(element) {
    if (element.querySelector('.js-label-link').textContent.trim() === label.name) {
      flag = true
      element.querySelector('.js-edit-label').click()
      element.querySelector('.js-new-label-name-input').value = label.name
      element.querySelector('.js-new-label-description-input').value = label.description
      element.querySelector('.js-new-label-color-input').value = '#' + label.color
      element.querySelector('.js-edit-label-cancel ~ .btn-primary').click()
    }
  })
  return flag
}

function addNewLabel (label) {
  document.querySelector('.js-new-label-name-input').value = label.name
  document.querySelector('.js-new-label-description-input').value = label.description
  document.querySelector('.js-new-label-color-input').value = '#' + label.color
  document.querySelector('.js-details-target ~ .btn-primary').disabled = false
  document.querySelector('.js-details-target ~ .btn-primary').click()
}

function addLabel (label) {
  if (!updateLabel(label)) addNewLabel(label)
}
