package com.ai.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ai.model.Flower;

@Controller
@RequestMapping("/pricePrediction")
public class PricePredictionController {

   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String login(ModelMap model) {
	      return "priceDashboard";
   } 
   
   @RequestMapping(value = "/runML", method = RequestMethod.POST,produces="application/json")
   public ResponseEntity<Flower> register(@RequestBody Flower flower)
   {
	   String flowerType = null;
	   String[] cmd = {
			      "python",
			      "C:\\AI\\ApartmentPricePrediction\\python\\price_prediction.py",
			      flower.getSepalLength(),
			      flower.getSepalWidth(),
			      flower.getPetalLength(),
			      flower.getPetalWidth()
			    };
			    
	   try {
	        ProcessBuilder probuilder = new ProcessBuilder(cmd);
	        Process p = probuilder.start();
	        BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
	        flowerType = in.readLine();
	        flower.setFlowerType(flowerType);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	   return new ResponseEntity<Flower>(flower, HttpStatus.OK);
   }
}
