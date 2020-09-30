package com.sohu.cache.entity;

import com.sohu.cache.web.util.Page;
import lombok.Data;

/**
 * 搜索实体
 *
 * @author leifu
 */
@Data
public class AppSearch {
    /**
     * 应用id
     */
    private Long appId;

    /**
     * 应用名
     */
    private String appName;

    /**
     * 应用类型
     */
    private Integer appType;

    /**
     * 申请状态
     */
    private Integer appStatus;

    /**
     * 命中率排序
     */
    private String orderBy;

    /**
     * 重要度
     */
    private Integer importantLevel;
    /**
     * Redis版本 ,默认查询所有版本
     */
    private Integer versionId = -1;

    /**
     * 相关用户id
     */
    private long userId;

    /**
     * 分页
     */
    private Page page;

}
