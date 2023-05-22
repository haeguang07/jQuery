package com.yedam.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.yedam.common.DataSource;

public class SampleExe {

	public static void main(String[] args) {
		SqlSessionFactory sqlSessionFactory = DataSource.getInstance();
		
		try (SqlSession session = sqlSessionFactory.openSession(true)) {
			  Employee emp = session.selectOne("com.yedam.common.NoticeMapper.getEmp", 200);
			  System.out.println(emp);
			 //session.delete("com.yedam.common.NoticeMapper.delEmp",300);
			  Employee emp2 = new Employee();
			  emp2.setLastName("Hong");
			  emp2.setEmail("Homnga@eamil");
			  emp2.setJobId("IT_PROG");
			  session.insert("com.yedam.common.NoticeMapper.addEmp",emp2);
			  List<Employee> list =session.selectList("com.yedam.common.NoticeMapper.EmpList");
			  for (Employee emp1 :list) {
				  System.out.println(emp1);
			  }
			  
			}
		

	}

}
