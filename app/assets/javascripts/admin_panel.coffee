# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(window).load ->
  if window.currentController == "admin_panel"
    $("#spotlight-search-query").on "keyup", (e) ->
      if $.trim($(this).val()).length > 2
        $("form#spotlight-search").submit()
      else
        $(".search-results-popover").hide()

      $("form#spotlight-search").on "submit", (e) ->
        e.preventDefault()

        $.post($(this).attr("action"), {query: $("#spotlight-search-query").val()}, (data) ->
          console.log(data)
          content = $("<div class='search-results'>")
          receiver = $(".search-results-popover")

          searchResults = $("#spotlight-search-query")
          if data?
            for result in data
              if result?
                content.append(JSON.stringify(result) + "<br>")
          else
            content.append("<p class='no-results'>No results found.</p>")
          content.append("</div>")
          console.log(content)
          receiver.html(content)
          receiver.show()

        , "json").done(->
        ).fail(->
        ).always(->
        )