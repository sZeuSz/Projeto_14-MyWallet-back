CREATE TABLE users (
	"id" serial NOT NULL,
	"name" char(255) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE sessions (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"user_name" TEXT,
	"token" TEXT NOT NULL,
	CONSTRAINT "sessions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE transactions (
    "id" serial NOT NULL,
    "user_id" integer,
    "value" numeric,
    "description" TEXT,
    "date" date,
    CONSTRAINT "transactions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE sessions ADD CONSTRAINT "sessions_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE transactions ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");





