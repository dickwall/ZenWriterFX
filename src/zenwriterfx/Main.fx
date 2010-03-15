/*
 * Main.fx
 *
 * Created on Mar 15, 2010, 9:58:54 AM
 */
package zenwriterfx;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import zen.like.TextEditor;
import javafx.ext.swing.SwingComponent;

/**
 * @author dick
 */

var scene: Scene;
def theme = Theme.DEFAULT;
var editor: SwingComponent = TextEditor.create(theme.font, theme.textColor, 
    theme.selectionColor, theme.selectionTextColor) as SwingComponent;
editor.focusTraversable = true;

var width: Number = bind stage.width on replace {
    editor.width = width * (theme.endX - theme.beginX);
    editor.translateX = width * theme.beginX;
};
var height: Number = bind stage.height on replace {
    editor.height = height * (theme.endY - theme.beginY);
    editor.translateY = height * theme.beginY;
};

def stage: Stage = Stage {
    fullScreen: true
    title: "ZenWriterFX"
    scene: scene = Scene {
        content: [
            ImageView {
                opacity: theme.opacity
                image: Image {
                    backgroundLoading: true
                    url: theme.url
                }
                fitWidth: bind width
                fitHeight: bind height
            }

            editor
        ]
        fill: theme.fill
    }
}

editor.requestFocus();