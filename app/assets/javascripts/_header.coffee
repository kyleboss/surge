# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  if window.showHeader
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


$(document).ready(ready)
$(document).on('page:load', ready)

formatSearchResults = (searchData) ->
  content = $("<div class='search-results'>")
  if searchData?
    for result in searchData
      if result?
        linkHtml = "<a class='popover-result' href='/patients/" + result.searchable_id + "'>"
        linkHtml += result.patient_name + " <span class='popover-result-type'>("
        linkHtml += result.patient_mrn + ")</span></a>" + "<br>"
        content.append(linkHtml)
  else
    content.append("<p class='no-results'>No results found.</p>")
  content.append("</div>")
  content