package com.itlike.service.impl;

import com.itlike.domain.Department;
import com.itlike.domain.QueryVo;
import com.itlike.mapper.DepartmentMapper;
import com.itlike.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {
    /*注入mapper*/
    @Autowired
    private DepartmentMapper departmentMapper;
    @Override
    public List<Department> getDepartmentList() {
        return departmentMapper.selectAll();
    }

    /*根据部门名称查询部门id*/
    @Override
    public Long getDepartmentIdByName(String name) {
        return departmentMapper.getDepartmentIdByName(name);
    }
}
