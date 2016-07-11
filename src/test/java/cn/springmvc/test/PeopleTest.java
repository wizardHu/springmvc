package cn.springmvc.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.springmvc.model.People;
import cn.springmvc.service.PeopleService;



public class PeopleTest {

private PeopleService peopleService;
	
	@Before
	public void before(){                                                                    
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:conf/spring.xml"
				,"classpath:conf/spring-mybatis.xml"});
		peopleService = (PeopleService) context.getBean("peopleServiceImpl");
	}
	
	@Test
	public void addUser(){
		People people = new People();
		for (int i = 0; i < 200; i++) {
			if(i%3==0){
				people.setAuthority("超级管理员");
			}else if(i%3 == 1){
				people.setAuthority("配送员");
			}else{
				people.setAuthority("采购助理");
			}
			
			people.setName("amplee"+i);
			people.setPhone("1557583242"+i%10);
			System.out.println(peopleService.insertPeople(people));
		}
	}
	
//	@Test
//	public void showPeople(){
//
//		List<People> list = peopleService.showPeopleList(1);
//		System.out.println(list.size());
//		for (People people : list) {
//			System.out.println(people.getName());
//		}
//		
//	}
	
//	@Test
//	public void pageCount(){
//
//		System.out.println(peopleService.pageCount());
//		
//	}
	
//	@Test
//	public void delPeople(){
//
//		peopleService.delPeople(2);
//		
//	}
}
