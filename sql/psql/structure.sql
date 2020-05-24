drop table "article";
drop table "clazz";
drop table "clazz_member";
drop table "collection";
drop table "comment";
drop table "course";
drop table "feed";
drop table "group_member";
drop table "group_subscriber";
drop table "groups";
drop table "keyword";
drop table "message";
drop table "orders";
drop table "orders_item";
drop table "paper";
drop table "paper_item";
drop table "question";
drop table "question_option";
drop table "quiz";
drop table "quiz_result";
drop table "quiz_result_item";
drop table "role";
drop table "tag";
drop table "tag_cached";
drop table "user";
drop table "user_file";
drop table "user_profile";

CREATE TABLE "article" (
  id SERIAL,
  "name" varchar(100) NOT NULL,
  "period" varchar(100),
  "course_id" int4 NOT NULL,
  "style" varchar(255),
  "html" text,
  "content" text,
  "seq" int4 NOT NULL,
  "level" int4,
  "creator_id" int4 ,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "parent_id" int4 NOT NULL,
  PRIMARY KEY ("id")
);
COMMENT ON COLUMN "article"."name" IS '节名称';
COMMENT ON COLUMN "article"."period" IS '课程周期';
COMMENT ON COLUMN "article"."course_id" IS '课程ID';
COMMENT ON COLUMN "article"."style" IS '内容格式';
COMMENT ON COLUMN "article"."html" IS '内容HTML缓存';
COMMENT ON COLUMN "article"."content" IS '节内容';
COMMENT ON COLUMN "article"."level" IS '层级';
COMMENT ON COLUMN "article"."creator_id" IS '创建者ID';
COMMENT ON COLUMN "article"."parent_id" IS '父ID';
COMMENT ON TABLE "article" IS '课程文章表';

CREATE TABLE "clazz" (
  id SERIAL,
  "name" varchar(30) NOT NULL,
  "start_date" date,
  "end_date" date,
  "master_name" varchar(30) NOT NULL,
  "master_id" int4 NOT NULL,
  "creator_id" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_26" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "clazz"."name" IS '班级名称';
COMMENT ON COLUMN "clazz"."start_date" IS '开始日期';
COMMENT ON COLUMN "clazz"."end_date" IS '结束日期';
COMMENT ON COLUMN "clazz"."master_name" IS '班主任姓名';
COMMENT ON COLUMN "clazz"."master_id" IS '班主任用户ID';
COMMENT ON COLUMN "clazz"."creator_id" IS '创建者ID';
COMMENT ON TABLE "clazz" IS '班级表';

CREATE TABLE "clazz_member" (
  id SERIAL,
  "user_id" int4 NOT NULL,
  "clazz_id" int4 NOT NULL,
  "join_date" date,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  CONSTRAINT "_copy_25" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "clazz_member"."user_id" IS '用户ID';
COMMENT ON COLUMN "clazz_member"."clazz_id" IS '班级ID';
COMMENT ON COLUMN "clazz_member"."join_date" IS '加入日期';
COMMENT ON TABLE "clazz_member" IS '班级成员表';

CREATE TABLE "collection" (
  id SERIAL,
  "user_id" int4 NOT NULL,
  "obj_type" varchar(255) NOT NULL,
  "obj_id" int4 NOT NULL,
  "memo" varchar(200) NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_24" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "collection"."user_id" IS '用户ID';
COMMENT ON COLUMN "collection"."obj_type" IS '类型';
COMMENT ON COLUMN "collection"."obj_id" IS '收藏对象ID';
COMMENT ON COLUMN "collection"."memo" IS '备注';
COMMENT ON COLUMN "collection"."created_at" IS '插入时间';
COMMENT ON TABLE "collection" IS '收藏表';

CREATE TABLE "comment" (
  id SERIAL,
  "obj_type" varchar(255) NOT NULL,
  "obj_id" int4 NOT NULL,
  "style" varchar(255) NOT NULL,
  "content" text,
  "img_urls" text,
  "creator_id" int4 NOT NULL,
  "receiver_id" int4 NOT NULL,
  "client_ip" varchar(20) NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_23" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "comment"."obj_type" IS '评论类型';
COMMENT ON COLUMN "comment"."obj_id" IS '评论对象ID';
COMMENT ON COLUMN "comment"."style" IS '内容渲染样式';
COMMENT ON COLUMN "comment"."content" IS '评论内容';
COMMENT ON COLUMN "comment"."img_urls" IS '图片URL，多个图片用英文逗号隔开';
COMMENT ON COLUMN "comment"."creator_id" IS '创建者用户ID';
COMMENT ON COLUMN "comment"."receiver_id" IS '被回复者用户ID';
COMMENT ON COLUMN "comment"."client_ip" IS '客户端IP';
COMMENT ON TABLE "comment" IS '评论表';

CREATE TABLE "course" (
  id SERIAL,
  "name" varchar(100) NOT NULL,
  "summary" varchar(100) NOT NULL,
  "description" text,
  "tag_ids" varchar(500),
  "period" int4 ,
  "price" int4 DEFAULT 0 ,
  "seq" int4 ,
  "start_article_id" int4,
  "creator_id" int4,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_22" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "course"."name" IS '课程名称';
COMMENT ON COLUMN "course"."summary" IS '课程简介';
COMMENT ON COLUMN "course"."description" IS '课程详细介绍';
COMMENT ON COLUMN "course"."tag_ids" IS '标签IDs';
COMMENT ON COLUMN "course"."period" IS '课程周期';
COMMENT ON COLUMN "course"."price" IS '课程售价(元)';
COMMENT ON COLUMN "course"."seq" IS '排序值';
COMMENT ON COLUMN "course"."start_article_id" IS '起始文章ID';
COMMENT ON COLUMN "course"."creator_id" IS '创建者ID';
COMMENT ON TABLE "course" IS '课程表';

CREATE TABLE "feed" (
  id SERIAL,
  "type" int4 NOT NULL,
  "show_type" int4 NOT NULL,
  "title" varchar(200) NOT NULL,
  "style" varchar(255) NOT NULL,
  "content" text,
  "img_urls" text,
  "file_urls" text,
  "is_deleted" int2 NOT NULL,
  "views" int4 NOT NULL,
  "client_ip" varchar(20) NOT NULL,
  "group_id" int4 NOT NULL,
  "creator_id" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_21" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "feed"."type" IS '类型:1-默认类型;2-留言咨询;';
COMMENT ON COLUMN "feed"."show_type" IS '展示方案:1-完全公开;2-仅群组内公开;';
COMMENT ON COLUMN "feed"."title" IS '标题';
COMMENT ON COLUMN "feed"."style" IS '内容渲染样式';
COMMENT ON COLUMN "feed"."content" IS '内容';
COMMENT ON COLUMN "feed"."img_urls" IS '图片链接,多个用英文逗号隔开';
COMMENT ON COLUMN "feed"."file_urls" IS '文件链接,多个用英文逗号隔开';
COMMENT ON COLUMN "feed"."is_deleted" IS '是否已删除';
COMMENT ON COLUMN "feed"."views" IS '浏览量';
COMMENT ON COLUMN "feed"."client_ip" IS '发布者客户端IP';
COMMENT ON COLUMN "feed"."group_id" IS '所属群组ID';
COMMENT ON COLUMN "feed"."creator_id" IS '创建者用户ID';
COMMENT ON TABLE "feed" IS 'Feed表';

CREATE TABLE "group_member" (
  id SERIAL,
  "group_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "name" varchar(100) NOT NULL,
  "is_receive" int2 NOT NULL,
  "role_type" int4 NOT NULL,
  "is_deleted" int2 NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  CONSTRAINT "_copy_20" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "group_member"."group_id" IS '群组ID';
COMMENT ON COLUMN "group_member"."user_id" IS '用户ID';
COMMENT ON COLUMN "group_member"."name" IS '成员在群内的名称';
COMMENT ON COLUMN "group_member"."is_receive" IS '是否接收消息';
COMMENT ON COLUMN "group_member"."role_type" IS '群角色:1-成员;2-管理员;3-群主;';
COMMENT ON COLUMN "group_member"."is_deleted" IS '是否已删除';
COMMENT ON TABLE "group_member" IS '群组成员表';

CREATE TABLE "group_subscriber" (
  id SERIAL,
  "group_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "is_deleted" int2 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_19" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "group_subscriber"."group_id" IS '群组ID(被订阅)';
COMMENT ON COLUMN "group_subscriber"."user_id" IS '用户ID(订阅)';
COMMENT ON COLUMN "group_subscriber"."is_deleted" IS '是否已删除';
COMMENT ON TABLE "group_subscriber" IS '群组订阅表';

CREATE TABLE "groups" (
  id SERIAL,
  "name" varchar(200) NOT NULL,
  "avatar" varchar(500) NOT NULL,
  "intro" varchar(2000) NOT NULL,
  "type" int2 NOT NULL,
  "creator_id" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_18" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "groups"."name" IS '群组名称';
COMMENT ON COLUMN "groups"."avatar" IS '群组头像';
COMMENT ON COLUMN "groups"."intro" IS '群组说明';
COMMENT ON COLUMN "groups"."type" IS '群组类型:1-公开群组;2-私密群组;';
COMMENT ON COLUMN "groups"."creator_id" IS '创建者ID';
COMMENT ON TABLE "groups" IS '群组表';

CREATE TABLE "keyword" (
  id SERIAL,
  "keyword" varchar(100) NOT NULL,
  "memo" varchar(500) NOT NULL,
  "hot" int4 NOT NULL,
  "hits" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_17" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "keyword"."keyword" IS '搜索关键词';
COMMENT ON COLUMN "keyword"."memo" IS '备注';
COMMENT ON COLUMN "keyword"."hot" IS '热度(运营干预)';
COMMENT ON COLUMN "keyword"."hits" IS '命中次数';
COMMENT ON TABLE "keyword" IS '搜索热词表';

CREATE TABLE "message" (
  id SERIAL,
  "sender_id" int4 NOT NULL,
  "receiver_id" int4 NOT NULL,
  "sender_name" varchar(128) NOT NULL,
  "receiver_name" varchar(128) NOT NULL,
  "content" varchar(500) NOT NULL,
  "type" int4 NOT NULL,
  "obj_id" int4 NOT NULL,
  "struct" varchar(500) NOT NULL,
  "has_read" int2 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_16" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "message"."sender_id" IS '发送者ID';
COMMENT ON COLUMN "message"."receiver_id" IS '接受者ID';
COMMENT ON COLUMN "message"."sender_name" IS '发送者名称';
COMMENT ON COLUMN "message"."receiver_name" IS '接受者名称';
COMMENT ON COLUMN "message"."content" IS '消息内容';
COMMENT ON COLUMN "message"."type" IS '消息类型:1-默认;';
COMMENT ON COLUMN "message"."obj_id" IS '关联对象ID';
COMMENT ON COLUMN "message"."struct" IS '消息额外JSON信息';
COMMENT ON COLUMN "message"."has_read" IS '是否已读';
COMMENT ON TABLE "message" IS '消息表';

CREATE TABLE "orders" (
  id SERIAL,
  "user_id" int4 NOT NULL,
  "type" varchar(255) NOT NULL,
  "amount" numeric(10,2) NOT NULL,
  "actual_amount" numeric(10,2) NOT NULL,
  "payment_channel" int4 NOT NULL,
  "memo" varchar(200) NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_15" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "orders"."user_id" IS '用户ID';
COMMENT ON COLUMN "orders"."type" IS '订单类型';
COMMENT ON COLUMN "orders"."amount" IS '订单总金额';
COMMENT ON COLUMN "orders"."actual_amount" IS '订单实际支付金额';
COMMENT ON COLUMN "orders"."payment_channel" IS '订单支付渠道';
COMMENT ON COLUMN "orders"."memo" IS '备注';
COMMENT ON TABLE "orders" IS '用户订单表';

CREATE TABLE "orders_item" (
  id SERIAL,
  "type" varchar(255) NOT NULL,
  "obj_id" int4 NOT NULL,
  "obj_name" varchar(200) NOT NULL,
  "orders_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "subtotal" numeric(10,2) NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_14" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "orders_item"."type" IS '订单类型';
COMMENT ON COLUMN "orders_item"."obj_id" IS '产品ID';
COMMENT ON COLUMN "orders_item"."obj_name" IS '产品名称';
COMMENT ON COLUMN "orders_item"."orders_id" IS '订单ID';
COMMENT ON COLUMN "orders_item"."user_id" IS '用户ID';
COMMENT ON COLUMN "orders_item"."subtotal" IS '条目金额';
COMMENT ON TABLE "orders_item" IS '订单产品表';

CREATE TABLE "paper" (
  id SERIAL,
  "name" varchar(100) NOT NULL,
  "content" varchar(500) NOT NULL,
  "tag_ids" varchar(500) NOT NULL,
  "mode" varchar(255) NOT NULL,
  "is_survey" int2 NOT NULL,
  "is_official" int2 NOT NULL,
  "is_draft" int2 NOT NULL,
  "passed_score" int4 NOT NULL,
  "score" int4 NOT NULL,
  "subjective" int4 NOT NULL,
  "objective" int4 NOT NULL,
  "questions" int4 NOT NULL,
  "difficulty" int4 NOT NULL,
  "minutes_limited" int4 NOT NULL,
  "creator_id" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_13" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "paper"."name" IS '试卷名称';
COMMENT ON COLUMN "paper"."content" IS '试卷说明';
COMMENT ON COLUMN "paper"."tag_ids" IS '标签IDs';
COMMENT ON COLUMN "paper"."mode" IS '试卷模式';
COMMENT ON COLUMN "paper"."is_survey" IS '是否调查';
COMMENT ON COLUMN "paper"."is_official" IS '来源官方吗';
COMMENT ON COLUMN "paper"."is_draft" IS '是否草稿';
COMMENT ON COLUMN "paper"."passed_score" IS '通过分数';
COMMENT ON COLUMN "paper"."score" IS '试卷分数';
COMMENT ON COLUMN "paper"."subjective" IS '主观题数量';
COMMENT ON COLUMN "paper"."objective" IS '客观题数量';
COMMENT ON COLUMN "paper"."questions" IS '题目数量';
COMMENT ON COLUMN "paper"."difficulty" IS '试卷难度';
COMMENT ON COLUMN "paper"."minutes_limited" IS '做题时间限制';
COMMENT ON COLUMN "paper"."creator_id" IS '创建者用户ID';
COMMENT ON TABLE "paper" IS '试卷表';

CREATE TABLE "paper_item" (
  id SERIAL,
  "seq" int4 NOT NULL,
  "paper_id" int4 NOT NULL,
  "question_id" int4 NOT NULL,
  "score" int4 NOT NULL,
  "rate" numeric(10,2) NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_12" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "paper_item"."seq" IS '排序';
COMMENT ON COLUMN "paper_item"."paper_id" IS '试卷ID';
COMMENT ON COLUMN "paper_item"."question_id" IS '试题ID';
COMMENT ON COLUMN "paper_item"."score" IS '分数';
COMMENT ON COLUMN "paper_item"."rate" IS '比例';
COMMENT ON TABLE "paper_item" IS '试卷试题表';

CREATE TABLE "question" (
  id SERIAL,
  "name" varchar(200) NOT NULL,
  "tag_ids" varchar(500) NOT NULL,
  "content_is_md" int2 NOT NULL,
  "content" text,
  "is_survey" int2 NOT NULL,
  "type" varchar(255) NOT NULL,
  "answer_is_md" int2 NOT NULL,
  "answer" text,
  "difficulty" int4 NOT NULL,
  "score" int4 NOT NULL,
  "hots" int4 NOT NULL,
  "complexity_time" int4 NOT NULL,
  "complexity_space" int4 NOT NULL,
  "input" varchar(200) NOT NULL,
  "output" varchar(200) NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "course_id" int4 NOT NULL,
  "chapter_id" int4 NOT NULL,
  "article_id" int4 NOT NULL,
  "enable" int2 NOT NULL,
  CONSTRAINT "_copy_11" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "question"."name" IS '题目名称';
COMMENT ON COLUMN "question"."tag_ids" IS '标签IDs';
COMMENT ON COLUMN "question"."content_is_md" IS 'content是否Markdown';
COMMENT ON COLUMN "question"."content" IS '题目描述';
COMMENT ON COLUMN "question"."is_survey" IS '是否调查';
COMMENT ON COLUMN "question"."type" IS '题目类型';
COMMENT ON COLUMN "question"."answer_is_md" IS 'answer是否Markdown';
COMMENT ON COLUMN "question"."answer" IS '答案';
COMMENT ON COLUMN "question"."difficulty" IS '难度';
COMMENT ON COLUMN "question"."score" IS '默认分数';
COMMENT ON COLUMN "question"."hots" IS '热度指数';
COMMENT ON COLUMN "question"."complexity_time" IS '运行时间限制,单位秒';
COMMENT ON COLUMN "question"."complexity_space" IS '运行空间限制,单位KB';
COMMENT ON COLUMN "question"."input" IS '输入';
COMMENT ON COLUMN "question"."output" IS '输出';
COMMENT ON COLUMN "question"."enable" IS '是否启用';
COMMENT ON TABLE "question" IS '题目表';

CREATE TABLE "question_option" (
  id SERIAL,
  "question_id" int4 NOT NULL,
  "no" varchar(20) NOT NULL,
  "lang" varchar(255) NOT NULL,
  "content_is_md" int2 NOT NULL,
  "content" varchar(2000) NOT NULL,
  "answer_is_md" int2 NOT NULL,
  "answer" varchar(2000) NOT NULL,
  "score" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_10" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "question_option"."question_id" IS '试题ID';
COMMENT ON COLUMN "question_option"."no" IS '选项编号';
COMMENT ON COLUMN "question_option"."lang" IS '代码语言';
COMMENT ON COLUMN "question_option"."content_is_md" IS 'content是否Markdown';
COMMENT ON COLUMN "question_option"."content" IS '选项内容/代码模板';
COMMENT ON COLUMN "question_option"."answer_is_md" IS 'answer是否Markdown';
COMMENT ON COLUMN "question_option"."answer" IS '选项解析/答案代码';
COMMENT ON COLUMN "question_option"."score" IS '分数';
COMMENT ON TABLE "question_option" IS '题目选项/模板表';

CREATE TABLE "quiz" (
  id SERIAL,
  "paper_id" int4 NOT NULL,
  "min_score" int4 NOT NULL,
  "max_score" int4 NOT NULL,
  "evaluation" text,
  "creator_id" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_9" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "quiz"."paper_id" IS '试卷ID';
COMMENT ON COLUMN "quiz"."min_score" IS '最小分数';
COMMENT ON COLUMN "quiz"."max_score" IS '最大分数';
COMMENT ON COLUMN "quiz"."evaluation" IS '评价';
COMMENT ON COLUMN "quiz"."creator_id" IS '创建者用户ID';
COMMENT ON TABLE "quiz" IS '试卷评价表';

CREATE TABLE "quiz_result" (
  id SERIAL,
  "paper_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "score" int4 NOT NULL,
  "correct_num" int4 NOT NULL,
  "duration" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "quiz_id" int4 NOT NULL,
  CONSTRAINT "_copy_8" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "quiz_result"."paper_id" IS '试卷ID';
COMMENT ON COLUMN "quiz_result"."user_id" IS '答题用户ID';
COMMENT ON COLUMN "quiz_result"."score" IS '得分';
COMMENT ON COLUMN "quiz_result"."correct_num" IS '正确的数量(客观题)';
COMMENT ON COLUMN "quiz_result"."duration" IS '做题时间(单位:秒)';
COMMENT ON TABLE "quiz_result" IS '试卷结果表';

CREATE TABLE "quiz_result_item" (
  id SERIAL,
  "paper_id" int4 NOT NULL,
  "quiz_result_id" int4 NOT NULL,
  "question_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "score" numeric(10,2) NOT NULL,
  "duration" int4 NOT NULL,
  "success" int2 NOT NULL,
  "answer" text,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "lang" varchar(255) NOT NULL,
  CONSTRAINT "_copy_7" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "quiz_result_item"."paper_id" IS '试卷ID，如果为0，则为随机答题';
COMMENT ON COLUMN "quiz_result_item"."quiz_result_id" IS '试卷记录ID，如果为0，则为随机答题';
COMMENT ON COLUMN "quiz_result_item"."question_id" IS '题目ID';
COMMENT ON COLUMN "quiz_result_item"."user_id" IS '答题用户ID';
COMMENT ON COLUMN "quiz_result_item"."score" IS '测验得分';
COMMENT ON COLUMN "quiz_result_item"."duration" IS '做题时间(单位:秒)';
COMMENT ON COLUMN "quiz_result_item"."success" IS '是否答对';
COMMENT ON COLUMN "quiz_result_item"."answer" IS '用户答案';
COMMENT ON COLUMN "quiz_result_item"."lang" IS '编程题语言类型';
COMMENT ON TABLE "quiz_result_item" IS '答题记录表';

CREATE TABLE "role" (
  id SERIAL,
  "code" varchar(30) NOT NULL,
  "name" varchar(30) NOT NULL,
  "config" text,
  "memo" varchar(200) NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_6" PRIMARY KEY ("id")
);
CREATE INDEX "idx_code" ON "role" USING btree (
  "code"
);
COMMENT ON COLUMN "role"."code" IS '角色编码';
COMMENT ON COLUMN "role"."name" IS '角色名称';
COMMENT ON COLUMN "role"."config" IS '角色相关权限配置, JSON字符串';
COMMENT ON COLUMN "role"."memo" IS '备注';
COMMENT ON COLUMN "role"."created_at" IS '插入时间';
COMMENT ON COLUMN "role"."updated_at" IS '更新时间';
COMMENT ON TABLE "role" IS '角色表';

CREATE TABLE "tag" (
  id SERIAL,
  "code" varchar(100) NOT NULL,
  "name" varchar(100) NOT NULL,
  "type" varchar(255) NOT NULL,
  "memo" varchar(500) NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_5" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "tag"."code" IS '标签英文Code';
COMMENT ON COLUMN "tag"."name" IS '标签名称';
COMMENT ON COLUMN "tag"."type" IS '标签类型';
COMMENT ON COLUMN "tag"."memo" IS '标签备注';
COMMENT ON TABLE "tag" IS '标签表';

CREATE TABLE "tag_cached" (
  id SERIAL,
  "obj_id" int4 NOT NULL,
  "tag_id" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_4" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "tag_cached"."obj_id" IS '对象ID';
COMMENT ON COLUMN "tag_cached"."tag_id" IS '标签ID';
COMMENT ON TABLE "tag_cached" IS '试题标签关系表';

CREATE TABLE "user" (
  id SERIAL,
  "phone" varchar(20) NOT NULL,
  "username" varchar(30) NOT NULL,
  "email" varchar(50) NOT NULL,
  "password" varchar(255) NOT NULL,
  "job_title" varchar(100),
  "full_name" varchar(50),
  "roles" varchar(200) ,
  "avatar" varchar(300),
  "homepage" varchar(300),
  "gender" int2,
  "birthday" date,
  "wx_unique_id" varchar(100),
  "wx_openid" varchar(100),
  "wx_sex" varchar(10),
  "wx_city" varchar(30),
  "wx_province" varchar(30),
  "wx_country" varchar(30) ,
  "register_ip" varchar(30),
  "last_visited" timestamp,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_3" PRIMARY KEY ("id")
);
CREATE INDEX "username_UNIQUE" ON "user" USING btree (
  "username"
);
CREATE INDEX "phone_UNIQUE" ON "user" USING btree (
  "phone"
);
COMMENT ON COLUMN "user"."phone" IS '手机号码';
COMMENT ON COLUMN "user"."username" IS '用户名';
COMMENT ON COLUMN "user"."email" IS '邮箱';
COMMENT ON COLUMN "user"."password" IS '密码';
COMMENT ON COLUMN "user"."full_name" IS '姓名';
COMMENT ON COLUMN "user"."roles" IS '角色编码';
COMMENT ON COLUMN "user"."avatar" IS '默认头像';
COMMENT ON COLUMN "user"."homepage" IS '个人主页';
COMMENT ON COLUMN "user"."gender" IS '性别:0-未知;1-男;2-女;3-保密;';
COMMENT ON COLUMN "user"."birthday" IS '生日';
COMMENT ON COLUMN "user"."wx_unique_id" IS '微信 UNIQUE ID';
COMMENT ON COLUMN "user"."wx_openid" IS '微信 OPEN ID';
COMMENT ON COLUMN "user"."wx_sex" IS '微信性别';
COMMENT ON COLUMN "user"."wx_city" IS '微信所在城市';
COMMENT ON COLUMN "user"."wx_province" IS '微信所在省份';
COMMENT ON COLUMN "user"."wx_country" IS '微信所在国家';
COMMENT ON COLUMN "user"."register_ip" IS '注册IP';
COMMENT ON COLUMN "user"."last_visited" IS '最后在线时间';
COMMENT ON COLUMN "user"."job_title" IS '职称';
COMMENT ON TABLE "user" IS '用户表';

CREATE TABLE "user_file" (
  id SERIAL,
  "url" varchar(500) NOT NULL,
  "name" varchar(100) NOT NULL,
  "origin_name" varchar(200) NOT NULL,
  "description" varchar(500) NOT NULL,
  "user_id" int4 NOT NULL,
  "obj_id" int4 NOT NULL,
  "obj_type" varchar(255) NOT NULL,
  "type" varchar(255) NOT NULL,
  "size" int4 NOT NULL,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  CONSTRAINT "_copy_2" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "user_file"."url" IS '远程链接';
COMMENT ON COLUMN "user_file"."name" IS '文件名';
COMMENT ON COLUMN "user_file"."origin_name" IS '原始文件名';
COMMENT ON COLUMN "user_file"."description" IS '图片/文件描述';
COMMENT ON COLUMN "user_file"."user_id" IS '用户ID';
COMMENT ON COLUMN "user_file"."obj_id" IS '关联对象ID';
COMMENT ON COLUMN "user_file"."obj_type" IS '关联对象类型';
COMMENT ON COLUMN "user_file"."type" IS '文件类型';
COMMENT ON COLUMN "user_file"."size" IS '文件大小(单位Byte)';
COMMENT ON TABLE "user_file" IS '用户上传文件表';

CREATE TABLE "user_profile" (
  id SERIAL,
  "user_id" int4 NOT NULL,
  "full_name" varchar(50) NOT NULL,
  "avatar" varchar(300) NOT NULL,
  "homepage" varchar(300) NOT NULL,
  "github" varchar(300) NOT NULL,
  "gender" int2 NOT NULL,
  "birthday" date,
  "birth_year" int4 NOT NULL,
  "birth_month" int4 NOT NULL,
  "working_status" varchar(20) NOT NULL,
  "expect_city" varchar(20) NOT NULL,
  "expect_salary" varchar(20) NOT NULL,
  "phone" varchar(20) NOT NULL,
  "email" varchar(50) NOT NULL,
  "intro" varchar(500) NOT NULL,
  "school" varchar(50) NOT NULL,
  "major" varchar(50) NOT NULL,
  "admission_year" varchar(50) NOT NULL,
  "graduation_year" varchar(50) NOT NULL,
  "english_ability" varchar(50) NOT NULL,
  "work_experience" text,
  "project_experience" text,
  "created_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "education" varchar(50) NOT NULL,
  "birthplace" varchar(100) NOT NULL,
  CONSTRAINT "_copy_1" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "user_profile"."user_id" IS '用户ID';
COMMENT ON COLUMN "user_profile"."full_name" IS '姓名';
COMMENT ON COLUMN "user_profile"."avatar" IS '默认头像';
COMMENT ON COLUMN "user_profile"."homepage" IS '个人主页';
COMMENT ON COLUMN "user_profile"."github" IS 'GiHub主页';
COMMENT ON COLUMN "user_profile"."gender" IS '性别:0-未知;1-男;2-女;3-保密;';
COMMENT ON COLUMN "user_profile"."birthday" IS '生日';
COMMENT ON COLUMN "user_profile"."birth_year" IS '出生年份';
COMMENT ON COLUMN "user_profile"."birth_month" IS '出生月份';
COMMENT ON COLUMN "user_profile"."working_status" IS '工作状态';
COMMENT ON COLUMN "user_profile"."expect_city" IS '期望工作城市';
COMMENT ON COLUMN "user_profile"."expect_salary" IS '期望薪资';
COMMENT ON COLUMN "user_profile"."phone" IS '手机号码';
COMMENT ON COLUMN "user_profile"."email" IS '电子邮箱';
COMMENT ON COLUMN "user_profile"."intro" IS '个人简介';
COMMENT ON COLUMN "user_profile"."school" IS '学校';
COMMENT ON COLUMN "user_profile"."major" IS '专业';
COMMENT ON COLUMN "user_profile"."admission_year" IS '入学年份';
COMMENT ON COLUMN "user_profile"."graduation_year" IS '毕业年份';
COMMENT ON COLUMN "user_profile"."english_ability" IS '英语能力';
COMMENT ON COLUMN "user_profile"."work_experience" IS '工作经历';
COMMENT ON COLUMN "user_profile"."project_experience" IS '项目经验';
COMMENT ON COLUMN "user_profile"."education" IS '学历';
COMMENT ON COLUMN "user_profile"."birthplace" IS '籍贯';
COMMENT ON TABLE "user_profile" IS '用户档案表';

