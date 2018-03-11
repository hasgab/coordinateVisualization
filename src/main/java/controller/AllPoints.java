package controller;

import com.google.gson.Gson;
import model.Point;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

@Controller
public class AllPoints {

    @Value("${file.path}")
    private String fileName;

    @Autowired
    public AllPoints(ApplicationContext applicationContext) {
        System.out.println("hello");
    }

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

    public static void main(String[] args) {


        ArrayList<Point> points = new ArrayList<Point>();
        Point point0 = new Point(0, 300, 100);
        Point point1 = new Point(300, 700, 100);
        Point point2 = new Point(0, 100, 100);
        Point point3 = new Point(400, 500, 100);
        Point point4 = new Point(200, 0, 100);
        Point point5 = new Point(-150, 0, 100);
        Point point6 = new Point(-200, -200, 100);
        Point point7 = new Point(-300, 300, 100);
        Point point8 = new Point(0, 300, 60);
        Point point9 = new Point(300, 700, 60);
        Point point10 = new Point(0, 100, 60);
        Point point11 = new Point(400, 500, 60);
        Point point12 = new Point(200, 0, 60);
        Point point13 = new Point(-150, 0, 60);
        Point point14 = new Point(-200, -200, 60);
        Point point15 = new Point(-300, 300, 60);
        points.add(point0);
        points.add(point1);
        points.add(point2);
        points.add(point3);
        points.add(point4);
        points.add(point5);
        points.add(point6);
        points.add(point7);
        points.add(point8);
        points.add(point9);
        points.add(point10);
        points.add(point11);
        points.add(point12);
        points.add(point13);
        points.add(point14);
        points.add(point15);
        String pointsJson = new Gson().toJson(points);
        System.out.println(pointsJson);
    }
}
