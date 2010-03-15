/*
 * Application.fx
 *
 * Created on Mar 15, 2010, 4:43:28 PM
 */

package zenwriterfx;
import zen.like.TextEditor;

public class Application {
    public-init var editor: TextEditor;

    public function exit() {
        println("REFLECTION EXIT HANDLER CALLED!");
        editor.save();
    }
}

