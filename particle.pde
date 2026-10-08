// Samme partikelklasse bruges til mad, ild og blod.
Partikel[] eksplosion = new Partikel[180];

void startEksplosion() {
  for (int i = 0; i < eksplosion.length; i++) {
    eksplosion[i] = new Partikel(400, 320);
    eksplosion[i].fartX = random(-7, 7);
    eksplosion[i].fartY = random(-7, 7);
    eksplosion[i].tyngdekraft = 0.05;
    eksplosion[i].fade = 0.012;

    if (i < 100) {
      eksplosion[i].farve = color(255, random(100, 200), 0);
    } else {
      eksplosion[i].farve = color(200, 0, 0);
      eksplosion[i].fade = 0;
      eksplosion[i].landet = true;
      // Halvdelen af pletterne kommer på gulvet, resten på væggene.
      if (random(1) < 0.5) {
        eksplosion[i].x = random(150, 650);
        eksplosion[i].y = random(425, 580);
      } else {
        if (random(1) < 0.5) {
          eksplosion[i].x = random(25, 105);
        } else {
          eksplosion[i].x = random(695, 775);
        }
        eksplosion[i].y = random(90, 400);
      }
    }
  }
}

void tegnEksplosion() {
  for (int i = 0; i < eksplosion.length; i++) {
    if (eksplosion[i] != null && !eksplosion[i].erFaerdig()) {
      eksplosion[i].opdater();
      eksplosion[i].display();
    }
  }
}
class Partikel {
  float x;
  float y;
  float fartX;
  float fartY;
  float levetid;
  color farve = color(100, 60, 25);
  float tyngdekraft = 0.25;
  float fade = 0.06;
  boolean landet = false;
  float pletStoerrelse = random(12, 28);

  Partikel(float startX, float startY) {
    x = startX;
    y = startY;
    fartX = random(-4, 4);
    fartY = random(-4, 1);
    levetid = 1;
  }

  void opdater() {
    // Blodet stopper og bliver siddende på skærmen.
    if (landet) return;
    x += fartX;
    y += fartY;
    fartY += tyngdekraft;
    levetid -= fade;
  }

  void display() {
    pushStyle();
    noStroke();
    fill(farve, levetid * 255);
    if (landet) {
      // Flere overlappende ovaler giver en ujævn, flad blodplet.
      ellipse(x, y, pletStoerrelse, pletStoerrelse * 0.6);
      ellipse(x - 6, y - 3, pletStoerrelse * 0.6, pletStoerrelse * 0.5);
      ellipse(x + 5, y + 4, pletStoerrelse * 0.7, pletStoerrelse * 0.4);
      ellipse(x + 12, y - 8, 4, 3);
      ellipse(x - 15, y + 6, 3, 3);
    } else {
      float stoerrelse = 1 + levetid * 5;
      ellipse(x, y, stoerrelse, stoerrelse);
    }
    popStyle();
  }

  boolean erFaerdig() {
    return levetid <= 0;
  }
}
