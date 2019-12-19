final static String LEVEL_PATH = "data/levels/";
StringList levelNameJSON;

//Find all .json levels
StringList listLevels() {
  String sketch_path = sketchPath();
  StringList filenames = listFileNames(sketch_path + "/" + LEVEL_PATH);
  return filenames;
}

//Find all .json files given a dir
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

//Setup UI
void setupLevelSelect(StringList fileNames) throws LevelFormatException{

  //Make UI font
  ControlFont cf1 = new ControlFont(createFont("Arial",32,true),32);
  
  //Level name as defined in the level's JSON payload
  levelNameJSON = new StringList();
  for(int i = 0; i < fileNames.size(); i++){
    levelNameJSON.append(loadJSONObject("levels/" + fileNames.get(i)).getString("name"));
  }

  //Level select
  ScrollableList d1 = 
       cp5.addScrollableList("Level")
          .setPosition((width/2)-300,height/2-100)
          .setSize(600,300)
          .setBackgroundColor(color(190))
          .setBarHeight(100)
          .setItemHeight(100)
          .setColorBackground(color(60))
          .setColorActive(color(255, 128))
          .addItems(levelNameJSON.array())
          .setFont(cf1);
  
  //Play button
  cp5.addButton("Play")
     .setValue(0)
     .setPosition((width/2)-100,height/2+300)
     .setSize(200,200)
     //This has a callback in it so we can define a custom action when clicked
     .addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        if (event.getAction() == ControlP5.ACTION_RELEASED) {
          System.out.println("Play Control! About to play with level " + levelNum);
          levelNameNice = levelNameJSON.get(levelNum);
          isUIVisible = !isUIVisible;
          try{
            setInitialPosition(loadJSONObject("levels/" + levelNames.get(levelNum)));
          } catch (LevelFormatException e) {
            System.out.println(e);
          }
        }
      }
    })
    .setFont(cf1);
}
//Simple level number setter
void Level(int n) {
  levelNum = n;
}