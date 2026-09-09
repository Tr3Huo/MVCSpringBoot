package vn.iotstar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.entity.User;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    
    @Query("SELECT u FROM User u WHERE u.isDeleted = false OR u.isDeleted IS NULL")
    List<User> findActiveUsers();

    @Query("SELECT u FROM User u WHERE u.isDeleted = true")
    List<User> findDeletedUsers();

    @Query("SELECT u FROM User u WHERE (u.isDeleted = false OR u.isDeleted IS NULL) AND (LOWER(u.username) LIKE LOWER(CONCAT('%', :keyword, '%')) OR LOWER(u.fullName) LIKE LOWER(CONCAT('%', :keyword, '%')))")
    List<User> searchActiveUsers(@Param("keyword") String keyword);
}
