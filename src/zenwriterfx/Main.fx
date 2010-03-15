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

/**
 * @author dick
 */

var scene: Scene;

Stage {
    // fullScreen: true
    title: "ZenWriterFX"
    scene: scene = Scene {
        content: [
            ImageView {
                opacity: 0.3
                image: Image {
                    backgroundLoading: true
                    url: "{__DIR__}WriterZen-BG001.JPG"
                }
                fitHeight: bind scene.height
                fitWidth: bind scene.width
            }

            Text {
                font: Font {
                    size: 16
                }
                x: 10
                y: 30
                content: "Application content"
            }
        ]
        fill: Color.WHITE
    }
}
