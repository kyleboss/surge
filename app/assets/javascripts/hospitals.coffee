# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  if window.currentController == "hospitals"

    createDateRangeSlider = ->
      margin =
        top: 20
        right: 20
        bottom: 30
        left: 20
      dateRangeWidth = document.getElementById("graphical-date-range-chooser").clientWidth;
      width = dateRangeWidth - margin.left - margin.right
      height = 100 - margin.top - margin.bottom
      setupMainSvg(margin, width, height)
      selectedBoxElem = document.getElementById("selected-box")
      handlesElem = document.getElementById("handles")
      handlesElem.style.cssText = "width: #{width/2}px; height: #{height}px; "
      handlesElem.style.cssText += "margin: #{margin.top}px #{margin.right}px #{margin.bottom}px #{margin.left}px"

    setupSelectedBoxSvg = (margin, width, height) ->
      selectedBox = d3.select("#selected-box").style("width", "#{width/2}px").style("height", "#{height}px")
      .style("margin", "#{margin.top}px #{margin.right}px #{margin.bottom}px #{margin.left}px")
      selectedBoxSvg = selectedBox.append("svg").attr("width", width).style("position", "fixed")
      .style("border-bottom", "5px solid rgb(70, 140, 255)")
      .style("left", "#{margin.left}px").style("top", "#{margin.top}px").attr("height", height).append("g")
      return selectedBoxSvg

    setupMainSvg = (margin, width, height) ->
      x = d3.time.scale().range([ 0, width ])
      y = d3.scale.linear().range([ height, 0 ])
      xAxis = d3.svg.axis().scale(x).orient("bottom")
      area = setupAreaSvg(x, y, width, height)
      parseDate = d3.time.format("%d-%b-%y").parse
      selectedBoxSvg = setupSelectedBoxSvg(margin, width, height)
      svg = d3.select("#graphical-date-range-chooser").append("svg").attr("width", width+margin.left+margin.right)
      .attr("height", 100).append("g").attr("transform", "translate(#{margin.left},#{margin.top})")
      d3.tsv "https://raw.githubusercontent.com/xibbit/reD3/master/dist/data/area.tsv", (error, data) ->
        throw error  if error
        data.forEach (d) ->
          d = parseDatum(d, parseDate)
        setDomains(x, y, data)
        appendResultsToSvg(data, area, xAxis, height, svg)
        selectedBoxSvg.append("path").datum(data).attr("class", "area").attr("d", area)

    parseDatum = (d, parseDate) ->
      d.date = parseDate(d.date)
      d.close = +d.close
      return d

    appendResultsToSvg = (data, area, xAxis, height, svg) ->
      svg.append("path").datum(data).attr("class", "area").attr("d", area)
      svg.append("g").attr("class", "x axis").attr("transform", "translate(0,#{height})").call xAxis

    setDomains = (x, y, data) ->
      x.domain d3.extent(data, (d) ->
        d.date
      )

      y.domain [ 0, d3.max(data, (d) ->
        d.close
      ) ]


    setupAreaSvg = (x, y, width, height) ->
      area = d3.svg.area().x((d) ->
        x d.date
      ).y0(height).y1((d) ->
        y d.close
      )
      return area

    !do ->
      bP = {}
      b = 30
      bb = document.getElementById("bipartite-graph").clientWidth - 450
      height = 600
      buffMargin = 1
      minHeight = 14
      c1 = [
        -70
        100
      ]
      c2 = [
        -20
        90
      ]
      #Column positions of labels.
      colors = [
        '#C11F51'
        '#9C3666'
        '#9F6A6C'
        '#0072b9'
        '#009999'
        '#0099C6'
      ]

      visualize = (data) ->
        vis = {}

        calculatePosition = (a, s, e, b, m) ->
          total = d3.sum(a)
          sum = 0
          neededHeight = 0
          leftoverHeight = e - s - (2 * b * a.length)
          ret = []
          a.forEach (d) ->
            `var sum`
            v = {}
            v.percent = if total == 0 then 0 else d / total
            v.value = d
            v.height = Math.max(v.percent * (e - s - (2 * b * a.length)), m)
            if v.height == m then (leftoverHeight -= m) else (neededHeight += v.height)
            ret.push v
            return
          scaleFact = leftoverHeight / Math.max(neededHeight, 1)
          sum = 0
          ret.forEach (d) ->
            d.percent = scaleFact * d.percent
            d.height = if d.height == m then m else d.height * scaleFact
            d.middle = sum + b + d.height / 2
            d.y = s + d.middle - (d.percent * (e - s - (2 * b * a.length)) / 2)
            d.h = d.percent * (e - s - (2 * b * a.length))
            d.percent = if total == 0 then 0 else d.value / total
            sum += 2 * b + d.height
            return
          ret

        vis.mainBars = [
          calculatePosition(data.data[0].map((d) ->
            d3.sum d
          ), 0, height, buffMargin, minHeight)
          calculatePosition(data.data[1].map((d) ->
            d3.sum d
          ), 0, height, buffMargin, minHeight)
        ]
        vis.subBars = [
          []
          []
        ]
        vis.mainBars.forEach (pos, p) ->
          pos.forEach (bar, i) ->
            calculatePosition(data.data[p][i], bar.y, bar.y + bar.h, 0, 0).forEach (sBar, j) ->
              sBar.key1 = if p == 0 then i else j
              sBar.key2 = if p == 0 then j else i
              vis.subBars[p].push sBar
              return
            return
          return
        vis.subBars.forEach (sBar) ->
          sBar.sort (a, b) ->
            if a.key1 < b.key1 then -1 else if a.key1 > b.key1 then 1 else if a.key2 < b.key2 then -1 else if a.key2 > b.key2 then 1 else 0
          return
        vis.edges = vis.subBars[0].map((p, i) ->
          {
            key1: p.key1
            key2: p.key2
            y1: p.y
            y2: vis.subBars[1][i].y
            h1: p.h
            h2: vis.subBars[1][i].h
          }
        )
        vis.keys = data.keys
        vis

      arcTween = (a) ->
        i = d3.interpolate(@_current, a)
        @_current = i(0)
        (t) ->
          edgePolygon i(t)

      drawPart = (data, id, p) ->

        alignLabel = 'start'
        if (p == 0)
          alignLabel = 'end'
        d3.select('#' + id).append('g').attr('class', 'part' + p).attr 'transform', 'translate(' + p * (bb + b) + ',0)'
        d3.select('#' + id).select('.part' + p).append('g').attr 'class', 'mainbars'
        d3.select('#' + id).select('.part' + p).append('g').attr 'class', 'subbars'
        mainbar = d3.select('#' + id).select('.part' + p).select('.mainbars').selectAll('.mainbar').data(data.mainBars[p]).enter().append('g').attr('class', 'mainbar')
        mainbar.append('rect').attr('class', 'mainrect').attr('x', 0).attr('y', (d) ->
          d.middle - (d.height / 2)
        ).attr('width', b).attr('height', (d) ->
          d.height
        ).style('shape-rendering', 'auto').style('fill-opacity', 0).style('stroke-width', '0.5').style('stroke', 'black').style 'stroke-opacity', 0
        mainbar.append('text').attr('class', 'barlabel').attr('x', c1[p]).attr('y', (d) ->
          d.middle + 5
        ).text((d, i) ->
          if data.mainBars[p][i].value > 0
            data.keys[p][i]
        ).attr 'text-anchor', alignLabel
        mainbar.append('text').attr('class', 'barpercent').attr('x', c2[p]).attr('y', (d) ->
          d.middle + 5
        ).text((d, i) ->
          if data.mainBars[p][i].value > 0
            '( ' + Math.round(100 * d.percent) + '%)'
        ).attr('text-anchor', 'end').style 'fill', 'grey'
        d3.select('#' + id).select('.part' + p).select('.subbars').selectAll('.subbar').data(data.subBars[p]).enter().append('rect').attr('class', 'subbar').attr('x', 0).attr('y', (d) ->
          d.y
        ).attr('width', b).attr('height', (d) ->
          d.h
        ).style 'fill', (d) ->
          colors[d.key1]
        return

      drawEdges = (data, id) ->
        d3.select('#' + id).append('g').attr('class', 'edges').attr 'transform', 'translate(' + b + ',0)'
        d3.select('#' + id).select('.edges').selectAll('.edge').data(data.edges).enter().append('polygon').attr('class', 'edge').attr('points', edgePolygon).style('fill', (d) ->
          colors[d.key1]
        ).style('opacity', 0.5).each (d) ->
          @_current = d
          return
        return

      edgePolygon = (d) ->
        [
          0
          d.y1
          bb
          d.y2
          bb
          d.y2 + d.h2
          0
          d.y1 + d.h1
        ].join ' '

      transitionPart = (data, id, p) ->
        mainbar = d3.select('#' + id).select('.part' + p).select('.mainbars').selectAll('.mainbar').data(data.mainBars[p])
        mainbar.select('.mainrect').transition().duration(500).attr('y', (d) ->
          d.middle - (d.height / 2)
        ).attr 'height', (d) ->
          d.height
        mainbar.select('.barlabel').transition().duration(500).attr 'y', (d) ->
          d.middle + 5
        mainbar.select('.barpercent').transition().duration(500).attr('y', (d) ->
          d.middle + 5
        ).text (d, i) ->
          '( ' + Math.round(100 * d.percent) + '%)'
        d3.select('#' + id).select('.part' + p).select('.subbars').selectAll('.subbar').data(data.subBars[p]).transition().duration(500).attr('y', (d) ->
          d.y
        ).attr 'height', (d) ->
          d.h
        return

      transitionEdges = (data, id) ->
        d3.select('#' + id).append('g').attr('class', 'edges').attr 'transform', 'translate(' + b + ',0)'
        d3.select('#' + id).select('.edges').selectAll('.edge').data(data.edges).transition().duration(500).attrTween('points', arcTween).style 'opacity', (d) ->
          if d.h1 == 0 or d.h2 == 0 then 0 else 0.5
        return

      transition = (data, id) ->
        transitionPart data, id, 0
        transitionPart data, id, 1
        transitionEdges data, id
        return

      bP.partData = (data) ->
        sData = {}
        sData.keys = [
          d3.set(data.map((d) ->
            d[0]
          )).values().sort((a, b) ->
            if a < b then -1 else if a > b then 1 else 0
          )
          d3.set(data.map((d) ->
            d[1]
          )).values().sort((a, b) ->
            if a < b then -1 else if a > b then 1 else 0
          )
        ]
        sData.data = [
          sData.keys[0].map((d) ->
            sData.keys[1].map (v) ->
              0
          )
          sData.keys[1].map((d) ->
            sData.keys[0].map (v) ->
              0
          )
        ]
        data.forEach (d) ->
          sData.data[0][sData.keys[0].indexOf(d[0])][sData.keys[1].indexOf(d[1])] = d[2]
          sData.data[1][sData.keys[1].indexOf(d[1])][sData.keys[0].indexOf(d[0])] = d[2]
          return
        sData

      bP.draw = (data, svg) ->
        data.forEach (biP, s) ->
          svg.append('g').attr('id', biP.id).attr 'transform', 'translate(' + 550 * s + ',0)'
          visData = visualize(biP.data)
          drawPart visData, biP.id, 0
          drawPart visData, biP.id, 1
          drawEdges visData, biP.id
          [
            0
            1
          ].forEach (p) ->
            numKeys = data[0].data.keys[1].length
            d3.select('#' + biP.id).select('.part' + p).select('.subbars').selectAll('.subbar').on('mouseover', (d, i) ->
              mainBarI = 0
              if p == 0
                mainBarI = Math.floor(i/numKeys)
              else
                mainBarI = i%numKeys
              bP.selectSegment data, p, mainBarI
            ).on 'mouseout', (d, i) ->
              mainBarI = 0
              if p == 0
                mainBarI = Math.floor(i/numKeys)
              else
                mainBarI = i%numKeys
              bP.deSelectSegment data, p, mainBarI
            d3.select('#' + biP.id).select('.part' + p).select('.mainbars').selectAll('.mainbar').on('mouseover', (d, i) ->
              bP.selectSegment data, p, i
            ).on 'mouseout', (d, i) ->
              bP.deSelectSegment data, p, i
            return
          return
        return

      bP.selectSegment = (data, m, s) ->
        data.forEach (k) ->
          newdata =
            keys: []
            data: []
          newdata.keys = k.data.keys.map((d) ->
            d
          )
          newdata.data[m] = k.data.data[m].map((d) ->
            d
          )
          newdata.data[1 - m] = k.data.data[1 - m].map((v) ->
            v.map (d, i) ->
              if s == i then d else 0
          )
          transition visualize(newdata), k.id
          selectedBar = d3.select('#' + k.id).select('.part' + m).select('.mainbars').selectAll('.mainbar').filter((d, i) ->
            i == s
          )
          selectedBar.select('.mainrect').style 'stroke-opacity', 1
          selectedBar.select('.barlabel').style 'font-weight', 'bold'
          selectedBar.select('.barpercent').style 'font-weight', 'bold'
          return
        return

      bP.deSelectSegment = (data, m, s) ->
        data.forEach (k) ->
          transition visualize(k.data), k.id
          selectedBar = d3.select('#' + k.id).select('.part' + m).select('.mainbars').selectAll('.mainbar').filter((d, i) ->
            i == s
          )
          selectedBar.select('.mainrect').style 'stroke-opacity', 0
          selectedBar.select('.barlabel').style 'font-weight', 'normal'
          selectedBar.select('.barpercent').style 'font-weight', 'normal'
          return
        return

      @bP = bP
      return
    createBipartiteGraph = ->
      sales_data = [
        [
          'Oxycodone'
          'Main Pharmacy'
          16
        ]
        [
          'Actigall'
          'Main Pharmacy'
          27
        ]
        [
          'Abraxane'
          'Main Pharmacy'
          58
        ]
        [
          'Nitrice'
          'Main Pharmacy'
          1551
        ]
        [
          'Actos'
          'Main Pharmacy'
          141
        ]
        [
          'Oxycodone'
          'Holding Room A'
          5453
        ]
        [
          'Actigall'
          'Holding Room A'
          862
        ]
        [
          'Nitrice'
          'Holding Room A'
          6228
        ]
        [
          'Oxycodone'
          'Holding Room B'
          15001
        ]
        [
          'Actigall'
          'Holding Room B'
          836
        ]
        [
          'Abraxane'
          'Holding Room B'
          28648
        ]
        [
          'Nitrice'
          'Holding Room B'
          3
        ]
        [
          'Oxycodone'
          'Holding Room C'
          13
        ]
        [
          'Actigall'
          'Holding Room C'
          362
        ]
        [
          'Abraxane'
          'Holding Room C'
          78
        ]
        [
          'Nitrice'
          'Holding Room C'
          2473
        ]
        [
          'Actos'
          'Holding Room C'
          2063
        ]
        [
          'Actigall'
          'Petes Pharmacy'
          203
        ]
        [
          'Nitrice'
          'Petes Pharmacy'
          686
        ]
        [
          'Actos'
          'Petes Pharmacy'
          826
        ]
        [
          'Oxycodone'
          'Main Pharmacy'
          1738
        ]
        [
          'Actigall'
          'Main Pharmacy'
          15413
        ]
        [
          'Actigall'
          'Holding Room A'
          86
        ]
        [
          'Abraxane'
          'Holding Room B'
          348
        ]
        [
          'Nitrice'
          'Holding Room A'
          4244
        ]
        [
          'Actos'
          'Holding Room A'
          1536
        ]
        [
          'Nitrice'
          'Holding Room B'
          405
        ]
        [
          'Actigall'
          'Holding Room C'
          127
        ]
        [
          'Nitrice'
          'Holding Room C'
          1470
        ]
        [
          'Actos'
          'Holding Room C'
          516
        ]
        [
          'Oxycodone'
          'Petes Pharmacy'
          43
        ]
        [
          'Actigall'
          'Petes Pharmacy'
          172
        ]
        [
          'Abraxane'
          'Petes Pharmacy'
          149
        ]
        [
          'Nitrice'
          'Petes Pharmacy'
          1380
        ]
        [
          'Actos'
          'Petes Pharmacy'
          791
        ]
        [
          'Nitrice'
          'Main Pharmacy'
          1
        ]
        [
          'Nitrice'
          'Holding Room A'
          1171
        ]
        [
          'Actos'
          'Holding Room A'
          33
        ]
        [
          'Abraxane'
          'Holding Room B'
          1
        ]
        [
          'Actigall'
          'Holding Room C'
          3
        ]
        [
          'Nitrice'
          'Holding Room C'
          457
        ]
        [
          'Actos'
          'Holding Room C'
          20
        ]
        [
          'Actigall'
          'Petes Pharmacy'
          167
        ]
        [
          'Abraxane'
          'Petes Pharmacy'
          95
        ]
        [
          'Nitrice'
          'Petes Pharmacy'
          1090
        ]
        [
          'Actos'
          'Petes Pharmacy'
          676
        ]
        [
          'Oxycodone'
          'Main Pharmacy'
          1195
        ]
        [
          'Actigall'
          'Main Pharmacy'
          212
        ]
        [
          'Nitrice'
          'Main Pharmacy'
          1509
        ]
        [
          'Oxycodone'
          'Holding Room A'
          3899
        ]
        [
          'Actigall'
          'Holding Room A'
          455
        ]
        [
          'Abraxane'
          'Holding Room B'
          1
        ]
        [
          'Nitrice'
          'Holding Room A'
          4100
        ]
        [
          'Oxycodone'
          'Holding Room B'
          12
        ]
        [
          'Actigall'
          'Holding Room B'
          749
        ]
        [
          'Abraxane'
          'Holding Room B'
          119
        ]
        [
          'Nitrice'
          'Holding Room B'
          3705
        ]
        [
          'Actos'
          'Holding Room B'
          3456
        ]
        [
          'Actigall'
          'Holding Room C'
          288
        ]
        [
          'Abraxane'
          'Holding Room C'
          141
        ]
        [
          'Nitrice'
          'Holding Room C'
          2625
        ]
        [
          'Actos'
          'Holding Room C'
          1920
        ]
        [
          'Actigall'
          'Petes Pharmacy'
          212
        ]
        [
          'Abraxane'
          'Petes Pharmacy'
          223
        ]
        [
          'Nitrice'
          'Petes Pharmacy'
          1803
        ]
        [
          'Actos'
          'Petes Pharmacy'
          761
        ]
        [
          'Actigall'
          'Main Pharmacy'
          90
        ]
        [
          'Nitrice'
          'Main Pharmacy'
          930
        ]
        [
          'Actos'
          'Main Pharmacy'
          395
        ]
        [
          'Oxycodone'
          'Holding Room A'
          7232
        ]
        [
          'Actigall'
          'Holding Room A'
          1896
        ]
        [
          'Nitrice'
          'Holding Room A'
          10782
        ]
        [
          'Actos'
          'Holding Room A'
          1911
        ]
        [
          'Actigall'
          'Holding Room B'
          32
        ]
        [
          'Abraxane'
          'Holding Room B'
          7
        ]
        [
          'Nitrice'
          'Holding Room B'
          1557
        ]
        [
          'Actos'
          'Holding Room B'
          24
        ]
        [
          'Abraxane'
          'Holding Room C'
          88
        ]
        [
          'Nitrice'
          'Holding Room C'
          956
        ]
        [
          'Actigall'
          'Petes Pharmacy'
          71
        ]
        [
          'Nitrice'
          'Petes Pharmacy'
          575
        ]
        [
          'Actos'
          'Petes Pharmacy'
          368
        ]
      ]
      width = document.getElementById("bipartite-graph").clientWidth
      height = 610
      margin =
        b: 0
        t: 40
        l: 170
        r: 50
      svg = d3.select('#bipartite-graph').append('svg').attr('width', width).attr('height', height + margin.b + margin.t)
      .append('g').attr('transform', "translate(#{margin.l},#{margin.t})")
      data = [
        {
          data: bP.partData(sales_data)
          id: 'SalesAttempts'
          header: [
            'Drug'
            'Room'
            'Drugs in Rooms'
          ]
        }
      ]
      bP.draw data, svg
    createDateRangeSlider()
    createBipartiteGraph()

$(document).ready(ready)
$(document).on('page:load', ready)