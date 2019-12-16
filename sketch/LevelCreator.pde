import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import javax.script.ScriptException;

void setInitialPosition(JSONObject levelData) throws LevelFormatException
{
    String temp1, temp2, temp3, temp4;
    try {
        temp1 = levelData.getString("startingx");
        temp2 = levelData.getString("startingy");
        temp3 = levelData.getString("finishx");
        temp4 = levelData.getString("finishy");
    } catch(RuntimeException e){
        throw new LevelFormatException("startingx, startingy, finishx, finishy not found in your level file!");
    }
    particleXPos = parseIntHelper(temp1);
    particleYPos = parseIntHelper(temp2);
    finishX = parseIntHelper(temp3);
    finishY = parseIntHelper(temp4);
}

void drawLevel(JSONObject levelData) throws LevelFormatException
{
    Iterator wallsKeys;
    JSONObject wallsJSON;
    try {
        wallsKeys = levelData.getJSONObject("walls").keyIterator();
        wallsJSON = levelData.getJSONObject("walls");
    } catch (RuntimeException e) {
        throw new LevelFormatException("Could not find walls!");
    }
    while(wallsKeys.hasNext()) {
        String wallRay = (String) wallsKeys.next();
        JSONArray wall = wallsJSON.getJSONArray(wallRay);
        if(wall instanceof JSONArray){
            //System.out.println(wall + " is a JSON Array");
            walls.add(new Boundary(
                parseIntHelper(wall.get(0) + ""),
                parseIntHelper(wall.get(1) + ""),
                parseIntHelper(wall.get(2) + ""),
                parseIntHelper(wall.get(3) + ""),
                0
            ));
        }
        else {
            throw new LevelFormatException("Your walls must be JSONArray Objects!");
        }
    }
}

int parseIntHelper(String input) throws LevelFormatException
{
    try {
        return Integer.parseInt(input);
    } catch (NumberFormatException e) {
        if(input.equals("height")) {
            return height;
        }
        else if(input.equals("width")) {
            return width;
        }
        else if(input.equals("centerH")) {
            return height/2;
        }
        else if(input.equals("centerW")) {
            return width/2;
        }
        else {
            try{
                //Parse math experssions in levels
                ScriptEngineManager mgr = new ScriptEngineManager();
                ScriptEngine engine = mgr.getEngineByName("JavaScript");
                input = input.replaceAll("height", height + "");
                input = input.replaceAll("width", width + "");
                return (int)engine.eval(input);
            } catch(ScriptException e1) {
                System.out.println(e1);
                return 0;
            }
            //throw new LevelFormatException("Invalid value for JSON input. Must either be a number or \"height\" or \"width\"!");
        }
    }
}