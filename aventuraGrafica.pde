State state;
void setup() {
  state = new State(0, 0, width, height, "Empty");
  frameRate(12);
  ellipseMode(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  colorMode(HSB);
  size(579, 290);
  noStroke();
  smooth();
  state.update(mouseX, mouseY, width, height,
  state.lvl, "RequestedNoRender");
  background(0);
  frameRate(12);
}
void draw() {
  state.clouds();
}
void keyPressed() {
  if (key == ' ') {
    state.update(mouseX, mouseY, width, height, "Empty", "Inicio");
  }
}
void mouseClicked() {
  if (state.lvl == "Storie") {
      if (
      mouseX > width/5 -width/3/2 &&
      mouseX < width/5 +width/3/2 && 
      mouseY > height/1.2-width/10/2 &&
      mouseY < height/1.2 +width/10/2
      )
    {
      state.clicked(false);
    }
        if (
      mouseX > width/1.3 -width/3/2 &&
      mouseX < width/1.3 +width/3/2 && 
      mouseY > height/1.2-width/10/2 &&
      mouseY < height/1.2 +width/10/2
      ) 
    {
      state.clicked(true);
    }
  }
}
