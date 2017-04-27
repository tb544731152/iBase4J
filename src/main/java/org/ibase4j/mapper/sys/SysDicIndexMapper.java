package org.ibase4j.mapper.sys;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.ibase4j.core.base.BaseMapper;
import org.ibase4j.model.sys.SysDicIndex;

public interface SysDicIndexMapper extends BaseMapper<SysDicIndex> {
    List<Long> selectIdPage(@Param("cm") Map<String, Object> params);
}
