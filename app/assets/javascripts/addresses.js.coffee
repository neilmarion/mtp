$ ->

  $('#add_an_address').live 'click', ->
    s = $('#address_fields').children().size()
    new_id = 'address['+s+']'
    $('#address_fields').append('<div id='+new_id+'><input id="person_addresses_attributes_'+s+'_address" name="person[addresses_attributes]['+s+'][address]" size="30" type="text"></div>')
