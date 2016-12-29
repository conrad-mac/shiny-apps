var initVoice = function() {
if (annyang) {
  
  //Default input values
  Shiny.onInputChange('bins', 30);
  Shiny.onInputChange('text', "Blah");

  var setBins = function(bins){
    Shiny.onInputChange('bins', bins);
  };

  var text = function(text){
    Shiny.onInputChange('text',text);
  };
  
  var commands = {
    'bins :bins': setBins,
    'text :text': text 
  };

  annyang.addCommands(commands);
  annyang.setLanguage('en');
  annyang.start();

  }
};

$(function() {
  setTimeout(initVoice, 1);
});