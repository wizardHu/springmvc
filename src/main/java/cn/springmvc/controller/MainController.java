package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.People;
import cn.springmvc.service.PeopleService;

@Controller
@RequestMapping("/admin")
public class MainController {

	@Autowired
	private PeopleService peopleService;
	
	/**
	 * 进入首页
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		
		List<People> list = peopleService.showPeopleList(0);
		int pageCount = peopleService.pageCount();
		mav.addObject("data", list);
		mav.addObject("pageCount", pageCount);
		
		return mav;
	}
	
	/**
	 * 分页
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/page/{page}",method=RequestMethod.GET)
	public @ResponseBody Map<String, List<People>> page(@PathVariable int page){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		List<People> list = peopleService.showPeopleList(page*10);
		Map<String, List<People>> map = new HashMap<String, List<People>>();
		map.put("list", list);
		return map;
	}
	
}
