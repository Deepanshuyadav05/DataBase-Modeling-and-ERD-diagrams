CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY ,
  name VARCHAR(20),
  speciality VARCHAR(50),
  experience INTEGER,
  education VARCHAR(100),
  sitting_time VARCHAR(50),

  createdAt timestamp,
  updatedAt timestamp
);

CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20),
  email VARCHAR(65),
  phone VARCHAR(12),
  address TEXT,
  dob Date,

  createdAt timestamp,
  updatedAt timestamp

);

CREATE TABLE appointments
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER,
  patient_id INTEGER ,
  appointment_date Date,
  status ENUM('pending', 'confirmed', 'cancelled'),

  createdAt timestamp,
  updatedAt timestamp,

  FOREIGN KEY (patient_id) REFERENCES patients(id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

CREATE TABLE consultations
(
  id SERIAL PRIMARY KEY,
  appointment_id INTEGER NULL,
  visit_date Date,
  followup_date Date,
  consultation_fee DECIMAL(10,2),
  prescription TEXT,
  diagnosis TEXT,
  symptoms TEXT,

  createdAt timestamp,
  updatedAt timestamp,

  FOREIGN KEY (appointment_id) REFERENCES appointments(id)
);

CREATE TABLE test_catalog
(
  id SERIAL PRIMARY KEY,
  test_name VARCHAR(50),
  price DECIMAL(10,2),
  description TEXT,

  createdAt timestamp,
  updatedAt timestamp
);

CREATE TABLE ordered_diagnostic_tests
(
  id SERIAL PRIMARY KEY,
  test_catalog_id INTEGER,
  consultation_id INTEGER,
  price_at_order DECIMAL(10,2),
  status ENUM('pending', 'completed'),
  ordered_date Date,

  createdAt timestamp,
  updatedAt timestamp,

  FOREIGN KEY (test_catalog_id) REFERENCES test_catalog(id),
  FOREIGN KEY (consultation_id) REFERENCES consultations(id)
);

CREATE TABLE reports
(
  id SERIAL PRIMARY KEY,
  diagnosis_test_id INTEGER ,
  result TEXT,
  report_date Date,
  collected_date Date,

  createdAt timestamp,
  updatedAt timestamp,

  FOREIGN KEY (diagnosis_test_id) REFERENCES ordered_diagnostic_tests(id)

);

CREATE TABLE payments
(
  id SERIAL PRIMARY KEY,
  ordered_diagnostic_tests INTEGER NULL,
  consultation_id INTEGER NULL,
  payment_method ENUM('UPI', 'cash', 'card'),
  status ENUM('pending', 'failed', 'completed'),
  payment_date Date,

  createdAt timestamp,
  updatedAt timestamp,

  FOREIGN KEY (ordered_diagnostic_tests) REFERENCES ordered_diagnostic_tests(id),
  FOREIGN KEY (consultation_id) REFERENCES consultations(id),

    --constraint to check atlest 1 out of appointment or test will get the payment
  CONSTRAINT chk_payment_target CHECK ((ordered_diagnostic_tests IS NOT NULL AND consultation_id IS NULL ) OR (ordered_diagnostic_tests IS NULL AND consultation_id IS NOT NULL ))
);


