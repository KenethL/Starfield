Particle[] blobs = new Particle[1000];
boolean pull = true;
float holeSize = 40;

void setup() {
  size(400, 400);
  background(0);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Particle();
  }
  for (int i = 0; i < 10; i++) {
    blobs[i] = new OddParticle();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < blobs.length; i++) {
    if (pull == false) {
      blobs[i].move();
    }
    if (pull == true) {
      blobs[i].myAngle = Math.atan2((blobs[i].myY - 200) * -1, (blobs[i].myX - 200) * -1);
      blobs[i].move();
    }
    blobs[i].show();
  }
  fill(30);
  if (pull == true) {
    holeSize = holeSize + 0.2;
    if (holeSize > 150) {
      holeSize = 150;
    }
  } else {
    holeSize = holeSize - 0.15;
    if (holeSize < 40) {
      holeSize = 40;
    }
  }
  ellipse(200, 200, holeSize, holeSize);
}

void mouseClicked() {
  if (pull == false)
    pull = true;
  else
    pull = false;
  for (int i = 0; i < blobs.length; i++) {
    blobs[i].myAngle = Math.atan2((blobs[i].myY - 200), (blobs[i].myX - 200));
  }
}

class Particle {
  int myColor;
  double myX, myY, mySize, mySpeed, myAngle;
  Particle() {
    myX = (Math.random()*600)-100;
    myY = (Math.random()*600)-100;
    mySize = 5;
    mySpeed = (Math.random()*3+0.3);
    myAngle = (Math.random()*2)*Math.PI;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  }
  void show() {
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
    if (pull == false) {
      if (myX > 500 || myX < -100) {
        myX = 200;
        myY = 200;
        myAngle = (Math.random()*2)*Math.PI;
        myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
        mySpeed = (Math.random()*3+0.3);
        if(mySize == 20){
          mySpeed = (Math.random()*10)+2;
        }
      }
      if (myY > 500 || myY < -100) {
        myX = 200;
        myY = 200;
        myAngle = (Math.random()*2)*Math.PI;
        myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
        mySpeed = (Math.random()*3+0.3);
        if(mySize == 20){
          mySpeed = (Math.random()*10)+2;
        }
      }
    }
    if (pull == true) {
      if (Math.abs(myX - 200) < 20 && Math.abs(myY - 200) < 20) {
        myAngle = (Math.random()*2)*Math.PI;
        myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
        mySpeed = (Math.random()*3+0.3);
        if(mySize == 20){
          mySpeed = (Math.random()*10)+2;
        }
        if((int)(Math.random()*2) == 0){
          myX = (Math.random()*600)-100;
          if((int)(Math.random()*2)==0){
            myY = (Math.random()*200)-200;
          }
          else{
            myY = (Math.random()*200)+400;
          }
        }
        else{
          myY = (Math.random()*600)-100;
          if((int)(Math.random()*2)==0){
            myX = (Math.random()*200)-200;
          }
          else{
            myX = (Math.random()*200)+400;
          }
        }
      }
    }
  }
}

class OddParticle extends Particle {
  OddParticle() {
    myX = 200;
    myY = 200;
    mySize = 20;
    mySpeed = (Math.random()*10)+2;
    myAngle = (Math.random()*2)*Math.PI;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void move() {
    if(pull == false){
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
    }
    if(pull == true){
    myX = myX + Math.cos(myAngle - Math.PI/2.4) * mySpeed;
    myY = myY + Math.sin(myAngle - Math.PI/2.4) * mySpeed;
    }
  }
}
