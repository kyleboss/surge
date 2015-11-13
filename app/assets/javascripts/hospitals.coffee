# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).load ->
  if window.currentController == "hospitals"
    $("#spotlight-search-query").on "keyup", (e) ->
      if $.trim($(this).val()).length > 2
        $("form#spotlight-search").submit()
      else
        $(".search-results-popover").hide()
      $("form#spotlight-search").on "submit", (e) ->
        e.preventDefault()
        $.post($(this).attr("action"), {query: $("#spotlight-search-query").val()}, (data) ->
          content   = formatSearchResults(data)
          receiver  = $(".search-results-popover")
          receiver.html(content)
          receiver.show()
        , "json")

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