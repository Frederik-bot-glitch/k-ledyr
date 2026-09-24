class Pet {

  // Attributter
  String navn;
  private SundhedsStatus sundhed;

  // Konstruktør
  Pet(String navn, float vaegt) {
    this.navn = navn;
    sundhed = new SundhedsStatus(vaegt);
  }

  // Pet videresender ændringer til sin egen sundhedsstatus.
  void aendreVaegt(float aendring) {
    sundhed.aendreVaegt(aendring);
  }

  void aendreKalorier(int aendring) {
    sundhed.aendreKalorier(aendring);
  }

  float getVaegt() {
    return sundhed.getVaegt();
  }

  int getKalorier() {
    return sundhed.getKalorier();
  }

  // Metode til at give mad
  void givMad() {
    aendreVaegt(1);
    aendreKalorier(500);
  }


  // Metode til at træne
  void traen() {
    aendreVaegt(-1);
  }

  void display() {

    // Maven bliver større med vægten
    float mave = 120 + getVaegt() * 15;

    // Gemmer det nuværende kordinatsystem
    pushMatrix();

    // Flytter kordinatsystemet så (0,0) bliver ved (400,320) hvorefter man kan tegne kæledyret ud fra det
    translate(400, 320);


    // Mave som bliver større
    fill(210, 150, 90);
    ellipse(0, 40, mave, mave * 0.75);

    // Hoved
    fill(220, 160, 100);
    ellipse(0, -90, 145, 130);

    // Ører
    fill(160, 100, 60);
    ellipse(-70, -100, 50, 100);
    ellipse(70, -100, 50, 100);

    // Øjne
    fill(30);
    ellipse(-27, -105, 22, 28);
    ellipse(27, -105, 22, 28);

    // Glimt i øjnene
    fill(255);
    ellipse(-31, -110, 6, 6);
    ellipse(23, -110, 6, 6);

    // Snude
    fill(80);
    ellipse(0, -65, 35, 25);

    // Mund
    stroke(50);
    strokeWeight(4);
    noFill();
    arc(-10, -52, 18, 15, 0, PI);
    arc(10, -52, 18, 15, 0, PI);

    // Poter som følger maven når den vokser
    fill(190, 130, 75);

    float poteY = 40 + mave * 0.37;

    ellipse(-75, poteY, 80, 50);
    ellipse(75, poteY, 80, 50);

    // Tæer
    stroke(100, 70, 40);
    strokeWeight(4);

    line(-90, poteY, -90, poteY + 20);
    line(-75, poteY, -75, poteY + 20);

    line(60, poteY, 60, poteY + 20);
    line(75, poteY, 75, poteY + 20);

    // Går tilbage til det gamle kordinatsystem
    popMatrix();
  }
}
