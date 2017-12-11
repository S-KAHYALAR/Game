float x;
float y;
float dx = 2;
float dy = 2;

float accx =3;
float accy = 3;

float bw = 150;
float bh = 30;
String bTxt = "START";
String rTxt="Restart";
float radEnemy = 30;

Boolean scene1 = true;
Boolean scene2 = false;
Boolean scene3 = false;
Boolean scene4=false;

// parameters for robot
float rw = 45;
float rh = 153;

void setup() {
  size(600, 600);

setupSound();
}

void setupSound() {

  // instantiate lib and load sound to play
}

  void draw() {
    background(#5A574A);

    if (scene2 == true) {
      // draw robot
      drawMycustomRobot(mouseX, mouseY, 52, 152, 219);
      x = x+accx*dx;
      y = y +accy*dy;

      if (x > width || x < 0)
      {
        accx = random(0.1, 5);
        dx = dx*-1;
      }

      if ( y > height || y < 0) {
        accy = random(0.1, 5);
        dy = dy*-1;
      }


      fill(0);
      noStroke();
      ellipse(x,y, radEnemy, radEnemy);
    }

    // Check hit detection with robot and enemy ball
    if (mouseX + rw/2 > x-radEnemy/2 && mouseX - rw/2 < x + radEnemy/2
      && mouseY + rh/2> y - radEnemy/2 && mouseY - rh/2 < y + radEnemy/2) {
      scene3 = true;
      scene1 = false;
      scene2 = false;

      if (scene1 == true) {
        startButton();
      }
    }

    // Scene 3 content
    if (scene3 == true) {
      fill(255, 0, 0, 150);
      rect(0, 0, width, height);
      restartButton();
    }
  }

  void restartButton() {
    pushMatrix();
    translate(width/2 - bw/2, height/2 - bh/2);
    fill(#2ECC71);

    noStroke();
    rect(0, 0, bw, bh);

    fill(255);
    text(rTxt, bw/2 - textWidth(rTxt)/2, 18 );
    popMatrix();
  }

  void startButton() {
    pushMatrix();
    translate(width/2 - bw/2, height/2 - bh/2);
    fill(#2ECC71);


    noStroke();
    rect(0, 0, bw, bh);

    fill(255);
    text(bTxt, bw/2 - textWidth(bTxt)/2, 18 );
    popMatrix();
  }

  void mousePressed() {
    if (mouseX > width/2 - bw/2 && mouseX < width/2 - bw/2 + bw
      && mouseY > height/2 - bh/2 && mouseY < height/2 - bh/2 + bh) {
      scene1 = false;
      scene2 = true;
      scene3 = false;
    }
  }
  void drawMycustomRobot(float xpos, float ypos, float r, float g, float b) {
    

    //translate(mouseX,mouseY);
    translate(xpos - 120 + 25, ypos - 220 + 75);

    scale(0.5, 0.5);

    fill(#b63b2f);
    rect(190, 92, 112, 103);
    // drawing faces
    fill(#b7deda);
    ellipse(196, 101, 6, 6);
    fill(#98d1c9);
    ellipse(196, 146, 6, 6);
    fill(#b7deda);
    ellipse(196, 184, 6, 6);
    fill(#98d1c9);
    ellipse(293, 99, 6, 6);
    fill(#b7deda);
    ellipse(293, 144, 6, 6);
    fill(#98d1c9);
    ellipse(293, 182, 6, 6);
    //drawing left eye
    fill(#98d1c9);
    ellipse(220, 120, 36, 34);
    ellipse(220, 120, 23, 21);
    //drawing right eye
    fill(#98d1c9);
    ellipse(270, 120, 36, 34);
    ellipse(270, 120, 22, 21);
    //drawing a mouth
    fill(#b7deda);
    rect(223, 156, 51, 20);
    rect(230, 162, 37, 8);
    //drawing a throat
    fill(#4a1516);
    rect(238, 195, 20, 21);
    //drawing a body
    fill(#b63b30);
    rect(184, 216, 130, 117);
    fill(#cd5952);
    ellipse(250, 275, 84, 82);
    //drawing left arms
    fill(#003f2a);
    rect(162, 216, 22, 25);
    fill(#00583f);
    rect(140, 216, 22, 25);
    rect(140, 241, 22, 25);
    rect(140, 266, 22, 25);
    rect(140, 290, 22, 25);
    fill(#b22920);
    pushMatrix();
    translate(300, 625);
    rotate(radians(180));
    arc(150, 308, 48, 48, 0, PI+QUARTER_PI, PIE);
    popMatrix();
    //drawing right arms
    fill(#003f2a);
    rect(314, 216, 22, 25);
    fill(#00583f);
    rect(336, 216, 22, 25);
    rect(336, 241, 22, 25);
    rect(336, 266, 22, 25);
    rect(336, 290, 22, 25);
    fill(#b22920);
    pushMatrix();
    translate(695, 625);
    rotate(radians(180));
    arc(350, 308, 48, 48, 0, PI+QUARTER_PI, PIE);
    popMatrix();
    //drawing left leg
    fill(#005c43);
    rect(200, 334, 18, 30);
    fill(#b02e22);
    rect(191, 364, 36, 62);
    fill(#005b42);
    rect(184, 426, 49, 24);
    //drawing right leg
    fill(#005c43);
    rect(278, 334, 18, 30);
    fill(#b02e22);
    rect(269, 364, 36, 63);
    fill(#005b42);
    rect(262, 426, 49, 24);
  }