//Team Windows XDDD - Jason Mohabir, Lorenz Vargas, Grace Stempel
//APCS pd2
//HW47 -- All That Bouncin'
//2016-05-30

// Chain Reaction 

Ball[] _balls;
boolean pressed = false;

// ====================================================================
// Setup - Initialization of the World
// ====================================================================
void setup() {
  size(600,600); // World Size
  background(0); // Black
  _balls = new Ball[20];
  for (int i = 0 ; i < 20 ; i++)
    _balls[i] = new Ball(random(360), 2 + random(2));
  _balls[0].setState(0);
  frameRate(60); // 60 FPS Default
}

// ====================================================================
// Draw - Runs Program
// ====================================================================
void draw() {
  clear();
  for (Ball b : _balls) {
    b.update();
    
    for (Ball other : _balls) {
      if (b != other && 
          b._state == 1 &&
          other._state > 1 &&
          b.detect(other)) { //detect all balls other than self
        b.setState(2);
      }
    }
    
  }
}

void mousePressed() {
  if (!pressed) {
    _balls[0] =  new Ball(0,0,mouseX,mouseY,2) ;
    pressed = true;
  }
}