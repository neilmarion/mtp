$ ->

  $('#office_selects select').live 'change', ->
      data_level = Number($(this).attr('data_level'))
        
      t = $(this)
      
      
      $('#office_selects select').each ->
        $(this).remove() if Number($(this).attr('data_level')) > data_level
      
      $.ajax
        type: 'GET',
        url: '/offices/get_children?format=json',
        dataType: 'json',
        data: 'id='+$(this).val(),
        success: (data) ->
          if data.length > 0
            t.removeAttr('id')
            t.removeAttr('name')
            $('#office_selects').append('<select data_level='+$('#office_selects select').size()+' id="office_id" name="office_id"><option></option></select>')
            $.each data, (key, val) ->
              $('#office_id').append('<option value='+val['id']+'>'+val['name']+'</option>')
          else
            t.attr('id', 'office_id')
            t.attr('name', 'office_id')
    
