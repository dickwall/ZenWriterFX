/*
 * Theme.fx
 *
 * Created on Mar 15, 2010, 12:35:14 PM
 */

package zenwriterfx;

import javafx.scene.paint.Paint;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;

/**
 * @author tor
 */

public class Theme {
    public-init var name: String;
    public-init var url: String;
    public-init var beginX = 0.1;
    public-init var beginY = 0.1;
    public-init var endX = 0.9;
    public-init var endY = 0.9;
    public-init var fill: Paint = Color.WHITE;
    public-init var opacity = 0.3;
    public-init var font: Font;
}

public def DEFAULT = Theme {
    url: "{__DIR__}images/backgrounds/WriterZen-BG002.JPG"
    font: Font.font("American Typewriter", 32)
}
