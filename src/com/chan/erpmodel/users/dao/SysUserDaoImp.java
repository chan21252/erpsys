package com.chan.erpmodel.users.dao;

import com.chan.erpmodel.users.domain.SysUser;
import com.chan.erpmodel.util.DruidUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SysUserDaoImp implements SysUserDao {
    @Override
    public SysUser validateLoginUser(SysUser loginUser) {
        String sql = "SELECT ID, NAME, PASSWORD, GRANTED, EMPID, LASTTIME, ROLES FROM sysusers " +
                "WHERE NAME=? AND PASSWORD=?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SysUser sysUser = null;
        try {
            conn = DruidUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, loginUser.getName());
            ps.setString(2, loginUser.getPassword());

            rs = ps.executeQuery();
            while (rs.next()) {
                sysUser = new SysUser();
                sysUser.setId(rs.getString("ID"));
                sysUser.setName(rs.getString("NAME"));
                sysUser.setGranted(rs.getInt("GRANTED"));
                sysUser.setEmpId(rs.getString("EMPID"));
                sysUser.setTimestamp(rs.getTimestamp("LASTTIME"));
                sysUser.setRole(rs.getString("ROLES"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DruidUtil.close(conn, ps, rs);
        }

        return sysUser;
    }
}
