int rows1 = 4;
int cols1 = 4;
int rows2 = 4;
int cols2 = 4;
static boolean stop = false;
boolean visible = false;
boolean clickTimeOut = false;
MatrixBlock[][] matrix1 = new MatrixBlock[rows1][cols1];
MatrixBlock[][] matrix2 = new MatrixBlock[rows2][cols2];
MatrixBlock[][] bufferMatrix = new MatrixBlock[rows1][cols1];
MatrixBlock[][] resultMatrix = new MatrixBlock[rows2][cols2];
Buttons operationUI;
Buttons matrix1RowsIncrease = new Buttons(10, 20, "matrix1RowsIncrease");
Buttons matrix1ColsIncrease = new Buttons(20, 10, "matrix1ColsIncrease");

Buttons matrix1RowsDecrease = new Buttons(30, 20, "matrix1RowsDecrease");
Buttons matrix1ColsDecrease = new Buttons(40, 10, "matrix1ColsDecrease");

Buttons matrix2RowsIncrease = new Buttons(310, 20, "matrix2RowsIncrease");
Buttons matrix2RowsDecrease = new Buttons(330, 20, "matrix2RowsDecrease");

Buttons matrix2ColsIncrease = new Buttons(320, 10, "matrix2ColsIncrease");
Buttons matrix2ColsDecrease = new Buttons(340, 10, "matrix2ColsDecrease");
ArrayList<Buttons> operations = new ArrayList<Buttons>(); 
ArrayList<Buttons> incDec = new ArrayList<Buttons>();
void setup() {
  size(900, 500);
  incDec.add(matrix1RowsIncrease);
  incDec.add(matrix1ColsIncrease);
  incDec.add(matrix1RowsDecrease);
  incDec.add(matrix1ColsDecrease);
  incDec.add(matrix2RowsIncrease);
  incDec.add(matrix2RowsDecrease);
  incDec.add(matrix2ColsIncrease);
  incDec.add(matrix2ColsDecrease);
  operationUI = new Buttons(260, 110, "opreations");
  for (int i = 0; i < cols1; i++) {
    for (int h = 0; h < rows1; h++) {
      matrix1[h][i] = new MatrixBlock(h, i);
    }
  }
  for (int i = 0; i < cols2; i++) {
    for (int h = rows2+2; h < rows2*2+2; h++) {
      matrix2[h-cols2-2][i] = new MatrixBlock(h, i);
    }
  }
  for (int i = 0; i < cols2; i++) {
    for (int h = rows2*2+4; h < rows2*3+4; h++) {
      resultMatrix[h-(2*cols2)-4][i] = new MatrixBlock(h, i);
    }
  }
}
void draw() {
  background(0);
  operationUI.show();
  for (Buttons button : incDec) {
    button.show();
    button.update();
  }
  for (int i = 0; i < cols1; i++) {
    for (int h = 0; h < rows1; h++) {
      matrix1[h][i].show();
      matrix1[h][i].update();
    }
  }
  for (int i = 0; i < cols2; i++) {
    for (int h = 0; h < rows2; h++) {
      matrix2[h][i].show();
      matrix2[h][i].update();
    }
  }
}
void mouseClicked() {
  if (dist(mouseX, mouseY, operationUI.getPos().x, operationUI.getPos().y) < operationUI.getRad()) {
    visible = true;
  }
}

void safeMatrix(int index) {
  if (index == 1) {
    bufferMatrix = matrix1;
  } else if (index == 2) {
    bufferMatrix = matrix2;
  }
}
void setMatrixFromBuffer(int index) {
  if (index == 1) {
    for (int i = 0; i < cols1; i++) {
      for (int h = 0; h < rows1; h++) {
        matrix1[h][i] = new MatrixBlock(h, i);
      }
    }
    for (int i = 0; i < cols1; i++) {
      for (int h = 0; h < rows1; h++) {
        if (bufferMatrix.length <= h || bufferMatrix[0].length <= i) {
          matrix1[h][i] = new MatrixBlock(h, i);
        } else {
          matrix1[h][i].num = bufferMatrix[h][i].num; 
          matrix1[h][i].input = Integer.toString((int)bufferMatrix[h][i].num);
        }
      }
    }
    bufferMatrix = new MatrixBlock[rows1][cols1];
  } else if (index == 2) {
    for (int i = 0; i < cols2; i++) {
      for (int h = 0; h < rows2; h++) {
        matrix2[h][i] = new MatrixBlock(h, i);
      }
    }
    for (int i = 0; i < cols2; i++) {
      for (int h = 0; h < rows2; h++) {
        if (bufferMatrix.length <= h || bufferMatrix[0].length <= i) {
          matrix2[h][i] = new MatrixBlock(h+6, i);
        } else {
          matrix2[h][i].num = bufferMatrix[h][i].num; 
          matrix2[h][i].x = bufferMatrix[h][i].x;
          matrix2[h][i].y = bufferMatrix[h][i].y;
          matrix2[h][i].input = Integer.toString((int)bufferMatrix[h][i].num);
        }
      }
    }
    bufferMatrix = new MatrixBlock[rows2][cols2];
  }
}