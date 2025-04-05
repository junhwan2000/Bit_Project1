package securitydb;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.Optional;
@Mapper
public interface UserMapper {    
	/*
	@Select( "SELECT user_id, passwd, nickname, email, created_at FROM Users WHERE user_id = #{userId}" )
	@Results( {
		@Result(property = "userId", column = "user_id" ),
		@Result(property = "passwd", column = "passwd" ),
		@Result(property = "nickname", column = "nickname" ),
		@Result(property = "email", column = "email" ),
		@Result(property = "createdAt", column = "created_at" ),
	})
	*/
	Optional<User> findByUserId( String userId );
	int insertUser( User user );
}
