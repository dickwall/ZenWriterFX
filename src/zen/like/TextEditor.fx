/*
 * TextEditor.fx
 *
 * Created on Mar 15, 2010, 11:10:07 AM
 */

package zen.like;

import javafx.scene.Node;
import javax.swing.JScrollPane;
import javafx.ext.swing.SwingComponent;
import javax.swing.border.EmptyBorder;
import java.awt.Insets;

/**
 * @author dick
 */

public class TextEditor {
}

public function create(): Node {
    var textPane = new AntiAliasedTextArea();

    var scrollPane = new JScrollPane(textPane);
    var text: SwingComponent = SwingComponent.wrap(scrollPane);
    textPane.setBackground(new java.awt.Color(0,0,0,0)); // 0 opacity => 100% transparent!
    textPane.setForeground(java.awt.Color.BLACK);
    textPane.setCaretColor(java.awt.Color.BLACK);
    scrollPane.setOpaque(false);
    scrollPane.setBorder(new EmptyBorder(new Insets(0,0,0,0)));
    textPane.setFont(new java.awt.Font("American Typewriter", 0, 32));

    text
}
