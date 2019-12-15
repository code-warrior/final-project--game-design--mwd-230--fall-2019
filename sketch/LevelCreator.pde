void drawLevel(JSONObject levelData)
{
    String temp1, temp2, temp3, temp4;
    try {
        temp1 = levelData.getString("startingx");
        temp2 = levelData.getString("startingy");
    } catch(java.lang.RuntimeException e){
        throw new LevelFormatException("startingx and startingy not found in your level file!");
    }
    try {
        particleXPos = Integer.parseInt(temp1);
    } catch (NumberFormatException e) {
        if(temp1.equals("height")) {
            particleXPos = height;
        }
        else if(temp1.equals("width")) {
            particleXPos = width;
        }
        else {
            throw new LevelFormatException("Invalid value for startingx!");
        }
    }
    try {
        particleYPos = Integer.parseInt(temp2);
    } catch (NumberFormatException e) {
        if(temp2.equals("height")) {
            particleYPos = height;
        }
        else if(temp2.equals("width")) {
            particleYPos = width;
        }
        else {
            throw new LevelFormatException("Invalid value for startingy!");
        }
    }
}