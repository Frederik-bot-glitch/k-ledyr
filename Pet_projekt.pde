// Digitale kæledyr

float vaegt = 5;
int kalorier = 0;

void setup() {
  size(800, 600);
}

void draw() {
  background(220);

  // Titel
  textSize(30);
  text("Mit digitale kæledyr", 250, 50);

  // Kæledyr
  fill(150, 100, 200);
  ellipse(400, 300, vaegt * 20, vaegt * 20);

  // Øjne
  fill(0);
  ellipse(380, 290, 10, 10);
  ellipse(420, 290, 10, 10);

  // Status
  textSize(20);
  fill(0);
  text("Vægt: " + vaegt + " kg", 50, 100);
  text("Kalorier: " + kalorier, 50, 130);

  // Knapper
  fill(100, 200, 100);
  rect(50, 450, 150, 50);
  rect(230, 450, 150, 50);

  fill(0);
  text("Giv mad", 90, 482);
  text("Træn", 280, 482);
}

void mousePressed() {

  // Giv mad
  if (mouseX > 50 && mouseX < 200 &&
      mouseY > 450 && mouseY < 500) {
      
    vaegt = vaegt + 1;
    kalorier = kalorier + 500;
  }

  // Træn
  if (mouseX > 230 && mouseX < 380 &&
      mouseY > 450 && mouseY < 500) {
      
    if (vaegt > 1) {
      vaegt = vaegt - 1;
    }
  }
}
