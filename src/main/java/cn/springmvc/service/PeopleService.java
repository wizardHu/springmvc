package cn.springmvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.springmvc.model.People;


public interface PeopleService {

	public int insertPeople(People people);
	public List<People> showPeopleList(int page);
	public int pageCount();
	public void delPeople(int id);
	public void updatePeople(People people);
	public People getPeopleById(@Param(value="id") int id);
}
