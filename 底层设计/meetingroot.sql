CREATE TABLE user(
	id int not null primary key auto_increment comment '编号',
	name VARCHAR(20) not null comment '用户名 可以不是为真实姓名',
	phone VARCHAR(20) not null comment '手机号',
	email VARCHAR(100) not null comment '邮箱',
	password VARCHAR(100) not null comment '密码 加密',
	avatar VARCHAR(255) default 'default.jpg' comment '头像地址，没有就是默认头像,后期会修改',
	role tinyint default 1 comment '用户身份,权限后期给出'
) comment '用户表';


CREATE TABLE meetingroom(
	id int not null primary key auto_increment comment '编号',
	name VARCHAR(20) not null comment 'Eg:xx会议室',
	address VARCHAR(30) not null comment '会议室位置',
	volume tinyint not null comment'可容纳人数',
	is_using tinyint default 0 comment '0表示当前未使用',
	verify tinyint default 1 comment '0表示不需要，1表示需要'
);

CREATE TABLE meeting_apply(
	id int not null primary key auto_increment comment '编号',
	worker_id int not null comment '发起人id',
	topic VARCHAR(100) not null comment '会议主题',
	intro TEXT comment '会议说明',
	document_list Text comment'相关文件列表',
	room_id int not null comment'会议室id',
	attendance int not null comment'参加会议人数',
	begin_time timestamp default current_timestamp not null comment '开始时间',
	end_time timestamp default current_timestamp not null comment '结束时间',
	status tinyint default 0 comment'0未审核，1通过，2未通过',
	applytime timestamp default current_timestamp  comment '申请日期',
	apply_update_time timestamp default current_timestamp on update current_timestamp comment '修改日期'
);

CREATE TABLE attend_worders(
	id int not null primary key auto_increment comment '编号',
	meeting_id int not null comment'会议室id',
	worder_id int not null comment'员工id'
);