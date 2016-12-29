var initVoice = function() {
if (annyang) {
    
    var obs = 10;
  
    // Set default values
      Shiny.onInputChange('dataset', 'cars');
      Shiny.onInputChange('obs', 10);


      var commands = {
        'data *name': function(name) {
            Shiny.onInputChange('dataset', name.toLowerCase());
        },
        'add :number': function(number) {
            obs += number
            Shiny.onInputChange('obs', obs);
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