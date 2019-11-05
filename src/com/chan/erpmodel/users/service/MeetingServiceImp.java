package com.chan.erpmodel.users.service;

import com.chan.erpmodel.users.dao.MeetingDao;
import com.chan.erpmodel.users.dao.MeetingDaoImp;
import com.chan.erpmodel.users.domain.Meeting;

import java.util.List;

public class MeetingServiceImp implements MeetingService {
    @Override
    public List<Meeting> queryAllMeeting() {
        MeetingDao meetingDao = new MeetingDaoImp();
        return meetingDao.queryAllMeeting();
    }
}
