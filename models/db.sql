create database if not exists `photo_gallery`;

use `photo_gallery`;

create table if not exists `auth`
(
	id int primary key auto_increment,
	user_name varchar(16) unique not null,
	password varchar(255) not null,
	email varchar(128) not null,
	created_at timestamp default CURRENT_TIMESTAMP,
	updated_at timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) CHARSET=utf8mb4;

create table if not exists `bucket`
(
	id int primary key auto_increment,
	auth_id int,
	name varchar(64) not null,
	state tinyint(1) default 1,
	size int default 0,
	description text,
	created_at timestamp default CURRENT_TIMESTAMP,
	updated_at timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT UC_bucket UNIQUE(auth_id, name),
	INDEX idx_aid_name (auth_id, name)
) CHARSET=utf8mb4;

create table if not exists `photo`
(
	id int primary key auto_increment,
	bucket_id int,
	auth_id int,
	name varchar(255) not null,
	tag varchar(255),
	url varchar(255) not null,
	description text,
	state tinyint(1) default 1,
	created_at timestamp default CURRENT_TIMESTAMP,
	updated_at timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	constraint UC_photo UNIQUE(bucket_id, name),
	INDEX idx_bid_name (bucket_id, name)
) CHARSET=utf8mb4;
