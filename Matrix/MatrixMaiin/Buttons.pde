class Buttons {
  int posX;
  int posY;
  int sizeIN = 35;
  int sizeBox = 16;
  int rad = sizeIN/2;
  String name;
  PVector pos;
  Buttons(int x, int y, String boxName) {
    posX = x;
    posY = y;
    name = boxName;
    pos = new PVector(posX, posY);
  }
  public PVector getPos() {
    return pos;
  }
  public int getRad() {
    return rad;
  }
  void show() {
    if (name.contains("matrix")) {
      pushMatrix();
      stroke(255);
      noFill();
      if (this.name.contains("1")) {
        if (this.name.contains("Rows")) {
          rect(posX, posY+cols1*50, sizeBox, sizeBox);
          line(posX+2, posY+sizeBox/2+cols1*50, posX+sizeBox-2, posY+sizeBox/2+cols1*50);
          if (name.contains("Increase")) {  
            line(posX+sizeBox/2, posY+2+cols1*50, posX+sizeBox/2, posY+sizeBox-2+cols1*50);
          }
        } else if (this.name.contains("Cols")) {
          rect(posX+rows1*50, posY, sizeBox, sizeBox);
          line(posX+2+rows1*50, posY+sizeBox/2, posX+sizeBox-2+rows1*50, posY+sizeBox/2);
          if (name.contains("Increase")) {  
            line(posX+sizeBox/2+rows1*50, posY+2, posX+sizeBox/2+rows1*50, posY+sizeBox-2);
          }
        }
      } else if (this.name.contains("2")) {
        if (this.name.contains("Rows")) {
          rect(posX, posY+cols2*50, sizeBox, sizeBox);
          line(posX+2, posY+sizeBox/2+cols2*50, posX+sizeBox-2, posY+sizeBox/2+cols2*50);
          if (name.contains("Increase")) {  
            line(posX+sizeBox/2, posY+2+cols2*50, posX+sizeBox/2, posY+sizeBox-2+cols2*50);
          }
        } else if (this.name.contains("Cols")) {
          rect(posX+rows2*50, posY, sizeBox, sizeBox);
          line(posX+2+rows2*50, posY+sizeBox/2, posX+sizeBox-2+rows2*50, posY+sizeBox/2);
          if (name.contains("Increase")) {  
            line(posX+sizeBox/2+rows2*50, posY+2, posX+sizeBox/2+rows2*50, posY+sizeBox-2);
          }
        }
      }
      popMatrix();
    }
  }

  void update() {
    if (!mousePressed) {
      clickTimeOut = false;
    }
    if ((mouseX > posX && mouseX < posX + sizeBox && mouseY > posY+cols1*50 && mouseY < posY+sizeBox+cols1*50 && mousePressed && this.name.contains("matrix1RowsIncrease"))||
      (mouseX > posX && mouseX < posX + sizeBox && mouseY > posY+cols1*50 && mouseY < posY+sizeBox+cols1*50 && mousePressed && this.name.contains("matrix1RowsDecrease"))||
      (mouseX > posX+rows1*50 && mouseX < posX + sizeBox +rows1*50 && mouseY > posY && mouseY < posY+sizeBox && mousePressed && this.name.contains("matrix1ColsIncrease"))|| 
      (mouseX > posX+rows1*50 && mouseX < posX + sizeBox +rows1*50 && mouseY > posY && mouseY < posY+sizeBox && mousePressed && this.name.contains("matrix1ColsDecrease"))|| 
      (mouseX > posX && mouseX < posX + sizeBox && mouseY > posY +cols2*50 && mouseY < posY+sizeBox +cols2*50 && mousePressed && this.name.contains("matrix2RowsIncrease"))||
      (mouseX > posX && mouseX < posX + sizeBox && mouseY > posY +cols2*50 && mouseY < posY+sizeBox +cols2*50 && mousePressed && this.name.contains("matrix2RowsDecrease"))||
      (mouseX > posX+rows2*50 && mouseX < posX + sizeBox +rows2*50 && mouseY > posY && mouseY < posY+sizeBox && mousePressed && this.name.contains("matrix2ColsIncrease"))||
      (mouseX > posX+rows2*50 && mouseX < posX + sizeBox +rows2*50 && mouseY > posY && mouseY < posY+sizeBox && mousePressed && this.name.contains("matrix2ColsDecrease"))) {
      if (this.name.contains("matrix1")) {
        if (this.name.contains("Increase")) {
          if (this.name.contains("Cols")) {
            if (!clickTimeOut) {
              safeMatrix(1);
              rows1++;
              matrix1 = new MatrixBlock[rows1][cols1];
              setMatrixFromBuffer(1);
            }
            clickTimeOut = true;
          } else if ( this.name.contains("Row")) {
            if (!clickTimeOut) {
              safeMatrix(1);
              cols1++;
              matrix1 = new MatrixBlock[rows1][cols1];
              setMatrixFromBuffer(1);
            }
            clickTimeOut = true;
          }
        } else if (this.name.contains("Decrease")) {
          if (this.name.contains("Cols")) {
            if (!clickTimeOut) {
              safeMatrix(1);
              rows1--;
              matrix1 = new MatrixBlock[rows1][cols1];
              setMatrixFromBuffer(1);
            }
            clickTimeOut = true;
          } else if ( this.name.contains("Row")) {
            if (!clickTimeOut) {
              safeMatrix(1);
              cols1--;
              matrix1 = new MatrixBlock[rows1][cols1];
              setMatrixFromBuffer(1);
            }
            clickTimeOut = true;
          }
        }
      } else if (this.name.contains("matrix2")) {
        if (this.name.contains("Increase")) {
          if (this.name.contains("Cols")) {
            if (!clickTimeOut) {
              safeMatrix(2);
              rows2++;
              matrix2 = new MatrixBlock[rows2][cols2];
              setMatrixFromBuffer(2);
            }
            clickTimeOut = true;
          } else if ( this.name.contains("Row")) {
            if (!clickTimeOut) {
              safeMatrix(2);
              cols2++;
              matrix2 = new MatrixBlock[rows2][cols2];
              setMatrixFromBuffer(2);
            }
            clickTimeOut = true;
          }
        } else if (this.name.contains("Decrease")) {
          if (this.name.contains("Cols")) {
            if (!clickTimeOut) {
              safeMatrix(2);
              rows2--;
              matrix2 = new MatrixBlock[rows2][cols2];
              setMatrixFromBuffer(2);
            }
            clickTimeOut = true;
          } else if ( this.name.contains("Row")) {
            if (!clickTimeOut) {
              safeMatrix(2);
              cols2--;
              matrix2 = new MatrixBlock[rows2][cols2];
              setMatrixFromBuffer(2);
            }
            clickTimeOut = true;
          }
        }
      }
    }
  }
}
