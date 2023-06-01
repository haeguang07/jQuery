package com.yedam;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TodoMapper {
	public List<ToDoVO> selectToDo();
	public int insertTodo(String todoTitle);
	public int selectMaxNo();
	public int deleteTodo(int todoNo);
	public int updateTodo(@Param("status")String status,@Param("todoNo") int todoNo);

}
