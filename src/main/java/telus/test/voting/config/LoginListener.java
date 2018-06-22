/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.config;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

/**
 *
 * @author Admin
 */
@Component
public class LoginListener implements ApplicationListener<InteractiveAuthenticationSuccessEvent> {

    @Override
    public void onApplicationEvent(InteractiveAuthenticationSuccessEvent event) {

        BufferedReader input;
        try {
            String fileName = "visitorCounter.txt";
            File file = new File(fileName);
            FileWriter fileWriter = new FileWriter(file, true);
            input = new BufferedReader(new FileReader(fileName));
            String last = "", line;
            while ((line = input.readLine()) != null) {
                last = line;
            }
            String dateFormat = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            String fecha = dateFormat;
            String counter = "1";
            if (!last.isEmpty()) {
                fecha = last.split("\\|")[0];
                counter = last.split("\\|")[1];
                if (fecha.equals(dateFormat)) {
                    counter = Integer.toString(Integer.parseInt(counter) + 1);
                    //Borrando última línea
                    this.deleteLine(fileName, last);
                    this.deleteLine(fileName, last);
                }else{
                   fecha = dateFormat;
                   counter = "1";
                }
            }
            line = fecha + "|" + counter;
            BufferedWriter bw = new BufferedWriter(fileWriter);
            bw.append(line + "\n");
            bw.close();
        } catch (IOException e) {
            Logger.getLogger(e.getMessage());
        }

    }
    
    public void deleteLine(String fileName, String text)
    {
        try
        {
                BufferedReader file = new BufferedReader(new FileReader(fileName));
                String line;
                String input = "";
                while ((line = file.readLine()) != null) 
                {
                    if (line.contains(text))
                    {
                        line = "";
                    }else{
                       input += line + '\n'; 
                    }
                }
                FileOutputStream File = new FileOutputStream(fileName);
                File.write(input.getBytes());
                file.close();
                File.close();
        }
        catch (Exception e)
        {
                System.out.println("Problem reading file.");
        }
    }
}
