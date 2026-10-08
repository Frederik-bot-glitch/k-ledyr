Pet pet;
Mad burger;
Mad aeble;
Mad pizza;
Mad heleMaccen;

Traening loeb;
Traening cykel;
Traening fitness;

boolean traenMenu = false;
boolean madMenu = false;
boolean eksploderet = false;

boolean madFlyver = false;
boolean madPartikler = false;
float madTid = 0;
final int PARTIKEL_ANTAL = 30;
Partikel[] partikler = new Partikel[PARTIKEL_ANTAL];
float ventendeVaegt;
int ventendeKalorier;
void setup() {
  size(800, 600);

  // Opretter kæledyret
  pet = new Pet("Mads", 5);
  burger = new Mad("Burger", 700);
  aeble = new Mad("Æble", 80);
  pizza = new Mad("Pizza", 500);
  heleMaccen = new Mad("Hele Mcdonald's", 10000);

  loeb = new Traening("Løb", 300);
  cykel = new Traening("Cykel", 400);
  fitness = new Traening("Fitness", 500);
}

void draw() {
  pushStyle();
  background(210, 220, 230);
  noStroke();

  // Bagvæg
  fill(235, 225, 205);
  rect(130, 70, 540, 330);

  // Venstre og højre væg
  fill(205, 190, 170);
  quad(0, 0, 130, 70, 130, 400, 0, 600);
  fill(190, 175, 155);
  quad(670, 70, 800, 0, 800, 600, 670, 400);

  // Gulv
  fill(170, 130, 90);
  quad(130, 400, 670, 400, 800, 600, 0, 600);
  popStyle();

  // Titel
  textSize(30);
  fill(0);
  text("Mit digitale kæledyr", 250, 50);

  // Viser kæledyret
  tjekEksplosion();
  if (!eksploderet) {
    pet.display();
  }

  //Madskål
  pushStyle();
  stroke(20, 65, 130);
  strokeWeight(2);
  fill(55, 130, 220);
  quad(665, 535, 755, 535, 775, 580, 645, 580);

  fill(25, 80, 160);
  ellipse(710, 535, 95, 30);

  noStroke();
  fill(100, 60, 25);
  ellipse(672, 532, 9, 9);
  ellipse(682, 526, 9, 9);
  ellipse(688, 538, 9, 9);
  ellipse(695, 531, 9, 9);
  ellipse(702, 524, 9, 9);
  ellipse(706, 539, 9, 9);
  ellipse(713, 531, 9, 9);
  ellipse(720, 524, 9, 9);
  ellipse(724, 539, 9, 9);
  ellipse(731, 531, 9, 9);
  ellipse(738, 525, 9, 9);
  ellipse(744, 538, 9, 9);
  ellipse(749, 530, 9, 9);
  ellipse(680, 539, 9, 9);
  ellipse(691, 523, 9, 9);
  ellipse(716, 523, 9, 9);
  ellipse(735, 539, 9, 9);
  popStyle();

  tegnMadAnimation();

  // Viser status
  textSize(20);
  text("Navn: " + pet.navn, 50, 100);
  text("Vægt: " + pet.getVaegt() + " kg", 50, 130);
  text("Kalorier: " + pet.getKalorier(), 50, 160);


  fill(100, 200, 100);
  // Mad knap
  rect(50, 450, 150, 50);

  // Træn knap
  rect(230, 450, 150, 50);

  // Hvis trænmenu er åben
  if (traenMenu) {

    loeb.display(400, 400);
    cykel.display(400, 470);
    fitness.display(400, 540);
  }

  // Hvis madmenuen er åben
  if (madMenu) {

    burger.display(250, 400);
    aeble.display(450, 400);
    pizza.display(250, 480);
    heleMaccen.display(450, 480);
  }

  fill(0);
  text("Giv mad", 90, 482);
  text("Træn", 280, 482);
  tegnEksplosion();
  if (eksploderet) {
    fill(140, 0, 0);
    text("Kæledyret eksploderede! Tryk R for at starte igen.", 150, 190);
  }
}

void mousePressed() {
  if (eksploderet || madFlyver) return;

  // Giv mad
  if (mouseX > 50 && mouseX < 200 &&
    mouseY > 450 && mouseY < 500) {

    madMenu = !madMenu;
    traenMenu = false;
  }

  // Træn
  if (mouseX > 230 && mouseX < 380 &&
    mouseY > 450 && mouseY < 500) {

    traenMenu = !traenMenu;
    madMenu = false;
  }

  // Burger
  if (madMenu &&
    mouseX > 250 && mouseX < 430 &&
    mouseY > 400 && mouseY < 460) {

    startMadAnimation(2, 700);
    madMenu = false;
  }


  // Æble
  if (madMenu &&
    mouseX > 450 && mouseX < 630 &&
    mouseY > 400 && mouseY < 460) {

    startMadAnimation(0.2, 80);
    madMenu = false;
  }


  // Pizza
  if (madMenu &&
    mouseX > 250 && mouseX < 430 &&
    mouseY > 480 && mouseY < 540) {

    startMadAnimation(1, 500);
    madMenu = false;
  }
  
  // Hele Mcdonald's giver 20 kg ekstra.
  if (madMenu &&
      mouseX > 450 && mouseX < 630 &&
      mouseY > 480 && mouseY < 540) {

    startMadAnimation(20, heleMaccen.kalorier);
    madMenu = false;
  }

   // LØB
  if (traenMenu &&
      mouseX > 400 && mouseX < 580 &&
      mouseY > 400 && mouseY < 460) {

    pet.aendreKalorier(-300);
    pet.aendreVaegt(-0.5);

    traenMenu = false;
  }


  // CYKEL
  if (traenMenu &&
      mouseX > 400 && mouseX < 580 &&
      mouseY > 470 && mouseY < 530) {

    pet.aendreKalorier(-400);
    pet.aendreVaegt(-0.7);

    traenMenu = false;
  }


  // FITNESS
  if (traenMenu &&
      mouseX > 400 && mouseX < 580 &&
      mouseY > 540 && mouseY < 600) {

    pet.aendreKalorier(-500);
    pet.aendreVaegt(-1);

    traenMenu = false;
  }
}

// En foderkugle flyver fra skålen til hundens mund.
void tegnMadAnimation() {
  if (madFlyver) {
    madTid += 0.035;

    float kugleX = lerp(710, 400, madTid);
    float kugleY = lerp(535, 268, madTid) - sin(PI * madTid) * 100;

    pushStyle();
    noStroke();
    fill(100, 60, 25);
    ellipse(kugleX, kugleY, 13, 13);
    popStyle();

    if (madTid >= 1) {
      madFlyver = false;
      pet.aendreVaegt(ventendeVaegt);
      pet.aendreKalorier(ventendeKalorier);
      tjekEksplosion();
      if (!eksploderet) startPartikler();
    }
  }

  if (madPartikler) {
    boolean alleErFaerdige = true;
    for (int i = 0; i < PARTIKEL_ANTAL; i++) {
      partikler[i].opdater();
      partikler[i].display();
      if (!partikler[i].erFaerdig()) {
        alleErFaerdige = false;
      }
    }

    madPartikler = !alleErFaerdige;
  }
}

void startMadAnimation(float vaegt, int kalorier) {
  madFlyver = true;
  madPartikler = false;
  madTid = 0;
  ventendeVaegt = vaegt;
  ventendeKalorier = kalorier;
}

void startPartikler() {
  madPartikler = true;

  for (int i = 0; i < PARTIKEL_ANTAL; i++) {
    partikler[i] = new Partikel(400, 268);
  }
}

void tjekEksplosion() {
  if (!eksploderet && pet.getVaegt() > 20) {
    eksploderet = true;
    madFlyver = false;
    madPartikler = false;
    madMenu = false;
    traenMenu = false;
    startEksplosion();
  }
}

void keyPressed() {
  if (eksploderet && (key == 'r' || key == 'R')) {
    pet = new Pet("Mads", 5);
    eksploderet = false;
    eksplosion = new Partikel[180];
  }
}
