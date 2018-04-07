local FormatUtil = {}

------------------------------中文数字翻译开始------------------------------

--[[中文数字翻译]]
FormatUtil.ChineseBits =  {
    ['0'] = '零',
    ['1'] = '一',
    ['2'] = '二',
    ['3'] = '三',
    ['4'] = '四',
    ['5'] = '五',
    ['6'] = '六',
    ['7'] = '七',
    ['8'] = '八',
    ['9'] = '九',
}

--[[中文单位翻译，不打算支持太大的数]]
FormatUtil.ChineseUnits = {'','十','百','千','万','十','百','千','亿','十','百','千','万'}

--[[中文权位]]
FormatUtil.ZERO    = FormatUtil.ChineseBits['0']
FormatUtil.WAN     = FormatUtil.ChineseUnits[5]
FormatUtil.YI      = FormatUtil.ChineseUnits[9]
FormatUtil.DOT     = '点'
FormatUtil.NAGTIVE = '负的'

--[[将数字翻译为中文直读表述]]
function FormatUtil:numberToChineseFlat_(num)
    local num_str = tostring(num)
    local num_len = string.len(num_str)
    local num_chinese_arr = {}
    
    for cur_len=1, num_len do
        -- 当前数字
        local bit_str = string.sub(num_str, cur_len, cur_len)
        -- 插入中文数字
        local bit_chinese = FormatUtil.ChineseBits[bit_str]
        table.insert(num_chinese_arr, bit_chinese)
    end

    return table.concat(num_chinese_arr)
end

--[[将数字(包含小数点)翻译为中文直读表述]]
function FormatUtil:numberToChineseFlat(num)
    local num_str   = tostring(num)
    local split_str = string.split(num_str, '.')
    local int_str   = FormatUtil:numberToChineseFlat_(split_str[1])
    local num_chinese_str = int_str
    if #split_str > 1 then
        local digit_str = FormatUtil:numberToChineseFlat_(split_str[2], true)
        num_chinese_str = int_str .. FormatUtil.DOT .. digit_str
    end
    printf('数字 : %s 中文 : %s', num, num_chinese_str)
    return num_chinese_str
end

--[[将数字翻译为中文语义表述]]
function FormatUtil:numberToChinese_(num)
    local num_str  = tostring(num)
    local num_len  = string.len(num_str)
    local bit_arr  = string.unpack(num_str)
    local num_arr = {}
    
    for i = num_len, 1, -1 do
        local bit_str  = FormatUtil.ChineseBits[bit_arr[num_len-i+1]]
        local unit_str = FormatUtil.ChineseUnits[i]
        if bit_str ~= FormatUtil.ZERO then
            if not (unit_str ~= '' and i == 1) then
                table.insert(num_arr, bit_str .. unit_str)
            end
        elseif unit_str ~= '' and num_arr[#num_arr] ~= FormatUtil.ZERO then
            if i % 4 == 1 then
                local last_str = num_arr[#num_arr]
                local last_idx = string.find(last_str, FormatUtil.YI)
                if not(unit_str == FormatUtil.WAN and last_idx) then
                    table.insert(num_arr, unit_str)
                end
            else
                local behind_bit_str = FormatUtil.ChineseBits[bit_arr[num_len-i+2]]
                if behind_bit_str and behind_bit_str ~= FormatUtil.ZERO then
                    table.insert(num_arr, FormatUtil.ZERO)
                end
            end
        end
        if num_len == 1 and bit_str == FormatUtil.ZERO then
            table.insert(num_arr, FormatUtil.ZERO)
        end
    end
    
    -- printf('阿拉伯：%s  中文：%s', num, table.concat(num_arr))
    return table.concat(num_arr)
end

--[[将数字(包含小数点)翻译为中文语义表述]]
function FormatUtil:numberToChinese(num)    
    local num_chinese_str = ''
    local num_ori = num
    if num < 0 then
        --处理负数
        num = -num
        num_chinese_str = FormatUtil.NAGTIVE
    end
    local num_split = string.split(tostring(num), '.')
    local num_int   = tonumber(num_split[1])
    if string.len(tostring(num_int)) >= 13 then
        --整数部分超过13位则不计算
        return num
    end
    local num_digit = tonumber(num_split[2] or 0)
    local int_str   = FormatUtil:numberToChinese_(num_int)
    num_chinese_str = num_chinese_str .. int_str
    if num_digit and num_digit ~= 0 then
        --处理小数点部分
        local digit_str = FormatUtil:numberToChineseFlat_(num_digit)
        num_chinese_str = num_chinese_str .. FormatUtil.DOT .. digit_str
    end
    printf('阿拉伯数字 : %s => 中文表述 : %s', num_ori, num_chinese_str)
    return num_chinese_str
end

------------------------------中文数字翻译结束------------------------------

return FormatUtil
