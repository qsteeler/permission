package com.itlike.mapper;

import com.itlike.domain.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Long rid);

    int insert(Role record);

    Role selectByPrimaryKey(Long rid);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

    /*保存角色与权限之间关系*/
    void insertRoleAndPermissionRel(@Param("rid") Long rid, @Param("pid") Long pid);

    /*打破角色与权限之间的关系*/
    void deletePermissionRel(Long rid);

    /*根据用户id查询对应的角色*/
    List<Long> getRoleWithId(Long id);
}