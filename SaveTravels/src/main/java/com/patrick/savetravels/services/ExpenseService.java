package com.patrick.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.patrick.savetravels.models.Expense;
import com.patrick.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	public final ExpenseRepository expenseRepo;
	public ExpenseService(ExpenseRepository expenseRepo) {
		this.expenseRepo = expenseRepo;
	}
	public List<Expense> allExpense(){
		return expenseRepo.findAll();
	}
	public Expense addExpense(Expense expense) {
		return expenseRepo.save(expense);
	}
	public Expense getOne(Long id) {
		Optional<Expense> optionalExpense = expenseRepo.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		}
		return null;
	}
	public Expense update(Expense expense) {
		return expenseRepo.save(expense);
	}

	public void delete(Long id) {
	expenseRepo.deleteById(id);
	}
}
