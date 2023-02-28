package com.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Todo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int todoId;
	private String todoTitle;
	private String description;
	private Date entryDate;
	public Todo(String todoTitle, String description, Date entryDate) {
		super();
		this.todoTitle = todoTitle;
		this.description = description;
		this.entryDate = entryDate;
	}
	
	public Todo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTodoTitle() {
		return todoTitle;
	}
	public void setTodoTitle(String todoTitle) {
		this.todoTitle = todoTitle;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getTodoTitle()+ ":" + this.getDescription();
	}
	
	
}
