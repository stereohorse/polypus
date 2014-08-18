CREATE TABLE journals (
  id SERIAL NOT NULL,
  name VARCHAR(255) UNIQUE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE priorities (
  id SERIAL NOT NULL,
  name VARCHAR(255) UNIQUE NOT NULL,
  value VARCHAR(255) UNIQUE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE statuses (
  id SERIAL NOT NULL,
  name VARCHAR(255) UNIQUE NOT NULL,
  value VARCHAR(255) UNIQUE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE steps (
  id SERIAL NOT NULL,
  assignee VARCHAR(255),
  date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(255) NOT NULL,
  priority INT4 NOT NULL,
  status INT4 NOT NULL,
  task INT4 NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tasks (
  id SERIAL NOT NULL,
  date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(255) NOT NULL,
  journal INT4 NOT NULL,
  priority INT4 NOT NULL,
  status INT4 NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE steps
  ADD CONSTRAINT step_priority
  FOREIGN KEY (priority)
  REFERENCES priorities;

ALTER TABLE steps
  ADD CONSTRAINT step_task
  FOREIGN KEY (task)
  REFERENCES tasks;

ALTER TABLE steps
  ADD CONSTRAINT step_status
  FOREIGN KEY (status)
  REFERENCES statuses;

ALTER TABLE tasks
  ADD CONSTRAINT task_priority
  FOREIGN KEY (priority)
  REFERENCES priorities;

ALTER TABLE tasks
  ADD CONSTRAINT task_status
  FOREIGN KEY (status)
  REFERENCES statuses;

ALTER TABLE tasks
  ADD CONSTRAINT task_journal
  FOREIGN KEY (journal)
  REFERENCES journals;


INSERT INTO priorities (name, value)
VALUES ('medium', 'MEDIUM');

INSERT INTO statuses (name, value)
VALUES ('open', 'OPEN');