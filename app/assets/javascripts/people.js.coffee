# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  initialize_map = ->
    myLatlng = new google.maps.LatLng(14.455661832483251, 120.98109025575866)
    mapOptions =
      zoom: 15
      center: myLatlng
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map(document.getElementById("map"), mapOptions)
    latlng = new google.maps.LatLng(14.455661832483251, 120.98109025575866)
    marker = new google.maps.Marker(
      position: latlng
      map: map
      title: "TITLE"
      labelContent: "NAME"
      html: "<div>profile pic</div>"
    )
    markers.push marker
    i = 0

    while i < markers.length
      marker = markers[i]
      infowindow = new google.maps.InfoWindow()
      google.maps.event.addListener marker, "click", ->
        infowindow.setContent @html
        infowindow.open map, this

      i++
  markers = []
  google.maps.event.addDomListener window, "load", initialize


  $('#people_controller a.add_person').live 'click', ->
    $('#new_person')[0].reset()
    $('#add_person_div').dialog
      resizable: false,
      height:650,
      width:1200,
      modal: true,
      buttons: 
        Cancel: ->
          $(this).dialog('destroy')
          $('#new_person')[0].reset()
    false
    
  $('#people_controller a.see_map').click ->
    $('#map').toggle()
    google.maps.event.trigger map, "resize"
    false
    
  $('#people_controller a.search_and_filter').click ->
    $('#left').toggle()
    
    if $('#main').css('margin-left') == '0px'
      $('#main').css('margin-left', '15%')
    else
      $('#main').css('margin-left', '0px')
    
    false
    
  $('#person_fb_profile').live 'keyup', ->
    a = $(this).val().split('/')
    $('#fb_profile_pic').html('<img alt="Picture?type=large" src="http://graph.facebook.com/'+a[a.length-1]+'/picture?type=large">')


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
    
  $('.person_row td:not(.checkbox_cell)').live 'click', ->
    unless $('a', this)[0]?
      tr = $(this).parent()
      document.location = '/people/' + tr.attr('data-id')
    
  $('.controls a.delete').live 'click', (e)->
    $(this).closest('tr').fadeOut()
    
  $('.delete_entry').live 'click', ->
    $(this).closest('div').remove()
    
  $('#people_search_form').live 'submit', ->
    
    $.ajax '/people.json'
      success: (data, status, xhr) ->
        console.log(data)
    
  
