package guesthouse.domain.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

import guesthouse.domain.Client;
import guesthouse.domain.UserRole;
import guesthouse.domain.repository.UserRoleRepository;
import guesthouse.service.ClientService;

@Repository
public class UserRoleRepositoryImpl implements UserRoleRepository {

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private ClientService clientService;
	
	@SuppressWarnings("unchecked")
	public void addUserRole(UserRole role) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(role);
	}
	
	public List<UserRole> getAllRoles() {
		Session session = this.sessionFactory.getCurrentSession();
		List<UserRole> roleList = session.createQuery("from UserRole").list();
		return roleList;
	}
	
	public UserRole getUserRoleByClientId(String clientId) {
		int id = Integer.valueOf(clientId);
		UserRole userRole = new UserRole();
		List<UserRole> roleList = getAllRoles();
		for (UserRole ur : roleList) {
			if(ur.getClientLogin().equals(clientService.findClientById(id).getClientLogin())) {
				userRole = ur;
				break;
			}
		}
		return userRole;
	}
	
	public void deleteUserRole(UserRole userRole) {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(userRole);
	}
}
