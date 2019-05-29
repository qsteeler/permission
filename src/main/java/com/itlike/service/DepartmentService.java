package com.itlike.service;

import com.itlike.domain.Department;

import java.util.List;

/**
 * @Author Swipth
 * @Date 2019/2/18 11:47
 * @Description
 */
public interface DepartmentService {
    /*查询部门列表*/
    List<Department> getDepartmentList();

    /*根据部门名称查询部门id*/
    Long getDepartmentIdByName(String name);
}
