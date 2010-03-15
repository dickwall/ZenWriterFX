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

/**
 * @author dick
 */
Stage {
    fullScreen: true
    title: "ZenWriterFX"
    scene: Scene {
        content: [
            Text {
                font: Font {
                    size: 16
                }
                x: 10
                y: 30
                content: "Application content"
            }
        ]
        fill: Color.AQUAMARINE
    }
}
