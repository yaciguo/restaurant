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

import com.ispan.eeit64.entity.BannerBean;
import com.ispan.eeit64.repository.BannerRepository;

@RestController
public class bannerController {

	private final BannerRepository bannerRepository;

	public bannerController(BannerRepository bannerRepository) {
		super();
		this.bannerRepository = bannerRepository;
	}

	@GetMapping(value = { "/queryBanner", "/custIndex/queryBanner" })
	public List<BannerBean> findAllBanners() {
		List<BannerBean> allBanner = bannerRepository.findAll();

		return allBanner;
	}

	@PostMapping("/saveBannerImg")
	public void saveImage(@RequestBody Map<String, String> requestData) {
		String imageBase64 = requestData.get("imageBase64");
		BannerBean bannerBean = new BannerBean();
		bannerBean.setPic(imageBase64);
		bannerRepository.save(bannerBean);
	}

	@PostMapping("/updateBannerUrl")
	public void updateBannerUrl(@RequestBody Map<String, Object> requestData) {
		Integer id = (Integer) requestData.get("id");
		String url = (String) requestData.get("url");

		BannerBean bannerBean = bannerRepository.findById(id).orElse(null);
		
		bannerBean.setUrl(url);
		bannerRepository.save(bannerBean);
	}
	
	@DeleteMapping("/deleteBanner")    
	@CrossOrigin(origins = "http://localhost:8080/") // 設置允許跨域的來源網址
	public void deleteBannerById(@RequestParam Integer bId) {
		System.out.println("bannerId: " +bId);
		bannerRepository.deleteById(bId);
	}
}
