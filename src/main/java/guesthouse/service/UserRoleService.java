package guesthouse.service;

import java.util.List;

import guesthouse.domain.UserRole;

public interface UserRoleService  {
	
	void addUserRole(UserRole role);
	UserRole getUserRoleByClientId(String clientId);
	void deleteUserRole(UserRole userRole);
	List<UserRole> getAllRoles();
}
