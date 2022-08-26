Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4CAD5A20B1
	for <lists+linux-omap@lfdr.de>; Fri, 26 Aug 2022 08:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbiHZGLv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Aug 2022 02:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiHZGLu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Aug 2022 02:11:50 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE6B6E2F5;
        Thu, 25 Aug 2022 23:11:48 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MDTts0WSXznTll;
        Fri, 26 Aug 2022 14:09:25 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 14:11:46 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 26 Aug
 2022 14:11:45 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <jneanne@baylibre.com>, <broonie@kernel.org>
Subject: [PATCH -next] regulator: tps65219: change tps65219_regulator_irq_types to static
Date:   Fri, 26 Aug 2022 14:19:41 +0800
Message-ID: <20220826061941.1814723-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tps65219_regulator_irq_types is only used in tps65219-regulator.c now,
change it to static.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/regulator/tps65219-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 7ba2594e437c..934bf52bbd85 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -30,7 +30,7 @@ struct tps65219_regulator_irq_type {
 	unsigned long event;
 };
 
-struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
+static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
 	{ "LDO3_SCG", "LDO3", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
 	{ "LDO3_OC", "LDO3", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
 	{ "LDO3_UV", "LDO3", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
-- 
2.25.1

