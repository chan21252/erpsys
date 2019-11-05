package com.chan.erpmodel.users.dao;

import com.chan.erpmodel.users.domain.Meeting;
import com.chan.erpmodel.util.DruidUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MeetingDaoImp implements MeetingDao {
    @Override
    public List<Meeting> queryAllMeeting() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT ID, TITLE, CONTENT, STARTDATE, DURATION, PARTICIPANT, ADDRESS, `STATUS`, DESCS FROM meeting";

        try {
            conn = DruidUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            List<Meeting> meetingList = new ArrayList<Meeting>();
            while (rs.next()) {
                Meeting meeting = new Meeting();
                meeting.setId(rs.getInt("ID"));
                meeting.setTitle(rs.getString("TITLE"));
                meeting.setContent(rs.getString("CONTENT"));
                meeting.setStartDate(rs.getTimestamp("STARTDATE"));
                meeting.setDuration(rs.getInt("DURATION"));
                meeting.setParticipant(rs.getString("PARTICIPANT"));
                meeting.setAddress(rs.getString("ADDRESS"));
                meeting.setStatus(rs.getInt("STATUS"));
                meeting.setDescs(rs.getString("DESCS"));
                meetingList.add(meeting);
            }

            return meetingList;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DruidUtil.close(conn, ps, rs);
        }
    }
}
