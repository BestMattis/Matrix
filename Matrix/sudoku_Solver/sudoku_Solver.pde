RasterBlock[][] raster;
ArrayList<int[]> rows = new ArrayList<int[]>();
ArrayList<int[]> cols = new ArrayList<int[]>();
ArrayList<int[]> quads = new ArrayList<int[]>();
int[] row1 = new int[9];
int[] row2 = new int[9];
int[] row3 = new int[9];
int[] row4 = new int[9];
int[] row5 = new int[9];
int[] row6 = new int[9];
int[] row7 = new int[9];
int[] row8 = new int[9];
int[] row9 = new int[9];

int[] col1 = new int[9];
int[] col2 = new int[9];
int[] col3 = new int[9];
int[] col4 = new int[9];
int[] col5 = new int[9];
int[] col6 = new int[9];
int[] col7 = new int[9];
int[] col8 = new int[9];
int[] col9 = new int[9];

int[] quad1 = new int[9];
int[] quad2 = new int[9];
int[] quad3 = new int[9];
int[] quad4 = new int[9];
int[] quad5 = new int[9];
int[] quad6 = new int[9];
int[] quad7 = new int[9];
int[] quad8 = new int[9];
int[] quad9 = new int[9];

void setup(){
  size(500,500);
  rows.add(row1);rows.add(row2);rows.add(row3);rows.add(row4);rows.add(row5);rows.add(row6);rows.add(row7);rows.add(row8);rows.add(row9);
  cols.add(col1);cols.add(col2);cols.add(col3);cols.add(col4);cols.add(col5);cols.add(col6);cols.add(col7);cols.add(col8);cols.add(col9);
  quads.add(quad1);quads.add(quad2);quads.add(quad3);quads.add(quad4);quads.add(quad5);quads.add(quad6);quads.add(quad7);quads.add(quad8);quads.add(quad9);
  raster = new RasterBlock[9][9];
  for(int i = 0; i < raster.length; i++){
    for(int h = 0; h < raster[0].length; h++){
      raster[h][i] = new RasterBlock(h,i);
    }
  }
  
}


void draw(){
  background(0);
  strokeWeight(3);
  line(10,160,460,160);
  line(10,310,460,310);
  line(160,10,160,460);
  line(310,10,310,460);
  strokeWeight(1);
  for(int i = 0; i < raster.length; i++){
    for(int h = 0; h < raster[0].length; h++){
      raster[i][h].update();
      raster[i][h].show();
    }
  }
}

void keyPressed(){
  if(key == ENTER){
       println("rows");
        for(int[] b : rows){
          println(b);
        }
        
        println("cols");
      for(int[] b : cols){
          println(b);
        }
        println("quads");
        for(int[] b : quads){
          println(b);
        }
  }
}
