/*
 * Main.fx
 *
 * Created on Mar 15, 2010, 9:58:54 AM
 */
package zenwriterfx;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import zen.like.TextEditor;
import javafx.ext.swing.SwingComponent;
import zen.like.MenuPanel;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;

public function run(args: String[]) {
    def themeName = if (sizeof args == 0) Theme.DEFAULT else args[0];
    def theme = Theme.getTheme(themeName);
    if (theme == null) {
        println("No such theme: {themeName}");
        println("Available names: {Theme.getNames()}");
        FX.exit();
    }

    var scene: Scene;
    def keyTyped = function(): Void {
        theme.playClick();
    }
    def editor = TextEditor.create(theme.font, theme.textColor, theme.selectionColor, theme.selectionTextColor, keyTyped);
    def editorNode: SwingComponent = editor.node as SwingComponent;
    editor.load(true);

    def menuPanel = MenuPanel {};

    editorNode.focusTraversable = true;

    var width: Number = bind stage.width on replace {
        editorNode.width = width * (theme.endX - theme.beginX);
        editorNode.translateX = width * theme.beginX;
        menuPanel.x = width * theme.panelX;
        menuPanel.width = width * theme.panelWidth;
    };
    var height: Number = bind stage.height on replace {
        editorNode.height = height * (theme.endY - theme.beginY);
        editorNode.translateY = height * theme.beginY;
        menuPanel.y = height * theme.panelY;
        menuPanel.height = height * theme.panelHeight;
    };

    def bgPlayer = MediaPlayer {
        volume: 0.5
        media: Media {
            source: Utilities.makeLocal("{__DIR__}sounds/background/OceanWave.wav");
        }
        autoPlay: true
        repeatCount: MediaPlayer.REPEAT_FOREVER
        onError: function(e) {
            println(e);
        }
    }


    def stage: Stage = Stage {
        fullScreen: true
        title: "ZenWriterFX"
        scene: scene = Scene {
            content: [
                ImageView {
                    opacity: theme.opacity
                    image: Image {
                        backgroundLoading: true
                        url: theme.backgroundImage
                    }
                    fitWidth: bind width
                    fitHeight: bind height
                }

                editorNode,
                menuPanel
            ]
            fill: theme.fill
        }
    }

    editorNode.requestFocus();
    Utilities.addShutdown(Application { editor: editor });
}
