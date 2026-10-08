Pet pet;
Mad burger;
Mad aeble;
Mad pizza;
Mad heleMaccen;

Traening loeb;
Traening cykel;
Traening fitness;
Traening marathon;

boolean traenMenu = false;
boolean madMenu = false;
boolean eksploderet = false;

boolean madFlyver = false;
boolean madPartikler = false;
float madTid = 0;
final int PARTIKEL_ANTAL = 30;
Partikel[] partikler = new Partikel[PARTIKEL_ANTAL];
int ventendeKalorier;
void setup() {
  size(800, 600);

  // Opretter kæledyret
  pet = new Pet("Mads", 5);
  burger = new Mad("Burger", 700);
  aeble = new Mad("Æble", 80);
  pizza = new Mad("Pizza", 500);
  heleMaccen = new Mad("Hele Mcdonald's", 20000);

  loeb = new Traening("Løb", 300);
  cykel = new Traening("Cykel", 400);
  fitness = new Traening("Fitness", 500);
  marathon = new Traening("Marathon", 2500);
}

void draw() {
  tegnBaggrund();

  // Titel
  textSize(30);
  fill(0);
  text("Mit digitale kæledyr", 250, 50);

  // Viser kæledyret
  tjekEksplosion();
  if (!eksploderet) {
    pet.display();
  }

  tegnMadskaal();

  tegnMadAnimation();

  // Viser status
  textSize(20);
  text("Navn: " + pet.navn, 50, 100);
  text("Vægt: " + nf(pet.getVaegt(), 1, 2) + " kg", 50, 130);
  text("Kalorier: " + pet.getKalorier(), 50, 160);


  fill(100, 200, 100);
  // Mad knap
  rect(50, 450, 150, 50);

  // Træn knap
  rect(230, 450, 150, 50);

  // Hvis trænmenu er åben
  if (traenMenu) {

    loeb.display(400, 400);
    cykel.display(600, 400);
    fitness.display(400, 480);
    marathon.display(600, 480);
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

    startMadAnimation(burger.kalorier);
    madMenu = false;
  }


  // Æble
  if (madMenu &&
    mouseX > 450 && mouseX < 630 &&
    mouseY > 400 && mouseY < 460) {

    startMadAnimation(aeble.kalorier);
    madMenu = false;
  }


  // Pizza
  if (madMenu &&
    mouseX > 250 && mouseX < 430 &&
    mouseY > 480 && mouseY < 540) {

    startMadAnimation(pizza.kalorier);
    madMenu = false;
  }
  
  // Hele Mcdonald's giver 20 kg ekstra.
  if (madMenu &&
      mouseX > 450 && mouseX < 630 &&
      mouseY > 480 && mouseY < 540) {

    startMadAnimation(heleMaccen.kalorier);
    madMenu = false;
  }

   // LØB
  if (traenMenu &&
      mouseX > 400 && mouseX < 580 &&
      mouseY > 400 && mouseY < 460) {

    pet.aendreKalorier(-loeb.kalorier);

    traenMenu = false;
  }


  // CYKEL
  if (traenMenu &&
      mouseX > 600 && mouseX < 780 &&
      mouseY > 400 && mouseY < 460) {

    pet.aendreKalorier(-cykel.kalorier);

    traenMenu = false;
  }


  // MARATHON
  if (traenMenu &&
      mouseX > 600 && mouseX < 780 &&
      mouseY > 480 && mouseY < 540) {

    pet.aendreKalorier(-marathon.kalorier);
    traenMenu = false;
  }

  // FITNESS
  if (traenMenu &&
      mouseX > 400 && mouseX < 580 &&
      mouseY > 480 && mouseY < 540) {

    pet.aendreKalorier(-fitness.kalorier);

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

void startMadAnimation(int kalorier) {
  madFlyver = true;
  madPartikler = false;
  madTid = 0;
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
    eksplosion = new Partikel[380];
  }
}
