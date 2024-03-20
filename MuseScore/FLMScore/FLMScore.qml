import QtQuick 2.0
import MuseScore 3.0
import FileIO 3.0

MuseScore {
    title: "FLMScore"
    description: "FLMScore syncs edits between FL Studio and MuseScore"
    version: "4.0"

    FileIO {
            id: outfile
            source: "Z:/Programs/FL Studio BETA/System/Config/Piano roll scripts/FLMScoreComm.txt"
            onError: console.log(msg)
    }  

    onRun:{
        var cursor = curScore.newCursor();
        var noteStr = "";

        for (var staff = 0; staff < curScore.nstaves; staff++) {
            for (var voice = 0; voice < 4; voice++) {
                cursor.rewind(1); // Beginning of selection, for some reason this needs to be called before setting staff / voice.
                cursor.staffIdx = staff;
                cursor.voice = voice;
                cursor.rewind(0);

                while (cursor.segment && (cursor.tick <= curScore.lastSegment.tick)) {
                      if (cursor.element) {
                          if (cursor.element.type === Element.CHORD) {
                              var notes = cursor.element.notes;
                              for (var k = 0; k < notes.length; k++) {
                                  var note = notes[k];
                                  noteStr += staff + "," + voice + "," + cursor.tick + "," + note.pitch + "," + cursor.element.duration.str  + "\n";
                              }
                          }
                      }
                      cursor.next();
                }
            }
        }

        var rc = outfile.write(noteStr);
        if (rc){ 
              console.log("Log file has been  written to "+ outfile.source);
        } else {
              console.log("Something went wrong. File cannot be written");
        }

        quit();
    } 
}