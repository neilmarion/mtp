$ ->

  $('#office_selects div select').live 'change', ->
      data_level = Number($(this).attr('data_level'))
        
      t = $(this)
      parent_id = $(this).parent().attr('id')
      parent = $(this).parent()
      parent_index = $(this).parent().parent().index()
      
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
            parent.append('<select data_level='+parent.find('select').size()+' id="person_people_offices_attributes_'+parent_index+'_office_id" name="person[people_offices_attributes]['+parent_index+'][office_id]"><option></option></select>')
            $.each data, (key, val) ->
              $('#person_people_offices_attributes_'+parent_index+'_office_id').append('<option value='+val['id']+'>'+val['name']+'</option>')
          else
            t.attr('id', 'person_people_offices_attributes_'+parent_index+'_office_id')
            t.attr('name', 'person[people_offices_attributes]['+parent_index+'][office_id]')
    

  $('#add_an_office').live 'click', ->
    s = $('#office_selects').children().size()
    new_id = 'office_select['+s+']'
    $.ajax
        type: 'GET',
        url: '/offices/get_roots?format=json',
        dataType: 'json',
        success: (data) ->
          $('#office_selects').append('<div class="grey_field_long"><div id='+new_id+' class="office_select"><select data_level=0 id="person_people_offices_attributes_'+s+'_office_id" name="person[people_offices_attributes]['+s+'][office_id]"><option></option></select></div><a href="#" class="delete_entry"> ×</a></div>')
          $.each data, (key, val) ->
            $('#person_people_offices_attributes_'+s+'_office_id').append('<option value='+val['id']+'>'+val['name']+'</option>')
    
    
    
