$ ->

  $('#office_selects div select').live 'change', ->
      data_level = Number($(this).attr('data_level'))
        
      t = $(this)
      parent_id = $(this).parent().attr('id')
      parent = $(this).parent()
      parent_index = $(this).parent().index()
      console.log $(this).parent().index()
      
      parent.find('select').each ->
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
            parent.append('<select data_level='+parent.find('select').size()+' id="office_ids_'+parent_index+'" name="office_ids['+parent_index+']"><option></option></select>')
            $.each data, (key, val) ->
              $('#office_ids_'+parent_index).append('<option value='+val['id']+'>'+val['name']+'</option>')
          else
            t.attr('id', 'office_ids_'+parent_index)
            t.attr('name', 'office_ids['+parent_index+']')
    

  $('#add_an_office').live 'click', ->
    s = $('#office_selects').children().size()
    new_id = 'office_select['+s+']'
    $.ajax
        type: 'GET',
        url: '/offices/get_roots?format=json',
        dataType: 'json',
        success: (data) ->
          $('#office_selects').append('<div id='+new_id+'><select data_level=0 id="office_ids_'+s+'" name="office_ids['+s+']"><option></option></select></div>')
          $.each data, (key, val) ->
            $('#office_ids_'+s).append('<option value='+val['id']+'>'+val['name']+'</option>')
    
    
    
