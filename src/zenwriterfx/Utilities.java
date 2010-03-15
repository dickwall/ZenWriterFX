/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package zenwriterfx;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public static void addShutdown(final Object instance) {
        Runtime.getRuntime().addShutdownHook(new Thread() {
            @Override
            public void run() {
                try {
                    Class cls = Class.forName("zenwriterfx.Application");
                    Method method = cls.getMethod("exit", (Class[])null);
                    method.invoke(instance, (Object[])null);
                } catch (IllegalAccessException ex) {
                    Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IllegalArgumentException ex) {
                    Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
                } catch (InvocationTargetException ex) {
                    Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
                } catch (NoSuchMethodException ex) {
                    Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SecurityException ex) {
                    Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }
}
