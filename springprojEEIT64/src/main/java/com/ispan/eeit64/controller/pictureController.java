package com.ispan.eeit64.controller;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.repository.DishRepository;

@RestController
public class pictureController {
	private final DishRepository dishRepository;

	public pictureController(DishRepository dishRepository) {
		super();
		this.dishRepository = dishRepository;
	}

	@GetMapping(value = { "/queryPicture", "/custIndex/queryPicture" })
    public List<DishBean> findAllPictures() {
        List<DishBean> allPictures = dishRepository.findAll();

        return allPictures;
    }

	@PostMapping("/savePictureImg")
	public void saveImage(@RequestBody Map<String, String> requestData) {
	    String imageBase64 = requestData.get("imageBase64");
	    DishBean dishBean = new DishBean();
	    dishBean.setPicture(imageBase64);
	    dishRepository.save(dishBean);
	}
	@PostMapping("/updatePictureUrl")
	public void updatePictureUrl(@RequestBody Map<String, Object> requestData) {
	    Integer dishId = (Integer) requestData.get("dishId");
	    String url = (String) requestData.get("url");

	    DishBean dishBean = dishRepository.findById(dishId).orElse(null);

	    dishBean.setPicture(url);
	    dishRepository.save(dishBean);
	}

    @DeleteMapping("/deletePicture")
    @CrossOrigin(origins = "http://localhost:8080/") // 设置允许跨域的来源网址
    public void deletePictureById(@RequestParam Integer pId) {
        System.out.println("pictureId: " + pId);
        dishRepository.deleteById(pId);
    }
}
