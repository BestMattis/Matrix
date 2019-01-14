class MatrixBlock {
  int size = 50;
  int x;
  int y;
  int writePos;
  double num = 0;
  String input = "0";
  boolean current = false;
  boolean inputTimeOut = false;
  boolean writeMode = true;
  MatrixBlock(int x, int y) {
    this.x = x * size+10;
    this.y = y * size+10;
  }
  public int getSisze() {
    return size;
  }

  void show() {
    stroke(255);
    noFill();
    textAlign(CENTER);
    textSize(11);
    text(input, this.x+size/2+1, (this.y+size/2)+5);
    rect(this.x, this.y, size, size);
  }

  void update() {
    if (mousePressed && mouseButton == LEFT && this.x < mouseX && this.x +size > mouseX && this.y < mouseY && this.y +size > mouseY ) {
      if (this.input.length() == 1 && this.input.contains("0")) {
        this.input = "";
      }
      this.current = true;
    }
    if (mousePressed && mouseButton == LEFT && !(this.x < mouseX && this.x +size > mouseX && this.y < mouseY && this.y +size > mouseY)) {
      if (this.input.contains("|")) {
        this.input = this.input.replace("|", "");
      }
      if (this.input.length() == 0) {
        input = "0";
      }
      num = Double.parseDouble(input);
      this.current = false;
    }
    if (keyPressed && current && !inputTimeOut) {
      switch(key) {
      case '1': 
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "1" + this.input.substring(writePos, this.input.length());
        if (writeMode) {
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      case '2':
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "2" + this.input.substring(writePos, this.input.length());
        if (writeMode) {  
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      case '3':
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "3" + this.input.substring(writePos, this.input.length());
        if (writeMode) {
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      case '4':
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "4" + this.input.substring(writePos, this.input.length());
        if (writeMode) {
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      case '5':
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "5" + this.input.substring(writePos, this.input.length());
        if (writeMode) {
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      case '6':
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "6" + this.input.substring(writePos, this.input.length());
        if (writeMode) {
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      case '7':
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "7" + this.input.substring(writePos, this.input.length());
        if (writeMode) {
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      case '8':
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "8" + this.input.substring(writePos, this.input.length());
        if (writeMode) {
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      case '9':
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "9" + this.input.substring(writePos, this.input.length());
        if (writeMode) {
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      case '0':
        inputTimeOut = true;
        this.input = this.input.substring(0, writePos)+ "0" + this.input.substring(writePos, this.input.length());
        if (writeMode) {
          this.writePos = this.input.length();
        } else {
          writePos++;
        }
        break;
      }
      if (key == CODED) {
        if (keyCode == LEFT) {  
          writeMode = false;
          if (this.input.length() > 0 && this.writePos > 0) {
            inputTimeOut = true;
            this.writePos--;
            if (this.input.contains("|")) {
              this.input = this.input.replace("|", "");
              if (this.writePos > 0) {
                this.input = input.substring(0, this.writePos)+"|"+this.input.substring(this.writePos, this.input.length());
              } else if (writePos <= 0) {
                this.input = "|"+this.input.substring(0, this.input.length());
              }
            } else {
              this.input = this.input.substring(0, this.writePos)+"|"+this.input.substring(this.writePos, this.input.length());
            }
          }
        }
      }
      if (key == CODED) {
        if (keyCode == RIGHT) {  
          writeMode = false;
          if (this.input.length() > 0 && this.writePos < this.input.length()) {
            inputTimeOut = true;
            this.writePos++;
            if (this.input.contains("|")) {
              this.input = this.input.replace("|", "");
              if (this.writePos < this.input.length()) {
                this.input = input.substring(0, this.writePos)+"|"+this.input.substring(this.writePos, this.input.length());
              } else if (this.writePos >= this.input.length()) {
                this.input = input.substring(0, this.input.length())+"|";
                this.writePos = this.input.length()-1;
              }
            } else {
              this.input = this.input.substring(0, this.writePos)+"|"+this.input.substring(this.writePos, this.input.length());
            }
          }
        }
      }
      if (key == BACKSPACE) {
        if (input.length() > 0) {
          inputTimeOut = true;
          if (this.writePos > 0 && this.writePos <= this.input.length()) {
            this.input = this.input.substring(0, this.writePos-1)+this.input.substring(writePos, this.input.length());
            writePos--;
          }
        }
      }
      if (key == ENTER) {
        if (this.input.contains("|")) {
          this.input = this.input.replace("|", "");
        }
        if (this.input.length() == 0) {
          input = "0";
        }
        num = Double.parseDouble(input);
        this.current = false;
      }
    }
    if (!keyPressed && current && inputTimeOut) {
      inputTimeOut = false;
    }
  }
}
