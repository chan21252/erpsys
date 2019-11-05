package com.chan.erpmodel.users.dao;

import com.chan.erpmodel.users.domain.Meeting;

import java.util.List;

public interface MeetingDao {
    List<Meeting> queryAllMeeting();
}
