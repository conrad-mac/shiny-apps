##NZ's Highest Risk Intersections app

I created this visualisation using the [leaflet](http://leafletjs.com/) package in R. I downloaded the input dataset from the [NZTA website](http://www.nzta.govt.nz/assets/resources/high-risk-intersections-guide/docs/high-risk-intersections.csv).

I needed to convert the Northings and Eastings in the original dataset into latitude and longitude. 
To do this, I used the coordinate conversion tool on the [LINZ website](http://apps.linz.govt.nz/coordinate-conversion/index.aspx).

A live version of this app can be found [here](https://conrad.shinyapps.io/high-risk-intersections-nz/).
