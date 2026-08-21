CREATE TABLE users
(
    id        SERIAL PRIMARY KEY,
    name      VARCHAR(50),
    email     VARCHAR(165) UNIQUE,
    phone     VARCHAR(12) UNIQUE,
    role      ENUM('trainer', 'client') DEFAULT 'client',

    createdAt timestamp,
    updatedAt timestamp
)

CREATE TABLE plans
(
    id          SERIAL PRIMARY KEY,
    duration    VARCHAR(50),
    cost        DECIMAL(10, 2),
    plan_checkI ENUM('weekly', 'monthly', 'alternate_days') DEFAULT 'weekly',
    plan_type   ENUM('diet_plan', 'workout_plan', 'diet_and_workout_plan'),

    createdAt timestamp,
    updatedAt timestamp
)

CREATE TABLE enrollments
(
    id         SERIAL PRIMARY KEY,
    client_id  INTEGER,
    trainer_id INTEGER,
    plan_id    INTEGER,
    start_date Date,
    end_date   VARCHAR(10),

    createdAt  timestamp,
    updatedAt  timestamp,

    FOREIGN KEY (client_id) REFERENCES users (id),
    FOREIGN KEY (trainer_id) REFERENCES users (id),
    FOREIGN KEY (plan_id) REFERENCES plans (id),

)

CREATE TABLE sessions
(
    id            SERIAL PRIMARY KEY,
    trainer_id    INTEGER fk,
    client_id     INTEGER fk,
    enrollment_id INTEGER fk NULL,
    status        ENUM('scheduled','re_scheduled','cancelled','completed') DEFAULT 'scheduled',
    schedule_at   Date,
    duration      INTEGER,

    createdAt     timestamp,
    updatedAt     timestamp,

    FOREIGN KEY (client_id) REFERENCES users (id),
    FOREIGN KEY (trainer_id) REFERENCES users (id),
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(id),

)

CREATE TABLE check_in
(
    id            SERIAL PRIMARY KEY,
    enrollment_id INTEGER fk,
    client_id     INTEGER fk,
    weight        DECIMAL(5, 2),
    note          TEXT,
    measurements  VARCHAR(20),
    checkIn_date  Date,

    createdAt     timestamp,
    updatedAt     timestamp,

    FOREIGN KEY (enrollment_id) REFERENCES enrollments(id),
  FOREIGN KEY (client_id) REFERENCES users (id),

)

CREATE TABLE notes
(
    id         SERIAL PRIMARY KEY,
    trainer_id INTEGER,
    client_id  INTEGER,
    note       TEXT,

    createdAt  timestamp,
    updatedAt timestamp,

    FOREIGN KEY (client_id) REFERENCES users (id),
    FOREIGN KEY (trainer_id) REFERENCES users (id),

)

CREATE TABLE payments
(
    id             SERIAL PRIMARY KEY,
    enrollment_id  INTEGER NULL,
    session_id     INTEGER NULL,
    payment        DECIMAL(10, 2),
    payment_date   Date,
    status         ENUM('pending','completed','failed') DEFAULT 'pending',
    payment_method ENUM('UPI', 'card', 'cash', 'net_banking'),

    createdAt      timestamp,
    updatedAt      timestamp,

     FOREIGN KEY (enrollment_id) REFERENCES enrollments(id),
     FOREIGN KEY (session_id) REFERENCES sessions(id),

    --constraint to verify least 1 of enrolment and session id in not null to avoid ghost payments
    --'num_nonnulls' is Pg function to check it return the number equivalent to total non-null values inside it
    --like here if both are present then it return 2 if any one is present then it return 1 and if both are present then it will return 0
    --if we want to do it without inbuild function then we can do it like this:
    --CHECK ((enrollment_id IS NOT NULL AND session_id IS NULL) OR (enrollment_id IS NULL AND session_id IS NOT NULL))
    CONSTRAINT chk_payment_target CHECK (num_nonnulls(enrollment_id, session_id) = 1)
)






