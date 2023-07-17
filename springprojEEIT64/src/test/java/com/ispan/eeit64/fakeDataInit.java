package com.ispan.eeit64;

import java.io.File;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.jpa.repository.JpaRepository;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ispan.eeit64.entity.ActivityBean;
import com.ispan.eeit64.entity.BasicSettingsBean;
import com.ispan.eeit64.entity.CategoryBean;
import com.ispan.eeit64.entity.CheckoutBean;
import com.ispan.eeit64.entity.ClosingTimeBean;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.entity.FdTableBean;
import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.entity.OrderRecordBean;
import com.ispan.eeit64.entity.ReservationBean;
import com.ispan.eeit64.jsonBean.ActivityJson;
import com.ispan.eeit64.jsonBean.CategoryJson;
import com.ispan.eeit64.jsonBean.CheckoutJson;
import com.ispan.eeit64.jsonBean.ClosingTimeJson;
import com.ispan.eeit64.jsonBean.DishJson;
import com.ispan.eeit64.jsonBean.DishJson2;
import com.ispan.eeit64.jsonBean.FdTableJson;
import com.ispan.eeit64.jsonBean.OpeningHourJson;
import com.ispan.eeit64.jsonBean.OrderJson;
import com.ispan.eeit64.jsonBean.OrderRecordJson;
import com.ispan.eeit64.jsonBean.ReservationsJson;
import com.ispan.eeit64.jsonBean.reader.ReadJson;
import com.ispan.eeit64.repository.ActivityRepository;
import com.ispan.eeit64.repository.BasicSettingsRepository;
import com.ispan.eeit64.repository.CategoryRepository;
import com.ispan.eeit64.repository.CheckoutRepository;
import com.ispan.eeit64.repository.ClosingTimeRepository;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.repository.FdTableRepository;
import com.ispan.eeit64.repository.OpeningHourRepository;
import com.ispan.eeit64.repository.OrderRepository;
import com.ispan.eeit64.repository.ReservationRepository;
import com.ispan.eeit64.repository.UniversalCustomRepository;

@SpringBootTest
public class fakeDataInit {
    public Boolean isDeleteOldData = true;

    @Autowired
    UniversalCustomRepository ucDao;
    
    @Autowired
    ActivityRepository activityDao;
    
    @Autowired
    DishRepository dishDao;

    @Autowired
    CategoryRepository categoryDao;

    @Autowired
    OpeningHourRepository openHourdao;
    
    @Autowired
    OrderRepository orderDao;

    @Autowired
    FdTableRepository fdTableDao;

    @Autowired
    ReservationRepository reservationDao;

    @Autowired
    CheckoutRepository checkoutDao;

    @Autowired
    ClosingTimeRepository ClosingTimeDao;

    @Autowired
    BasicSettingsRepository BasicSettingsDao;

    @BeforeEach
    public void before(TestInfo testInfo) {
        System.out.println("");
        System.out.println("Test method execution : " + testInfo.getDisplayName());
    }

    @AfterEach
    public void after(TestInfo testInfo) {
        System.out.println("Test method execution end : " + testInfo.getDisplayName());
        System.out.println("");
    }
    
    @Test
    void test() {
        // try {
        //     CategoryBean bean = categoryDao.findById(7).get();
        //     categoryDao.delete(bean);
        // } catch (Exception e) {
        //     System.out.println(e);
        // }
    }
        
    @Test
    void addFakeData() {
        System.out.println("----------------------------------------------");
        // try {
        //     if(isDeleteOldData) {
        //         resetTable("fdtable", fdTableDao);
        //         resetTable("reservation", reservationDao);
        //         resetTable("orders", orderDao);
        //         ucDao.resetAutoId("orderdetail");
        //         ucDao.resetAutoId("orderrecord");
        //         resetTable("checkout", checkoutDao);
        //         resetTable("openinghour", openHourdao);
        //         resetTable("closingtime", ClosingTimeDao);
        //         resetTable("category", categoryDao);
        //         resetTable("dish", dishDao);
        //         resetTable("activity", activityDao);
        //     }
            
        //     // add fake data
        //     addBasicSettingsData();
        //     addFdTableData();
        //     addReservationData();
        //     addOpeningHourData();
        //     addClosingTimeData();
        //     addCategoryData();
        //     addDishData();
        //     addActivityData();
        //     addOrderData();
        //     addCheckoutData();
        // } catch (Exception e) {
        //     System.out.println(e);
        // }
    }

    public <T> List<T> getJson(String jsonPath, Class<T> type) throws Exception {
        String jsonStr = ReadJson.getJsonFileString(jsonPath);
        List<T> json = new LinkedList<>();
        
        if (jsonStr != null) {
            Type listType = TypeToken.getParameterized(List.class, type).getType();
            json = new Gson().fromJson(jsonStr, listType);
        } else {
            return null;
        }
        return json;
    }

    public <T, ID> void resetTable(String tableName, JpaRepository<T, ID> dao) throws Exception {
        System.out.println(dao.findAll().size());
        if (dao.findAll().size() != 0) {
            dao.deleteAll();
        }
        ucDao.resetAutoId(tableName);
    }

    public void addBasicSettingsData() throws Exception {
        String imagePath = "/static/assets/img/logo.png";
        ClassPathResource cpr = new ClassPathResource(imagePath);
        String mimeType = Files.probeContentType(Paths.get(imagePath));

        InputStream is = cpr.getInputStream();
        File source = cpr.getFile();
        
        byte[] buf = new byte[(int)source.length()];
        is.read(buf);						
        is.close();

        String base64String = Base64.getEncoder().encodeToString(buf);

        BasicSettingsBean shopNameBean = new BasicSettingsBean("shopName", "墨竹亭(公益店)");
        BasicSettingsDao.save(shopNameBean);
        BasicSettingsBean logoImgBean = new BasicSettingsBean("logoImg", "data:"+mimeType+";base64,"+base64String);
        BasicSettingsDao.save(logoImgBean);
    }
    

    public void addOpeningHourData() throws Exception {
        List<OpeningHourJson> json = getJson("/static/assets/json/openingHours.json", OpeningHourJson.class);

        SimpleDateFormat formatDate = new SimpleDateFormat("HH:mm");
        for (OpeningHourJson jsonBean : json) {
            Date oepnDate = formatDate.parse(jsonBean.open);
            Date closeDate = formatDate.parse(jsonBean.close);
            OpeningHourBean bean = new OpeningHourBean(null, jsonBean.day, oepnDate, closeDate);
            openHourdao.save(bean);
        }
    }

    public void addCategoryData() throws Exception {
        List<CategoryJson> json = getJson("/static/assets/json/category.json", CategoryJson.class);

        for (CategoryJson jsonBean : json) {
            CategoryBean bean = new CategoryBean(null, jsonBean.name);
            categoryDao.save(bean);
            System.out.println(bean);
        }
    }

    public void addDishData() throws Exception {
        List<DishJson2> json = getJson("/static/assets/json/dish2.json", DishJson2.class);
        
        for (DishJson2 jsonBean : json) {
            Integer cid = ((Double)jsonBean.categoryBean.get("id")).intValue();
            Optional<CategoryBean> cbeanOptional = categoryDao.findById(cid);
            CategoryBean cbean = cbeanOptional.get();
            DishBean bean = new DishBean(jsonBean.name, cbean, jsonBean.price, jsonBean.cost, jsonBean.picture, jsonBean.description, jsonBean.status);

            dishDao.save(bean);
        }
    }

    public void addActivityData() throws Exception {
        List<ActivityJson> json = getJson("/static/assets/json/activity.json", ActivityJson.class);
        
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");            
        for(ActivityJson jsonBean : json) {
            java.sql.Date startDate = new java.sql.Date(formatDate.parse(jsonBean.startDate).getTime());
            java.sql.Date endDate = new java.sql.Date(formatDate.parse(jsonBean.endDate).getTime());
            
            DishBean dBean = null;                
            if(jsonBean.FK_Dish_Id != null) {
                Optional<DishBean> dBeanOptional = dishDao.findById(jsonBean.FK_Dish_Id);
                dBean = dBeanOptional.get();
            }
            ActivityBean bean = new ActivityBean(jsonBean.name, jsonBean.type, jsonBean.discount, jsonBean.amount, startDate, endDate, dBean);
            activityDao.save(bean);
        }
    }

    public void addOrderData() throws Exception {
        List<OrderJson> orderJson = getJson("/static/assets/json/orders.json", OrderJson.class);
        List<OrderRecordJson> recordJson = getJson("/static/assets/json/orderrecords.json", OrderRecordJson.class);
        
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

        for(int i=0; i<orderJson.size(); i++) {
            OrderRecordJson recordData = recordJson.get(i);
            java.sql.Timestamp orderEstablish = java.sql.Timestamp.valueOf(recordData.order_establish);
            java.sql.Timestamp orderDeal = recordData.order_deal != null?java.sql.Timestamp.valueOf(recordData.order_deal):null;
            java.sql.Timestamp orderFinish = recordData.order_finish != null?java.sql.Timestamp.valueOf(recordData.order_finish):null;
            java.sql.Timestamp orderCancel = recordData.order_cancel != null?java.sql.Timestamp.valueOf(recordData.order_cancel):null;
            OrderRecordBean rBean = new OrderRecordBean(orderEstablish, orderDeal, orderFinish, orderCancel);
            
            OrderJson orderData = orderJson.get(i);
            Set<OrderDetailBean> dBeans = new HashSet<>();
            Map<Integer, Integer> elementCountMap = new HashMap<>();
            for (Integer element : orderData.orderDetails) {
                if (elementCountMap.containsKey(element)) {
                    int count = elementCountMap.get(element);
                    elementCountMap.put(element, count + 1);
                } else {
                    elementCountMap.put(element, 1);
                }
            }
            for(Integer id : elementCountMap.keySet()) {
                Optional<DishBean> dishBeanOptional = dishDao.findById(id);
                DishBean dishBean = dishBeanOptional.get();
                
                OrderDetailBean odBean = new OrderDetailBean(dishBean, elementCountMap.get(id));
                dBeans.add(odBean);
            }
            ActivityBean aBean = null;
            if(orderData.FK_Activity_Id != null) {
                Optional<ActivityBean> dishBeanOptional = activityDao.findById(orderData.FK_Activity_Id);
                aBean = dishBeanOptional.get();                    
            }
            OrderBean oBean = new OrderBean(
                    orderData.type, 
                    formatDate.parse(orderData.pickTime), 
                    java.sql.Timestamp.valueOf(orderData.orderTime), 
                    orderData.amount, 
                    orderData.orderStatus, 
                    null, 
                    orderData.customer, 
                    orderData.phone, 
                    rBean,
                    dBeans,
                    aBean);        
            orderDao.save(oBean);
        }
    }
    
    public void addFdTableData() throws Exception {
        List<FdTableJson> json = getJson("/static/assets/json/fdtable.json", FdTableJson.class);
            
        for(FdTableJson jsonBean : json) {
            FdTableBean bean = new FdTableBean(jsonBean.id,jsonBean.capacity);
            fdTableDao.save(bean);
        }
    }
    

    public void addReservationData() throws Exception {
        List<ReservationsJson> json = getJson("/static/assets/json/reservations.json", ReservationsJson.class);

        SimpleDateFormat formatYMDDate = new SimpleDateFormat("yyyy-MM-dd");
        for(ReservationsJson jsonBean : json) {
            Optional<FdTableBean> fdTableBeanOptional = fdTableDao.findById(jsonBean.FK_FdTableBean_Id);
            FdTableBean fBean = null; 
            if(!fdTableBeanOptional.isEmpty()){
                fBean = fdTableBeanOptional.get();
            }
            
            ReservationBean rBean = new ReservationBean(
                    jsonBean.name, 
                    jsonBean.gender, 
                    jsonBean.phone, 
                    jsonBean.pNumber,
                    new java.sql.Date(formatYMDDate.parse(jsonBean.date).getTime()),
                    Time.valueOf(jsonBean.startTime),
                    Time.valueOf(jsonBean.endTime),
                    jsonBean.email,
                    jsonBean.note,
                    Timestamp.valueOf(jsonBean.submitTime),
                    fBean);
            
            reservationDao.save(rBean);
        }
    }
    

    public void addCheckoutData() throws Exception {
        List<CheckoutJson> json = getJson("/static/assets/json/checkout.json", CheckoutJson.class);
        
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");            
        for(CheckoutJson jsonBean : json) {
            Optional<OrderBean> oBeanOptional = orderDao.findById(jsonBean.FK_orderId);
            OrderBean oBean = oBeanOptional.get();
            CheckoutBean cBean = new CheckoutBean(
                formatDate.parse(jsonBean.payTime),
                jsonBean.payStatus,
                oBean
            );
            checkoutDao.save(cBean);            
        }
    }
    
    public void addClosingTimeData() throws Exception {
        List<ClosingTimeJson> json = getJson("/static/assets/json/closingTime.json", ClosingTimeJson.class);

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for (ClosingTimeJson jsonBean : json) {
            Date startDate = formatDate.parse(jsonBean.start);
            Date endDate = formatDate.parse(jsonBean.end);
            ClosingTimeBean bean = new ClosingTimeBean(startDate, endDate, jsonBean.note);
            ClosingTimeDao.save(bean);
        }
    }
}
