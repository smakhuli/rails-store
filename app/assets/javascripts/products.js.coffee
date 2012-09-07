# method below used for filtering on product_type
$ ->
  $("#products_product_type_selector").change ->
    window.location.href = $(this).val()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  showCategoryFields = ->
    $(".art-category-fields").hide()
    $(".food-category-fields").hide()
    $(".media-category-fields").hide()
    $(".other-category-fields").hide()
    $("#product_category option:selected").each( ->
      $("*[data-category=#{$(this).text().toLowerCase()}]").show()
    )

  showCategoryFields()
  $("#product_category").change( ->
    showCategoryFields()
  )

  $(".popover-hover").popover({
    trigger: "hover",
    delay: 500
  })