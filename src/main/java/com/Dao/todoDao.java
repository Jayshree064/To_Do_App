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
	
//	create
	@Transactional
	public void save(Todo t) {
		this.hibernateTemplate.saveOrUpdate(t);
//		Integer i = (Integer)this.hibernateTemplate.save(t);
//		return i;
	}
	
//	get all data
	public List<Todo> getAll(){
		List<Todo> todos = this.hibernateTemplate.loadAll(Todo.class);
		return todos;
	}

//	delete 
	@Transactional
	public void deletetodo(int id) {
		Todo t = this.hibernateTemplate.load(Todo.class, id);
		this.hibernateTemplate.delete(t);
	}
	
//	get single todo
	public Todo getTodo(int todoId) {
		return this.hibernateTemplate.get(Todo.class, todoId);
	}
}
