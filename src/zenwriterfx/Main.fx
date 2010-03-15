/*
 * Main.fx
 *
 * Created on Mar 15, 2010, 9:58:54 AM
 */
package zenwriterfx;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import zen.like.TextEditor;
import javafx.ext.swing.SwingComponent;

/**
 * @author dick
 */

var scene: Scene;

Stage {
    fullScreen: true
    title: "ZenWriterFX"
    scene: scene = Scene {
        content: [
            ImageView {
                opacity: 0.3
                image: Image {
                    backgroundLoading: true
                    url: "{__DIR__}images/backgrounds/WriterZen-BG002.JPG"
                }
                fitHeight: bind scene.height
                fitWidth: bind scene.width
            }

            {
                def editor = TextEditor.create() as SwingComponent;
                editor.width = 500;
                editor.height = 500;
                editor.translateX = 50;
                editor.translateY = 50;
                
                editor
            }
        ]
        fill: Color.WHITE
    }
}
