package com.chan.erpmodel.users.service;

import com.chan.erpmodel.users.dao.SysUserDao;
import com.chan.erpmodel.users.dao.SysUserDaoImp;
import com.chan.erpmodel.users.domain.SysUser;

public class SysUserServiceImp implements SysUserService {
    @Override
    public SysUser validateLogin(SysUser loginUser) {
        SysUserDao sysUserDao = new SysUserDaoImp();
        return sysUserDao.validateLoginUser(loginUser);
    }
}
