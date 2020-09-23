// Globals
int _baseTileSize = 10;

// Frame and margin sizes, expressed in tiles
int _frameX = 160;
int _frameY = 90;
int _margin = 2;
int _dimMin = 5;
int _dimMax = 10;

void setup() {

  size(1920, 1080);
  noStroke();
    
  // Draw basic grid    
  createGrid();
  
  // Make margins white
  setMargins();
  
  
}


void draw() {

  drawTiles();
  
}

void keyPressed() {
  if (key == 'a') {
     createGrid(); 
  }
  
  if (key == 'd') {
     drawTiles();
  }
}

// Initializes the grid
void createGrid() {
  background(255,255,255);
   for (int i=_margin; i < _frameX-_margin; i++) {
    for (int j=_margin; j < _frameY-_margin; j++) {
      fill(color(random(255), random(255), random(255))); //<>//
      rect(i*_baseTileSize, j*_baseTileSize, _baseTileSize, _baseTileSize); //<>//
    }
  }
}

// Defines the margin space between the frame and the minimal bounded box
void setMargins() {
  fill(color(255,255,255));
  
  rect(0,0, _frameX*_baseTileSize, _margin*_baseTileSize);
  rect(0,(_frameY-_margin)*_baseTileSize, _frameX*_baseTileSize, _margin*_baseTileSize);
  rect((_frameX-_margin)*_baseTileSize, 0, _margin*_baseTileSize, _frameY*_baseTileSize);
  rect(0,0, _margin*_baseTileSize, _frameY*_baseTileSize);
  
}


void drawTiles() {
  int tileCount = 0;
  
  // Redraw operations
  tileCount++;
  int pX = 0;
  int pY = 0;
  
  //TODO: algorithm to be filled out here
}

// Determines if a point falls within the box boundary
boolean isPointInBox(int x, int y, int xmin, int ymin, int xmax, int ymax) {
  return false;
}

// Returns a randomly generated pair of integers between dmin and dmax, inclusive
int[] generateRandomDimensions(int dmin, int dmax) {  
  int[] point = { 0, 0 };
  return point;
}

// Generates a new point from two formulas that are chosen at random
int[] generateNewPoint(int x1, int y1,  int d1, int d2) {
  int[] point = { 0, 0 };
  return point;
}
