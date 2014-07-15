require(rCharts)
output$metplot <- renderChart({
  result <- read.csv('./met.csv', header=T, encoding="utf-8")
  result <- transform(result, date=as.Date(mon))
  reuslt <- result[order(result$title, result$date),]
  reuslt <- result[as.Date("2013/01/01")<=result$date,]
  
  # Visualize with Highchart
  result = transform(result, date = as.numeric(as.POSIXct(date))*1000)
  p1 <- hPlot(c ~ date, data=subset(result, title == input$title), group="title", type = input$type)
  p1$xAxis(type='datetime', labels=list(format='{value:%Y-%m}'))
  p1$set(dom = 'metplot')
  p1
})