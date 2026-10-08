void tegnMadskaal() {
  pushStyle();
  noStroke();

  // Skygge under skålen.
  fill(0, 0, 0, 45);
  ellipse(710, 579, 145, 24);

  // Rund blå skål med en mørkere bund.
  fill(25, 75, 140);
  ellipse(710, 567, 126, 36);
  fill(45, 120, 205);
  rect(647, 535, 126, 30);
  ellipse(710, 562, 126, 32);

  // Lys kant og mørkt indre.
  fill(130, 200, 250);
  ellipse(710, 535, 132, 44);
  fill(20, 65, 120);
  ellipse(710, 535, 114, 31);
  fill(85, 50, 25);
  ellipse(710, 535, 100, 23);

  // Foder i tre rækker. Faste placeringer, så det ikke flimrer.
  for (int x = 680; x <= 740; x += 15) {
    fill(160, 105, 50);
    ellipse(x, 529, 10, 7);
    ellipse(x - 5, 536, 10, 7);
    ellipse(x, 542, 9, 6);
  }

  // Glans på forsiden og kæledyrets navn.
  fill(100, 175, 235);
  rect(655, 551, 7, 15, 4);
  fill(255);
  textAlign(CENTER);
  textSize(16);
  text("MADS", 710, 570);
  popStyle();
}
