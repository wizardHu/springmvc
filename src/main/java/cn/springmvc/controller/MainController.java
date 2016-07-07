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
public class MainController {

	@Autowired
	private PeopleService peopleService;

	/**
	 * 进入首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("redirect:/list/1");

		return mav;
	}

	/**
	 * 分页
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/list/{page}", method = RequestMethod.GET)
	public ModelAndView PeopleList(@PathVariable int page) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tables");

		int pageCount = peopleService.pageCount();
		if (page > (pageCount/10)) {
			page = pageCount/10;
		} else if (page < 1) {
			page = 1;
		}
		List<People> list = peopleService.showPeopleList((page - 1) * 10);

		mav.addObject("data", list);
		mav.addObject("pageCount", pageCount / 10);
		mav.addObject("nowPage", page);

		return mav;
	}

	/**
	 * 分页 ajax
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/page/{page}", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<People>> page(@PathVariable int page) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		List<People> list = peopleService.showPeopleList((page - 1) * 10);
		Map<String, List<People>> map = new HashMap<String, List<People>>();
		map.put("list", list);
		mav.addObject("nowPage", page);
		return map;
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del/{id}/{page}", method = RequestMethod.GET)
	public ModelAndView del(@PathVariable int id, @PathVariable int page) {

		peopleService.delPeople(id);

		return new ModelAndView("redirect:/list/" + page);
	}

}
