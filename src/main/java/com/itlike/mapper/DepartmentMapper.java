package com.itlike.mapper;

import com.itlike.domain.Department;
import com.itlike.domain.QueryVo;

import java.util.List;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Department record);

    Department selectByPrimaryKey(Long id);

    List<Department> selectAll();

    int updateByPrimaryKey(Department record);

    Long getDepartmentIdByName(String name);
}