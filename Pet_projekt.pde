Pet pet;

void setup() {
  size(800, 600);

  // Opretter kæledyret
  pet = new Pet("Bobo", 5);
}

void draw() {
  background(220);

  // Titel
  textSize(30);
  fill(0);
  text("Mit digitale kæledyr", 250, 50);

  // Viser kæledyret
  pet.display();

  // Viser status
  textSize(20);
  text("Navn: " + pet.navn, 50, 100);
  text("Vægt: " + pet.vaegt + " kg", 50, 130);
  text("Kalorier: " + pet.kalorier, 50, 160);

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
      
    pet.givMad();
  }

  // Træn
  if (mouseX > 230 && mouseX < 380 &&
      mouseY > 450 && mouseY < 500) {
      
    pet.traen();
  }
}
