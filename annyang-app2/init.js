var initVoice = function() {
if (annyang) {
        
    // Set default values
    //Shiny.onInputChange('speech', '');
    Shiny.onInputChange('country', null);
    Shiny.onInputChange('plotme', null);
    
    function capitaliseFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
    }

  var commands = {
    //'*words': function(words) {
      //  Shiny.onInputChange('speech', capitaliseFirstLetter(words));
    //},
    'what is the capital of *countryInput': function(countryInput) {
        Shiny.onInputChange('country', countryInput);
    },
    'show me *plotName': function(plotName) {
        Shiny.onInputChange('plotme', plotName.toLowerCase());
    }
  };

  annyang.addCommands(commands);
  annyang.setLanguage('en');
  annyang.start();
  }
};

$(function() {
  setTimeout(initVoice, 10);
});