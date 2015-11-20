# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).load ->
  if window.currentController == "locations"
    $('.brand_id_selector').on "change", (e) ->
      $("form#brand_selector").submit()
    $("form#brand_selector").on "submit", (e) ->
      e.preventDefault()
      selectedBrands = []
      $('.brand_id_selector:checked').each ->
        selectedBrands.push $(this).attr('value')
      $("#drug_partial").load($(this).attr("action"), {brands: selectedBrands, location_id: locationId})

formatSearchResults = (searchData) ->
  content = $("<div class='search-results'>")
  if searchData?
    for result in searchData
      if result?
        resultType = result.searchable_type.toLowerCase() + "s"
        content.append("<a href='/" + resultType + "/" + result.searchable_id + "'>" + result.term + "</a>" + "<br>")
  else
    content.append("<p class='no-results'>No results found.</p>")
  content.append("</div>")
  content