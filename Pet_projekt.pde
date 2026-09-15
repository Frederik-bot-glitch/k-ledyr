Pet pet;
Mad burger;
Mad aeble;
Mad pizza;

Træn løb;
Træn cykel;
Træn fitness;

boolean madMenu = false;
void setup() {
  size(800, 600);

  // Opretter kæledyret
  pet = new Pet("Mads", 5);
    burger = new Mad("Burger", 700);
  aeble = new Mad("Æble", 80);
  pizza = new Mad("Pizza", 500);
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
  text("Vægt: " + pet.getVaegt() + " kg", 50, 130);
  text("Kalorier: " + pet.kalorier, 50, 160);

  // Knapper
  fill(100, 200, 100);
  
  // Mad knap
  rect(50, 450, 150, 50);
  
  // Træn knap
  rect(230, 450, 150, 50);
  
  // Hvis trænmenu er åben
  if (trænMenu) { 
  cykel.display(250,400);
  løb.display(450,400);
  fitness.display(250,480);
  
  }
  
   // Hvis madmenuen er åben
  if (madMenu) {

    burger.display(250, 400);
    aeble.display(450, 400);
    pizza.display(250, 480);
  }

  fill(0);
  text("Giv mad", 90, 482);
  text("Træn", 280, 482);
  
 
}

void mousePressed() {

  // Giv mad
  if (mouseX > 50 && mouseX < 200 &&
      mouseY > 450 && mouseY < 500) {
      
madMenu = !madMenu;
  }

  // Træn
  if (mouseX > 230 && mouseX < 380 &&
      mouseY > 450 && mouseY < 500) {
      
    pet.traen();
  }
  
   // Burger
   if (madMenu &&
      mouseX > 250 && mouseX < 430 &&
      mouseY > 400 && mouseY < 460) {

    pet.vaegt = pet.vaegt + 2;
    pet.kalorier = pet.kalorier + 700;
    madMenu = false;
  }


  // Æble
  if (madMenu &&
      mouseX > 450 && mouseX < 630 &&
      mouseY > 400 && mouseY < 460) {

    pet.vaegt = pet.vaegt + 0.2;
    pet.kalorier = pet.kalorier + 80;
    madMenu = false;
  }


  // Pizza
  if (madMenu &&
      mouseX > 250 && mouseX < 430 &&
      mouseY > 480 && mouseY < 540) {

    pet.vaegt = pet.vaegt + 1;
    pet.kalorier = pet.kalorier + 500;
    madMenu = false;
  }
}
