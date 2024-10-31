CREATE SCHEMA IF NOT EXISTS `goorm` DEFAULT CHARACTER SET utf8mb4;

GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
GRANT ALL ON goorm.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

USE `goorm`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `token` varchar(100) NOT NULL,
    `name` varchar(100) NOT NULL,
    `address` varchar(100) NOT NULL,
    `phone_number` varchar(100) NOT NULL,
    `role` varchar(100),
    `created_at` datetime not null default CURRENT_TIMESTAMP,
    `updated_at` datetime not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX idx_user (`id`, `token`, `role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO user (`token`,`name`,`address`,`phone_number`,`role`) VALUES ('ThisIsToken', '스타벅스', '제주특별자치도 제주시', '010-1111-2222', '사장님');



DROP TABLE IF EXISTS `collect_rule`;
CREATE TABLE `collect_rule`
(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `cafe_id` int(11) NOT NULL,
    `weekday` int(10) NOT NULL,
    `time` varchar(5) NOT NULL,
    `amount` int(11) NOT NULL,
    `position` varchar(100) NOT NULL,
    `created_at` datetime not null default CURRENT_TIMESTAMP,
    `updated_at` datetime not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX idx_collect_rule (`id`, `cafe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO collect_rule (`cafe_id`,`weekday`,`time`,`amount`,`position`) VALUES (10, 1, '09:00', 10, '문 밖');
INSERT INTO collect_rule (`cafe_id`,`weekday`,`time`,`amount`,`position`) VALUES (10, 5, '09:00', 10, '문 밖');
INSERT INTO collect_rule (`cafe_id`,`weekday`,`time`,`amount`,`position`) VALUES (11, 2, '09:00', 20, '기타');
INSERT INTO collect_rule (`cafe_id`,`weekday`,`time`,`amount`,`position`) VALUES (12, 3, '09:00', 20, '직접 전달');
INSERT INTO collect_rule (`cafe_id`,`weekday`,`time`,`amount`,`position`) VALUES (12, 4, '09:00', 20, '직접 전달');
INSERT INTO collect_rule (`cafe_id`,`weekday`,`time`,`amount`,`position`) VALUES (12, 6, '09:00', 10, '직접 전달');


DROP TABLE IF EXISTS `collect_transaction`;
CREATE TABLE `collect_transaction`
(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `cafe_id` int(11) NOT NULL,
    `client_name` varchar(100) NOT NULL,
    `time` datetime NOT NULL,
    `amount` int(11) NOT NULL,
    `status` varchar(100),
    `created_at` datetime not null default CURRENT_TIMESTAMP,
    `updated_at` datetime not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX idx_collect_transaction (`id`, `cafe_id`, `time`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO collect_transaction (`cafe_id`,`client_name`,`time`,`amount`,`status`) VALUES (10, 'ABC 양로원', '2024-10-01T09:00:00.000000+09:00', 10, 'COMPLETED');
INSERT INTO collect_transaction (`cafe_id`,`client_name`,`time`,`amount`,`status`) VALUES (10, 'ABC 양로원', '2024-10-02T09:00:00.000000+09:00', 10, 'COMPLETED');
INSERT INTO collect_transaction (`cafe_id`,`client_name`,`time`,`amount`,`status`) VALUES (10, 'ABC 양로원', '2024-10-03T09:00:00.000000+09:00', 10, 'COMPLETED');
INSERT INTO collect_transaction (`cafe_id`,`client_name`,`time`,`amount`,`status`) VALUES (10, 'ABC 양로원', '2024-11-01T09:00:00.000000+09:00', 10, 'READY');
INSERT INTO collect_transaction (`cafe_id`,`client_name`,`time`,`amount`,`status`) VALUES (10, 'ABC 양로원', '2024-11-03T09:00:00.000000+09:00', 10, 'WAITING');
INSERT INTO collect_transaction (`cafe_id`,`client_name`,`time`,`amount`,`status`) VALUES (11, 'ABC 양로원', '2024-10-05T09:00:00.000000+09:00', 10, 'COMPLETED');
INSERT INTO collect_transaction (`cafe_id`,`client_name`,`time`,`amount`,`status`) VALUES (11, 'ABC 양로원', '2024-10-06T09:00:00.000000+09:00', 10, 'COMPLETED');
INSERT INTO collect_transaction (`cafe_id`,`client_name`,`time`,`amount`,`status`) VALUES (12, 'ABC 양로원', '2024-11-07T09:00:00.000000+09:00', 10, 'WAITING');
