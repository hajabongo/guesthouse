package guesthouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import guesthouse.domain.UserRole;
import guesthouse.domain.repository.UserRoleRepository;
import guesthouse.service.UserRoleService;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserRoleServiceImpl implements UserRoleService {

	@Autowired
	private UserRoleRepository userRoleRepository;
	
	@Transactional(readOnly = false)
	public void addUserRole(UserRole role) {
		userRoleRepository.addUserRole(role);
	}
	
	@Transactional
	public UserRole getUserRoleByClientId(String clientId) {
		return userRoleRepository.getUserRoleByClientId(clientId);
	}
	
	
	@Transactional(readOnly = false)
	public void deleteUserRole(UserRole userRole) {
		userRoleRepository.deleteUserRole(userRole);
	}
	
	@Transactional
	public List<UserRole> getAllRoles() {
		return userRoleRepository.getAllRoles();
	}
}
