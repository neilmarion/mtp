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
          $('#new_person')[0].reset()
    false

  $('.person_row td:not(.checkbox_cell)').live 'click', ->
    unless $('a', this)[0]?
      tr = $(this).parent()
      document.location = '/people/' + tr.attr('data-id')


  $('#add_person_div .save').live 'click', ->
      form = $(this).closest('form')
      if $('#person_first_name', form).val() == ''
        alert(I18n.t('errors.first_name_missing'))
        return false
      if $(this).hasClass('save_and_more')
        $('#add_another').val('true')
      $.rails.handleRemote(form)
      form.html("<img src=\"<%= asset_path('spinner.gif') %>\" />")
      false
      
    true
    
  $('.controls a.delete').live 'click', (e)->
    $(this).closest('tr').fadeOut()
