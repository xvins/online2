package com.springapp.mvc.controller;

import com.springapp.mvc.model.Car;
import com.springapp.mvc.model.Detail;
import com.springapp.mvc.repository.CarRepository;
import com.springapp.mvc.repository.DetailRepository;
import com.springapp.mvc.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import java.util.Map;

@Controller
public class DetailController {

    @Autowired
    private DetailRepository detailRepository;

    @Autowired
    private CarRepository carRepository;

    @Autowired
    private DetailService detailService;
//
//    @RequestMapping(value = "details/createdetail", method = RequestMethod.GET)
//    public String createForm(ModelMap model) {
//        model.addAttribute("detail", new Detail());
//        return "details/createdetail";
//    }
//
//    @RequestMapping(value = "details/createdetail", method = RequestMethod.POST)
//    public String createDetail(@ModelAttribute("detail") Detail detail, BindingResult result) {
//        detailRepository.save(detail);
//        return "redirect:/details";
//    }



    @RequestMapping("/details")
    public String details(ModelMap model) {
        Detail detail = new Detail();
        model.addAttribute("detail", detail);
        model.addAttribute("detailList", detailRepository.findAll());
        return "details/details";
    }

    @RequestMapping(params = "dAction=delete", method = RequestMethod.GET)
    public String deleteDetail(@RequestParam(value = "detailId") int dId) {
        detailRepository.delete(dId);
        return "redirect:/details";
    }

    @RequestMapping(value = "details/editdetail/{detailId}", method = RequestMethod.GET)
    public String initUpdateForm(ModelMap model, @PathVariable("detailId") int detailId) {
        Detail detail = detailRepository.findOne(detailId);
        model.addAttribute("detail", detail);
        return "details/editdetail";
    }

    @RequestMapping(value = "details/editdetail/{detailId}", method = {RequestMethod.PUT, RequestMethod.POST})
    public String processUpdateForm(@ModelAttribute("detail") Detail detail, SessionStatus status,
                                    @PathVariable("detailId") int detailId) {
            detailRepository.save(detail);
            detailRepository.delete(detailId);
            status.setComplete();
            return "redirect:/details/";
    }

    @InitBinder
    public void setAllowedFields(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }

    @RequestMapping(value = "/cars/{carId}/details/new", method = RequestMethod.GET)
    public String initCreationForm(@PathVariable("carId") int carId, Map<String, Object> model) {
        Car car = carRepository.findOne(carId);
        Detail detail = new Detail();
        car.addDetail(detail);
        model.put("detail", detail);
        return "details/createdetail";
    }

    @RequestMapping(value = "/cars/{carId}/details/new", method = {RequestMethod.PUT, RequestMethod.POST})
    public String processCreationForm(@ModelAttribute("detail") Detail detail, BindingResult result, SessionStatus status) {
            detailRepository.save(detail);
            status.setComplete();
            return "redirect:/cars/carinfo{carId}";
    }
}




