package cn.springmvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.stat.TableStat.Mode;

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

		long peopleCount = peopleService.pageCount();
		int pageCount = (int) (peopleCount/10);
		
		if((peopleCount%10)!=0){
			pageCount++;
		}
		if (page > pageCount && pageCount!=0) {
			page = pageCount;
		} else if (page < 1) {
			page = 1;
		}
		List<People> list = peopleService.showPeopleList((page - 1) * 10);

		mav.addObject("data", list);
		mav.addObject("pageCount", pageCount );
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

	/**
	 * 跳转到新增人数的JSP
	 * @return
	 */
	@RequestMapping("/skiptojsp/add")
	public String skipToAddJsp(Model model){
		List<String> authority = new ArrayList<String>();
		authority.add(" ");
		authority.add("超级管理员");
		authority.add("配送员");
		authority.add("采购助理");
		model.addAttribute("people", new People());
		model.addAttribute("authority", authority);
		return "add";
	}
	
	/**
	 * 添加人数
	 * @param people
	 * @return
	 */
	@RequestMapping("/addPeople")
	public ModelAndView addPeople(@ModelAttribute People people){
		
		ModelAndView mav = new ModelAndView("redirect:/list/1");
		peopleService.insertPeople(people);
		
		return mav;
	}
	
	/**
	 * 跳转更新页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/editBook/{id}/{page}")
	public String editBook(@PathVariable int page,@PathVariable int id,Model model){
		
		List<String> authority = new ArrayList<String>();
		authority.add(" ");
		authority.add("超级管理员");
		authority.add("配送员");
		authority.add("采购助理");
		
		People people = peopleService.getPeopleById(id);
		model.addAttribute("people", people);
		model.addAttribute("id", id);
		model.addAttribute("id", page);
		model.addAttribute("authority", authority);
		return "edit";
	}
	
	/**
	 * 更新
	 * @param page
	 * @param id
	 * @param people
	 * @return
	 */
	@RequestMapping("/updateBook/{id}/{page}")
	public String updateBook(@PathVariable int page,@PathVariable int id,@ModelAttribute People people){
		
		peopleService.updatePeople(people);
		return "redirect:/list/"+page;
	}
	
	@RequestMapping("/test")
	public String skipToDataTable(){
		return "datatables";
	}
	
	@RequestMapping("/getall")
	@ResponseBody
	public Map<String, Object> getAllRecords(){
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 List<People> list = new ArrayList<People>();
		 
		 for (int i = 0; i < 20; i++) {
			 list.add(new People("amplee"+1, ""+i, i, "qwe"));
		 }
		
		 map.put("data", list);
		 map.put("draw", 1);
		 map.put("recordsTotal", 57);
		 map.put("recordsFiltered", 57);
		
		return null;
	}
}
