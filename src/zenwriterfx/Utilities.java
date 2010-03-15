/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package zenwriterfx;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;

public class Utilities {
    public static String makeLocal(String url) {
        try {
            String name = url.substring(url.lastIndexOf('/')+1);
            File tmpdir = new File(java.lang.System.getProperty("java.io.tmpdir"));
            File localFile = new File(tmpdir, name);
            if (localFile.exists()) {
                return localFile.toURI().toURL().toExternalForm();
            }

            // Copy resource locally
            URL u = new URL(url);
            FileOutputStream writer = new FileOutputStream(localFile);
            InputStream input = u.openStream();
            while (true) {
                int c = input.read();
                if (c == -1) {
                    break;
                }
                writer.write((char)c);
            }

            writer.close();


            return localFile.toURI().toURL().toExternalForm();
        } catch (Exception e) {
            return null;
        }
    }

}
