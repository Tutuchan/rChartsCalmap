HTMLWidgets.widget({

  name: 'calheatmap',

  type: 'output',
  
  factory: function(el, width, height) {
    var cal = new CalHeatMap();
    var exists = false;
    return{
      renderValue: function(x) {
        x.itemSelector = '#' + el.id;
        if (x.start){
          x.start = new Date(x.start);
        }
        if (!exists) {
          exists = cal.init(x);
        } else {
          cal = cal.destroy();
          cal = new CalHeatMap();
          cal.init(x);
        }
      },
      resize: function(x, width, height) {
        cal.resize();
      },
      chm: cal
    };
  }
});
