package com.ispan.eeit64.controller;

//import java.util.Map;
//import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.service.ShowDishService;

//呈現json資料
@Controller
public class ShowDishController {
    ShowDishService service;
    @Autowired
    public ShowDishController(ShowDishService service) {
        this.service = service;
    }
    
    //前後端抓categoryId
    @GetMapping("/dishes")
    public String getDishesByCategory(@RequestParam("categoryId") int categoryId, Model model) {
      // 使用 categoryId 調用 ShowDishService 中的方法，獲取屬於該類別的餐點資料
      List<Dish> dishes = ShowDishService.getDishesByCategoryId(categoryId);

      // 將餐點資料傳遞給前端
      model.addAttribute("dishes", dishes);

      return "selectproduct"; // 替換成你的視圖名稱
    }
}
    
    //前端表格出現json資料
//    @GetMapping("/dishes")
//
//    public String getAllOrderStatus(
//            @RequestParam(required = false, defaultValue = "40") int pageSize,
//            @RequestParam(required = false, defaultValue = "0") int pageNumber,
//            Model model){ 	    	   
//      Page<DishBean>   list = service.findAll(pageSize, pageNumber);
//          model.addAttribute("list", list); 
//         return "product";
//         }
//    }
//網頁呈現json資料
//    @GetMapping("/dishtitle")
//    @ResponseBody
//    public Page<DishBean> getAllOrderStatus(
//            @RequestParam(required = false, defaultValue = "20") int pageSize,
//            @RequestParam(required = false, defaultValue = "0") int pageNumber,
//            Model model){ 	    	   
////      Page<DishBean>   list = service.findAll(pageSize, pageNumber);
////          model.addAttribute("dishes", list); 
//         return service.findAll(pageSize, pageNumber);
//         }
//}




    


