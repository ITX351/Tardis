class Notice < ActiveRecord::Base
	attr_accessible :admin_id, :infotype, :place_id, :temp_place_id, :user_id
	
	# infotype:
	# 0 提交一个新建地点的申请
	# 1 提交一个更新地点信息的申请
	# 2 一个新的地点被创建了, 创建者,审核者, 地点信息
	# 3 一个地点的信息被更新了, 更新者,审核者, 地点信息
	# 4 某人升级为了管理员了, 某人
end
