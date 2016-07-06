package cn.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.springmvc.model.People;


public interface PeopleDAO {

	/**
	 * 插入
	 * @param user
	 * @return
	 */
	public int insertPeople(People people);
	
	/**
	 * 分页
	 * @param page
	 * @return
	 */
	public List<People> showPeopleList(@Param(value="page") int page);
	
	/**
	 * 得到总页数
	 * @return
	 */
	public int pageCount();
	
	
}
