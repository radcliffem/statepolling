This is a map that displays state-level polling averages for the 2016 general election. Polling data is obtained from pollster.com using R. That data is then read by a javascript file to produce the colored map.

To download data, run the R script `get_data.R`. This will obtain the most recent 100 polls on pollster.com that reference the general election, remove national polls in favor of only state-level polls, and delete any repeated data. If data has previously been obtained, it will merge the two data.frames into one, remove repeated data, and store the final product in two ways: as a .csv file (`cleaned_data.csv`) and also as a .json file (`clean.json`).

To color the map, first ensure that `clean.json` contains up-to-date data. Then run `US_Map.html` in any browser.

The javascript file `map.js` contains all javascript code related to coloring the map. The map can be colored by the poll average on a given day, or run animation to show polling between two days.

The file `dictionaries.js` contains a dictionary that converts state names to their postal codes and a dictionary containing the average election outcome for each state for the past 3 elections.

Licensing is as follows:

 * `Rainbowvis.js` is released under Eclipse Public License - v 1.0. This file was obtained at [https://github.com/anomal/RainbowVis-JS]()
 * `US_Map.html` is released under CC BY-SA 3.0. This file was obtained at [https://commons.wikimedia.org/wiki/File:Blank_US_Map_(states_only).svg]()
 * Original work in this project is released under CC BY-SA 3.0.
