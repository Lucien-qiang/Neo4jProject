/**
 * Created by Administrator on 14-6-30.
 */
/**
 * ����֤
 */
var obj;
var checkCan = new Array();
var patterns = new Object();
//ƥ��ip��ַ
patterns.Ip = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$/;
//ƥ���ʼ���ַ
patterns.Email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
//ƥ�����ڸ�ʽ2008-01-31������ƥ��2008-13-00
patterns.Date = /^\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2]\d|3[0-1])$/;
/*ƥ��ʱ���ʽ00:15:39������ƥ��24:60:00������ʹ��RegExp����Ĺ��췽��
 ������RegExp����ʵ����ע��������ʽģʽ�ı��еġ�\��Ҫд�ɡ�\\��*/
patterns.Time = new RegExp("^([0-1]\\d|2[0-3]):[0-5]\\d:[0-5]\\d$");
//ƥ����������
patterns.Num = /^[0-9]*$/;
//ƥ�両������
patterns.FloatNum = /^\d+(\.\d+)?$/;
//ƥ�����ڼ�ʱ���ʽ
patterns.DateAndTime = /^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1])) (?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9](:[0-5][0-9])?$/;
//ƥ���ֻ�����
patterns.Phone = /^(1[3|4|5|8])[0-9]{9}$/;
//ƥ������
patterns.Chinese=/^[\u4e00-\u9fa5]{2,8}$/;
//qq����
patterns.QQ=new RegExp("^[1-9]\\d{4,10}$");
patterns.Telephone=/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
//���֤������ʽ(15λ)
patterns.isIDCard1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;
//���֤������ʽ(18λ)
patterns.isIDCard2=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;


$(function (e) {
    bind_form_check();
})

var bind_form_check=function(){
    $('.form_check').after('<div class=" show_info" ></div>');
    $('.form_check').click(function () {
    })
    $('.form_check').focus(function () {
    })
    $('.form_check').blur(function () {
        obj = $(this);
        var type = obj.attr('check-type');
        //��֤���ݵĳ����Ƿ���ȷ
        var checkLength = checkInputLength();
        //����ƥ��
        eval('var check = check' + type + '()');
        if (checkLength == 1 && check.status) {
            //ƥ����ȷ
            check_form.success(check.info);
            checkCan[obj.attr('name')] = 1;
        } else if (checkLength == 0) {
            //ƥ������Ϊ��
            //�Ƿ����Ϊ��
            var canEmpty= obj.attr('can-empty')||0;
            if(canEmpty!=0){//�������Ϊ��
                check_form.remove();
                checkCan[obj.attr('name')] = 1;
            }else{
                check_form.error('����Ϊ�գ�')
                checkCan[obj.attr('name')] = 0;
            }
        } else if (checkLength == -1) {
            //ƥ�����ݳ��Ȳ���ȷ
            check_form.error('������' + obj.attr('check-length') + '�ڣ�')
            checkCan[obj.attr('name')] = 0;
        }else if (checkLength==-2) {
            var strs = new Array(); //����һ����
            strs = obj.attr('check-length').split(","); //�ַ��ָ�
            //ƥ�����ݳ��Ȳ���ȷ
            check_form.error('���Ȳ�������' + strs[0] + '���ַ���')
            checkCan[obj.attr('name')] = 0;
        }else if (!check.status) {
            //ƥ�䲻�ɹ�
            check_form.error(check.info)
            checkCan[obj.attr('name')] = 0;
        }
    })
    $('.form_check').change(function () {
        $(this).blur();
    })
    /**
     * �ύʱ�������
     */
    $(":submit").click(function (e) {
        var canDubmit = true;
        for (var key in checkCan) {
            canDubmit = canDubmit & checkCan[key];
        }
        if (!canDubmit) {
            toast.error('����д��������ȷ����Ϣ�����ύ��')
            e.preventDefault();
            return false;
        }
    })
}
/**
 * ����Ƿ�Ϊ��
 * @returns {boolean}
 */
var checkEmpty = function () {
    if (obj.val().length == 0) {
        return false;
    } else {
        return true;
    }
}
/**
 * ��鳤���Ƿ����Ҫ��
 * @returns {number}
 */
var checkInputLength = function () {
    str = obj.val().replace(/\s+/g, "");
    if (str.length == 0) {
        return 0;
    } else {
        if (typeof (obj.attr('check-length')) != 'undefined') {
            var strs = new Array(); //����һ����
            strs = obj.attr('check-length').split(","); //�ַ��ָ�
            if (strs[1]) {
                if(strs[1]=='*'){
                    if (str.length < strs[0]) {//1,*��������Сֵ��
                        return -2;
                    }
                }else if (strs[1] < str.length || str.length < strs[0]) {
                    return -1;
                }
            }else {
                if (strs[0] < str.length) {//����ֵ�����ֵ��
                    return -1;
                }
            }
        }
        return 1;
    }
}
/**
 * ��֤�ı���
 * @returns {{status: number, info: string}}
 */
var checkText = function () {
    var res = {status: 1, info: ''}
    return res;
}

/**zzl
 * ��֤���������
 * @returns {{status: number, info: string}}
 */
var checkChinese = function () {
    var str=obj.val();
    if(patterns['Chinese'].test(str)){
        var res = {status: 1, info: ''}
    }
    else{
        var res = {status: 0, info: '������2-8�����ֵ�����'}
    }
    return res;
}

/**zzl
 * ��֤QQ��
 * @returns {{status: number, info: string}}
 */
var checkQQ = function () {
    var str=obj.val();
    if(patterns['QQ'].test(str)){
        var res = {status: 1, info: ''}
    }
    else{
        var res = {status: 0, info: '��������ȷqq�ţ�'}
    }
    return res;
}

/**zzl
 * ��֤����
 * @returns {{status: number, info: string}}
 */
var checkEmail = function () {
    var str=obj.val();
    if(patterns['Email'].test(str)){
        var res = {status: 1, info: ''}
    }
    else{
        var res = {status: 0, info: '��������ȷqq�ţ�'}
    }
    return res;
}

/**zzl
 * ��֤���֤��
 * @returns {{status: number, info: string}}
 */
var checkIDCard = function () {
    var str=obj.val();
    if(patterns['isIDCard1'].test(str)||patterns['isIDCard2'].test(str)){
        var res = {status: 1, info: ''}
    }
    else{
        var res = {status: 0, info: '��������ȷ���֤�ţ�'}
    }
    return res;
}

/**
 * ��֤����
 * @returns {{status: number, info: string}|{status: number, info: string}}
 */
var checkDate = function () {
    var str = obj.val();
    if (patterns['Date'].test(str)) {
        var res = {status: 1, info: ''}
    }
    else {
        var res = {status: 0, info: '����д��ȷ�ĸ�ʽ��'}
    }
    return res;
}
/**
 * ��֤���ڼ�ʱ��
 * @returns {{status: number, info: string}|{status: number, info: string}}
 */
var checkDateAndTime = function () {
    var str = obj.val();
    if (patterns['DateAndTime'].test(str)) {
        var res = {status: 1, info: ''}
    }
    else {
        var res = {status: 0, info: '����д��ȷ�ĸ�ʽ��'}
    }
    return res;
}
/**
 * ��֤����
 * @returns {{status: number, info: string}|{status: number, info: string}}
 */
var checkNum = function () {
    var str = obj.val();
    if (patterns['Num'].test(parseInt(str))) {
        if (typeof (obj.attr('check-value')) != 'undefined') {
            var strs = new Array(); //����һ����
            strs = obj.attr('check-value').split(","); //�ַ��ָ�
            str = parseInt(obj.val());
            if (strs[1]) {
                if(strs[1] == '*'){
                    if ( str < parseInt(strs[0])) {
                        var res = {status: 0, info: '��������Ϊ' + parseInt(strs[0]) }
                        return res;
                    }
                }
                if (parseInt(strs[1]) < str || str < parseInt(strs[0])) {
                    var res = {status: 0, info: '���ַ�Χ��' + strs + '��'}
                    return res;
                }
            }
            else {
                if (parseInt(strs[0]) < str) {
                    var res = {status: 0, info: '���ַ�Χ��' + strs + '��'}
                    return res;
                }
            }
        }
        var res = {status: 1, info: ''}
    }
    else {
        var res = {status: 0, info: '����д���֣�'}
    }
    return res;
}

/**zzl
 * ��֤��������
 * @returns {{status: number, info: string}|{status: number, info: string}}
 */
var checkIntNum = function () {
    var str = obj.val();
    if(parseInt(str)!=str){
        var res = {status: 0, info: '����д�������֣�'}
        return res;
    }
    if (patterns['Num'].test(parseInt(str))) {
        if (typeof (obj.attr('check-value')) != 'undefined') {
            var strs = new Array(); //����һ����
            strs = obj.attr('check-value').split(","); //�ַ��ָ�
            str = parseInt(obj.val());
            if (strs[1]) {
                if(strs[1] == '*'){
                    if ( str < parseInt(strs[0])) {
                        var res = {status: 0, info: '��������Ϊ' + parseInt(strs[0]) }
                        return res;
                    }
                }
                if (parseInt(strs[1]) < str || str < parseInt(strs[0])) {
                    var res = {status: 0, info: '���ַ�Χ��' + strs + '��'}
                    return res;
                }
            }
            else {
                if (parseInt(strs[0]) < str) {
                    var res = {status: 0, info: '���ַ�Χ��' + strs + '��'}
                    return res;
                }
            }
        }
        var res = {status: 1, info: ''}
    }
    else {
        var res = {status: 0, info: '����д�������֣�'}
    }
    return res;
}

/**zzl
 * ��֤����������
 * @returns {{status: number, info: string}|{status: number, info: string}}
 */
var checkFloatNum = function () {
    var str = obj.val();
    if(parseFloat(str)!=str){
        var res = {status: 0, info: '����д���������֣�'}
        return res;
    }
    if (patterns['FloatNum'].test(parseFloat(str))) {
        if (typeof (obj.attr('check-value')) != 'undefined') {
            var strs = new Array(); //����һ����
            strs = obj.attr('check-value').split(","); //�ַ��ָ�
            str = parseFloat(obj.val());
            if (strs[1]) {
                if(strs[1] == '*'){
                    if ( str < parseFloat(strs[0])) {
                        var res = {status: 0, info: '��������Ϊ' + parseFloat(strs[0]) }
                        return res;
                    }
                }
                if (parseFloat(strs[1]) < str || str < parseFloat(strs[0])) {
                    var res = {status: 0, info: '���ַ�Χ��' + strs + '��'}
                    return res;
                }
            }
            else {
                if (parseFloat(strs[0]) < str) {
                    var res = {status: 0, info: '���ַ�Χ��' + strs + '��'}
                    return res;
                }
            }
        }
        var res = {status: 1, info: ''}
    }
    else {
        var res = {status: 0, info: '����д�������֣�'}
    }
    return res;
}

/**zzl
 * ��֤�ֻ������̶��绰
 * @returns {{status: number, info: string}|{status: number, info: string}}
 */
var checkPhoneOrTelephone = function () {
    var str = obj.val();
    if (patterns['Phone'].test(parseInt(str))||patterns['Telephone'].test(str)) {
        var res = {status: 1, info: ''}
    }
    else {
        var res = {status: 0, info: '����д�ֻ������̶��绰��'}
    }
    return res;
}

/**
 * ��֤�ֻ�
 * @returns {{status: number, info: string}|{status: number, info: string}}
 */
var checkPhone = function () {
    var str = obj.val();
    if (patterns['Phone'].test(parseInt(str))) {
        var res = {status: 1, info: ''}
    }
    else {
        var res = {status: 0, info: '����д�ֻ����룡'}
    }
    return res;
}
/**
 * ��֤�̶��绰
 * @returns {{status: number, info: string}|{status: number, info: string}}
 */
var checkTelephone = function () {
    var str = obj.val();
    if (patterns['Telephone'].test(str)) {
        var res = {status: 1, info: ''}
    }
    else {
        var res = {status: 0, info: '����д�̶��绰���룡'}
    }
    return res;
}


/**
 * ��֤�����˵�
 * @returns {{status: number, info: string}|{status: number, info: string}}
 */
var checkSelect = function () {
    var str = obj.val();
    if(str==0){
        var can_empty=obj.attr('can-empty');
        if(can_empty==1){
            check_form.remove();
            checkCan[obj.attr('name')] = 1;
            return;
        }
    }
    if (str != 0 && str != '' && typeof (str) != 'undefined') {
        var res = {status: 1, info: ''}
    }
    else {
        var res = {status: 0, info: '��ѡ��'}
    }
    return res;
}

/**
 * ��֤�����������ʽ
 * ����reg-exp="^[0-9]*\/[0-9]*\/[0-9]*$"
 */
var checkRegExps=function(){
    var regExps=obj.attr('reg-exp');
    if(typeof(regExps)=="undefined"){
        checkCan[obj.attr('name')] = 1;
        return;
    }
    var str=obj.val();
    regExps=new RegExp(regExps);
    if(regExps.test(str)){
        var res={status:1,info:''}
    }
    else{
        var errorInfo=obj.attr('error-info')||"�밴��ȷ��ʽ��д��";
        var res = {status: 0, info:errorInfo}
    }
    return res;
}

var checkUsername = function(){
    var str = obj.val();
    var type = 'username';
    var url = obj.attr('check-url');
    $.post(url,{account:str,type:type},function(res){
        ajaxRerurn(res);
    },'json')

}
var checkUserEmail = function(){
    var str = obj.val();
    var type = 'email';
    var url = obj.attr('check-url');
    $.post(url,{account:str,type:type},function(res){
        ajaxRerurn(res);
    },'json')

}

var checkUserMobile = function(){
    var str = obj.val();
    var type = 'mobile';
    var url = obj.attr('check-url');
    $.post(url,{account:str,type:type},function(res){
        ajaxRerurn(res);
    },'json')

}

var checkNickname = function(){
    var str = obj.val();
    var url = obj.attr('check-url');
    $.post(url,{nickname:str},function(res){
        ajaxRerurn(res);
    },'json')

}

var ajaxRerurn = function(res){
    if(res.status){
        checkCan[obj.attr('name')] = 1;
        check_form.success(res.info);

    }else{
        checkCan[obj.attr('name')] = 0;
        check_form.error(res.info);
    }
}


/**
 * ��ʾ��ʾ��Ϣ
 * @param str
 */
var showInfo = function (str,status) {
    if(str != ''){
        var color;
        if(status == 1 ||  status == true){
            color = 'green';
        }
        else{
            color = 'red';
        }

        var html = '<div class="send '+color+'"><div class="arrow"></div>' + str + '</div>';
        obj.parent().find('.show_info').html(html);
    }else{
        removeInfo();
    }


}
/**zzl
 * �Ƴ���ʾ��Ϣ
 *
 */
var removeInfo = function () {
    var html = '';
    obj.parent().find('.show_info').html(html);

}

/**
 * ��ʾ��Ϣ
 * @type {{error: Function, success: Function}}
 */
var check_form = {
    /**zzl
     * �Ƴ��Ǳ����������ʾ��Ϣ
     */
    remove:function(){
       // var html = ' <span class="glyphicon form-control-feedback"></span>';
       // obj.parent().find('.glyphicon').replaceWith(html);
        removeInfo();
    },
    error: function (str) {
        //var html = ' <span class="glyphicon glyphicon-remove form-control-feedback"></span>';
        //obj.parent().find('.glyphicon').replaceWith(html);
        showInfo(str);
       // obj.next().css('margin-left', obj.width() + 22 + 'px');
    },
    success: function (str) {
       // var html = ' <span class="glyphicon glyphicon-ok form-control-feedback"></span>';
        //obj.parent().find('.glyphicon').replaceWith(html);
        showInfo(str,1);
        //obj.next().css('margin-left', obj.width() + 22 + 'px');
    }
}

