final static String LEVEL_PATH = "data/levels/";

StringList listLevels() {
  String sketch_path = sketchPath();
  StringList filenames = listFileNames(sketch_path + "/" + LEVEL_PATH);
  return filenames;
}

StringList listFileNames(String dir) {
  File file = new File(dir);
  StringList jsonNames = new StringList(); 
  if (file.isDirectory()) {
    String names[] = file.list();
    for(String name : names){
        if(name.contains(".json"))
        {
            jsonNames.append(name);
        }
    }
    return jsonNames;
  } else {
    // If it's not a directory
    return null;
  }
}

void setupLevelSelect(StringList fileNames) {
  StringList levelNameJSON = new StringList();
  for(int i = 0; i < fileNames.size(); i++){
    levelNameJSON.append(loadJSONObject("levels/" + fileNames.get(i)).getString("name"));
  }

  ScrollableList d1 = 
       cp5.addScrollableList("Level")
          .setPosition((width/2)-300,height/2-100)
          .setSize(600,300)
          .setBackgroundColor(color(190))
          .setBarHeight(100)
          .setItemHeight(100)
          .setColorBackground(color(60))
          .setColorActive(color(255, 128))
          .addItems(levelNameJSON.array());
  
  cp5.addButton("Play")
     .setValue(0)
     .setPosition((width/2)-100,height/2+300)
     .setSize(200,200)
     .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        if (event.getAction() == ControlP5.ACTION_RELEASED) {
          System.out.println("Play Control! About to play with level " + levelNum);
          isUIVisible = !isUIVisible;
        }
      }
    });
}

void Level(int n) {
  levelNum = n;
}