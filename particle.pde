class Partikel {
  float x;
  float y;
  float fartX;
  float fartY;
  float levetid;

  Partikel(float startX, float startY) {
    x = startX;
    y = startY;
    fartX = random(-4, 4);
    fartY = random(-4, 1);
    levetid = 1;
  }

  void opdater() {
    x += fartX;
    y += fartY;
    fartY += 0.25;
    levetid -= 0.06;
  }

  void display() {
    pushStyle();
    noStroke();
    fill(100, 60, 25, levetid * 255);
    float stoerrelse = 1 + levetid * 5;
    ellipse(x, y, stoerrelse, stoerrelse);
    popStyle();
  }

  boolean erFaerdig() {
    return levetid <= 0;
  }
}
