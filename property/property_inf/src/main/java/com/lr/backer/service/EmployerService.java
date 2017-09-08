package com.lr.backer.service;
import java.util.List;
import java.util.Map;

public interface EmployerService {
	//修改抢单状态
	void updateApplyOrderinfo(Map<String, Object> data);
	//查询封杀列表
	List<Map<String, Object>> getKillList(Map<String, Object> data);
	
	void updateApplyOrder(Map<String, Object> data);
	//查询项目图片
	List<Map<String, Object>> getProjectPicture(Map<String, Object> data);
	//添加分享记录
	void insertShareRecore(Map<String, Object> data);
	//订单信息
	Map<String, Object> getOrderInfo(Map<String, Object> data);
	//修改订单信息
	int updateorderInfo(Map<String, Object> data);
	//查询已经过了时间的订单
	List<Map<String, Object>> getOutTimeOrder();
	//抢单详情（招工）
	Map<String, Object> getApplyJobDetail(Map<String, Object> data);
	//抢单详情（项目）
	Map<String, Object> getApplyProjectDetail(Map<String, Object> data);
	//查看通知了多少人
	int getnoticenum(Map<String, Object> data);
	//申请记录列表
	List<Map<String, Object>> getApplyOrder(Map<String, Object> data);
	//项目通知表
	int insertprojectMessage(Map<String, Object> data);
	//通知 对象的列表
	List<Map<String, Object>> getMemberListByinfo(Map<String, Object> data);
	//发布项目的信息
	Map<String,Object> getProjectInfo(Map<String, Object> data);
	//添加到记录表
	int insertprojectjob(Map<String, Object> data);
	//发布招工 最近10个项目
	List<Map<String, Object>> getTopTenproject(Map<String, Object> data);
	//添加到项目图片表
	String insertProjectImg(Map<String, Object> data);
	//添加到图片表
	String insertImg(Map<String, Object> data);
	//发布招工
	String insertJob(Map<String, Object> data);
	//发布项目
	String insertProject(Map<String, Object> data);
}
