document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.password_matches')

  if (control) { control.addEventListener('input', passwordMatches) }
})

function passwordMatches(){
  var password = user_password.value
  var passwordConfirmation = user_password_confirmation.value

  if (passwordConfirmation === '') {
    this.querySelector('.octicon-alert').classList.add('hide')
    this.querySelector('.octicon-check-circle').classList.add('hide')
    return
  }
  if (password === passwordConfirmation){
    this.querySelector('.octicon-alert').classList.add('hide')
    this.querySelector('.octicon-check-circle').classList.remove('hide')
  } else {
    this.querySelector('.octicon-alert').classList.remove('hide')
    this.querySelector('.octicon-check-circle').classList.add('hide')
  }
}
