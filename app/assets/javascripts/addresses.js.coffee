$ ->

  $('#add_an_address').live 'click', ->
    s = $('#address_fields').children().size()
    new_id = 'addresses['+s+']'
    $('#address_fields').append('<div id='+new_id+'"><textarea id="person_addresses_attributes_'+s+'_address" name="person[addresses_attributes]['+s+'][address]"></textarea><a href="#" class="delete_entry" class="entry"> ×</a></div>')
