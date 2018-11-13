PFont mono;
// The font "andalemo.ttf" must be located in the 
// current sketch's "data" directory to load successfully
mono = createFont("andalemo.ttf",32);
background(0);
textFont(mono);
text("word", 12, 60);