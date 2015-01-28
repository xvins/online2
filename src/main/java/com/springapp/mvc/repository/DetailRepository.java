package com.springapp.mvc.repository;

import com.springapp.mvc.model.Car;
import com.springapp.mvc.model.Detail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DetailRepository extends JpaRepository<Detail, Integer> {
    List<Detail> findByCar(Car car);
}
