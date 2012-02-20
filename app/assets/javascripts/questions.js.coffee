# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

jQuery ->
  

  addOption= ->
    options = $('.question-choice-option') 
    $('.field.options').append("
    <p class=\"#{options.length + 1}\">
      <label for=\"question_choices_Option\">Opt #{options.length + 1}</label>
      <input class=\"question-choice-option\" id=\"question_choices_opt#{options.length + 1}\" name=\"question[choices][opt#{options.length + 1}]\" placeholder=\"\" size=\"30\" type=\"text\"><a href='javascript:void(0)' class='icon-minus-sign remove-choice' data-id='#{options.length + 1}'> </a>
   </p>")

  
  removeOption= ->
    elem = $(@).data('id')
    $("p.#{elem}").remove()

  $(".field.choices").delegate("a.remove-choice", "click", removeOption)
  $(".field.choices").delegate("a.add-choice",    "click", addOption   )
