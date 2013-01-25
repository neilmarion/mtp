$ ->

  $('#add_a_phone_number').live 'click', ->
    s = $('#phone_number_fields').children().size()
    new_id = 'phone_numbers['+s+']'
    $('#phone_number_fields').append('<div id='+new_id+'><input id="person_phone_numbers_attributes_'+s+'_phone_number" name="person[phone_numbers_attributes]['+s+'][phone_number]" size="30" type="text"></div>')
