//Team Windows XDDD - Jason Mohabir, Lorenz Vargas, Grace Stempel
//APCS pd2
//HW47 -- All That Bouncin'
//2016-05-30

// Ball

class Ball {

  // Instance Variables

  float _dx, _dy, _x, _y, _size;
  int _state;
  color c; 
 
  // State Variable: (Subject to Change)
  // 0 - Dead
  // 1 - Moving
  // 2 - Expanding
  // 3 - Shrinking
  
  public void setState(int newState) { _state = newState; }
  public int getState() { return _state; } 

  // Default Constructor

  Ball() {

    _dx = random(10) - 5;
    _dy = random(10) - 5;

    _state = 1;
    _x = random(width); //random float [0, 600)
    _y = random(height);
    _size = 25;

    c = color(int(random(255)),int(random(255)),int(random(255)));
  }
  
  
    Ball(int x, int y, int state) {
    this();
    _x = x;
    _y = y;
    _state = state;
  } 
  

  // Ball Movement - State 1: Moving

  // reflect() - If the ball hits a wall, negate the appropriate velocity
  void reflect() {
    if (_x <= 0 || _x >= 600) {
      _dx = -(_dx);
    }
    if (_y <= 0 || _y >= 600) {
      _dy = -(_dy);
    } 
  }
  
  // tick() - Moves the ball according to its dx and dy values
  void tick() { // Name subject to change
    _x += _dx;
    _y += _dy;
  }
  

  // Chain Reaction - State 2,3: Expanding and Shrinking

  // updateSize() - Changes the size of the ball depending on its state
   void updateSize() {
     if (_state == 2) { //expanding
       if (_size >= 150) //start shrinking at size = 150
         _state = 3; 
       else _size++;
     }
     else { //shrinking
       if (_size <= 0)
         _state = 0;
       else _size--;
     }
     
   }
  
  // detect() - Returns a boolean indicating whether this ball has collided with an
  //            expanding or shrinking ball
   boolean detect(Ball other) {
     if ( (_size + other._size)/2 > cartDist(this, other) ) { //if other ball is within 1 unit from me
       return true;
     }
     return false;
   }
   
   // cartDist() - Returns Cartesian distance between 2 balls
   float cartDist(Ball ball1, Ball ball2) {
      return sqrt( sq(ball1._x - ball2._x) +  
                   sq(ball1._y - ball2._y) ); 
   }
   

  // Updating Image - Prints Ball onto canvas

  void update() {    
    if (_state != 0) {
      if (_state == 1) {
        reflect();
        tick();
      }
      else updateSize(); //state should be 2 or 3
      fill(c);
      noStroke();
      ellipse (_x, _y, _size, _size);
    }
    
  }
  
  
}