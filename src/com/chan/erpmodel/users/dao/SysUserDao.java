package com.chan.erpmodel.users.dao;

import com.chan.erpmodel.users.domain.SysUser;

/**
 * desc：用户数据操作接口
 *
 * @author CuiCan
 */
public interface SysUserDao {
    SysUser validateLoginUser(SysUser loginUser);
}
