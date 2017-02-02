<?php

class IndexAction extends Action
{
    public function index()
    {
        // 代码整理者注：
        // 以下注释仅为了表示这个子方法的用途，即给哪个模板变量赋值，没有其他用途

        // $eFocuslist = array(array('url' => '', 'title' => ''));
        // $eTrivialist = array(array('url' => '', 'title' => ''));
        // $eInterviewlist = array(array('url' => '', 'title' => ''));
        // $eVisitList = array(array('url' => '', 'title' => ''));
        // $eBlogList = array(array('url' => '', 'title' => ''));
        $this->eNews();

        // $eKnowList = array(array('question_id' => '', 'question_content' => ''));
        $this->eKnow();

        // $ePicList1 = array(array('url' => '', 'thumb' => ''));
        // $ePicList2 = array(array('url' => '', 'thumb' => ''));
        // $ePicList3 = array(array('url' => '', 'thumb' => ''));
        // $ePicList4 = array(array('url' => '', 'thumb' => ''));
        // $ePicList5 = array(array('url' => '', 'thumb' => ''));
        $this->ePic();

        // $eLovedvNewList = array(array('title' => '', 'introduction' => ''));
        // $eLovedvFocusList = array(array('id' => '', 'title' => '', 'score' => ''));
        $this->eLovedv();

        // 代码整理者注：此函数已废弃
        // $this->eNewdv();

        // $eAnnList = array(array('aid' => '', 'title' => ''));
        $this->eAnn();

        $this->display();
    }

    private function eNews()
    {
        // 代码整理者注：
        // e瞳新闻使用PHPCMSv9管理，catid即为对应类别的id
        $eNewsModel = D('News');

        $eFocusList = $eNewsModel->where('catid=1')->order('id desc')->limit(8)->select();
        $this->assign('eFocuslist', $eFocusList);

        $eTriviaList = $eNewsModel->where('catid=2')->order('id desc')->limit(8)->select();
        $this->assign('eTrivialist', $eTriviaList);

        $eInterviewList = $eNewsModel->where('catid=3')->order('id desc')->limit(8)->select();
        $this->assign('eInterviewlist', $eInterviewList);

        $eVisitList = $eNewsModel->where('catid=4')->order('id desc')->limit(8)->select();
        $this->assign('eVisitList', $eVisitList);

        $eBlogList = $eNewsModel->where('catid=5')->order('id desc')->limit(8)->select();
        $this->assign('eBlogList', $eBlogList);
    }

    private function eKnow()
    {
        $eKnowModel = D("Know");

        // 代码整理者注：
        // 以前的代码是只取未回答的问题，如下
        // $eKnowList = $eKnowModel->where('status=1')->order('id desc')->limit(10)->select();

        $eKnowList = $eKnowModel->order('question_id desc')->limit(10)->select();
        $this->assign('eKnowList', $eKnowList);
    }

    private function ePic()
    {
        $ePicModel = D('Pic');

        // 代码整理者注：
        // posids == 1 表示置顶
        $ePicList = $ePicModel->where('posids = 1')->order('id desc')->limit(5)->select();

        // 代码整理者注：
        // 这是为了保证5个标签页的滚动内容相同
        $this->assign('ePicList1', $ePicList);
        $this->assign('ePicList2', $ePicList);
        $this->assign('ePicList3', $ePicList);
        $this->assign('ePicList4', $ePicList);
        $this->assign('ePicList5', $ePicList);
    }

    private function eAnn()
    {
        // 代码整理者注：
        // 在整理代码时并不想改变原有代码的结构，此处相当于
        // SELECT * FROM `Ann` WHERE `endtime` > NOW() LIMIT 5;
        // 不知道为什么当时会写成这个样子
        $eAnnModel = D('Ann');
        $eAnnList = $eAnnModel->order('aid desc')->select();
        $i = 0;
        foreach ($eAnnList as $key => $value) {
            if ($i <= 5) {
                $time = time();
                $endtime = strtotime($value['endtime']);
                if ($time < $endtime) {
                    $array[] = $value;
                    $i++;
                }
            }
        }
        $this->assign('eAnnList', $array);
    }

    private function eLovedv()
    {
        $eLovedvModel = D('Lovedv');

        // 代码整理者注：
        // 这是一个根据访问量和过去时间评价的算法,
        // 随着访问的增多，分数线性增高
        // 随着时间的增长，分数成幂函数减少，
        // 0.37672这个Magic number我也不知道是怎么算出来的，反正表示一个权重，0表示与时间无关，1表示与(时间小时数+2)成-1次幂的关系，
        // 然而——这里的取小时数的SQL语句的用法是错误的。
        // 由于此项目已归档，所以此错误并未更改
        // 在使用本算法之前使用的算法是只考虑访问量，
        // 之前的代码是: $eLovedvFocusList = $eLovedvModel->order('count desc')->limit(7)->select();
        $tableName = $eLovedvModel->getTableName();
        $sql = "SELECT `count` / POWER(EXTRACT(HOUR FROM (TIMEDIFF(NOW(), `add_time`))) + 2, 0.37672) AS `score`, `id`, `title`, `count` FROM {$tableName} ORDER BY `score` DESC LIMIT 7";
        $eLovedvFocusList = $eLovedvModel->query($sql);
        $this->assign('eLovedvFocusList', $eLovedvFocusList);

        $eLovedvNewList = $eLovedvModel->order('id desc')->limit(1)->select();
        $eLovedvNewList[0]['introduction'] = $this->utf8Substr($eLovedvNewList[0]['introduction'], 0, 80) . '...';
        $this->assign('eLovedvNewList', $eLovedvNewList);
        // 代码整理者注：
        // 下面这行无用，由于使用了LIMIT 1的条件，可能本意是把id单独复制给一个变量
        // $this->assign('eLovedvNewListid', $eLovedvNewList[0]['id']);
    }

    // /**
    //  * @deprecated 代码整理者注：请使用IndexAction->eLovedv()
    //  */
    // private function eNewdv()
    // {
    //     $eNewdvModel = D('Lovedv');
    //     $eNewdvList = $eNewdvModel->order('id desc')->limit(2)->select();
    //     $this->assign('eNewdvList', $eNewdvList);
    // }

    private function utf8Substr($str, $from, $len)
    {
        return preg_replace('#^(?:[\x00-\x7F]|[\xC0-\xFF][\x80-\xBF]+){0,' . $from . '}' . '((?:[\x00-\x7F]|[\xC0-\xFF][\x80-\xBF]+){0,' . $len . '}).*#s', '$1', $str);
    }
}
