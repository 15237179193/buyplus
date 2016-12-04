create database buyplus charset=utf8;

use buyplus;
-- 会员表
create table tp_member
(
    member_id int unsigned auto_increment,  -- 主键
    email varchar(255) null default '', -- 邮箱
    telephone varchar(16) null default '', -- 电话
    password char(40) not null default '', -- 密码
    password_salt char(8) not null default '', -- 密码盐值
    nickname varchar(32) not null default '', -- 显示昵称
    gender enum('Male', 'Female', 'Secret') not null default 'Secret',
    newsletter tinyint not null default 0, -- 是否使用email订阅
    register_time int not null default 0, -- 注册时间
    primary key (member_id),
    index (email),
    index (telephone)
) charset=utf8;

-- 会员登录日志
create table tp_member_login_log
(
    member_login_log_id int unsigned auto_increment,
    member_id int unsigned not null default 0, -- 关联字段
    login_time int not null default 0, -- 时间
    login_ip int unsigned not null default 0, -- IP
    login_ua varchar(255) not null default '', -- user-agent
    primary key (member_login_log_id),
    index (member_id)
) charset=utf8;


-- 活动表
create table tp_event
(
    event_id int unsigned auto_increment,
    title varchar(128) not null default '',
    -- begin_time
    -- end_time
    primary key (event_id)
) charset=utf8;

-- 会员活动关联
create table tp_member_event
(
    member_event_id int unsigned auto_increment,
    member_id int unsigned not null default 0,
    event_id int unsigned not null default 0,
    primary key (member_event_id)
) charset=utf8;
