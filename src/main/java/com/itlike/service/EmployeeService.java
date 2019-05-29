package com.itlike.service;

import com.itlike.domain.Employee;
import com.itlike.domain.PageListRes;
import com.itlike.domain.QueryVo;

import java.util.List;

/**
 * @Author Swipth
 * @Date 2019/2/18 10:07
 * @Description
 */

public interface EmployeeService {
    PageListRes getEmployeeList(QueryVo vo);

    void saveEmployee(Employee employee);

    /*从excel中导入员工数据*/
    void saveEmployeeFromExcel(Employee employee);

    void updateEmployee(Employee employee);

    void updateState(Long id);
    /*根据用户名当中查询有没有当前用户*/
    Employee getEmployeeWithUserName(String username);

    /*根据用户的id查询角色编号名称*/
    List<String> getRolesById(Long id);

    /*根据用户的id查询权限 资源名称*/
    List<String> getPermissionById(Long id);

    /*查询所有员工信息不分页*/
    List<Employee> getAllEmployees();
}
