/*
 * Theme.fx
 *
 * Created on Mar 15, 2010, 12:35:14 PM
 */

package zenwriterfx;

import javafx.scene.paint.Paint;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.Media;
import java.util.Random;

public class Theme {
    public-init var name: String;
    public-init var backgroundImage: String;
    public-init var backgroundAudio: String;
    public-init var backgroundAudioVolume = 1.0;
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
        if (local != null) {
            Media {
                onError: function(error) {
                    println("{error}");
                }
                source: local
            }
        } else {
            null
        }
    }

    var mediaPlayer = MediaPlayer {
        media: clickMedia
    }

    public function playClick() {
        if (clickMedia != null) {
            mediaPlayer.currentTime = 0s;
            mediaPlayer.volume = new Random().nextFloat()*0.5 + 0.5;
            mediaPlayer.play();
        }
    }
}

public function getTheme(name: String) {
    for (theme in themes) {
        if (theme.name == name) {
            return theme;
        }
    }

    null
}

public def DEFAULT = "Default";

public function getNames(): String[] {
    for (theme in themes) {
        "{theme.name}, "
    }
}


def themes: Theme[] = [
    Theme {
        name: DEFAULT
        opacity: 0.5
        backgroundImage: "{__DIR__}images/backgrounds/WriterZen-BG038.JPG"
        backgroundAudio: "{__DIR__}sounds/background/OceanWave.wav"
        backgroundAudioVolume: 0.3
        font: Font.font("Helvetica", 24)
        clickSound: "{__DIR__}sounds/keyclick/typewriter-key.wav"
    },
    Theme {
        name: "Dick"
        backgroundImage: "{__DIR__}images/backgrounds/WriterZen-BG003.JPG"
        font: Font.font("Rufscript", 24)
    },
    Theme {
        name: "netbeans"
        opacity: 0.8
        backgroundImage: "{__DIR__}images/backgrounds/netbeans.png"
        font: Font.font("Courier", 24)
        clickSound: "{__DIR__}sounds/keyclick/typewriter-key.wav"
        beginX: 0.27
        beginY: 0.2
        endX: 0.9
        endY: 0.695
        panelX: 0.9
        panelY: 0.2
        panelWidth: 0.1
        panelHeight: 0.6
    },
    Theme {
        name: "Ugly"
        backgroundImage: "{__DIR__}images/backgrounds/WriterZen-BG002.JPG"
        font: Font.font("American Typewriter", 20)
        textColor: Color.YELLOW
        selectionColor: Color.RED
        selectionTextColor: Color.GREEN
        fill: Color.PURPLE
    }
];
