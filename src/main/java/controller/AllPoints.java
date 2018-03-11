package controller;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

@Controller
public class AllPoints {

    @Value("${file.path}")
    private String fileName;


    @RequestMapping(value = "/getPoints", method = RequestMethod.GET)
    @ResponseBody
    public String getPoints() {

        String line = null;
        String text = "";

        try {
            FileReader fileReader = new FileReader(fileName);
            BufferedReader bufferedReader = new BufferedReader(fileReader);

            while ((line = bufferedReader.readLine()) != null) {
                text += line;
            }
            bufferedReader.close();
        } catch (IOException ex) {
            System.out.println("Error reading file '" + fileName + "'");

        }
        return text;
    }

}
