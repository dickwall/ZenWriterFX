/*
 * Theme.fx
 *
 * Created on Mar 15, 2010, 12:35:14 PM
 */

package zenwriterfx;

import javafx.scene.paint.Paint;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
import javafx.scene.media.MediaView;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.Media;

public class Theme {
    public-init var name: String;
    public-init var backgroundImage: String;
    public-init var beginX = 0.1;
    public-init var beginY = 0.1;
    public-init var endX = 0.7;
    public-init var endY = 0.9;
    public-init var panelX = 0.75;
    public-init var panelY = 0.1;
    public-init var panelWidth = 0.15;
    public-init var panelHeight = 0.6;
    public-init var fill: Paint = Color.WHITE;
    public-init var textColor = Color.BLACK;
    public-init var selectionTextColor = Color.WHITE;
    public-init var selectionColor = Color.rgb(255, 255, 255, 0.5);
    public-init var opacity = 0.3;
    public-init var font: Font;
    public-init var clickSound: String;

    public def clickMedia = {
        def local = Utilities.makeLocal(clickSound);
        Media {
            onError: function(error) {
                println("{error}");
            }
            source: local
        }
    }

    var mediaPlayer = MediaPlayer {
        media: clickMedia
    }

    public function playClick() {
        mediaPlayer.currentTime = 0s;
        mediaPlayer.play();
    }
}

public def DEFAULT = Theme {
    name: "Test"
    backgroundImage: "{__DIR__}images/backgrounds/WriterZen-BG002.JPG"
    font: Font.font("American Typewriter", 32)
    clickSound: "{__DIR__}sounds/keyclick/typewriter-key.wav"
}

public def DICKS_THEME = Theme {
    backgroundImage: "{__DIR__}images/backgrounds/WriterZen-BG003.JPG"
    font: Font.font("Rufscript", 24)
}

public def UGLY = Theme {
    backgroundImage: "{__DIR__}images/backgrounds/WriterZen-BG002.JPG"
    font: Font.font("American Typewriter", 20)
    textColor: Color.YELLOW
    selectionColor: Color.RED
    selectionTextColor: Color.GREEN
    fill: Color.PURPLE
}
