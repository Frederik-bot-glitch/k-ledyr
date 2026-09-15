class Træn {
  String navn;
  int Træn;

  Mad(String navn, int træn) {
    this.navn = navn;
    this.kalorier = kalorier;
  }

  void display(float x, float y) {
    fill(255);
    stroke(100);
    rect(x, y, 180, 60, 10);

    fill(0);
    textSize(20);
    text(navn, x + 15, y + 25);
    text(kalorier + " kcal", x + 15, y + 48);
  }
  
  
}
