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

  formSelect= ->
    type = $(@ + ':selected').text()
    if type == "Poll"
      $('.field.short, .field.long').hide()
      $('.field.choices').show()
    if type == "Short"
      $('.field.choices, .field.long').hide()
      $('.field.short').show()
    if type == "Rant"
      $('.field.short, .field.choices').hide()
      $('.field.long').show()

  $(".field.choices")   .delegate("a.remove-choice"     , "click" , removeOption)
  $(".field.choices")   .delegate("a.add-choice"        , "click" ,  addOption  )
  $("form#new_question").delegate("select#question_type", "change", formSelect  )
  formSelect()