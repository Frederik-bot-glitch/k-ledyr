void tegnBaggrund() {
  pushStyle();
  noStroke();
  background(245, 235, 215);

  // Sidevægge og bagvæg.
  fill(230, 215, 190);
  rect(130, 70, 540, 330);
  fill(240, 90, 90);
  quad(0, 0, 130, 70, 130, 400, 0, 600);
  fill(240, 90, 90);
  quad(670, 70, 800, 0, 800, 600, 670, 400);

  // Gulv med fliser.
  fill(210, 200, 180);
  quad(130, 400, 670, 400, 800, 600, 0, 600);
  stroke(175, 165, 145);
  for (int y = 440; y < 600; y += 40) {
    // Gulvet bliver bredere frem mod bunden af skærmen.
    float kant = 130 * (600 - y) / 200.0;
    line(kant, y, 800 - kant, y);
  }
  for (int x = 0; x <= 800; x += 100) {
    line(400 + (x - 400) * 0.675, 400, x, 600);
  }
  noStroke();

  // Restaurantens røde skilt og gule M.
  fill(195, 30, 40);
  rect(270, 75, 260, 90, 12);
  fill(255, 200, 35);
  textAlign(CENTER);
  textSize(65);
  text("M", 400, 137);
  fill(255);
  textSize(14);
  text("McDonald's", 400, 157);

  // To menuskilte bag kæledyret.
  fill(40, 40, 40);
  rect(150, 180, 140, 100, 8);
  rect(510, 180, 140, 100, 8);
  fill(255, 205, 50);
  textSize(18);
  text("BURGER", 220, 207);
  text("POMFRITTER", 580, 207);

  // En burger på menuskiltet.
  fill(230, 165, 65);
  ellipse(220, 235, 65, 25);
  rect(188, 250, 64, 12, 5);
  fill(80, 45, 25);
  rect(188, 238, 64, 10, 4);
  fill(90, 170, 55);
  rect(188, 247, 64, 4);

  // Pomfritter i en rød æske.
  fill(255, 200, 50);
  for (int x = 559; x <= 595; x += 9) {
    rect(x, 220, 6, 35, 2);
  }
  fill(200, 35, 40);
  quad(550, 238, 610, 238, 603, 268, 557, 268);

  // Bestillingsdisk.
  fill(135, 85, 55);
  rect(145, 320, 510, 80);
  fill(65, 55, 50);
  rect(135, 310, 530, 14, 4);
  fill(255, 200, 50);
  rect(145, 335, 510, 5);

  // Lys bag statusoplysningerne, så de er nemme at læse.
  fill(255, 245, 225, 235);
  rect(35, 75, 235, 105, 10);
  popStyle();
}
