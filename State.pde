class State {
  Adventure adv;
  Cloud cloud;
  Buttons buttons;
  Pantallas pantallas;
  String stateArray [] = { "Empty", "Requested", "Waiting", "Storie", "RequestedNoRender" };
  int lvls = stateArray.length;
  String lvl = stateArray[0];
  String state[] = new String [lvls];
  float posX;
  float posY;
  int sizeX;
  int sizeY;
  int storieScreen;
  float temp;
  float  wind_speed;
  float clouds;
  float humidity;
  String pressure;
  String timezone;
  boolean onButton;
  boolean clicked;
  boolean value = false;
  State(float x, float y, int sizeX, int sizeY, String state) {
    this.posX = x;
    this.posY = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.lvl = state;
    for (int i = 0; i < 2; i++) {
      this.state[i] = this.stateArray[i];
    }
    this.buttons = new Buttons(0, 0, 0, 0, "", false, 0, 0);
    this.pantallas = new Pantallas(0);
  }
  void pressed(char keyPress) {
    ellipse(posX, posY, sizeX/10, sizeY/10);
    if (keyPress == '0') {
      fill(255);
      this.lvl = state[0];
    } else
      if (keyPress == 'd') {
        fill(255);
        this.posX = this.posX+20;
      } else
        if (keyPress == 'a') {
          fill(255);
          this.posX = this.posX-20;
        } else
          if (keyPress == 'w') {
            fill(255);
            this.posY = this.posY-20;
          } else
            if (keyPress == 's') {
              fill(255);
              this.posY = this.posY+20;
            }
  }
  boolean returner = returner(onButton);
  boolean returner(boolean value) {
    if (value) {
    } else {
    }
    return value;
  }
  void update(float x, float y, int sizeX, int sizeY, String state, String stateTo) {
    this.posX = x;
    this.posY = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    if (stateTo == "Storie") {
      this.lvl = "Storie";
    }
    if (stateTo == "Inicio") {
      this.lvl = "Empty";
    }
    if (state == "WannaRequest" && stateTo == "Requested") {
      adv = new Adventure(x, y, sizeX, sizeY);
      cloud = new Cloud(x, y, sizeX, sizeY, this.clouds, this.temp, this.wind_speed, this.humidity, this.pressure, this.timezone);
      this.lvl = "Requested";
    }
  }
  void clouds() {
    switch(this.lvl) {
    case "Empty" :
      background(0);
      fill(255);
      text("¡Hola!", sizeX/4, sizeY/2);
      firstButons();
      break;
    case "Waiting" :
      text("Esperando...", sizeX/4, sizeY/2);
      break;
    case "Storie" :
      this.pantallas.display(this.storieScreen);
      storieButons();
      text(this.storieScreen, width/2, height/2);
      break;
    case "Requested" :
      noStroke();
      this.renderClouds(this.posX, this.posY, this.sizeX, this.sizeY, this.clouds, this.temp, this.wind_speed, this.humidity, this.pressure, this.timezone);
      if (mousePressed) {
        this.update(mouseX, mouseY, width, height, "WannaRequest", "Requested");
      }
      break;
    case "RequestedNoRender" :
      background(0);
      fill(255);
      text("Presiona ' ' para comenzar", sizeX/4, sizeY/2);
      break;
    default :
      text("Waiting...", sizeX/4, sizeY/2);
      break;
    }
  }
  void renderStorie(int screen) {
    pantallas.display(screen);
  }
  void renderClouds(float posX, float posY, int sizeX, int sizeY, float clouds, float temp, float wind_speed, float humidity, String pressure, String timezone) {
    cloud.display(posX, posY, sizeX, sizeY, clouds, temp, wind_speed, humidity, pressure, timezone);
  }
  void firstButons() {
    if (
      mouseX > width/2 -width/3/2 &&
      mouseX < width/2 +width/3/2 && 
      mouseY > height/3-width/10/2 &&
      mouseY < height/3 +width/10/2
      )
    {
      noCursor();
      buttons.dibujarRects(width/2, height/3, width/3, width/10, "Investigar clima", 0, 255);
      if (
        mousePressed &&
        this.lvl == "Empty" ||
        this.lvl == "Requested"
        ) {
        cursor();
        this.update(mouseX, mouseY, width, height, "WannaRequest", "Requested");
      }
    } else {
      cursor();
      buttons.dibujarRects(width/2, height/3, width/3, width/10, "Investigar clima", 255, 0);
    }

    if (
      mouseX > width/2 -width/3/2 &&
      mouseX < width/2 +width/3/2 && 
      mouseY > height/1.5-width/10/2 &&
      mouseY < height/1.5 +width/10/2
      ) 
    {
      noCursor();
      buttons.dibujarRects(width/2, height/1.5, width/3, width/10, "¿Que pasa aquí?", 0, 255);
      if (
        mousePressed &&
        this.lvl == "Empty" ||
        this.lvl == "Requested"
        ) {
        cursor();
        this.update(mouseX, mouseY, width, height, this.lvl, "Storie");
      }
    } else {
      cursor();
      buttons.dibujarRects(width/2, height/1.5, width/3, width/10, "¿Que pasa aquí?", 255, 0);
    }
  }
  void storieButons() {
    if (
      mouseX > width/5 -width/3/2 &&
      mouseX < width/5 +width/3/2 && 
      mouseY > height/1.2-width/10/2 &&
      mouseY < height/1.2 +width/10/2
      )
    {
      noCursor();
      buttons.dibujarRects(width/5, height/1.2, width/3, width/10, "Anterior", 0, 255);
    } else {
      cursor();
      buttons.dibujarRects(width/5, height/1.2, width/3, width/10, "Anterior", 255, 0);
    }
    if (
      mouseX > width/1.3 -width/3/2 &&
      mouseX < width/1.3 +width/3/2 && 
      mouseY > height/1.2-width/10/2 &&
      mouseY < height/1.2 +width/10/2
      ) 
    {
      noCursor();
      buttons.dibujarRects(width/1.3, height/1.2, width/3, width/10, "Siguiente", 0, 255);
    } else {
      cursor();
      buttons.dibujarRects(width/1.3, height/1.2, width/3, width/10, "Siguiente", 255, 0);
    }
  }
  void clicked(boolean added) {
    if (added) {
      storieScreen++;
    } else {
      storieScreen--;
    }
    if(storieScreen <= 0){
      storieScreen = 0;
    }else if(storieScreen >= 5){
      storieScreen = 5;
    }
  }
}
