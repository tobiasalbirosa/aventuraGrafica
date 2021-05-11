class Buttons {
  float x;
  float y;
  float tamX;
  float tamY;
  color textColor;
  color colorDeFondo;
  String contenido;
  boolean circle;
  Buttons(float x, float y, float tamX, float tamY, String contenido, boolean circle, color colorDeFondo, color textColor) {
    this.x = x;
    this.y = y;
    this.tamX = tamX;
    this.tamY = tamY;
    this.contenido = contenido;
    this.circle = circle;
    this.colorDeFondo = colorDeFondo;
    this.textColor = textColor;
    if (circle) {
      dibujarCirculos(x, y, tamX, tamY, contenido);
    } else {
      dibujarRects(x, y, tamX, tamY, contenido, colorDeFondo, textColor);
    }
  }
  void dibujarCirculos(float x, float y, float tamX, float tamY, String contenido) {
    fill(0, 255, 0);
    ellipse(x, y, tamX, tamY);
    fill(255);
    text(contenido, x, y);
  }
  void dibujarRects(float x, float y, float tamX, float tamY, String contenido, color colorDeFondo, color textColor) {
    fill(colorDeFondo);
    strokeWeight(6);
    stroke(textColor);
    rect(x, y, tamX, tamY);
    fill(textColor);
    text(contenido, x-tamX/4, y);
  }
}
