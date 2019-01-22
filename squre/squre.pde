int startx = -200;
int starty = -200;

float xnoise = 0;
float ynoise = 0;
float znoise = 0;

float x = 0.1;

float _strokeCol = 0;
float _strokeChange = 0.5; 

void setup(){

  size(600, 600, P3D);
  
}
void draw(){
  background(255);
  translate(width/2, height/2);
  
  xnoise = 0;
  ynoise = 0;
  
  for(int i = starty; i < 200; i += 10){
    for(int j = startx; j < 200; j += 10){
      float noise = map(noise(xnoise, ynoise, znoise), 0, 1, -0.5, 0.5)*125;
      _strokeCol += _strokeChange;
      if (_strokeCol > 200) { _strokeChange *= -1; }
      if (_strokeCol < 0) { _strokeChange *= -1; }
      stroke(_strokeCol);
      rotateY(-x);
      rotateX(-x);
      rect(j + noise, i + noise, 30, 30);
      xnoise += 0.01;
    }
    ynoise += 0.01;
  }
  
  znoise += 0.01;
  x += 0.00001;
  
}

void keyPressed(){
    saveFrame("square-####.png");
}
