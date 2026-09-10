class Pet {

  // Attributter
  String navn;
  float vaegt;
  int kalorier;

  // Konstruktør
  Pet(String navn, float vaegt) {
    this.navn = navn;
    this.vaegt = vaegt;
    kalorier = 0;
  }

  // Metode til at give mad
  void givMad() {
    vaegt = vaegt + 1;
    kalorier = kalorier + 500;
  }

  // Metode til at træne
  void traen() {
    if (vaegt > 1) {
      vaegt = vaegt - 1;
    }
  }

  // Viser kæledyret
  void display() {

    // Krop
    fill(150, 100, 200);
    ellipse(400, 300, vaegt * 20, vaegt * 20);

    // Øjne
    fill(0);
    ellipse(380, 290, 10, 10);
    ellipse(420, 290, 10, 10);
  }
}
