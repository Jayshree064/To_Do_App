package com.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.entities.Todo;
@Component
public class todoDao {

	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int save(Todo t) {
		Integer i = (Integer)this.hibernateTemplate.save(t);
		return i;
	}
	
	public List<Todo> getAll(){
		List<Todo> todos = this.hibernateTemplate.loadAll(Todo.class);
		return todos;
		
	}
}
