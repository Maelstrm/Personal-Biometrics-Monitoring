--Setup
CREATE TABLE "Users" (
	"user_id" SERIAL,
	"first_name" TEXT NOT NULL,
	"last_name" TEXT NOT NULL,
	"birthday_date" DATE NOT NULL,
	"sex" TEXT NOT NULL,
	"gender" TEXT NOT NULL,
	"height" FLOAT NOT NULL,
	"weight" FLOAT NOT NULL,
	CONSTRAINT "User_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "Sessions" (
	"user_id" INTEGER NOT NULL,
	"session_id" SERIAL,
	CONSTRAINT "Sessions_pk" PRIMARY KEY ("session_id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "Session_Meta_Data" (
	"session_id" INTEGER NOT NULL,
	"start_time" TIMESTAMP NOT NULL,
	"end_time" TIMESTAMP NOT NULL,
	"power_source" TEXT NOT NULL,
	"user_comments" JSON,
	CONSTRAINT "Session_Meta_Data_pk" PRIMARY KEY ("session_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "EEG_Data" (
	"session_id" INTEGER NOT NULL,
	"record" JSON
) WITH (
  OIDS=FALSE
);



CREATE TABLE "PO_Data" (
	"session_id" TEXT NOT NULL,
	"record" JSON
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ECG_Data" (
	"session_id" TEXT NOT NULL,
	"record" JSON
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Sessions" ADD CONSTRAINT "Sessions_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");

ALTER TABLE "Session_Meta_Data" ADD CONSTRAINT "Session_Meta_Data_fk0" FOREIGN KEY ("session_id") REFERENCES "Sessions"("session_id");

ALTER TABLE "EEG_Data" ADD CONSTRAINT "EEG_Data_fk0" FOREIGN KEY ("session_id") REFERENCES  "Sessions"("session_id");

ALTER TABLE "PO_Data" ADD CONSTRAINT "PO_Data_fk0" FOREIGN KEY ("session_id") REFERENCES  "Sessions"("session_id");

ALTER TABLE "ECG_Data" ADD CONSTRAINT "ECG_Data_fk0" FOREIGN KEY ("session_id") REFERENCES  "Sessions"("session_id");

-- Add new User
INSERT INTO "Users" (first_name, last_name, birthday_date, sex, gender, height, weight)
VALUES('Jakeh', 'Clark', date '1989-10-01', 'male', 'non-binary', '182', '77.11' );

-- Add new Session
INSERT INTO "Sessions" (user_id)
VALUES(1)
RETURNING session_id;

-- Add new Session_Meta_Data
INSERT INTO "Session_Meta_Data" (session_id, start_time, end_time, power_source, user_comments)
VALUES(1, date '2020-05-01 12:00', date '2020-05-01 12:15', 'usb', '{"body": "", "mind": ""}');

	
