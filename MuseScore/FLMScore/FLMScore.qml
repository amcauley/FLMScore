import QtQuick 2.0
import MuseScore 3.0
import FileIO 3.0

MuseScore {
    title: "FLMScore"
    description: "FLMScore syncs edits between FL Studio and MuseScore"
    version: "4.0"

    FileIO {
            id: outfile
            source: "Z:/Documents/FLMScore/Debug/Logs/MuseScoreScript.log"
            onError: console.log(msg)
    }  

    onRun:{
        var cursor = curScore.startCmd()
        var rc = outfile.write("Hello World!\n");
            if (rc){ 
                  console.log("Log file has been  written to "+ outfile.source);
            } else {
                  console.log("Something went wrong. File cannot be written");
            }
        quit();
    } 
}