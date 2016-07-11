package cn.springmvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.PeopleDAO;
import cn.springmvc.model.People;
import cn.springmvc.service.PeopleService;


@Service
public class PeopleServiceImpl implements PeopleService{

	@Autowired
	private PeopleDAO peopleDAO;
	
	@Override
	public int insertPeople(People people) {
		return peopleDAO.insertPeople(people);
	}

	@Override
	public List<People> showPeopleList(int page) {
		
		List<People> list = peopleDAO.showPeopleList(page);
		return list;
	}

	@Override
	public int pageCount() {

		return peopleDAO.pageCount();
	}

	@Override
	public void delPeople(int id) {
		peopleDAO.delPeople(id);
	}

	@Override
	public void updatePeople(People people) {
		peopleDAO.updatePeople(people);
	}

	@Override
	public People getPeopleById(int id) {
		return peopleDAO.getPeopleById(id);
	}


}
