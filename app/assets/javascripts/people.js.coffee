# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  $('#people_controller a.add_person').live 'click', ->
    $('#new_person')[0].reset()
    $('#add_person_div').dialog
      resizable: false,
      height:444,
      width:600,
      modal: true,
      buttons: 
        Cancel: ->
          $(this).dialog('destroy')
          $('#new_person form')[0].reset()
    false
