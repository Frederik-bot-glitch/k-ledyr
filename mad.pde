class Mad {
  String navn;
  int kalorier;

  Mad(String navn, int kalorier) {
    this.navn = navn;
    this.kalorier = kalorier;
  }

  void display(float x, float y) {
    pushStyle();
    fill(255);
    stroke(100);
    strokeWeight(4);
    rect(x, y, 180, 60, 10);

    fill(0);
    textSize(20);
    text(navn, x + 15, y + 25);
    text(kalorier + " kcal", x + 15, y + 48);
    popStyle();
  }
}
