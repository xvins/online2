package com.springapp.mvc.repository;

import com.springapp.mvc.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepository extends JpaRepository<Car, Integer> {

}
