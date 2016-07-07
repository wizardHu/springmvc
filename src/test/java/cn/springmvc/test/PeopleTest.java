package cn.springmvc.test;

import java.util.List;

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
	
//	@Test
//	public void addUser(){
//		People people = new People();
//		for (int i = 0; i < 2000; i++) {
//			people.setCount(i);
//			people.setName("amplee"+i);
//			people.setPhone("123"+i);
//			System.out.println(peopleService.insertPeople(people));
//		}
//	}
	
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
	
	@Test
	public void delPeople(){

		peopleService.delPeople(2);
		
	}
}
