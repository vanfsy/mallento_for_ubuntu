-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: mysql8048.xserver.jp
-- Generation Time: 2020 年 3 月 03 日 12:33
-- サーバのバージョン： 5.7.27
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tinyart_mallento`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `browses`
--

CREATE TABLE IF NOT EXISTS `browses` (
  `id` int(10) unsigned NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `member_id` int(11) DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `cake_sessions`
--

CREATE TABLE IF NOT EXISTS `cake_sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `expires` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `calendar_dates`
--

CREATE TABLE IF NOT EXISTS `calendar_dates` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT '1900-01-01',
  `year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `month` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `day` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `day_week` int(11) NOT NULL DEFAULT '0',
  `holiday` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `off_work_flg` int(11) DEFAULT NULL,
  `deliver_date` date NOT NULL DEFAULT '1900-01-01',
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1463 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `cashing_datas`
--

CREATE TABLE IF NOT EXISTS `cashing_datas` (
  `id` int(11) NOT NULL,
  `status` int(11) DEFAULT '0',
  `member_id` int(11) NOT NULL,
  `money` decimal(11,0) DEFAULT NULL,
  `fee` decimal(11,0) DEFAULT '0',
  `possible_cashing` decimal(11,0) DEFAULT '0',
  `apply_date` date DEFAULT NULL,
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `configs`
--

CREATE TABLE IF NOT EXISTS `configs` (
  `id` int(11) NOT NULL,
  `code` varchar(126) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` decimal(11,2) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `configs`
--

INSERT INTO `configs` (`id`, `code`, `name`, `unit_name`, `type`, `number`, `value`, `description`, `rank`, `del_flg`, `created`, `modified`) VALUES
(1, 'cashing_rate', '換金手数料率', 'パーセント', '数値', 30.00, NULL, '', 0, 0, '0000-00-00 00:00:00', '2017-12-01 04:19:24'),
(2, 'min_change_money', '最低換金額', '円', '数値', 30000.00, NULL, '', 0, 0, '0000-00-00 00:00:00', '2017-12-01 04:21:54'),
(3, 'upload_max_size', '会員アップロード上限', 'M', '数値', 1.00, NULL, '', 0, 0, '0000-00-00 00:00:00', '2017-12-01 04:19:29');

-- --------------------------------------------------------

--
-- テーブルの構造 `constants`
--

CREATE TABLE IF NOT EXISTS `constants` (
  `id` int(11) NOT NULL,
  `const_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `active_flg` int(11) NOT NULL DEFAULT '1',
  `rank` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `credit_transactions`
--

CREATE TABLE IF NOT EXISTS `credit_transactions` (
  `id` bigint(20) unsigned NOT NULL,
  `transaction_time` datetime NOT NULL,
  `is_test_server` tinyint(1) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `api_type` tinyint(1) unsigned NOT NULL,
  `token` varchar(128) NOT NULL,
  `money` decimal(12,2) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `response_id` varchar(64) NOT NULL,
  `error_code` varchar(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `csv_lists`
--

CREATE TABLE IF NOT EXISTS `csv_lists` (
  `id` int(11) NOT NULL,
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `merch_basic_id` text COLLATE utf8_unicode_ci,
  `merch_item_id` text COLLATE utf8_unicode_ci,
  `merch_style_id` text COLLATE utf8_unicode_ci,
  `merch_category_id` text COLLATE utf8_unicode_ci,
  `category_name` text COLLATE utf8_unicode_ci NOT NULL,
  `merch_basic_name` text COLLATE utf8_unicode_ci,
  `merch_basic_code` text COLLATE utf8_unicode_ci,
  `name` text COLLATE utf8_unicode_ci,
  `code` text COLLATE utf8_unicode_ci,
  `sales_price` text COLLATE utf8_unicode_ci,
  `list_image` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `color` text COLLATE utf8_unicode_ci,
  `size` text COLLATE utf8_unicode_ci,
  `width` text COLLATE utf8_unicode_ci,
  `length` text COLLATE utf8_unicode_ci,
  `sleeve_length1` text COLLATE utf8_unicode_ci,
  `shoulder_width` text COLLATE utf8_unicode_ci,
  `sleeve_length2` text COLLATE utf8_unicode_ci,
  `all_length` text COLLATE utf8_unicode_ci,
  `waist` text COLLATE utf8_unicode_ci,
  `leg_length` text COLLATE utf8_unicode_ci,
  `wrist_length` text COLLATE utf8_unicode_ci,
  `stock_num` text COLLATE utf8_unicode_ci,
  `arrival_date` text COLLATE utf8_unicode_ci,
  `brand` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `data_branches`
--

CREATE TABLE IF NOT EXISTS `data_branches` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `attach_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `limit_level` int(11) NOT NULL DEFAULT '3',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `data_leaves`
--

CREATE TABLE IF NOT EXISTS `data_leaves` (
  `id` int(11) NOT NULL,
  `data_branch_id` int(11) NOT NULL,
  `data_branch_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `parent_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attach_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `email_datas`
--

CREATE TABLE IF NOT EXISTS `email_datas` (
  `id` int(11) NOT NULL,
  `email_magazine_id` int(11) DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci,
  `from_mail` text COLLATE utf8_unicode_ci,
  `from_name` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `attach_file` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `send_flg` int(11) DEFAULT '0',
  `send_date` datetime DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `email_magazines`
--

CREATE TABLE IF NOT EXISTS `email_magazines` (
  `id` int(11) NOT NULL,
  `subject` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `from_mail` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `sent_date` datetime DEFAULT NULL,
  `save_flg` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(11) NOT NULL,
  `code_name` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'auto' COMMENT 'auto:自動送信　order:受注管理　customer:顧客管理',
  `name` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `admin_mail` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `estimates`
--

CREATE TABLE IF NOT EXISTS `estimates` (
  `id` int(11) NOT NULL,
  `company_name` text COLLATE utf8_unicode_ci,
  `name` text COLLATE utf8_unicode_ci,
  `name_kana` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `size1` text COLLATE utf8_unicode_ci,
  `color1` text COLLATE utf8_unicode_ci,
  `size2` text COLLATE utf8_unicode_ci,
  `color2` text COLLATE utf8_unicode_ci,
  `size3` text COLLATE utf8_unicode_ci,
  `color3` text COLLATE utf8_unicode_ci,
  `print_color` text COLLATE utf8_unicode_ci,
  `file_name` text COLLATE utf8_unicode_ci,
  `file_path` text COLLATE utf8_unicode_ci,
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7704 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `favorite_items`
--

CREATE TABLE IF NOT EXISTS `favorite_items` (
  `id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `followers`
--

CREATE TABLE IF NOT EXISTS `followers` (
  `id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `follow_member_id` int(10) unsigned NOT NULL,
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `entry_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirm_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complete_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `mail_subject` text COLLATE utf8_unicode_ci,
  `mail_template` text COLLATE utf8_unicode_ci,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `form_fields`
--

CREATE TABLE IF NOT EXISTS `form_fields` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_valid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` int(11) NOT NULL DEFAULT '0',
  `unique` int(11) NOT NULL DEFAULT '0',
  `min_len` int(11) NOT NULL DEFAULT '0',
  `max_len` int(11) NOT NULL DEFAULT '0',
  `confirm` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `option_list` text COLLATE utf8_unicode_ci,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `functions`
--

CREATE TABLE IF NOT EXISTS `functions` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `source_code` text COLLATE utf8_unicode_ci,
  `member_variable` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `sample` text COLLATE utf8_unicode_ci,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `html_parts`
--

CREATE TABLE IF NOT EXISTS `html_parts` (
  `id` int(11) unsigned NOT NULL,
  `part_type` int(11) NOT NULL,
  `part_file_flg` tinyint(1) NOT NULL,
  `part_desc` varchar(256) NOT NULL DEFAULT '',
  `part_default` text NOT NULL,
  `part_html` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `html_parts`
--

INSERT INTO `html_parts` (`id`, `part_type`, `part_file_flg`, `part_desc`, `part_default`, `part_html`, `created`, `modified`) VALUES
(1, 0, 1, 'CSS', 'css/main.css.default', 'css/main.css', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 0, 'ヘッダーロゴ', '<p><a href="/"><img src="/img/logo.png" alt="マレント" class="header-logo" width="350"></a></p>\n<h1 class="header_top">CtoC・ECマッチングサイト構築CMS</h1>', '<p><a href="/"><img src="https://i.imgur.com/C21YLCQ.png" alt="マレント" class="header-logo" width="350"></a></p>\r\n<h1 class="header_top">CtoC・マッチングサイト構築CMS</h1>', '0000-00-00 00:00:00', '2020-03-03 12:30:59'),
(3, 2, 0, '左カラム最上段', '<a href="#"><img src="/img/cm_01.png" alt="無料でデジタルフリマ" class="img-responsive"></a>', '<a href="#"><img src="https://imgur.com/u6zqsZY.jpg" alt="左カラムバナー" class="img-responsive" width="250px"></a>', '0000-00-00 00:00:00', '2020-03-03 12:31:07'),
(4, 3, 0, 'トップページ上部', '<ul class="product_nav clearfix" style="padding-left: 0px;">\n  <li class="mr15"><a href="#"><img src="/img/business_s.png" alt="ビジネス文書作成" width="220px"></a></li>\n  <li class="mr15"><a href="#"><img src="/img/template_s.png" alt="ウェブテンプレート" width="220px" ></a></li>\n  <li><a href="#"><img src="/img/douga_s.png" alt="動画" width="220px"></a></li>\n</ul>', '<ul class="product_nav clearfix" style="padding-left: 0px;">\r\n  <li class="mr15"><a href="#"><img src="https://imgur.com/cvJbPYl.png" alt="トップ上部バナー" width="695px"></a></li>\r\n</ul>\r\n<br>\r\n<ul class="product_nav clearfix" style="padding-left: 0px;">\r\n  <li class="mr15"><a href="#"><img src="https://imgur.com/Oz3ZOm5.png" alt="トップ上部バナー" width="221px"></a></li>\r\n  <li class="mr15"><a href="#"><img src="https://imgur.com/Oz3ZOm5.png" alt="トップ上部バナー" width="221px" ></a></li>\r\n  <li><a href="#"><img src="https://imgur.com/Oz3ZOm5.png" alt="トップ上部バナー" width="221px"></a></li>\r\n</ul>', '0000-00-00 00:00:00', '2020-03-03 12:31:15'),
(5, 4, 0, '購入者ガイド', '<h3 class="ml30 mb30 mt20"><span>会員利用規約</span></h3>\n    <h4 class="ml30 spml_0 mb10 f14 strong">1.まずは新規会員登録をしよう。</h4>\n    <p class="ml30 spml_0">新規会員登録は、必要事項を入力するだけでとても簡単です。<br>\n      登録したメールアドレスに届く登録認証メールをクリックし、完了します。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 f14 strong">2.サイトにログインしましょう。</h4>\n    <p class="ml30 spml_0 mb20">会員登録時に入力した登録情報（メールアドレスとパスワード）を入力し、\n      「ログイン」ボタンをクリックして、ログインして下さい。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 f14 strong">3.購入したい商品をカートに入れて購入手続きをしましょう。</h4>\n    \n    <p class="ml30 spml_0 mb20">購入希望商品を1点ずつ「カートに入れる」ボタンをクリックしてショッピングカートに入れます。\n      購入希望商品全てをカートに入れ終わりましたら、「カートの中」ボタンをクリックし、購入手続きに進みます。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 f14 strong">4.カート内の商品を確認しましょう。</h4>\n    <p class="ml30 spml_0 mb20">カート内の商品を確認して下さい。<br>\n      もし必要のない商品がある場合はカートから削除して下さい。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 f14 strong">5.商品の決済をしよう。</h4>\n    <p class="ml30 spml_0 mb20">お持ちのコイン（ポイント）を使用するかどうかを選択して、\n      ご注文のお支払金額合計を確認して下さい。<br>\n      問題がなければ、クレジットカードの銘柄を選択し、「購入手続きに進む」をクリックして決済ページへ進んで下さい。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 mb10 f14 strong">6.クレジットカード情報を正確に入力しましょう。</h4>\n    <p class="ml30 spml_0 mb20">クレジットカードの情報は、入力方法に従って正確に入力して下さい。<br>\n      最後に「購入完了」ボタンをクリックすると、決済は完了します。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 mb10 f14 strong">7.購入した商品をダウンロードしましょう。</h4>\n    <p class="ml30 spml_0 mb20">Mallentoにログインし、「マイページ」内の「注文履歴・購入商品のダウンロード・ストリーミング再生」\n      ページを開くと、購入商品のリストが表示されます。<br>\n      ダウンロードボタンをクリックして下さい。<br>\n      ダウンロードの有効期限は。ご購入日から「２０日間」となりますのでお早めにダウンロードして下さい。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>', '<h3 class="ml30 mb30 mt20"><span>購入者ガイド</span></h3>\r\n    <h4 class="ml30 spml_0 mb10 f14 strong">1．まずは新規会員登録</h4>\r\n    <p class="ml30 spml_0">新規会員登録は、必要事項を入力するだけでとても簡単です。<br>\r\n      登録したメールアドレスに届く登録認証メールをクリックし、完了します。 </p>\r\n    <div>\r\n      <img src="https://imgur.com/MGswudO.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 f14 strong">2．サイトにログイン</h4>\r\n    <p class="ml30 spml_0 mb20">会員登録時に入力した登録情報（メールアドレスとパスワード）を入力し、\r\n      「ログイン」ボタンをクリックして、ログインして下さい。 </p>\r\n    <div>\r\n      <img src="https://imgur.com/MGswudO.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 f14 strong">3．購入したい商品をカートに入れて購入手続きを開始</h4>\r\n    \r\n    <p class="ml30 spml_0 mb20">購入希望商品を1点ずつ「カートに入れる」ボタンをクリックしてショッピングカートに入れます。\r\n      購入希望商品全てをカートに入れ終わりましたら、「カートの中」ボタンをクリックし、購入手続きに進みます。 </p>\r\n    <div>\r\n      <img src="https://imgur.com/MGswudO.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 f14 strong">4．カート内の商品を確認</h4>\r\n    <p class="ml30 spml_0 mb20">カート内の商品を確認して下さい。<br>\r\n      もし必要のない商品がある場合はカートから削除して下さい。 </p>\r\n    <div>\r\n      <img src="https://imgur.com/MGswudO.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 mb10 f14 strong">5．ポイントをクレジット決済で追加</h4>\r\n    <p class="ml30 spml_0 mb20">ポイント決済用のポイントをクレジット決済で追加します。\r\n      クレジットカードの情報は、入力方法に従って正確に入力して下さい。<br>\r\n      最後に「購入完了」ボタンをクリックすると、ポイントは追加されます。 </p>\r\n    <div>\r\n      <img src="https://imgur.com/MGswudO.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 f14 strong">6．商品をポイント決済</h4>\r\n    <p class="ml30 spml_0 mb20">事前に購入されたポイントを使用して商品のポイント決済を行います。\r\n      ご注文のお支払金額合計を確認して下さい。<br>\r\n      問題がなければ、「購入手続きに進む」をクリックしてポイント決済ページへ進んで下さい。 </p>\r\n    <div>\r\n      <img src="https://imgur.com/MGswudO.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 mb10 f14 strong">7．購入した商品・サービスをそれぞれダウンロード</h4>\r\n    <p class="ml30 spml_0 mb20">「マイページ」内の「注文履歴・購入商品」ページを開くと、購入商品のリストが表示されます。<br>\r\n      ダウンロード商品の場合はダウンロードを行い、サービス商品であれば出品者に購入済みの旨を伝え作業を開始してもらいます。 </p>\r\n    <div>\r\n      <img src="https://imgur.com/MGswudO.png" alt="" class="guide_img">\r\n    </div>', '0000-00-00 00:00:00', '2020-03-03 12:31:23'),
(6, 5, 0, '出品者ガイド', '<h3 class="ml30 mb30 mt20"><span>会員利用規約</span></h3>\n    <h4 class="ml30 spml_0 mb10 f14 strong">1.まずは新規会員登録をしよう。</h4>\n    <p class="ml30 spml_0">新規会員登録は、必要事項を入力するだけでとても簡単です。<br>\n      登録したメールアドレスに届く登録認証メールをクリックし、完了します。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 f14 strong">2.サイトにログインしましょう。</h4>\n    <p class="ml30 spml_0 mb20">会員登録時に入力した登録情報（メールアドレスとパスワード）を入力し、\n      「ログイン」ボタンをクリックして、ログインして下さい。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 f14 strong">3.購入したい商品をカートに入れて購入手続きをしましょう。</h4>\n    \n    <p class="ml30 spml_0 mb20">購入希望商品を1点ずつ「カートに入れる」ボタンをクリックしてショッピングカートに入れます。\n      購入希望商品全てをカートに入れ終わりましたら、「カートの中」ボタンをクリックし、購入手続きに進みます。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 f14 strong">4.カート内の商品を確認しましょう。</h4>\n    <p class="ml30 spml_0 mb20">カート内の商品を確認して下さい。<br>\n      もし必要のない商品がある場合はカートから削除して下さい。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 f14 strong">5.商品の決済をしよう。</h4>\n    <p class="ml30 spml_0 mb20">お持ちのコイン（ポイント）を使用するかどうかを選択して、\n      ご注文のお支払金額合計を確認して下さい。<br>\n      問題がなければ、クレジットカードの銘柄を選択し、「購入手続きに進む」をクリックして決済ページへ進んで下さい。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 mb10 f14 strong">6.クレジットカード情報を正確に入力しましょう。</h4>\n    <p class="ml30 spml_0 mb20">クレジットカードの情報は、入力方法に従って正確に入力して下さい。<br>\n      最後に「購入完了」ボタンをクリックすると、決済は完了します。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>\n    <h4 class="ml30 spml_0 mb10 f14 strong">7.購入した商品をダウンロードしましょう。</h4>\n    <p class="ml30 spml_0 mb20">Mallentoにログインし、「マイページ」内の「注文履歴・購入商品のダウンロード・ストリーミング再生」\n      ページを開くと、購入商品のリストが表示されます。<br>\n      ダウンロードボタンをクリックして下さい。<br>\n      ダウンロードの有効期限は。ご購入日から「２０日間」となりますのでお早めにダウンロードして下さい。 </p>\n    <div>\n      <img src="/img/front_ss.png" alt="" class="guide_img">\n    </div>', '<h3 class="ml30 mb30 mt20"><span>出品者ガイド</span></h3>\r\n    <h4 class="ml30 spml_0 mb10 f14 strong">1．まずは新規会員登録</h4>\r\n    <p class="ml30 spml_0">新規会員登録は、必要事項を入力するだけでとても簡単です。<br>\r\n      登録したメールアドレスに届く登録認証メールをクリックし、完了します。 </p>\r\n    <div>\r\n      <img src="https://imgur.com/UUvLz0T.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 f14 strong">2．サイトにログイン</h4>\r\n    <p class="ml30 spml_0 mb20">会員登録時に入力した登録情報（メールアドレスとパスワード）を入力し、\r\n      「ログイン」ボタンをクリックして、ログインして下さい。 </p>\r\n    <div>\r\n      <img src="https://imgur.com/UUvLz0T.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 f14 strong">3．出品したい商品やサービスを登録する</h4>\r\n    <p class="ml30 spml_0 mb20">左カラムの「商品を出品する」から商品の登録を開始します。<br>\r\n      出品したい商品名や詳細情報を記入し誓約事項確認をよく確認しチェック入れ出品を完了します。</p>\r\n    <div>\r\n      <img src="https://imgur.com/UUvLz0T.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 f14 strong">4．商品が購入される</h4>\r\n    <p class="ml30 spml_0 mb20">商品が購入された場合、ダウンロード商品はすでに登録済みの場合はそのままでも構いません。<br>\r\n      スキルシェアなどのサービス商品であれば作業を行ないます。<br>\r\n      この場合、購入者とヒアリングを行った上でサービス完了を目指してください。</p>\r\n    <div>\r\n      <img src="https://imgur.com/UUvLz0T.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 f14 strong">5．換金申請の準備をする</h4>\r\n    <p class="ml30 spml_0 mb20">「マイページ」の「登録情報」から会員登録内容を変更します。<br>\r\n      振込先口座情報を記入し換金申請へ進みます。</p>\r\n    <div>\r\n      <img src="https://imgur.com/UUvLz0T.png" alt="" class="guide_img">\r\n    </div>\r\n    <h4 class="ml30 spml_0 f14 strong">6．換金申請をする</h4>\r\n    <p class="ml30 spml_0 mb20">「マイページ」の「売上管理」から換金申請を行います。<br>\r\n      売り上げ金額が「換金申請できる金額」に到達している場合、換金申請が行えます。</p>\r\n    <div>\r\n      <img src="https://imgur.com/UUvLz0T.png" alt="" class="guide_img">\r\n    </div>', '0000-00-00 00:00:00', '2020-03-03 12:31:32'),
(7, 6, 0, 'よくある質問', '<div id="sub" class="col-xs-12 col-sm-12 col-md-12 m60">\n    <h3 class="ml30 mb30 mt20"><span>よくある質問</span></h3>\n      <p class="title">Q. テキストが入りますか？</p>\n      <p>A. テキストが入ります。</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n      <p class="title">テキスト</p>\n      <p>テキストが入ります</p>\n    </div>', '<div id="sub" class="col-xs-12 col-sm-12 col-md-12 m60">\r\n    <h3 class="ml30 mb30 mt20"><span>よくある質問</span></h3>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n      <p class="title">Q. ここに質問が入ります</p>\r\n      <p>A. ここにアンサーが入ります。</p>\r\n    </div>', '0000-00-00 00:00:00', '2020-03-03 12:31:40'),
(9, 8, 0, '特定商法取引に基づく表記', '<h3 class="ml30 mb30 mt20"><span>特定商法取引に基づく表記</span></h3>\n\n        <p class="title">運営サービス</p>\n        <p>Mallento</p>\n\n        <p class="title">運営統括サービス</p>\n        <p>Mallento</p>\n\n        <p class="title">所在地</p>\n        <p>〒000-0000 東京都○○区○○○○</p>\n\n        <p class="title">URL</p>\n        <p>http://mallento.com</p>\n\n        <p class="title">メールアドレス</p>\n        <p>info@mallento.com</p>\n\n        <p class="title">返品・キャンセル等</p>\n        <p>サービスの性質上、返品・返金はお受けしておりません。</p>\n\n        <p class="title">商品の価格</p>\n        <p>商品ごとに表示された税込み価格に基づく。</p>\n\n        <p class="title">商品代金以外の必要金額</p>\n        <p>銀行振込手数料、通信料、出品者のみ事務手数料</p>\n\n        <p class="title">ご注文方法</p>\n        <p>オンラインでのみとさせていただきます。</p>\n\n        <p class="title">お支払い方法</p>\n        <p>銀行振込、クレジットカード決済<br>\n  銀行振込をご希望のお客様は着金後、即日〜2、3日営業日で反映されます。</p>\n\n        <p class="title">引渡し時期</p>\n        <p>ご入金確認後、クレジットの場合はシステムにより即時ポイント反映します。<br>\n  (ポイントがアカウントに反映された時点で、ポイント購入対象商品をポイント決済後、すぐにご利用が可能です)<br>\n  ダウンロード可能期間は、購入したその日を含む7日間です。<br>\n  スキル商品はポイント決済が完了した時点で着手可能となります。<br>\n  7日間を過ぎますとダウンロードはできませんので、お早めにダウンロードをお願いします。<br>\n  尚、ポイントの有効期限は無期限です。</p>\n\n        <p class="title">お問い合わせ</p>\n        <p>メールアドレスでお問い合わせください。</p>', '<h3 class="ml30 mb30 mt20"><span>特定商法取引に基づく表記</span></h3>\r\n\r\n        <p class="title">運営サービス</p>\r\n        <p>Mallento デモサイト</p>\r\n\r\n        <p class="title">運営統括サービス</p>\r\n        <p>Mallento デモサイト</p>\r\n\r\n        <p class="title">所在地</p>\r\n        <p>ここに住所を入れる</p>\r\n\r\n        <p class="title">URL</p>\r\n        <p>http://demo.mallento.com</p>\r\n\r\n        <p class="title">メールアドレス</p>\r\n        <p>ここにメールアドレスを入れる</p>\r\n\r\n        <p class="title">返品・キャンセル等</p>\r\n        <p>サービスの性質上、返品・返金はお受けしておりません。</p>\r\n\r\n        <p class="title">商品の価格</p>\r\n        <p>商品ごとに表示された税込み価格に基づく。</p>\r\n\r\n        <p class="title">商品代金以外の必要金額</p>\r\n        <p>銀行振込手数料、通信料、出品者のみ事務手数料</p>\r\n\r\n        <p class="title">ご注文方法</p>\r\n        <p>オンラインでのみとさせていただきます。</p>\r\n\r\n        <p class="title">お支払い方法</p>\r\n        <p>銀行振込、クレジットカード決済<br>\r\n  銀行振込をご希望のお客様は着金後、即日〜2、3日営業日で反映されます。</p>\r\n\r\n        <p class="title">引渡し時期</p>\r\n        <p>ご入金確認後、クレジットの場合はシステムにより即時ポイント反映します。<br>\r\n  (ポイントがアカウントに反映された時点で、ポイント購入対象商品をポイント決済後、すぐにご利用が可能です)<br>\r\n  ダウンロード可能期間は、購入したその日を含む7日間です。<br>\r\n  スキル商品はポイント決済が完了した時点で着手可能となります。<br>\r\n  7日間を過ぎますとダウンロードはできませんので、お早めにダウンロードをお願いします。<br>\r\n  尚、ポイントの有効期限は無期限です。</p>\r\n\r\n        <p class="title">お問い合わせ</p>\r\n        <p>メールアドレスでお問い合わせください。</p>', '0000-00-00 00:00:00', '2020-03-03 12:31:53'),
(10, 9, 0, '個人情報保護について', '<h3 class="ml30 mb30 mt20"><span>個人情報保護について</span></h3>\n    <div class="mt20 ml20 pl20 spml_0 sppl_0">\n      <p class="f14 mt10">Mallentoでは個人情報の重要性を確認し、以下の取り組みを実施いたしており</p>\n      <p>(1) Mallentoでは、お客様個人に関する情報（以下「個人情報」といいます。」を館</p>\n      <p>(2) ユーザーの皆様から個人情報を取得させていただく場合は、利用目的をできる限り</p>\n      <p>(3) Mallentoでは、お客様より取得させていただいた個人情報を適切に管理し、以 </p>\n      <p class="ml15">(a)「※この商品を購入すると、ダウンロード会員の氏名がアップロード会員に開示</p>\n      <p class="ml15">(b)「※この商品を購入すると、ダウンロード会員のEメールアドレスがアップロー </p>\n      <p class="ml15">(c) 商品の購入後、ダウンロード会員の意思で、該商品のアップロード会員にダウン</p>\n    </div>', '<h3 class="ml30 mb30 mt20"><span>個人情報保護について</span></h3>\r\n    <div class="mt20 ml20 pl20 spml_0 sppl_0">\r\n      <p class="f14 mt10">Mallento デモサイトでは個人情報の重要性を確認し、以下の取り組みを実施いたしており</p>\r\n      <p>(1) Mallento デモサイトでは、お客様個人に関する情報（以下「個人情報」といいます。」を館</p>\r\n      <p>(2) ユーザーの皆様から個人情報を取得させていただく場合は、利用目的をできる限り</p>\r\n      <p>(3) Mallento デモサイトでは、お客様より取得させていただいた個人情報を適切に管理し、以 </p>\r\n      <p class="ml15">(a)「※この商品を購入すると、ダウンロード会員の氏名がアップロード会員に開示</p>\r\n      <p class="ml15">(b)「※この商品を購入すると、ダウンロード会員のEメールアドレスがアップロー </p>\r\n      <p class="ml15">(c) 商品の購入後、ダウンロード会員の意思で、該商品のアップロード会員にダウン...</p>\r\n      <p class="ml15">※ 利用規約文章は管理画面のページ・CSS編集より編集いただけます。</p>\r\n\r\n    </div>', '0000-00-00 00:00:00', '2020-03-03 12:32:01'),
(11, 10, 0, '運営会社', '<h3 class="ml30 mb30 mt20"><span>運営会社</span></h3>\n      <p class="title">運営会社</p>\n      <p>テキストが入ります</p>\n      <p class="title">運営統括責任者</p>\n      <p>テキストが入ります</p>\n      <p class="title">所在地</p>\n      <p>テキストが入ります</p>\n      <p class="title">販売価格</p>\n      <p>テキストが入ります</p>\n      <p class="title">お支払い方法</p>\n      <p>テキストが入ります</p>\n      <p class="title">お届け方法</p>\n      <p>テキストが入ります</p>\n      <p class="title">お届け期間</p>\n      <p>テキストが入ります</p>\n      <p class="title">有効期限</p>\n      <p>テキストが入ります</p>\n      <p class="title">商品の返品</p>\n      <p>テキストが入ります</p>\n      <p class="title">メールアドレス※</p>\n      <p>テキストが入ります</p>\n      <p class="title">電話番号</p>\n      <p>テキストが入ります</p>', '<h3 class="ml30 mb30 mt20"><span>運営会社</span></h3>\r\n      <p class="title">運営会社</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">運営統括責任者</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">所在地</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">販売価格</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">お支払い方法</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">お届け方法</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">お届け期間</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">有効期限</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">商品の返品</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">メールアドレス</p>\r\n      <p>テキストが入ります</p>\r\n      <p class="title">電話番号</p>\r\n      <p>テキストが入ります</p>', '0000-00-00 00:00:00', '2020-03-03 12:32:08'),
(12, 11, 0, 'お問い合わせ', '<h3 class="ml30 mb30 mt20"><span>お問い合わせ</span></h3>\n\n        <p class="title">運営サービス</p>\n        <p>Mallento</p>\n\n        <p class="title">運営統括サービス</p>\n        <p>Mallento</p>\n\n        <p class="title">所在地</p>\n        <p>〒525-0059 滋賀県草津市野路1-11-2</p>\n\n        <p class="title">URL</p>\n        <p>http://Mallento.com</p>\n\n        <p class="title">メールアドレス</p>\n        <p>info@Mallento.com</p>\n\n        <p class="title">返品・キャンセル等</p>\n        <p>サービスの性質上、返品・返金はお受けしておりません。</p>\n\n        <p class="title">商品の価格</p>\n        <p>商品ごとに表示された税込み価格に基づく。</p>\n\n        <p class="title">商品代金以外の必要金額</p>\n        <p>銀行振込手数料、通信料、出品者のみ事務手数料</p>\n\n        <p class="title">ご注文方法</p>\n        <p>オンラインでのみとさせていただきます。</p>\n\n        <p class="title">お支払い方法</p>\n        <p>銀行振込、クレジットカード決済<br>\n  銀行振込をご希望のお客様は着金後、即日〜2、3日営業日で反映されます。</p>\n\n        <p class="title">引渡し時期</p>\n        <p>ご入金確認後、クレジットの場合はシステムにより即時ポイント反映します。<br>\n  (ポイントがアカウントに反映された時点で、ポイント購入対象商品をポイント決済後、すぐにご利用が可能です)<br>\n  ダウンロード可能期間は、購入したその日を含む7日間です。<br>\n  スキル商品はポイント決済が完了した時点で着手可能となります。<br>\n  7日間を過ぎますとダウンロードはできませんので、お早めにダウンロードをお願いします。<br>\n  尚、ポイントの有効期限は無期限です。</p>\n\n        <p class="title">お問い合わせ</p>\n        <p>メールアドレスでお問い合わせください。</p>', '<h3 class="ml30 mb30 mt20"><span>お問い合わせ</span></h3>\r\n\r\n        <p class="title">運営サービス</p>\r\n        <p>Mallento デモサイト</p>\r\n\r\n        <p class="title">運営統括サービス</p>\r\n        <p>Mallento デモサイト</p>\r\n\r\n        <p class="title">所在地</p>\r\n        <p>ここに住所が入ります。</p>\r\n\r\n        <p class="title">URL</p>\r\n        <p>http://demo.mallento.com</p>\r\n\r\n        <p class="title">メールアドレス</p>\r\n        <p>ここにメールアドレスが入ります。</p>\r\n\r\n        <p class="title">返品・キャンセル等</p>\r\n        <p>サービスの性質上、返品・返金はお受けしておりません。</p>\r\n\r\n        <p class="title">商品の価格</p>\r\n        <p>商品ごとに表示された税込み価格に基づく。</p>\r\n\r\n        <p class="title">商品代金以外の必要金額</p>\r\n        <p>銀行振込手数料、通信料、出品者のみ事務手数料</p>\r\n\r\n        <p class="title">ご注文方法</p>\r\n        <p>オンラインでのみとさせていただきます。</p>\r\n\r\n        <p class="title">お支払い方法</p>\r\n        <p>銀行振込、クレジットカード決済<br>\r\n  銀行振込をご希望のお客様は着金後、即日〜2、3日営業日で反映されます。</p>\r\n\r\n        <p class="title">引渡し時期</p>\r\n        <p>ご入金確認後、クレジットの場合はシステムにより即時ポイント反映します。<br>\r\n  (ポイントがアカウントに反映された時点で、ポイント購入対象商品をポイント決済後、すぐにご利用が可能です)<br>\r\n  ダウンロード可能期間は、購入したその日を含む7日間です。<br>\r\n  スキル商品はポイント決済が完了した時点で着手可能となります。<br>\r\n  7日間を過ぎますとダウンロードはできませんので、お早めにダウンロードをお願いします。<br>\r\n  尚、ポイントの有効期限は無期限です。</p>\r\n\r\n        <p class="title">お問い合わせ</p>\r\n        <p>メールアドレスでお問い合わせください。</p>', '0000-00-00 00:00:00', '2020-03-03 12:32:15');

-- --------------------------------------------------------

--
-- テーブルの構造 `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `fee` decimal(10,0) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discription` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `review` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `review_auther` varchar(126) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_image1_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_image2_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_image3_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_image4_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_extension` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(12) unsigned DEFAULT NULL,
  `selling` int(11) unsigned NOT NULL DEFAULT '0',
  `sale_count` int(11) unsigned DEFAULT '0',
  `pickup` int(11) NOT NULL DEFAULT '0',
  `sale_rank` int(11) NOT NULL DEFAULT '0',
  `seller_rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `save_flg` int(11) NOT NULL DEFAULT '0',
  `close_flg` int(11) DEFAULT NULL COMMENT '1:非公開　0:公開',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `items`
--

INSERT INTO `items` (`id`, `member_id`, `title`, `price`, `fee`, `category`, `discription`, `message`, `password`, `review`, `review_auther`, `tag1`, `tag2`, `tag3`, `tag4`, `tag5`, `main_image_file_name`, `sub_image1_file_name`, `sub_image2_file_name`, `sub_image3_file_name`, `sub_image4_file_name`, `file_name`, `file_path`, `file_type`, `file_extension`, `file_size`, `selling`, `sale_count`, `pickup`, `sale_rank`, `seller_rank`, `del_flg`, `save_flg`, `close_flg`, `created`, `modified`) VALUES
(1, 259, 'テスト商品', 1000, NULL, 'ダウンロード-DVDパッケージ', 'テスト商品', 'テスト商品', '', NULL, NULL, 'テスト', '', '', '', '', 'Unknown.jpeg', 'Unknown.jpeg', '', '', '', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 1, NULL, '2019-07-10 00:54:39', '2019-07-10 00:55:10');

-- --------------------------------------------------------

--
-- テーブルの構造 `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_kana` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nickname` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `password_hint` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mailmag_flg` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `admin_message` text COLLATE utf8_unicode_ci,
  `point` int(12) unsigned NOT NULL DEFAULT '0',
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_rank` varchar(128) COLLATE utf8_unicode_ci DEFAULT 'general',
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'user' COMMENT 'user:一般 admin:管理者 dev:開発者',
  `status` int(11) DEFAULT '0' COMMENT '0:仮登録 1:有効 2:投稿不可 3:閲覧不可',
  `notification_to_saller_flag` int(11) NOT NULL DEFAULT '1' COMMENT '0:送信しない　1:送信する',
  `purchased_to_saller_flag` int(11) NOT NULL DEFAULT '1' COMMENT '0:送信しない　1:送信する',
  `bank_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tmp_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_level` decimal(2,1) DEFAULT NULL COMMENT '管理者が設定するレベル',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `del_flg` int(11) DEFAULT '0' COMMENT '0:未削除 1:削除済み'
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `members`
--

INSERT INTO `members` (`id`, `user_id`, `password`, `name`, `name_kana`, `company`, `postcode`, `address`, `phone`, `gender`, `birthday`, `nickname`, `email`, `password_hint`, `mailmag_flg`, `comment`, `admin_message`, `point`, `image_file_name`, `user_rank`, `role`, `status`, `notification_to_saller_flag`, `purchased_to_saller_flag`, `bank_name`, `branch_name`, `branch_code`, `account_no`, `deposit_name`, `tmp_key`, `admin_level`, `created`, `modified`, `del_flg`) VALUES
(1, 'admin', 'bb265fe330f7b79d4ace37413c694055a24e2a18', '管理者', 'カンリシャ', 'テスト株式会社', '1500001', '住所住所住所住所住所住所住所住所住所住所', '111-1111-1111', 'male', '1998-01-01', 'n0b_a', 'test@email.com', 'vitn0ba0538', 1, NULL, NULL, 30000, NULL, 'general', 'admin', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-05-28 01:22:31', '2018-02-08 12:13:10', 0),
(259, 'sample1@gmail.com', 'bb265fe330f7b79d4ace37413c694055a24e2a18', 'WP-master', 'ウェブ', '', '000-0000', 'サンプル', '000-0000-0000', 'male', '1999-01-01', 'WP-master', 'sample1@gmail.com', '', 0, '', '', 0, NULL, 'general', 'user', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, '3f5199c4362bd7d2affc93689cf1927a3fb9f55c', NULL, '2019-07-10 00:38:08', '2019-07-10 00:38:08', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `menu_lists`
--

CREATE TABLE IF NOT EXISTS `menu_lists` (
  `id` int(11) NOT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_name` text COLLATE utf8_unicode_ci,
  `memu_name` text COLLATE utf8_unicode_ci,
  `all_name` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `member_id` int(11) unsigned DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci,
  `to_member_id` int(11) DEFAULT '0',
  `from_member_id` int(11) DEFAULT '0',
  `from_name` text COLLATE utf8_unicode_ci,
  `from_item_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `subject` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `attach_file` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `send_flg` int(11) DEFAULT '0',
  `read_flg` int(11) DEFAULT '0',
  `send_date` datetime DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `order_details`
--

CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `merch_basic_id` int(11) NOT NULL DEFAULT '0',
  `merch_item_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `basic_name` text COLLATE utf8_unicode_ci,
  `item_name` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `point_flg` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=322707 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_kana` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `sale_ym` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `order_points`
--

CREATE TABLE IF NOT EXISTS `order_points` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci,
  `name_kana` text COLLATE utf8_unicode_ci,
  `company` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref` text COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `point` int(11) unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_blocks`
--

CREATE TABLE IF NOT EXISTS `page_blocks` (
  `id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_block_functions`
--

CREATE TABLE IF NOT EXISTS `page_block_functions` (
  `id` int(11) NOT NULL,
  `page_block_id` int(11) NOT NULL DEFAULT '0',
  `class_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `function_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_contents`
--

CREATE TABLE IF NOT EXISTS `page_contents` (
  `id` int(11) NOT NULL,
  `layout_id` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'private',
  `dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/',
  `name` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `head_image_l` text COLLATE utf8_unicode_ci,
  `head_image_s` text COLLATE utf8_unicode_ci,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_content_blocks`
--

CREATE TABLE IF NOT EXISTS `page_content_blocks` (
  `id` int(11) NOT NULL,
  `page_block_id` int(11) NOT NULL DEFAULT '0',
  `page_region_id` int(11) NOT NULL DEFAULT '0',
  `page_content_id` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_content_categories`
--

CREATE TABLE IF NOT EXISTS `page_content_categories` (
  `id` int(11) NOT NULL,
  `page_category_id` int(11) DEFAULT '0',
  `page_content_id` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_content_functions`
--

CREATE TABLE IF NOT EXISTS `page_content_functions` (
  `id` int(11) NOT NULL,
  `page_content_id` int(11) NOT NULL DEFAULT '0',
  `class_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `function_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_content_parameters`
--

CREATE TABLE IF NOT EXISTS `page_content_parameters` (
  `id` int(11) NOT NULL,
  `page_parameter_id` int(11) NOT NULL DEFAULT '0',
  `page_content_id` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_directories`
--

CREATE TABLE IF NOT EXISTS `page_directories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `controller_name` text COLLATE utf8_unicode_ci,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `unlock_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_layouts`
--

CREATE TABLE IF NOT EXISTS `page_layouts` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `layout` text COLLATE utf8_unicode_ci,
  `main_region_id` int(11) DEFAULT '0',
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_parameters`
--

CREATE TABLE IF NOT EXISTS `page_parameters` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_regions`
--

CREATE TABLE IF NOT EXISTS `page_regions` (
  `id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL DEFAULT '1',
  `name` text COLLATE utf8_unicode_ci,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  `del_flg` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `presses`
--

CREATE TABLE IF NOT EXISTS `presses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `press_pages`
--

CREATE TABLE IF NOT EXISTS `press_pages` (
  `id` int(11) NOT NULL,
  `press_id` int(11) NOT NULL,
  `subject` text COLLATE utf8_unicode_ci,
  `headline` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `frame_target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL DEFAULT '1900-01-01',
  `end_date` date NOT NULL DEFAULT '1900-01-01',
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `rating` int(11) NOT NULL COMMENT '5:大変良い 4:良い 3:普通 2:やや悪い 1:悪い',
  `del_flg` int(11) DEFAULT '0' COMMENT '0:未削除 1:削除済み',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `role_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_rank` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `role_details`
--

CREATE TABLE IF NOT EXISTS `role_details` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=393 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `sale_points`
--

CREATE TABLE IF NOT EXISTS `sale_points` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `point` int(11) unsigned NOT NULL DEFAULT '0',
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `whatsnews`
--

CREATE TABLE IF NOT EXISTS `whatsnews` (
  `id` int(11) NOT NULL,
  `comment_date` date DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `linkurl` varchar(255) CHARACTER SET utf8 NOT NULL,
  `del_flg` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `browses`
--
ALTER TABLE `browses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cake_sessions`
--
ALTER TABLE `cake_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar_dates`
--
ALTER TABLE `calendar_dates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `cashing_datas`
--
ALTER TABLE `cashing_datas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `constants`
--
ALTER TABLE `constants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `credit_transactions`
--
ALTER TABLE `credit_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `csv_lists`
--
ALTER TABLE `csv_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `data_branches`
--
ALTER TABLE `data_branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `data_leaves`
--
ALTER TABLE `data_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `email_datas`
--
ALTER TABLE `email_datas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_magazine_id` (`email_magazine_id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `email_magazines`
--
ALTER TABLE `email_magazines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `favorite_items`
--
ALTER TABLE `favorite_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_followr_id` (`member_id`,`follow_member_id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `functions`
--
ALTER TABLE `functions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `html_parts`
--
ALTER TABLE `html_parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `menu_lists`
--
ALTER TABLE `menu_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_points`
--
ALTER TABLE `order_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_blocks`
--
ALTER TABLE `page_blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_block_functions`
--
ALTER TABLE `page_block_functions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_contents`
--
ALTER TABLE `page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `page_content_blocks`
--
ALTER TABLE `page_content_blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_content_categories`
--
ALTER TABLE `page_content_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_content_functions`
--
ALTER TABLE `page_content_functions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_content_parameters`
--
ALTER TABLE `page_content_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_directories`
--
ALTER TABLE `page_directories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_layouts`
--
ALTER TABLE `page_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_parameters`
--
ALTER TABLE `page_parameters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `page_regions`
--
ALTER TABLE `page_regions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `presses`
--
ALTER TABLE `presses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `press_pages`
--
ALTER TABLE `press_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `role_details`
--
ALTER TABLE `role_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `sale_points`
--
ALTER TABLE `sale_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created` (`created`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `whatsnews`
--
ALTER TABLE `whatsnews`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `browses`
--
ALTER TABLE `browses`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `calendar_dates`
--
ALTER TABLE `calendar_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1463;
--
-- AUTO_INCREMENT for table `cashing_datas`
--
ALTER TABLE `cashing_datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `constants`
--
ALTER TABLE `constants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `credit_transactions`
--
ALTER TABLE `credit_transactions`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `csv_lists`
--
ALTER TABLE `csv_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data_branches`
--
ALTER TABLE `data_branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `data_leaves`
--
ALTER TABLE `data_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `email_datas`
--
ALTER TABLE `email_datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `email_magazines`
--
ALTER TABLE `email_magazines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7704;
--
-- AUTO_INCREMENT for table `favorite_items`
--
ALTER TABLE `favorite_items`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `functions`
--
ALTER TABLE `functions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `html_parts`
--
ALTER TABLE `html_parts`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=260;
--
-- AUTO_INCREMENT for table `menu_lists`
--
ALTER TABLE `menu_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=322707;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_points`
--
ALTER TABLE `order_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page_blocks`
--
ALTER TABLE `page_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `page_block_functions`
--
ALTER TABLE `page_block_functions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page_contents`
--
ALTER TABLE `page_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `page_content_blocks`
--
ALTER TABLE `page_content_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `page_content_categories`
--
ALTER TABLE `page_content_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page_content_functions`
--
ALTER TABLE `page_content_functions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page_content_parameters`
--
ALTER TABLE `page_content_parameters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page_directories`
--
ALTER TABLE `page_directories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `page_layouts`
--
ALTER TABLE `page_layouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `page_parameters`
--
ALTER TABLE `page_parameters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page_regions`
--
ALTER TABLE `page_regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `presses`
--
ALTER TABLE `presses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `press_pages`
--
ALTER TABLE `press_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `role_details`
--
ALTER TABLE `role_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=393;
--
-- AUTO_INCREMENT for table `sale_points`
--
ALTER TABLE `sale_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `whatsnews`
--
ALTER TABLE `whatsnews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
