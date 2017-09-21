package guesthouse.domain.repository;

import java.util.List;

import guesthouse.domain.UserRole;

public interface UserRoleRepository {
	
	void addUserRole(UserRole role);
	UserRole getUserRoleByClientId(String clientId);
	void deleteUserRole(UserRole userRole);
	List<UserRole> getAllRoles();

}
