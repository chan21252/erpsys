package com.chan.erpmodel.users.service;

import com.chan.erpmodel.users.domain.SysUser;

public interface SysUserService {
    SysUser validateLogin(SysUser loginUser);
}
