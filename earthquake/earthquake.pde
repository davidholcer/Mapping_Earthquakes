//Meteor Sketch
//Skillshare course

// LIBRARIES
import processing.pdf.*;

// GLOBAL VARIABLES
PShape baseMap;
String csv[];
String myData[][];
//PFont f;
Float percent;
 int[][] colours = {{30,66,191},{128,0,128},{241,38,141},{250,46,40},{253,165,53},{255,254,83},{255,245,153},{210,210,210},{237,237,237},{255,255,255}};

// SETUP
void setup(){
 // smooth(8);
  size (1280,640);
  pixelDensity(displayDensity());
 // size(1280, 640, "processing.core.PGraphicsRetina2D");
 // hint(ENABLE_RETINA_PIXELS);
  noLoop();
  percent=.5;
  //f=createFont("InputSerif-ExtraLightItalic.ttf",12);
  baseMap = loadShape("WorldMap.svg");
  csv = loadStrings("earthquakes.csv");
  myData= new String[csv.length][22];
  for (int i=0; i<csv.length; i++) {
    myData[i] =csv[i].split(",");
    //print(myData[i]);
  }
  print(myData[13][13].split("\""));
}

// DRAW
void draw() {
  beginRecord(PDF, "earthquakes.pdf");
  shape(baseMap, 0, 0, width, height);
  for (int i=0; i<1000; i++) {
    //textMode(MODEL);
    noStroke();
    float graphLong = map(float(myData[i][2]), -180, 180, 0, width);
    float graphLat=map(float(myData[i][1]), 90, -90, 0, height);
    float markerSize=pow(10,float(myData[i][4]))/19905;
    //println(graphLong + " + " + graphLat);
//    println (30*(10-float(myData[i][4])));
   // fill(227, 90*(float(myData[0][4])-float(myData[i][4])), 90, 255*percent);
  //  fill(random(0,255), random(0,255), random(0,255), 255*percent);
    for (int j=9; j>-1; j--) {
      if (floor(abs(float(myData[i][4])))==j) {
        fill (colours[9-j][0],colours[9-j][1],colours[9-j][2], 255*percent);
      }
    }
    ellipse(graphLong, graphLat, markerSize, markerSize);
    
    if (i<11){
      fill(54,64,79);
      //textMode(SHAPE);
      //textFont(f);
      text(myData[i][13],graphLong + markerSize-25, graphLat+3);
      noFill();
      stroke(0);
      line(graphLong+markerSize/2,graphLat,graphLong+markerSize/1.5,graphLat);
    }
  }
  endRecord();
  println("PDF Saved");
}
