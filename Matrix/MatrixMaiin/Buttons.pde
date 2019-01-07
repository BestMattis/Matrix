class Buttons {
  int posX;
  int posY;
  int sizeOperation = 50;
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
    if(this.name.contains("operation")){
      pushMatrix();
      stroke(255);
      noFill();
      textAlign(CENTER);
      if(this.name.contains("Add")){
        text("A + B", this.posX+sizeOperation/2+1, (this.posY+sizeOperation/2)+5);
      } else if(this.name.contains("Sub")){
        text("A - B", this.posX+sizeOperation/2+1, (this.posY+sizeOperation/2)+5);
      } else if(this.name.contains("Mult")){
        text("A * B", this.posX+sizeOperation/2+1, (this.posY+sizeOperation/2)+5);
      } else if(this.name.contains("Det")){
        text("Det A", this.posX+sizeOperation/2+1, (this.posY+sizeOperation/2)+5);
      } else if(this.name.contains("Switch")){
        text("  A <-> B", this.posX+sizeOperation/2+1, (this.posY+sizeOperation/2)+5);
      }
      rect(posX,posY,sizeOperation,sizeOperation);
      popMatrix();
    }
    if (this.name.contains("matrix")) {
      pushMatrix();
      stroke(255);
      noFill();
      if (this.name.contains("1")) {
        if (this.name.contains("Rows")) {
          rect(posX, posY+matrix1[0].length*50, sizeBox, sizeBox);
          line(posX+2, posY+sizeBox/2+matrix1[0].length*50, posX+sizeBox-2, posY+sizeBox/2+matrix1[0].length*50);
          if (name.contains("Increase")) {  
            line(posX+sizeBox/2, posY+2+matrix1[0].length*50, posX+sizeBox/2, posY+sizeBox-2+matrix1[0].length*50);
          }
        } else if (this.name.contains("Cols")) {
          rect(posX+matrix1.length*50, posY, sizeBox, sizeBox);
          line(posX+2+matrix1.length*50, posY+sizeBox/2, posX+sizeBox-2+matrix1.length*50, posY+sizeBox/2);
          if (name.contains("Increase")) {  
            line(posX+sizeBox/2+matrix1.length*50, posY+2, posX+sizeBox/2+matrix1.length*50, posY+sizeBox-2);
          }
        }
      } else if (this.name.contains("2")) {
        if (this.name.contains("Rows")) {
          rect(posX, posY+matrix2[0].length*50, sizeBox, sizeBox);
          line(posX+2, posY+sizeBox/2+matrix2[0].length*50, posX+sizeBox-2, posY+sizeBox/2+matrix2[0].length*50);
          if (name.contains("Increase")) {  
            line(posX+sizeBox/2, posY+2+matrix2[0].length*50, posX+sizeBox/2, posY+sizeBox-2+matrix2[0].length*50);
          }
        } else if (this.name.contains("Cols")) {
          rect(posX+matrix2.length*50, posY, sizeBox, sizeBox);
          line(posX+2+matrix2.length*50, posY+sizeBox/2, posX+sizeBox-2+matrix2.length*50, posY+sizeBox/2);
          if (name.contains("Increase")) {  
            line(posX+sizeBox/2+matrix2.length*50, posY+2, posX+sizeBox/2+matrix2.length*50, posY+sizeBox-2);
          }
        }
      }
      popMatrix();
    }
  }

  void update() {
    if(mousePressed && mouseButton == LEFT && this.posY + sizeOperation > mouseY && this.posY < mouseY && this.posX+sizeOperation > mouseX && this.posX < mouseX){
      if(this.name.contains("Switch")){
        if(!clickTimeOut){
          switchMatrix(); 
        }
        clickTimeOut = true;
      }
    }
    if (!mousePressed) {
      clickTimeOut = false;
    }
    if ((mouseX > posX && mouseX < posX + sizeBox && mouseY > posY+matrix1[0].length*50 && mouseY < posY+sizeBox+matrix1[0].length*50 && mousePressed && this.name.contains("matrix1RowsIncrease"))||
      (mouseX > posX && mouseX < posX + sizeBox && mouseY > posY+matrix1[0].length*50 && mouseY < posY+sizeBox+matrix1[0].length*50 && mousePressed && this.name.contains("matrix1RowsDecrease"))||
      (mouseX > posX+matrix1.length*50 && mouseX < posX + sizeBox +matrix1.length*50 && mouseY > posY && mouseY < posY+sizeBox && mousePressed && this.name.contains("matrix1ColsIncrease"))|| 
      (mouseX > posX+matrix1.length*50 && mouseX < posX + sizeBox +matrix1.length*50 && mouseY > posY && mouseY < posY+sizeBox && mousePressed && this.name.contains("matrix1ColsDecrease"))|| 
      (mouseX > posX && mouseX < posX + sizeBox && mouseY > posY +matrix2[0].length*50 && mouseY < posY+sizeBox +matrix2[0].length*50 && mousePressed && this.name.contains("matrix2RowsIncrease"))||
      (mouseX > posX && mouseX < posX + sizeBox && mouseY > posY +matrix2[0].length*50 && mouseY < posY+sizeBox +matrix2[0].length*50 && mousePressed && this.name.contains("matrix2RowsDecrease"))||
      (mouseX > posX+matrix2.length*50 && mouseX < posX + sizeBox +matrix2.length*50 && mouseY > posY && mouseY < posY+sizeBox && mousePressed && this.name.contains("matrix2ColsIncrease"))||
      (mouseX > posX+matrix2.length*50 && mouseX < posX + sizeBox +matrix2.length*50 && mouseY > posY && mouseY < posY+sizeBox && mousePressed && this.name.contains("matrix2ColsDecrease"))) {
      if (this.name.contains("matrix1")) {
        if (this.name.contains("Increase")) {
          if (this.name.contains("Cols")) {
            if (!clickTimeOut) {
              matrix2Offset += 50;
              safeMatrix(1);
              matrix1 = new MatrixBlock[matrix1.length+1][matrix1[0].length];
              setMatrixFromBuffer(1);
              for(int i = 0;  i < matrix2[0].length;i++){
                for(int h = 0; h < matrix2.length; h++){
                   matrix2[h][i].x += 50;   
                }
              }
              for(Buttons button : incDec){
                if(button.name.contains("2")){
                  button.posX += 50;
                }
              }
            }
            clickTimeOut = true;
          } else if ( this.name.contains("Row")) {
            if (!clickTimeOut) {
              safeMatrix(1);
              matrix1 = new MatrixBlock[matrix1.length][matrix1[0].length+1];
              setMatrixFromBuffer(1);
            }
            clickTimeOut = true;
          }
        } else if (this.name.contains("Decrease")) {
          if (this.name.contains("Cols")) {
            if (!clickTimeOut) {
              matrix2Offset -= 50;
              safeMatrix(1);
              matrix1 = new MatrixBlock[matrix1.length-1][matrix1[0].length];
              setMatrixFromBuffer(1);
              for(int i = 0;  i < matrix2[0].length;i++){
                for(int h = 0; h < matrix2.length; h++){
                   matrix2[h][i].x -= 50;   
                }
              }
              for(Buttons button : incDec){
                if(button.name.contains("2")){
                  button.posX -= 50;
                }
              }
            }
            clickTimeOut = true;
          } else if ( this.name.contains("Row")) {
            if (!clickTimeOut) {
              safeMatrix(1);
              matrix1 = new MatrixBlock[matrix1.length][matrix1[0].length-1];
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
              matrix2 = new MatrixBlock[matrix2.length+1][matrix2[0].length];
              setMatrixFromBuffer(2);
            }
            clickTimeOut = true;
          } else if ( this.name.contains("Row")) {
            if (!clickTimeOut) {
              safeMatrix(2);
              matrix2 = new MatrixBlock[matrix2.length][matrix2[0].length+1];
              setMatrixFromBuffer(2);
            }
            clickTimeOut = true;
          }
        } else if (this.name.contains("Decrease")) {
          if (this.name.contains("Cols")) {
            if (!clickTimeOut) {
              safeMatrix(2);
              matrix2 = new MatrixBlock[matrix2.length-1][matrix2[0].length];
              setMatrixFromBuffer(2);
            }
            clickTimeOut = true;
          } else if ( this.name.contains("Row")) {
            if (!clickTimeOut) {
              safeMatrix(2);
              matrix2 = new MatrixBlock[matrix2.length][matrix2[0].length-1];
              setMatrixFromBuffer(2);
            }
            clickTimeOut = true;
          }
        }
      }
    }
  }
}
