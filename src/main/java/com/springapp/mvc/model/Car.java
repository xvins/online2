package com.springapp.mvc.model;

import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PropertyComparator;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "cars")
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private int id;

    private String name;

    @OneToMany(fetch=FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "car")
    private Set<Detail> carDetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    protected void setCarDetailsInternal(Set<Detail> carDetals) {
        this.carDetails = carDetails;
    }

    protected Set<Detail> getCarDetailsInternal() {
        if (this.carDetails == null) {
            this.carDetails = new HashSet<Detail>();
        }
        return this.carDetails;
    }

    public List<Detail> getCarDetails() {
        List<Detail> sortedCarDetails = new ArrayList<Detail>(getCarDetailsInternal());
        PropertyComparator.sort(sortedCarDetails, new MutableSortDefinition("name", true, true));
        return Collections.unmodifiableList(sortedCarDetails);
    }

    public void addDetail(Detail detail) {
        getCarDetailsInternal().add(detail);
        detail.setCar(this);
    }
}
