Walker bob;
Walker [] black;

void setup() {
  size(500, 500);

  bob = new Walker();
  black = new Walker[30]; // first call to new
  for (int i = 0; i < black.length; i++) {
    black[i] = new Walker(); // second call to new
  }
  // WITH ARRAY OF OBJECTS, THERE ARE (at least) TWO CALLS TO NEW
}
void mousePressed() {
  redraw();
}
void draw() {
  background (100);
  textSize (60);
  text ("HIGH VOLTAGE!", 50,250);
  bob.walk();
  bob.show();
  for (int i = 0; i < black.length; i++) {
    black[i].walk();
    black[i].show();
  }
}

class Walker {
  //two member variables
  int myX, myY;

  //three member functions
  //one of them is special: CONSTRUCTOR
  //who will initialize member varies
  Walker() {
    myX = (int)(Math.random()* width);
    myY = (int)(Math.random()* height);
  }
  void walk() {
    myX = myX + (int)(Math.random()*3)-1;// -1,  0, 1
    myY = myY + (int)(Math.random()*3)-1;
    if(mousePressed == true){
    if (mouseX > myX)
      myX = myX + (int)(Math.random()*5-1);
    else
    myX = myX - (int)(Math.random()*5-1);
    if (mouseY > myY)
      myY += (int)(Math.random()*5-1);
    else 
      myY -= (int)(Math.random()*5-1);
  }
  }
  void show() {
    lightning();
    fill((int)(Math.random()*100)+150, (int)(Math.random()*100)+150, (int)(Math.random()*100)+150);
  }//end of Walker class
  void lightning() {
    stroke(255, 255, 0, 100);
    strokeWeight(10);
    line(myX, myY, myX- 20, myY + 20);
    line(myX - 20, myY+20, myX +10, myY +20);
    line(myX+10, myY+ 20, myX - 10, myY +40);
  }
}
