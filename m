Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C652C8442
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 13:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbgK3Mnq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 07:43:46 -0500
Received: from mail-eopbgr150090.outbound.protection.outlook.com ([40.107.15.90]:33156
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725897AbgK3Mnq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Nov 2020 07:43:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTGTUlpzSZVI+6FWWA3qj+uM2eIwUBcGJ30nlLPm6urExjww22z2hD064FO2nYUvRLXKlatwlhpUGP8WKPCC3ohqpSmsFh6ANtKhhlWsqr8/stEyHYzJaaDTpwjeDXWn8brk5fF2JiHNDk/zr/f96CL6IR0sR8dGoIW//wUDcm1ERpv54ymes7XiBUMHp6IGumGakWfD3vJNXghMOHMd+zZjeU4ICpwmiIvmF+AcMPkqzQOv8JrDhPNHTnNOaQY99h4+OzxxiQNZMesj1bWb2kU++NMOHSXKjt0IzjyUub131xCsLRYu7MqUEebvsmzUZsNkyRF2AQCJZdfolR/chw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN3lDHrTfCcWESiVhqoUGXtmvopuXsxFJJnsOnPBO6Q=;
 b=dLDJWzao8g3eWZgkKZ14JBnkDq+IEK2fjAMv8nTYxtXrS6QDdjQsz3HEgj/MwtY3z1a4e/Y8YOnksfNEOTkg0fk9YPBJ8S/4UXXHrK5N5Ye9UBs5WZOEBBnu6aMhsPp2XPkOUu7cw/pFRXrF1dAOzA+6hhG9eIybWH3Jjf7kw/l1/p+UZha2px0CUHGWF5QsjFySw5lGCM5tA26xf9iNOS7P/EV1jYxKb/tJHpovP1zI8uRWMo1jaYLRQ71aKvJbT0VUkRMoV5iAN85jqJEIRifT1/yIGP6QP694fhQkIDt8kbO1aQK8Rc91a1AzQh1Ghz2D0mxodxnNpsMULQwQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uN3lDHrTfCcWESiVhqoUGXtmvopuXsxFJJnsOnPBO6Q=;
 b=HWF5DXh24QIT5pV+M4FSS7CaYG3AcPJCArWXKgWrovkf8jdlS6dHeU+rYCNZnQxXAzOQwQtjs7+sIRl9PP1DkmTiSwJl3GXlw17RaLZljC8krD9WLsanU5LCkGQ3aau4dZPel+ZtWG8kKp49mm+0KAMDs492zAfkklWrvNByGjk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=leica-geosystems.com;
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com (2603:10a6:4:9b::11)
 by DB7PR06MB6043.eurprd06.prod.outlook.com (2603:10a6:10:85::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Mon, 30 Nov
 2020 12:42:56 +0000
Received: from DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c]) by DB6PR0602MB2886.eurprd06.prod.outlook.com
 ([fe80::49c3:4b5b:289c:d62c%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 12:42:56 +0000
From:   Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
To:     krzk@kernel.org, tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Nishanth Menon <nm@ti.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] ARM: omap2plus_defconfig: drop unused POWER_AVS option
Date:   Mon, 30 Nov 2020 12:42:33 +0000
Message-Id: <20201130124233.32569-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [193.8.40.112]
X-ClientProxiedBy: ZR0P278CA0099.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::14) To DB6PR0602MB2886.eurprd06.prod.outlook.com
 (2603:10a6:4:9b::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.112) by ZR0P278CA0099.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 12:42:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8c603d31-827a-45a9-c636-08d8952d7622
X-MS-TrafficTypeDiagnostic: DB7PR06MB6043:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR06MB6043951931E6A252CD958328A6F50@DB7PR06MB6043.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Qt50QBtN/iklh6JmJ0OM1kI5Wb6+PO4M7c3EG6gqHb7YsnJ8uv3Ktlt4CeIu2nHgcBaLSa8zvAS2Cju5qUEh8sUgdUXjKBKfX26L6GFTMHZgyiRaBps8Gu1GoIB3PtIDbByKtNcl8PpdEnu34Ejambeckz9AyTUZYRZRvzV+phD6lev0Fn0TpUEnfQI6wmwaPDgH6vy1CfUzXB+Q3yHDVQXXi66nwVVsY5yrG8N/9VbSSWLFlWFiuPDchBkHNSvvAgVySDt8QHiUAMDMlRbbYQCsPClPxzPQC0VUm4QZulTjY+BheJnC4srFOXmYTOjZHk72z/89OYhZcparCqzSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0602MB2886.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(6486002)(2906002)(6512007)(478600001)(83380400001)(956004)(2616005)(66556008)(66476007)(44832011)(66946007)(5660300002)(8936002)(86362001)(8676002)(4326008)(52116002)(26005)(6506007)(6666004)(54906003)(316002)(16526019)(186003)(1076003)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WkFwnbz7BiDWAOy7qEaHLJ/vSrvGh5UnXE9/13lIVUP58aNBh5kgLfLQHWzC?=
 =?us-ascii?Q?Nb9boAKDA27wgPylCL/cEvJTCb8zeWsqbC9FIiqd4n4clnOSBX5sFyj/NCZ8?=
 =?us-ascii?Q?3E2xh73GWQgPk7k3P7P2MnFp26NO9rnALXqEIfit3YbZTRHyvU1o2G8e3/Mn?=
 =?us-ascii?Q?y0Sb2194BVt9eL3GPtKH4c753g6oCmPk8RkzrVrhvF1rtsi7/PAN5ZknePhI?=
 =?us-ascii?Q?5AJlHeaE30Z4OAXq+t6iumrzjwIGQjUcjUn5nFhLJblY80H1ms4okFqN1vRi?=
 =?us-ascii?Q?9FQ1IkLyjMx4hwCht50FNY3vOXQExiq/0lb5T+cnhiQjjZqX9neYOaKySyMS?=
 =?us-ascii?Q?BxXJi//jhjApsmX/BVywfByEWg2v9d/oLm0aN+SgaVHxsWBZjH+5QWmxQIeW?=
 =?us-ascii?Q?UVMmgKU2Vk7qeG57/jLTvYFI66zcGpMFEZp9oyjPyC3xzPaguzAwUAt+D+O/?=
 =?us-ascii?Q?xfyPFvf0BAKCoqzjpPZzucDOOXAs83HsX9OVvu34Q6C5ifcqIg4HHzpmvpSn?=
 =?us-ascii?Q?vyzsdx+lZFzTrU0/Ku9BMjUYX63UPpdSMOBXCKX02+30MmlhY5bmpmYGhjhe?=
 =?us-ascii?Q?xt5N+mc0tPSVZab3iXhFl86s8caM+A1TkVe50ylWVznOM7VEBTwz49t+w1PF?=
 =?us-ascii?Q?19CPj5Bdcrhi2Y8FD55u1snl2Hv9I06a7K8Uz6fOJzfEA/wNiJOw91F1mlL2?=
 =?us-ascii?Q?8KNEhiAGo3mdSn9RnibNQi9umeHvhL9qqMNIJmHtzJptYCzNLOoK7b2CRn3G?=
 =?us-ascii?Q?UKwh7fhR1sJ9P/8mc6wmViUtbInZ9W4fxLuios5g2IFGjV5xyRfYG7exPzaZ?=
 =?us-ascii?Q?GjSx+ewEwl06Cmtilg8agx6rwyr3W8w3SnhvLzesQyxTyOYwXmn2XiAAztAo?=
 =?us-ascii?Q?XhZSFbZDUQtBjsBMk8zcWSb6GE6O8jrPypC2kCKoQxK6vlWtu8fQms9xwjrO?=
 =?us-ascii?Q?38J6j8zj3TZA4+wFkApQAdrr+c2W4qroXpMiRoLA3wqPegcJhV6cvgk6u2yE?=
 =?us-ascii?Q?j7aM?=
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c603d31-827a-45a9-c636-08d8952d7622
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0602MB2886.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 12:42:56.4411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Da2lkJcC+YKjFGv9lOy1C9QfIGZdUKY3Bo+NoqCreAeIGPMVr/VTaNaM9JHi/hVnPvUC+Uqz+vxEd3vd7zk21ljx1o5X0cmwNhbikwJ9Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB6043
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 785b5bb41b0a ("PM: AVS: Drop the avs directory and the
corresponding Kconfig") moved AVS code to SOC-specific folders, and
removed corresponding Kconfig from drivers/power, leaving original
POWER_AVS config option enabled in omap2plus_defconfig file.

Remove the option, which has no references in the tree anymore.

Fixes: 785b5bb41b0a ("PM: AVS: Drop the avs directory and the corresponding Kconfig")
Cc: Nishanth Menon <nm@ti.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 arch/arm/configs/omap2plus_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 34793aabdb65..de3b7813a1ce 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -297,7 +297,6 @@ CONFIG_GPIO_TWL4030=y
 CONFIG_W1=m
 CONFIG_HDQ_MASTER_OMAP=m
 CONFIG_W1_SLAVE_DS250X=m
-CONFIG_POWER_AVS=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_BATTERY_BQ27XXX=m
-- 
2.17.1

