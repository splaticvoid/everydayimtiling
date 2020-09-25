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
  boolean canDrawMoreTiles = true;
  
  if (!canDrawMoreTiles) return;
  
  // Redraw operations
  tileCount++;
  int pX = 0;
  int pY = 0;
  int mxmin = 0;
  int mymin = 0;
  
  // TODO: Add loop around entire block - 
  
  // Generate a new point
    int[]  point = generateRandomDimensions(pX,pY);
    boolean isInBox = false;
    
     while (!isInBox) {
       // If (px + dmin) , (py + dmax) is not in the frame
       
       if (isPointInBox(point[0], point[1], 0, 0, _frameX, _frameY)) {          
         isInBox = true;
         // Draw a rectangle starting at (px, py) the adjusted dimensions
         fill(color(random(255), random(255), random(255)));
         rect(pX, pY, point[0]-pX, point[1]-pY);        
       } else {
       
         // decrement one of the dimensions at random  at try again
         int isOne = int(random(1));
       
         if (point[0] - pX > _dimMin) point[0] = point[0] - isOne;
       
         if (point[1] - pY > _dimMin) point[1] = point[1] - (1 - isOne);
       
         // Or if both the dimension <= dmin, return error (cannot create any more tiles)
         if ((point[0] - pX < _dimMin) && (point[1] - pY < _dimMin)) {
           print("Cannot draw any more tiles!");
           canDrawMoreTiles = false;
          }                
        }
      }
    
    // Choose a new point (generate new point) based on randomized rules along x/y axes
    int[] newPoint = generateNewPoint(pX, pY, int(random(point[0] - pX)), int(random(point[1] - pY)));
  
    if (!isPointInBox(newPoint[0], newPoint[1], 0, 0, _frameX, _frameY)) {
        
      // If it's not in the frame, update mxmin, mymin 
      
    } else {
       pX = newPoint[0];
       pY = newPoint[1];
    }
  
  
  // Stop when mxmin / mymin is no longer in the minimum bounded box
  if (isPointInBox(mxmin, mymin, _margin, _margin, _frameX - _margin, _frameY - _margin)) {
      canDrawMoreTiles = false;
  }
}

// Determines if a point falls within the box boundary
boolean isPointInBox(int x, int y, int xmin, int ymin, int xmax, int ymax) { 
  boolean isXIn = (xmin <= x) && (x <= xmax);
  boolean isYIn = (ymin <= y) && (y <= ymax);
 
  return (isXIn && isYIn);
}

// Returns a randomly generated pair of integers between dmin and dmax, inclusive
int[] generateRandomDimensions(int x, int y) {  
  int[] point = { x + _dimMin + int(random(_dimMax-_dimMin)), y + _dimMin + int(random(_dimMax-_dimMin)) };
  return point;
}

// Generates a new point from two formulas that are chosen at random
int[] generateNewPoint(int x1, int y1,  int d1, int d2) {
  
  int isOne = int(random(1));
  int px = x1;
  int py = y1;
  
  if (isOne == 1) {
      px = x1 + d1;    
      py = y1;    
  } else {
     px = x1;
     py = y1 + d2;
  }
   
  int[] result = { px, py };
  
  return result;
}
