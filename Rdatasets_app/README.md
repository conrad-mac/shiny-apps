##R datasets app

The aim of this app is to use R's `data(package = .packages(all.available = TRUE))` to
return all the datasets that have come with the packages you have downloaded. 

The datasets and their locations on your machine are then displayed using Shiny and the DT package in 
R ([a wrapper for the datatables js library](https://datatables.net/)).
