package com.ispan.eeit64.repository.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.repository.UniversalCustomRepository;

@Repository
@Transactional
public class universalCustomDaoImpl implements UniversalCustomRepository {
	@PersistenceContext
	EntityManager em;
	
	@Override
	public void resetAutoId(String tableName) {
		System.out.println("resetId");
		em.createNativeQuery("ALTER TABLE "+tableName+" AUTO_INCREMENT = 1")
		  .executeUpdate();
	}
}
