package com.ai.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ai.model.Apartment;

@Controller
@RequestMapping("/pricePrediction")
public class PricePredictionController {
   
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String login(ModelMap model) {
	      return "priceDashboard";
   } 
   
   @RequestMapping(value = "/runML", method = RequestMethod.POST,produces="application/json")
   public ResponseEntity<Apartment> register(@RequestBody Apartment aprt,HttpServletRequest request)
   {
	   String path = request.getSession().getServletContext().getRealPath("/resources/python/price_prediction.py");

	   String[] cmd = {
			      "python",
			      path,
			      aprt.getTaxiDistance(),aprt.getMarketDistance(),aprt.getHospitalDistance(),aprt.getCarpet()
			      ,aprt.getBuiltup(),aprt.getParking(),aprt.getCityCategory(),aprt.getRainFall()    
			    };
			    
	   try {
	        ProcessBuilder probuilder = new ProcessBuilder(cmd);
	        Process p = probuilder.start();
	        BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
	        String price = in.readLine();
	        aprt.setPrice(price);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	   return new ResponseEntity<Apartment>(aprt, HttpStatus.OK);
   }
}
