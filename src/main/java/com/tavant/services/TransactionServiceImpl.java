package com.tavant.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tavant.db.impl.TransactionDAO;
import com.tavant.domain.Transaction;

@Service("transactionService")
public class TransactionServiceImpl implements TransactionService {
	private TransactionDAO transactionDAO;

	@Autowired
	public void setTransactionDAO(TransactionDAO transactionDAO) {
		this.transactionDAO = transactionDAO;
	}

	@Override
	public void addTransaction(Transaction transaction) {
		transactionDAO.insert(transaction);
	}

	@Override
	public List<Transaction> selectAll(int userId) {
		return transactionDAO.selectAll(userId);
	}

	@Override
	public void deleteTransaction(int id) {
		transactionDAO.delete(id);
	}

	@Override
	public int[] getTotalAmounts(int userId) {
		int [] totalAmount = new int[] {transactionDAO.toGive(userId), transactionDAO.toCollect(userId)};
		return totalAmount;
	}

}
