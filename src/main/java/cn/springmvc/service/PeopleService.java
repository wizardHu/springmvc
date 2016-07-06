package cn.springmvc.service;

import java.util.List;

import cn.springmvc.model.People;


public interface PeopleService {

	public int insertPeople(People people);
	public List<People> showPeopleList(int page);
	public int pageCount();
}
