DROP TABLE IF EXISTS tiktok_user;
CREATE TABLE tiktok_user(
                            UID BIGINT NOT NULL,
                            USRENAME VARCHAR(50) NOT NULL,
                            PASSWORD VARCHAR(255) NOT NULL,
                            AVATAR VARCHAR(255) NOT NULL,
                            BACKGROUND_IMG VARCHAR(255) NOT NULL,
                            TOTAL_FAVORITED BIGINT NOT NULL DEFAULT  0,
                            FELLOW_COUNT BIGINT NOT NULL DEFAULT  0,
                            FELLOWER_COUNT BIGINT NOT NULL DEFAULT  0,
                            VIDEO_COUNT BIGINT NOT NULL DEFAULT  0,
                            SIGNATURE VARCHAR(255) NOT NULL,
                            CREATED_BY BIGINT NOT NULL,
                            CREATED_TIME TIMESTAMP NOT NULL,
                            UPDATED_BY BIGINT NOT NULL,
                            UPDATED_TIME TIMESTAMP NOT NULL,
                            DELETE boolean NOT NULL DEFAULT  false,
                            PRIMARY KEY (UID)
);

COMMENT ON TABLE tiktok_user IS '用户表';
COMMENT ON COLUMN tiktok_user.UID IS 'UID';
COMMENT ON COLUMN tiktok_user.USRENAME IS '用户昵称';
COMMENT ON COLUMN tiktok_user.PASSWORD IS '加密后的密码';
COMMENT ON COLUMN tiktok_user.AVATAR IS '头像;头像地址，有默认头像';
COMMENT ON COLUMN tiktok_user.BACKGROUND_IMG IS '背景图片;有默认地址';
COMMENT ON COLUMN tiktok_user.TOTAL_FAVORITED IS '总点赞数;默认0';
COMMENT ON COLUMN tiktok_user.FELLOW_COUNT IS '关注人数;关注数量，默认0';
COMMENT ON COLUMN tiktok_user.FELLOWER_COUNT IS '被关注人数;被关注数量，默认0';
COMMENT ON COLUMN tiktok_user.VIDEO_COUNT IS '作品数量;作品数量，默认0';
COMMENT ON COLUMN tiktok_user.SIGNATURE IS '个人简介;个人简介';
COMMENT ON COLUMN tiktok_user.CREATED_BY IS '创建人;创建人';
COMMENT ON COLUMN tiktok_user.CREATED_TIME IS '创建时间;创建时间';
COMMENT ON COLUMN tiktok_user.UPDATED_BY IS '更新人';
COMMENT ON COLUMN tiktok_user.UPDATED_TIME IS '更新时间;更新时间';
COMMENT ON COLUMN tiktok_user.DELETE IS '是否删除;是否删除';

DROP TABLE IF EXISTS fellow;
CREATE TABLE fellow(
                       FELLOW_ID BIGINT NOT NULL,
                       USER_UID BIGINT NOT NULL,
                       FELLOW_UID BIGINT NOT NULL,
                       CREATED_BY BIGINT NOT NULL,
                       CREATED_TIME TIMESTAMP NOT NULL,
                       UPDATED_BY BIGINT NOT NULL,
                       UPDATED_TIME TIMESTAMP NOT NULL,
                       DELETE BOOL DEFAULT  false,
                       PRIMARY KEY (FELLOW_ID)
);

COMMENT ON TABLE fellow IS '关注表';
COMMENT ON COLUMN fellow.FELLOW_ID IS '关注ID;关注表的';
COMMENT ON COLUMN fellow.USER_UID IS '主动关注人的UID;主动关注人的UID';
COMMENT ON COLUMN fellow.FELLOW_UID IS '关注人的UID;关注人的UID';
COMMENT ON COLUMN fellow.CREATED_BY IS '创建人';
COMMENT ON COLUMN fellow.CREATED_TIME IS '创建时间';
COMMENT ON COLUMN fellow.UPDATED_BY IS '更新人';
COMMENT ON COLUMN fellow.UPDATED_TIME IS '更新时间';
COMMENT ON COLUMN fellow.DELETE IS '是否删除';

DROP TABLE IF EXISTS video;
CREATE TABLE video(
                      VIDEO_ID BIGINT NOT NULL,
                      USER_UID BIGINT NOT NULL,
                      DESCRIPATH VARCHAR(255) NOT NULL,
                      TITLE VARCHAR(255) NOT NULL,
                      COVER_PATH VARCHAR(255) NOT NULL,
                      VIDEO_PATH VARCHAR(255) NOT NULL,
                      LIKE_COUNT BIGINT NOT NULL DEFAULT  0,
                      COMMENT_COUNT BIGINT NOT NULL DEFAULT  0,
                      CREATED_BY BIGINT NOT NULL,
                      CREATED_TIME TIMESTAMP NOT NULL,
                      UPDATED_BY BIGINT NOT NULL,
                      UPDATED_TIME TIMESTAMP NOT NULL,
                      DELETE BOOL NOT NULL DEFAULT  false,
                      PRIMARY KEY (VIDEO_ID)
);

COMMENT ON TABLE video IS '视频表';
COMMENT ON COLUMN video.VIDEO_ID IS '视频ID;视频主键';
COMMENT ON COLUMN video.USER_UID IS '用户UID;用户UID';
COMMENT ON COLUMN video.DESCRIPATH IS '描述;描述';
COMMENT ON COLUMN video.TITLE IS '标题;标题';
COMMENT ON COLUMN video.COVER_PATH IS '封面地址;封面地址';
COMMENT ON COLUMN video.VIDEO_PATH IS '视频地址;视频地址';
COMMENT ON COLUMN video.LIKE_COUNT IS '点赞数;点赞数，默认0';
COMMENT ON COLUMN video.COMMENT_COUNT IS '评论数;评论数量，默认0';
COMMENT ON COLUMN video.CREATED_BY IS '创建人';
COMMENT ON COLUMN video.CREATED_TIME IS '创建时间';
COMMENT ON COLUMN video.UPDATED_BY IS '更新人';
COMMENT ON COLUMN video.UPDATED_TIME IS '更新时间';
COMMENT ON COLUMN video.DELETE IS '是否删除';

DROP TABLE IF EXISTS comment;
CREATE TABLE comment(
                        COMMENT_ID BIGINT NOT NULL,
                        USER_UID BIGINT NOT NULL,
                        VIDEO_ID BIGINT NOT NULL,
                        CONTENT VARCHAR(255) NOT NULL,
                        CREATED_BY BIGINT NOT NULL,
                        CREATED_TIME TIMESTAMP NOT NULL,
                        UPDATED_BY BIGINT NOT NULL,
                        UPDATED_TIME TIMESTAMP NOT NULL,
                        DELETE BOOL NOT NULL DEFAULT  false,
                        PRIMARY KEY (COMMENT_ID)
);

COMMENT ON TABLE comment IS '评论表';
COMMENT ON COLUMN comment.COMMENT_ID IS '评论ID;评论id';
COMMENT ON COLUMN comment.USER_UID IS '用户UID;用户ID';
COMMENT ON COLUMN comment.VIDEO_ID IS '视频ID;视频ID';
COMMENT ON COLUMN comment.CONTENT IS '评论;评论';
COMMENT ON COLUMN comment.CREATED_BY IS '创建人';
COMMENT ON COLUMN comment.CREATED_TIME IS '创建时间';
COMMENT ON COLUMN comment.UPDATED_BY IS '更新人';
COMMENT ON COLUMN comment.UPDATED_TIME IS '更新时间';
COMMENT ON COLUMN comment.DELETE IS '是否删除';

DROP TABLE IF EXISTS user_like_video;
CREATE TABLE user_like_video(
                                LIKE_ID BIGINT NOT NULL,
                                USER_UID BIGINT NOT NULL,
                                VIDEO_ID BIGINT NOT NULL,
                                CREATED_BY BIGINT NOT NULL,
                                CREATED_TIME TIMESTAMP NOT NULL,
                                UPDATED_BY BIGINT NOT NULL,
                                UPDATED_TIME TIMESTAMP NOT NULL,
                                DELETE BOOL NOT NULL DEFAULT  false,
                                PRIMARY KEY (LIKE_ID)
);

COMMENT ON TABLE user_like_video IS '用户点赞表';
COMMENT ON COLUMN user_like_video.LIKE_ID IS '点赞ID;点赞ID';
COMMENT ON COLUMN user_like_video.USER_UID IS '用户UID;用户UID';
COMMENT ON COLUMN user_like_video.VIDEO_ID IS '视频ID;视频ID';
COMMENT ON COLUMN user_like_video.CREATED_BY IS '创建人';
COMMENT ON COLUMN user_like_video.CREATED_TIME IS '创建时间';
COMMENT ON COLUMN user_like_video.UPDATED_BY IS '更新人';
COMMENT ON COLUMN user_like_video.UPDATED_TIME IS '更新时间';
COMMENT ON COLUMN user_like_video.DELETE IS '是否删除';

DROP TABLE IF EXISTS message;
CREATE TABLE message(
                        MESSAGE_ID BIGINT NOT NULL,
                        UID_SEND BIGINT NOT NULL,
                        UID_RECEIVE BIGINT NOT NULL,
                        CONTENT VARCHAR(255) NOT NULL,
                        CREATED_BY BIGINT NOT NULL,
                        CREATED_TIME TIMESTAMP NOT NULL,
                        UPDATED_BY BIGINT NOT NULL,
                        UPDATED_TIME TIMESTAMP NOT NULL,
                        PRIMARY KEY (MESSAGE_ID)
);

COMMENT ON TABLE message IS '私聊消息表';
COMMENT ON COLUMN message.MESSAGE_ID IS '消息ID';
COMMENT ON COLUMN message.UID_SEND IS '发送UID;发送用户';
COMMENT ON COLUMN message.UID_RECEIVE IS '接收用户;接收用户';
COMMENT ON COLUMN message.CONTENT IS '内容;内容';
COMMENT ON COLUMN message.CREATED_BY IS '创建人';
COMMENT ON COLUMN message.CREATED_TIME IS '创建时间';
COMMENT ON COLUMN message.UPDATED_BY IS '更新人';
COMMENT ON COLUMN message.UPDATED_TIME IS '更新时间';

