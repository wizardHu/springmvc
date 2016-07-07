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

	/**
	 * 删除记录
	 */
	public void delPeople(@Param(value="id") int id);
	
	/**
	 * 得到people
	 * @param id
	 * @return
	 */
	public People getPeopleById(@Param(value="id") int id);
	
	/**
	 * 更新
	 */
	public void updatePeople(People people);
	
}
