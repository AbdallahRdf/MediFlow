CREATE DATABASE hospital_appointment_system;

USE hospital_appointment_system;

CREATE TABLE `login` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `username` varchar(200) NOT NULL,
                         `password` varchar(200) NOT NULL,
                         `role` varchar(200) NOT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `admins` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `login_id` int DEFAULT NULL,
                          `cin` varchar(200) NOT NULL,
                          `first_name` varchar(200) NOT NULL,
                          `last_name` varchar(200) NOT NULL,
                          `email` varchar(200) NOT NULL,
                          `tele` varchar(14) NOT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `cin` (`cin`),
                          UNIQUE KEY `login_id` (`login_id`),
                          CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- the hash is "password" encrypted using sha-256 and output in base64 format
INSERT INTO `hospital_appointment_system`.`login` (`username`, `password`, `role`) VALUES ('doe', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=', 'admin');

INSERT INTO `hospital_appointment_system`.`admins` (`login_id`, `cin`, `first_name`, `last_name`, `email`, `tele`) VALUES (1, 'je000000', 'john', 'doe', 'doe@gmail.com', '0612033051');

CREATE TABLE `secretaries` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `login_id` int DEFAULT NULL,
                               `cin` varchar(200) NOT NULL,
                               `first_name` varchar(200) NOT NULL,
                               `last_name` varchar(200) NOT NULL,
                               `email` varchar(200) NOT NULL,
                               `tele` varchar(14) NOT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `cin` (`cin`),
                               UNIQUE KEY `login_id` (`login_id`),
                               CONSTRAINT `secretaries_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patients` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `cin` varchar(200) NOT NULL,
                            `first_name` varchar(200) NOT NULL,
                            `last_name` varchar(200) NOT NULL,
                            `email` varchar(200) NOT NULL,
                            `tele` varchar(14) NOT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `cin` (`cin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `doctors` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `cin` varchar(200) NOT NULL,
                           `first_name` varchar(200) NOT NULL,
                           `last_name` varchar(200) NOT NULL,
                           `email` varchar(200) NOT NULL,
                           `tele` varchar(14) NOT NULL,
                           `speciality` varchar(200) NOT NULL,
                           `registration_num` int NOT NULL,
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `cin` (`cin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `appointments` (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `patient_id` int NOT NULL,
                                `doctor_id` int NOT NULL,
                                `appointment_date` date NOT NULL,
                                `appointment_time` time NOT NULL,
                                `appointment_status` varchar(200) NOT NULL,
                                `appointment_room` varchar(200) NOT NULL,
                                PRIMARY KEY (`id`),
                                KEY `fk_appointments_patient_id` (`patient_id`),
                                KEY `fk_appointments_doctor_id` (`doctor_id`),
                                CONSTRAINT `fk_appointments_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT `fk_appointments_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;