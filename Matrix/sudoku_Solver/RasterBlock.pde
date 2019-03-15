class RasterBlock {
  int size = 50;
  int x;
  int y;
  int indexX;
  int indexY;
  int writePos;
  int num = 0;
  String input = "0";
  boolean current = false;
  boolean inputTimeOut = false;
  boolean writeMode = true;
  RasterBlock(int x, int y) {
    this.x = x * size+10;
    this.y = y * size+10;
    this.indexX = x;
    this.indexY = y;
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
      num = Integer.parseInt(input);
      if(!containsNum(this.num,rows.get(this.indexY))){
        rows.get(this.indexY)[this.indexX] = this.num;
      }
      if(!containsNum(this.num,cols.get(this.indexX))){
        cols.get(this.indexX)[this.indexY] = this.num;
      }
      
      if(indexX < 3 && indexY < 3){
        if(!containsNum(this.num,quads.get(0))){
          quads.get(0)[this.indexX+this.indexY*3] = this.num; 
        }
      }
      if(indexX > 2 && indexX < 6 && indexY < 3){
        if(!containsNum(this.num,quads.get(1))){
          quads.get(1)[this.indexX-3+this.indexY*3] = this.num; 
        }
      }
      if(indexX > 5 && indexY < 3){
        if(!containsNum(this.num,quads.get(2))){
          quads.get(2)[this.indexX-6+this.indexY*3] = this.num; 
        }
      }
      if(indexX < 3 && indexY > 2 && indexY < 6){
        if(!containsNum(this.num,quads.get(3))){
          quads.get(3)[this.indexX+(this.indexY-3)*3] = this.num; 
        }
      }
      if(indexX > 2 && indexX < 6 && indexY > 2 && indexY < 6){
        if(!containsNum(this.num,quads.get(4))){
          quads.get(4)[this.indexX-3+(this.indexY-3)*3] = this.num; 
        }
      }
      if(indexX > 5 && indexY > 2 && indexY < 6){
        if(!containsNum(this.num,quads.get(5))){
          quads.get(5)[this.indexX-6+(this.indexY-3)*3] = this.num; 
        }
      }
      if(indexX < 3 && indexY > 5){
        if(!containsNum(this.num,quads.get(6))){
          quads.get(6)[this.indexX+(this.indexY-6)*3] = this.num; 
        }
      }
      if(indexX > 2 && indexX < 6 && indexX <= 6 && indexY > 5){
        if(!containsNum(this.num,quads.get(7))){
          quads.get(7)[this.indexX-3+(this.indexY-6)*3] = this.num; 
        }
      }
      if(indexX > 5 && indexY > 5){
        if(!containsNum(this.num,quads.get(8))){
          quads.get(8)[this.indexX-6+(this.indexY-6)*3] = this.num; 
        }
      }
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
        num = Integer.parseInt(input);
        this.current = false;
        
      }
    }
    if (!keyPressed && current && inputTimeOut) {
      inputTimeOut = false;
    }
  }
  
  boolean containsNum(int num ,int[] a){
    for(int b : a){
      if(b == num){
        return true; 
      }
    }
    return false;
  }
}
