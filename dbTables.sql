CREATE DATABASE hospital_appointment_system;

USE hospital_appointment_system;

CREATE TABLE `login` (
                         `login_id` int NOT NULL AUTO_INCREMENT,
                         `username` varchar(200) NOT NULL,
                         `password` varchar(200) NOT NULL,
                         `role` varchar(200) NOT NULL,
                         PRIMARY KEY (`login_id`),
                         UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

CREATE TABLE `admins` (
                          `admin_id` int NOT NULL AUTO_INCREMENT,
                          `login_id` int DEFAULT NULL,
                          `cin` varchar(200) NOT NULL,
                          `first_name` varchar(200) NOT NULL,
                          `last_name` varchar(200) NOT NULL,
                          `email` varchar(200) NOT NULL,
                          `tele` varchar(14) NOT NULL,
                          PRIMARY KEY (`admin_id`),
                          UNIQUE KEY `cin` (`cin`),
                          UNIQUE KEY `login_id` (`login_id`),
                          CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- the hash is "password" encrypted using sha-256 and output in base64 format
INSERT INTO `hospital_appointment_system`.`login` (`login_id`, `username`, `password`, `role`) VALUES (1, 'doe', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 'admin');

INSERT INTO `hospital_appointment_system`.`admins` (`admin_id`, `login_id`, `cin`, `first_name`, `last_name`, `email`, `tele`) VALUES (1, 1, 'je000000', 'john', 'doe', 'doe@gmail.com', '0612033051');

CREATE TABLE `secretaries` (
                               `secretary_id` int NOT NULL AUTO_INCREMENT,
                               `login_id` int DEFAULT NULL,
                               `cin` varchar(200) NOT NULL,
                               `first_name` varchar(200) NOT NULL,
                               `last_name` varchar(200) NOT NULL,
                               `email` varchar(200) NOT NULL,
                               `tele` varchar(14) NOT NULL,
                               PRIMARY KEY (`secretary_id`),
                               UNIQUE KEY `cin` (`cin`),
                               UNIQUE KEY `login_id` (`login_id`),
                               CONSTRAINT `secretaries_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

CREATE TABLE `patients` (
                            `patient_id` int NOT NULL AUTO_INCREMENT,
                            `cin` varchar(200) NOT NULL,
                            `first_name` varchar(200) NOT NULL,
                            `last_name` varchar(200) NOT NULL,
                            `email` varchar(200) NOT NULL,
                            `tele` varchar(14) NOT NULL,
                            PRIMARY KEY (`patient_id`),
                            UNIQUE KEY `cin` (`cin`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

CREATE TABLE `doctors` (
                           `doctor_id` int NOT NULL AUTO_INCREMENT,
                           `cin` varchar(200) NOT NULL,
                           `first_name` varchar(200) NOT NULL,
                           `last_name` varchar(200) NOT NULL,
                           `email` varchar(200) NOT NULL,
                           `tele` varchar(14) NOT NULL,
                           `speciality` varchar(200) NOT NULL,
                           `registration_num` int NOT NULL,
                           PRIMARY KEY (`doctor_id`),
                           UNIQUE KEY `cin` (`cin`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

CREATE TABLE `appointments` (
                                `appointment_id` int NOT NULL AUTO_INCREMENT,
                                `patient_id` int NOT NULL,
                                `doctor_id` int NOT NULL,
                                `appointment_date` date NOT NULL,
                                `appointment_time` time NOT NULL,
                                `appointment_status` varchar(200) NOT NULL,
                                `appointment_room` varchar(200) NOT NULL,
                                PRIMARY KEY (`appointment_id`),
                                KEY `fk_appointments_patient_id` (`patient_id`),
                                KEY `fk_appointments_doctor_id` (`doctor_id`),
                                CONSTRAINT `fk_appointments_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
                                CONSTRAINT `fk_appointments_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;