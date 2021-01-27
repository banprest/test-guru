document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.progress-bar')

  if (control) {
    var progress = document.querySelector('.progress-bar').dataset.progress
    document.getElementById('progress').value = progress - 1
  }
})
