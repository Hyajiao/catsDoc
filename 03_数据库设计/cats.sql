/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/7/31 10:48:59                           */
/*==============================================================*/


drop table if exists auth_module;

drop table if exists auth_resource;

drop table if exists auth_role;

drop table if exists auth_role_res;

drop table if exists cats_expert_group;

drop table if exists cats_expert_group_detail;

drop table if exists cats_payee_info;

drop table if exists cats_project;

drop table if exists cats_project_enterprise_user_link;

drop table if exists cats_project_literature_config;

drop table if exists cats_project_news_config;

drop table if exists cats_survey_finish_record;

drop table if exists cats_survey_notice;

drop table if exists cats_survey_notice_record;

drop table if exists cats_survey_project;

drop table if exists cats_withdraw_record;

drop table if exists cm_admin_user;

drop table if exists cm_bills;

drop table if exists cm_sms_code;

drop table if exists cm_user;

drop table if exists cm_wechat_user;

drop table if exists wx_custom_menu;

drop table if exists wx_custom_menu_group;

drop table if exists wx_material;

drop table if exists wx_material_group;

drop table if exists wx_tag;

/*==============================================================*/
/* Table: auth_module                                           */
/*==============================================================*/
create table auth_module
(
   am_id                bigint not null auto_increment comment '模块表主键',
   am_name              varchar(128) comment '模块名称',
   primary key (am_id)
)
type = InnoDB;

alter table auth_module comment '权限模块描述表';

/*==============================================================*/
/* Table: auth_resource                                         */
/*==============================================================*/
create table auth_resource
(
   ar_id                bigint not null auto_increment comment '权限资源表主键',
   ar_module            bigint comment '权限模块',
   ar_permission        varchar(128) comment '权限标示',
   ar_name              varchar(128) comment '权限名称',
   ar_description       varchar(128) comment '权限描述',
   ar_url               varchar(128) comment '权限URL',
   primary key (ar_id)
)
type = InnoDB;

alter table auth_resource comment '权限资源表';

/*==============================================================*/
/* Table: auth_role                                             */
/*==============================================================*/
create table auth_role
(
   aro_id               bigint not null auto_increment comment '权限角色表主键',
   aro_name             varchar(128) comment '权限角色名称',
   aro_name_en          varchar(128) comment '角色英文名称',
   primary key (aro_id)
)
type = InnoDB;

alter table auth_role comment '权限角色表';

/*==============================================================*/
/* Table: auth_role_res                                         */
/*==============================================================*/
create table auth_role_res
(
   arr_id               bigint not null auto_increment comment '权限角色资源表主键',
   arr_role_id          bigint comment '角色ID',
   arr_module           bigint comment '权限模块',
   arr_res              bigint comment '拥有资源ID',
   primary key (arr_id)
)
type = InnoDB;

alter table auth_role_res comment '权限角色资源表';

/*==============================================================*/
/* Table: cats_expert_group                                     */
/*==============================================================*/
create table cats_expert_group
(
   ceg_id               bigint not null auto_increment comment '专家组表主键',
   ceg_expert_group_name varchar(128) comment '专家组名称',
   ceg_expert_num       int comment '医生数量',
   ceg_memo             varchar(1024) comment '备注',
   ceg_is_valid         int comment '是否有效状态',
   ceg_create_time      bigint comment '创建时间',
   ceg_create_user_id   bigint comment '创建人id',
   ceg_create_user_name varchar(128) comment '创建人名称',
   ceg_update_time      bigint comment '更新时间',
   ceg_update_user_id   bigint comment '更新人id',
   ceg_update_user_name varchar(128) comment '更新人名称',
   primary key (ceg_id)
)
type = InnoDB;

alter table cats_expert_group comment '专家组表';

/*==============================================================*/
/* Table: cats_expert_group_detail                              */
/*==============================================================*/
create table cats_expert_group_detail
(
   cegd_id              bigint not null auto_increment comment '专家组明细表主键',
   cegd_ceg_id          bigint comment '专家组表主键',
   cegd_medlive_id      bigint comment '医脉通id',
   cegd_real_name       varchar(128) comment '姓名',
   cegd_sex             varchar(128) comment '性别',
   cegd_hospital        varchar(128) comment '医院',
   cegd_dept            varchar(128) comment '科室',
   cegd_professional    varchar(128) comment '职称',
   cegd_tel_no          varchar(128) comment '手机',
   cegd_email           varchar(128) comment '邮箱',
   cegd_alipay_real_name varchar(128) comment '支付宝姓名',
   cegd_alipay_user_name varchar(128) comment '支付宝账号',
   cegd_bank_real_name  varchar(128) comment '银行卡姓名',
   cegd_bank_name       varchar(128) comment '银行卡开户行',
   cegd_bank_no         varchar(128) comment '银行卡账号',
   cegd_create_time     bigint comment '创建时间',
   cegd_create_user_id  bigint comment '创建人id',
   cegd_create_user_name varchar(128) comment '创建人名称',
   cegd_update_time     bigint comment '更新时间',
   cegd_update_user_id  bigint comment '更新人id',
   cegd_update_user_name varchar(128) comment '更新人名称',
   primary key (cegd_id)
)
type = InnoDB;

alter table cats_expert_group_detail comment '专家组明细表';

/*==============================================================*/
/* Table: cats_payee_info                                       */
/*==============================================================*/
create table cats_payee_info
(
   cpi_id               bigint not null auto_increment comment '收款人信息簿主键',
   cpi_cu_id            bigint comment '用户表id',
   cpi_withdraw_mode    int comment '收款方式(0:银行卡;1:支付宝)',
   cpi_real_name        varchar(128) comment '姓名',
   cpi_bank_name        varchar(128) comment '开户行名称',
   cpi_bank_no          varchar(128) comment '银行卡号',
   cpi_tel_no           varchar(128) comment '手机号',
   cpi_alipay_user_name varchar(128) comment '支付宝账号',
   cpi_is_default       int comment '是否默认',
   cpi_create_time      bigint comment '创建时间',
   cpi_update_time      bigint comment '更新时间',
   primary key (cpi_id)
)
type = InnoDB;

alter table cats_payee_info comment '收款人信息簿';

/*==============================================================*/
/* Table: cats_project                                          */
/*==============================================================*/
create table cats_project
(
   cp_id                bigint not null auto_increment comment '项目表主键',
   cp_project_name      varchar(128) comment '项目名称',
   cp_company_name      varchar(128) comment '药企名称',
   cp_project_memo      varchar(512) comment '项目简介',
   cp_start_time        bigint comment '项目开始时间',
   cp_end_time          bigint comment '项目结束时间',
   cp_is_valid          int comment '是否有效状态（0：无效；1：有效）',
   cp_create_time       bigint comment '创建时间',
   cp_create_user_id    bigint comment '创建人id',
   cp_create_user_name  varchar(128) comment '创建人姓名',
   cp_update_time       bigint comment '更新时间',
   cp_update_user_id    bigint comment '更新人id',
   cp_update_user_name  varchar(128) comment '更新人姓名',
   primary key (cp_id)
)
type = InnoDB;

alter table cats_project comment '项目表';

/*==============================================================*/
/* Table: cats_project_enterprise_user_link                     */
/*==============================================================*/
create table cats_project_enterprise_user_link
(
   cpeul_id             bigint not null auto_increment comment '项目_企业账户关联表主键',
   cpeul_cp_id          bigint comment '项目表id',
   cpeul_cau_id         bigint comment '系统用户表id',
   cpeul_create_time    bigint comment '创建时间',
   cpeul_create_user_id bigint comment '创建人id',
   cpeul_create_user_name varchar(128) comment '创建人名称',
   cpeul_update_time    bigint comment '更新时间',
   cpeul_update_user_id bigint comment '更新人id',
   cpeul_update_user_name varchar(128) comment '更新人名称',
   primary key (cpeul_id)
)
type = InnoDB;

alter table cats_project_enterprise_user_link comment '项目_企业账户关联表';

/*==============================================================*/
/* Table: cats_project_literature_config                        */
/*==============================================================*/
create table cats_project_literature_config
(
   cplc_id              bigint not null auto_increment comment '项目文献设置表主键',
   cplc_cp_id           bigint comment '项目表主键',
   cplc_title           varchar(128) comment '标题',
   cplc_author          varchar(128) comment '作者',
   cplc_jour            varchar(128) comment '刊名',
   cplc_keyword         varchar(128) comment '关键字',
   cplc_abstract        varchar(128) comment '摘要',
   cplc_publish_date_start varchar(128) comment '出版年起',
   cplc_publish_date_end varchar(128) comment '出版年止',
   cplc_create_time     bigint comment '创建时间',
   cplc_create_user_id  bigint comment '创建人id',
   cplc_create_user_name varchar(128) comment '创建人姓名',
   cplc_update_time     bigint comment '更新时间',
   cplc_update_user_id  bigint comment '更新人id',
   cplc_update_user_name varchar(128) comment '更新人姓名',
   primary key (cplc_id)
)
type = InnoDB;

alter table cats_project_literature_config comment '项目文献设置表';

/*==============================================================*/
/* Table: cats_project_news_config                              */
/*==============================================================*/
create table cats_project_news_config
(
   cpnc_id              bigint not null auto_increment comment '项目资讯配置表主键',
   cpnc_cp_id           bigint comment '项目表主键',
   cpnc_keywords        varchar(512) comment '关键词配置',
   cpnc_create_time     bigint comment '创建时间',
   cpnc_create_user_id  bigint comment '创建人id',
   cpnc_create_user_name varchar(128) comment '创建人姓名',
   cpnc_update_time     bigint comment '更新时间',
   cpnc_update_user_id  bigint comment '更新人id',
   cpnc_update_user_name varchar(128) comment '更新人姓名',
   primary key (cpnc_id)
)
type = InnoDB;

alter table cats_project_news_config comment '项目资讯设置表';

/*==============================================================*/
/* Table: cats_survey_finish_record                             */
/*==============================================================*/
create table cats_survey_finish_record
(
   csfr_id              bigint not null auto_increment comment '调研完成记录表主键',
   csfr_csp_id          bigint comment '调研项目表主键',
   csfr_match_form_id   bigint comment 'match form调研结果id',
   csfr_cegd_id         bigint comment '专家组明细表主键',
   csfr_cu_id           bigint comment '用户表主键',
   csfr_is_first_answer int comment '是否首次答题（0：否；1：是）',
   csfr_had_issue_reward int comment '是否已经发奖励（0：否；1：是）',
   csfr_finish_time     bigint comment '完成答题时间',
   csfr_reward_issue_user_id bigint comment '奖励发放人id',
   csfr_reward_issue_user_name varchar(128) comment '奖励发放人姓名',
   csfr_reward_issue_time bigint comment '奖励发放时间',
   primary key (csfr_id)
)
type = InnoDB;

alter table cats_survey_finish_record comment '调研完成记录表';

/*==============================================================*/
/* Table: cats_survey_notice                                    */
/*==============================================================*/
create table cats_survey_notice
(
   csn_id               bigint not null auto_increment comment '调研通知表主键',
   csn_csp_id           bigint comment '调研项目表主键',
   csn_send_type        int comment '发送方式(0:微信;1:短信)',
   csn_send_num         int comment '发送数量',
   csn_success_num      int comment '发送成功数量',
   csn_send_status      int comment '发送状态(0:未发送;1:发送中;2:发送完毕;3:发送失败)',
   csn_create_user_id   bigint comment '创建人id',
   csn_create_user_name varchar(128) comment '创建人姓名',
   csn_create_time      bigint comment '创建时间',
   primary key (csn_id)
)
type = InnoDB;

alter table cats_survey_notice comment '调研通知表';

/*==============================================================*/
/* Table: cats_survey_notice_record                             */
/*==============================================================*/
create table cats_survey_notice_record
(
   csnr_id              bigint not null auto_increment comment '调研通知发送记录表主键',
   csnr_csn_id          bigint comment '调研通知表主键',
   csnr_cegd_id         bigint comment '专家组明细表主键',
   csnr_cu_id           bigint comment '用户表id',
   csnr_send_type       int comment '发送方式(0:微信;1:短信)',
   csnr_send_status     int comment '发送状态(0:未发送;1:发送中;2:发送完毕;3:发送失败)',
   primary key (csnr_id)
)
type = InnoDB;

alter table cats_survey_notice_record comment '调研通知发送记录表';

/*==============================================================*/
/* Table: cats_survey_project                                   */
/*==============================================================*/
create table cats_survey_project
(
   csp_id               bigint not null auto_increment comment '调研项目表主键',
   csp_cp_id            bigint comment '项目表主键',
   csp_ceg_id           bigint comment '关联专家组主键',
   csp_title            varchar(128) comment '主题',
   csp_type             varchar(128) comment '问卷类型',
   csp_num              int comment '问卷数量',
   csp_finished_num     int comment '问卷完成数量',
   csp_unit_price       decimal(10,2) comment '单价',
   csp_duration         varchar(128) comment '时长',
   csp_start_date       bigint comment '开始时间',
   csp_end_date         bigint comment '截止时间',
   csp_survey_url       varchar(512) comment '关联问卷地址',
   csp_memo             varchar(1024) comment '备注',
   csp_survey_report_path varchar(128) comment '调研报告地址',
   csp_is_valid         int comment '是否有效状态',
   csp_create_time      bigint comment '创建时间',
   csp_create_user_id   bigint comment '创建人id',
   csp_create_user_name varchar(128) comment '创建人名称',
   csp_update_time      bigint comment '更新时间',
   csp_update_user_id   bigint comment '更新人id',
   csp_update_user_name varchar(128) comment '更新人名称',
   primary key (csp_id)
)
type = InnoDB;

alter table cats_survey_project comment '调研项目表';

/*==============================================================*/
/* Table: cats_withdraw_record                                  */
/*==============================================================*/
create table cats_withdraw_record
(
   cwr_id               bigint not null auto_increment comment '提现记录表主键',
   cwr_cu_id            bigint comment '用户表id',
   cwr_withdraw_mode    int comment '提现方式(0:银行卡;1:支付宝)',
   cwr_withdraw_money   decimal(10,2) comment '提现金额',
   cwr_real_name        varchar(128) comment '姓名',
   cwr_bank_name        varchar(128) comment '开户行名称',
   cwr_bank_no          varchar(128) comment '银行卡号',
   cwr_tel_no           varchar(128) comment '手机号',
   cwr_alipay_user_name varchar(128) comment '支付宝账号',
   cwr_status           int comment '状态(0:未打款;1:已打款)',
   cwr_withdraw_time    bigint comment '提现时间',
   cwr_remit_time       bigint comment '打款时间',
   primary key (cwr_id)
)
type = InnoDB;

alter table cats_withdraw_record comment '提现记录表';

/*==============================================================*/
/* Table: cm_admin_user                                         */
/*==============================================================*/
create table cm_admin_user
(
   au_id                bigint not null auto_increment comment '后台用户表主键',
   au_show_name         varchar(128) comment '姓名',
   au_sex               int comment '性别',
   au_age               int comment '年龄',
   au_tel               varchar(128) comment '联系电话',
   au_email             varchar(128) comment '邮箱',
   au_post_code         varchar(128) comment '邮编',
   au_address           varchar(128) comment '联系地址',
   au_user_name         varchar(128) comment '用户名',
   au_password          varchar(128) comment '密码',
   au_role              bigint comment '角色',
   au_zone              varchar(128) comment '区域',
   au_is_valid          int comment '是否有效',
   au_create_date       bigint comment '创建时间',
   au_create_user_id    bigint comment '创建人id',
   au_create_user_name  varchar(128) comment '创建人姓名',
   au_update_user_id    bigint comment '更新人id',
   au_update_user_name  varchar(128) comment '更新人名称',
   au_update_date       bigint comment '更新时间',
   primary key (au_id)
)
type = InnoDB;

alter table cm_admin_user comment '系统用户表';

/*==============================================================*/
/* Table: cm_bills                                              */
/*==============================================================*/
create table cm_bills
(
   cb_id                bigint not null auto_increment comment '账单表主键',
   cb_cu_id             bigint comment '用户表id',
   cb_biz_type          int comment '业务类型(0:参与调研;1:提现)',
   cb_biz_id            bigint comment '业务id',
   cb_biz_name          varchar(512) comment '业务名称',
   cb_trade_money       decimal(10,2) comment '交易金额',
   cb_trade_time        bigint comment '交易时间',
   primary key (cb_id)
)
type = InnoDB;

alter table cm_bills comment '账单表';

/*==============================================================*/
/* Table: cm_sms_code                                           */
/*==============================================================*/
create table cm_sms_code
(
   csc_id               bigint not null auto_increment comment '主键',
   csc_tel_no           varchar(128) comment '手机号',
   csc_user_id          bigint comment '用户主键',
   csc_type             varchar(64) comment '类型(code,password,etc)',
   csc_code             varchar(128) comment '验证码',
   csc_invalid_date     bigint comment '有效时间',
   csc_ip_address       varchar(128) comment 'IP地址',
   csc_is_used          int comment '是否使用(0:否1:是)',
   csc_create_date      bigint comment '创建时间',
   primary key (csc_id)
)
type = InnoDB;

alter table cm_sms_code comment '短信验证码表';

/*==============================================================*/
/* Table: cm_user                                               */
/*==============================================================*/
create table cm_user
(
   cu_id                bigint not null auto_increment comment '用户表主键',
   cu_type              varchar(64) comment '用户类型',
   cu_user_name         varchar(128) comment '用户名',
   cu_password          varchar(128) comment '密码',
   cu_nick_name         varchar(128) comment '昵称',
   cu_real_name         varchar(128) comment '真实姓名',
   cu_sex               varchar(64) comment '性别',
   cu_age               int comment '年龄',
   cu_headimg           varchar(128) comment '头像',
   cu_tel_no            varchar(128) comment '手机号',
   cu_email             varchar(128) comment '邮箱',
   cu_province          varchar(128) comment '省份',
   cu_city              varchar(128) comment '城市',
   cu_hospital          varchar(512) comment '医院',
   cu_dept              varchar(128) comment '科室',
   cu_professional      varchar(128) comment '职称',
   cu_post              varchar(128) comment '职业',
   cu_dept_tel_no       varchar(128) comment '科室固话',
   cu_certificate_img   varchar(128) comment '执业证照片',
   cu_is_authentication int comment '是否完成认证（0：否；1：是）',
   cu_medlive_id        bigint comment '医脉通id',
   cu_balance           decimal(10,2) comment '余额',
   cu_lock_money        decimal(10,2) comment '冻结金额',
   cu_is_valid          int default 1 comment '是否有效（0：否；1：是）',
   cu_create_time       bigint comment '创建时间',
   cu_update_time       bigint comment '更新时间',
   primary key (cu_id)
)
type = InnoDB;

alter table cm_user comment '用户表';

/*==============================================================*/
/* Table: cm_wechat_user                                        */
/*==============================================================*/
create table cm_wechat_user
(
   cwu_id               bigint not null auto_increment comment '微信用户表主键',
   cwu_cu_id            bigint comment '用户表主键',
   cwu_subscribe        int comment '是否订阅该公众号标识（0：未关注；1：关注）',
   cwu_openid           varchar(128) comment 'openid',
   cwu_nickname         varchar(128) comment '昵称',
   cwu_sex              varchar(128) comment '性别',
   cwu_city             varchar(128) comment '城市',
   cwu_country          varchar(128) comment '国家',
   cwu_province         varchar(128) comment '省份',
   cwu_language         varchar(128) comment '语言',
   cwu_headimgurl       varchar(512) comment '头像',
   cwu_subscribe_time   bigint comment '关注时间',
   cwu_unionid          varchar(128) comment 'unionid',
   cwu_remark           varchar(128) comment '备注',
   cwu_groupid          varchar(128) comment '用户分组ID',
   cwu_tagid_list       varchar(1024) comment '标签ID列表',
   cwu_headimg          varchar(128) comment '头像本地路径',
   cwu_score            int comment '积分',
   cwu_is_valid         int comment '是否有效（0:否；1：是）',
   cwu_create_time      bigint comment '创建时间',
   cwu_update_time      bigint comment '更新时间',
   primary key (cwu_id)
)
type = InnoDB;

alter table cm_wechat_user comment '微信用户表';

/*==============================================================*/
/* Table: wx_custom_menu                                        */
/*==============================================================*/
create table wx_custom_menu
(
   wcm_id               bigint not null auto_increment comment '自定义菜单表主键',
   wcm_name             varchar(128) comment '菜单名称',
   wcm_group_id         bigint comment '所在菜单组id',
   wcm_parent_id        bigint comment '父节点',
   wcm_type             int comment '菜单类型（1：发消息。2：跳转网页）',
   wcm_reply_type       int comment 'wcmType为1（发消息）时，回复的内容类型(1：图文，2：关键字)',
   wcm_reply_biz_id     bigint comment '回复的内容类型对应的主键',
   wcm_reply_biz_is_group int comment '回复图文是否是分组 0：否 1：是',
   wcm_link             varchar(512) comment '跳转网页链接',
   wcm_create_time      bigint comment '创建时间',
   wcm_create_user_id   bigint comment '创建人id',
   wcm_create_user_name varchar(128) comment '创建人姓名',
   wcm_update_time      bigint comment '更新时间',
   wcm_update_user_id   bigint comment '更新人id',
   wcm_update_user_name varchar(128) comment '更新人姓名',
   primary key (wcm_id)
)
type = InnoDB;

alter table wx_custom_menu comment '微信自定义菜单表';

/*==============================================================*/
/* Table: wx_custom_menu_group                                  */
/*==============================================================*/
create table wx_custom_menu_group
(
   wcmg_id              bigint not null auto_increment comment '菜单组表主键',
   wcmg_name            varchar(128) comment '菜单组名称',
   wcmg_is_valid        int comment '是否有效',
   wcmg_create_time     bigint comment '创建时间',
   wcmg_create_user_id  bigint comment '创建人id',
   wcmg_create_user_name varchar(128) comment '创建人名称',
   wcmg_update_time     bigint comment '更新时间',
   wcmg_update_user_id  bigint comment '更新人id',
   wcmg_update_user_name varchar(128) comment '更新人名称',
   primary key (wcmg_id)
)
type = InnoDB;

alter table wx_custom_menu_group comment '微信自定义菜单组表';

/*==============================================================*/
/* Table: wx_material                                           */
/*==============================================================*/
create table wx_material
(
   wm_id                bigint not null auto_increment comment '图文素材表主键',
   wm_position          int comment '所在分组排序位置',
   wm_group_id          bigint comment '所在分组ID',
   wm_type              int comment '类型（0：本地。1：微信）',
   wm_media_type        int comment '非图文媒体类型（0：图文、1：图片（image）、2：语音（voice）、3：视频（video）和 4、缩略图（thumb））',
   wm_img_text_media_id varchar(128) comment '上传后的图文素材MediaId（微信）',
   wm_non_img_text_media_id varchar(128) comment '非图文媒体上传微信后的mediaId',
   wm_path              varchar(128) comment '非图文媒体路径',
   wm_title             varchar(512) comment '标题',
   wm_author            varchar(128) comment '作者',
   wm_digest            varchar(128) comment '摘要',
   wm_content           varchar(1024) comment '内容',
   wm_show_cover_pic    int comment '封面图',
   wm_content_source_url varchar(128) comment '“阅读原文”的链接',
   wx_user_count        int comment '创建时间',
   wmg_create_user_id   bigint comment '创建人id',
   wmg_create_user_name varchar(128) comment '创建人姓名',
   wmg_update_time      bigint comment '更新时间',
   wmg_update_user_id   bigint comment '更新人id',
   wmg_update_user_name varchar(128) comment '更新人姓名',
   primary key (wm_id)
)
type = InnoDB;

alter table wx_material comment '图文素材表';

/*==============================================================*/
/* Table: wx_material_group                                     */
/*==============================================================*/
create table wx_material_group
(
   wx_id                bigint not null auto_increment comment '素材组表主键',
   wx_tag_id            varchar(128) comment '素材组名称',
   wx_tag_name          varchar(128) comment '素材组描述',
   wx_user_count        int comment '创建时间',
   wmg_create_user_id   bigint comment '创建人id',
   wmg_create_user_name varchar(128) comment '创建人姓名',
   wmg_update_time      bigint comment '更新时间',
   wmg_update_user_id   bigint comment '更新人id',
   wmg_update_user_name varchar(128) comment '更新人姓名',
   primary key (wx_id)
)
type = InnoDB;

alter table wx_material_group comment '素材组表';

/*==============================================================*/
/* Table: wx_tag                                                */
/*==============================================================*/
create table wx_tag
(
   wx_id                bigint not null comment '素材组表主键',
   wx_tag_id            varchar(128) comment '素材组名称',
   wx_tag_name          varchar(128) comment '素材组描述',
   wx_user_count        int comment '创建时间',
   primary key (wx_id)
)
type = InnoDB;

alter table wx_tag comment '标签表';

