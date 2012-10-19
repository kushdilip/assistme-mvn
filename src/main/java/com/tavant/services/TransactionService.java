package com.tavant.services;

import java.util.List;

import com.tavant.domain.Transaction;

public interface TransactionService {
	public void addTransaction(Transaction transaction);
	public List<Transaction> selectAll(int userId);
	public void deleteTransaction(int id);
	public int[] getTotalAmounts(int userId);
}
