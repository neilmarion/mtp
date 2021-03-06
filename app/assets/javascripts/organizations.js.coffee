$ ->
  $('#organization_selects select').live 'change', ->
    data_level = Number($(this).attr('data_level'))
      
    t = $(this)
    
    
    $('#organization_selects select').each ->
      $(this).remove() if Number($(this).attr('data_level')) > data_level
    
    $.ajax
      type: 'GET',
      url: '/organizations/get_children?format=json',
      dataType: 'json',
      data: 'id='+$(this).val(),
      success: (data) ->
        if data.length > 0
          t.removeAttr('id')
          t.removeAttr('name')
          $('#organization_selects').append('<select data_level='+$('#organization_selects select').size()+' id="person_organization_id" name="person[organization_id]"><option></option></select>')
          $.each data, (key, val) ->
            $('#person_organization_id').append('<option value='+val['id']+'>'+val['name']+'</option>')
        else
          t.attr('id', 'person_organization_id')
          t.attr('name', 'person[organization_id]')
    
    

  $('#add_sub_orgs').live 'click', ->
    $(this).hide()
    $('#orgs').show()
    
    
  $('.org_link').live 'click', ->
    col$ = $(this).closest('div')
    $('.org_link', col$).closest('li').removeClass('selected')
    level = Number(col$.attr('data-level')) + 1
    $('[data-level]').each ->
      if Number($(this).attr('data-level')) >= level
        $(this).hide()
    # $('[data-level=' + level + ']').hide()
    # $('[data-ancestor-id=' + $(this).attr('data-id') + ']').nextAll().hide()
    $(this).closest('li').addClass('selected')
    $('#spinner_column').show()
    
  $('.add_sub_org').live 'click', ->
    $('#new_org form')[0].reset()
    $('#organization_parent_id').val($(this).attr('data-parent-id'))
    $('#new_org').dialog
      resizable: false,
      height:444,
      width:600,
      modal: true,
      buttons: 
        Cancel: ->
          $(this).dialog('destroy')
          $('#new_org form')[0].reset()

  $('#new_org .save').live 'click', ->
    form = $(this).closest('form')
    if $(this).hasClass('save_and_more')
      $('#add_another').val('true')
    if $('#organization_terminology').val() != "" && $('#organization_name').val() != ""
      $.rails.handleRemote(form)
      form.html("<img src=\"<%= asset_path('spinner.gif') %>\" />")
    else
      if $('#organization_name').val() == ""
        $('#organization_name').focus()
      else
        $('#organization_terminology').focus()
      $.rails.handleRemote(form)
    false
    
    
