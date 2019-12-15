final static String LEVEL_PATH = "levels/";
JSONObject level;

StringList loadLevels() {
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