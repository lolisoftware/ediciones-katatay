$ = jQuery

country = (select, selector) ->
  if select.children('option:selected').text().toLowerCase() != 'argentina'
    $(selector).hide()
  else
    $(selector).show()

$('#contact-form').submit ->
  $('#contact-form').validate()
  if $('#contact-form').valid()
    formInput = $(this).serialize()
    $.ajax
      type: 'POST'
      url: $(this).attr('action')
      data: formInput
      dataType: 'json'
      success: (data) ->
        $('.contact-form').addClass('hidden')
        $('#formulario_correcto').removeClass('hidden')
      error: (data) ->
        errors = $.parseJSON(data.responseText).errors
        Recaptcha.reload()
        $('#errors_contact_modal').modal()
  false

$('#user_country_id').change ->
  country($(this), '#state_group')

if $('#user_country_id option:selected').text().toLowerCase() != 'argentina'
  $('#state_group').hide()

$('.add-to-cart').click ->
  $(this).parents('form').submit()

$('.delete-cart').click ->
  $(this).parent('form').submit()

$('.update-cart').prop('disabled', true)

$('.item-amount').on 'input', ->
  $(this).siblings('.update-cart').prop('disabled', false)

$('.update-cart').click ->
  $('form').validate()
  if $('form').valid()
    $(this).parent('form').submit()

$('.checkout').click ->
  $(this).parent('form').submit()

$('.confirm-address').prop('disabled', true)

$('input[name=selected_address]:radio').change ->
  $('.confirm-address').prop('disabled', false)

$('#shipping_address_country_id').change ->
  country($(this), '#shipping_address_state_group')

$('.confirm-address').click ->
  selected = $('input[name=selected_address]:radio:checked').val()
  console.log(selected)
  if selected == 'new'
    $('form#new-address').validate()
    if $('form#new-address').valid()
      $('form#new-address').submit()
  else
    $('form#existing-address').submit()

$('.item-amount').tooltip()