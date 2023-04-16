CREATE TABLE "Event" (
  "ID"  serial  NOT NULL  UNIQUE,
  "name"  varchar  NOT NULL,
  "version"  varchar  NOT NULL,
  "release"  varchar,
  "platformID"  varchar,
  "package"  varchar  NOT NULL,
  "description"  varchar,
  "payload"  varchar,
  "gateID"  varchar,
  "success"  boolean  NOT NULL,
  CONSTRAINT Event_pk PRIMARY KEY ("ID", "name", "version", "package")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "Event_reciever" (
  "ID"  serial  NOT NULL  UNIQUE,
  "name"  varchar  NOT NULL,
  "event_type"  varchar  NOT NULL,
  "version"  varchar  NOT NULL  UNIQUE,
  "description"  varchar  NOT NULL,
  "enabled"  boolean  NOT NULL,
  CONSTRAINT Event_reciever_pk PRIMARY KEY ("ID", "name", "event_type", "version", "enabled")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "Event_reciever_group" (
  "ID"  serial  NOT NULL  UNIQUE,
  "name"  varchar,
  "version"  varchar,
  "enabled"  boolean  NOT NULL,
  CONSTRAINT Event_reciever_group_pk PRIMARY KEY ("ID", "enabled")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "Event_reciever_group_to_event_reciever" (
  "event_reciever_group"  serial,
  "event_reciever"  serial
) WITH (
  OIDS=FALSE
);


ALTER TABLE "Event" ADD CONSTRAINT "Event_fk0" FOREIGN KEY ("gateID") REFERENCES "Event_reciever"("ID");

ALTER TABLE "Event_reciever_group_to_event_reciever" ADD CONSTRAINT "Event_reciever_group_to_event_reciever_fk0" FOREIGN KEY ("event_reciever_group") REFERENCES "Event_reciever_group"("ID");

ALTER TABLE "Event_reciever_group_to_event_reciever" ADD CONSTRAINT "Event_reciever_group_to_event_reciever_fk1" FOREIGN KEY ("event_reciever") REFERENCES "Event_reciever"("ID");
