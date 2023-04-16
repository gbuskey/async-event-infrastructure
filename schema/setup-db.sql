CREATE TABLE "Event" (
  "ID"  varchar  NOT NULL UNIQUE,
  "name"  varchar  NOT NULL,
  "version"  varchar  NOT NULL,
  "release"  varchar NOT NULL,
  "platformID"  varchar NOT NULL,
  "package"  varchar  NOT NULL,
  "description"  varchar NOT NULL,
  "payload"  varchar NOT NULL,
  "event_reciever_id"  varchar NOT NULL,
  "success"  boolean  NOT NULL,
  CONSTRAINT Event_pk PRIMARY KEY ("ID", "name", "version", "release", "package", "platformID")
);

CREATE TABLE "Event_reciever" (
  "ID"  varchar  NOT NULL  UNIQUE,
  "name"  varchar  NOT NULL,
  "type"  varchar  NOT NULL,
  "version"  varchar  NOT NULL  UNIQUE,
  "description"  varchar  NOT NULL,
  "enabled"  boolean  NOT NULL,
  CONSTRAINT Event_reciever_pk PRIMARY KEY ("ID", "name", "type", "version", "enabled")
);

CREATE TABLE "Event_reciever_group" (
  "ID"  varchar  NOT NULL  UNIQUE,
  "name"  varchar NOT NULL,
  "type" varchar NOT NULL,
  "version"  varchar NOT NULL,
  "enabled"  boolean  NOT NULL,
  CONSTRAINT Event_reciever_group_pk PRIMARY KEY ("ID", "type", "name", "version", "enabled")
);

CREATE TABLE "Event_reciever_group_to_event_reciever" (
  "event_reciever_group"  varchar,
  "event_reciever"  varchar,
  UNIQUE ("event_reciever_group", "event_reciever")
);


ALTER TABLE "Event" ADD CONSTRAINT "Event_fk0" FOREIGN KEY ("event_reciever_id") REFERENCES "Event_reciever"("ID");

ALTER TABLE "Event_reciever_group_to_event_reciever" ADD CONSTRAINT "Event_reciever_group_to_event_reciever_fk0" FOREIGN KEY ("event_reciever_group") REFERENCES "Event_reciever_group"("ID");

ALTER TABLE "Event_reciever_group_to_event_reciever" ADD CONSTRAINT "Event_reciever_group_to_event_reciever_fk1" FOREIGN KEY ("event_reciever") REFERENCES "Event_reciever"("ID");
