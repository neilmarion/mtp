$ ->

  $('#office_selects select').live 'change', ->
      data_level = Number($(this).attr('data_level'))
        
      t = $(this)
      
      
      $('#office_selects select').each ->
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
            $('#organization_selects').append('<select data_level='+$('#organization_selects select').size()+' id="organization_id" name="organization_id"><option></option></select>')
            $.each data, (key, val) ->
              $('#organization_id').append('<option value='+val['id']+'>'+val['name']+'</option>')
          else
            t.attr('id', 'organization_id')
            t.attr('name', 'organization_id')
    
