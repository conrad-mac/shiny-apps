var initSelect = function() {
   Shiny.onInputChange('loc', "All locations");
};

$(function() {
  setTimeout(initSelect, 10);
});