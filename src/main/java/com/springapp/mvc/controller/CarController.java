package com.springapp.mvc.controller;

import com.springapp.mvc.model.Car;
import com.springapp.mvc.model.Detail;
import com.springapp.mvc.repository.CarRepository;
import com.springapp.mvc.repository.DetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import java.util.List;

@Controller
public class CarController {

    @Autowired
    private CarRepository carRepository;

    @Autowired
    private DetailRepository detailRepository;



    @RequestMapping(value = "cars/createcar", method = RequestMethod.GET)
    public String createForm(ModelMap model) {
        model.addAttribute("car", new Car());
        return "cars/createcar";
    }

    @RequestMapping(value = "cars/createcar", method = RequestMethod.POST)
    public String createCar(@ModelAttribute("car") Car car, BindingResult result) {
        carRepository.save(car);
        return "redirect:/";
    }

    @ModelAttribute("detailList")
    public List<Detail> details(){
        return detailRepository.findAll();
    }

    @RequestMapping("/")
    public String cars(ModelMap model) {
        Car car = new Car();
        model.addAttribute("car", car);
        model.addAttribute("carList", carRepository.findAll());
        return "cars/cars";
    }

    @RequestMapping(params = "cAction=delete", method = RequestMethod.GET)
    public String deleteDetail(@RequestParam(value = "carId") int cId) {
        carRepository.delete(cId);
        return "redirect:/";
    }

    @RequestMapping(value = "cars/editcar/{carId}", method = RequestMethod.GET)
    public String initUpdateForm(ModelMap model, @PathVariable("carId") int carId) {
        Car car = carRepository.findOne(carId);
        model.addAttribute("car", car);
        return "cars/editcar";
    }

    @RequestMapping(value = "cars/editcar/{carId}", method = {RequestMethod.PUT, RequestMethod.POST})
    public String processUpdateForm(@ModelAttribute("car")
                                        Car car, SessionStatus status, @PathVariable("carId") int carId) {
        carRepository.save(car);
        carRepository.delete(carId);
        status.setComplete();
        return "redirect:/";
    }

    @RequestMapping(value = "/cars/carinfo{id}", method = RequestMethod.GET)
    public String carInfo(ModelMap model, @PathVariable int id) {
        model.addAttribute("car", carRepository.findOne(id));
        return "cars/carinfo";
    }




}
