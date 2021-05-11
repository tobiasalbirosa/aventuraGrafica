class Pantallas {
  int screen;
  Pantallas(int screen) {
    this.screen = screen;
  }

  void display(int screen) {
  if(screen % 2 == 0){
    background(0);
  }else{
    background(255);
  }
  }
}
