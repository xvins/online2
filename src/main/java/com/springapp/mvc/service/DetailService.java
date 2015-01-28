package com.springapp.mvc.service;

import com.springapp.mvc.model.Detail;
import com.springapp.mvc.repository.DetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DetailService {

    @Autowired
    private DetailRepository detailRepository;

    public void editDetail(Detail modifiedDetail) {
        List<Detail> dList = detailRepository.findAll();
        for (Detail detail : dList) {
            if (detail.getId() == modifiedDetail
                    .getId()) {
                detailRepository.delete(detail);
                break;
            }
        }
        detailRepository.save(modifiedDetail);

    }

}
