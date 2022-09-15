Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6EA5B935E
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 05:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiIODmH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Sep 2022 23:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiIODmG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Sep 2022 23:42:06 -0400
X-Greylist: delayed 1822 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 14 Sep 2022 20:42:02 PDT
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 13DC426C;
        Wed, 14 Sep 2022 20:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8klXX
        5ncOj/JqdaK9P3vyLs+eSbA7W/UiVirrasLRHE=; b=kTlkcv30PEvq1fQVSoSba
        bQwHFuQkuaWCXggJdtIVIBNSOizkI1Tm8KDZ9PpV4ZpEpJeE1RROLYXZBMEmGqbK
        I2I+fxZAVH/s633rGWlpvgNwMQiDsmuMCxzJSIVT6AoknpLLxRuxVIpi7uF8UD1Y
        XSgClB9B4++wntBvD9aUJI=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp9 (Coremail) with SMTP id NeRpCgC3nqrclyJjlCu8Bw--.29768S2;
        Thu, 15 Sep 2022 11:11:27 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, kristo@kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] clk: ti: Call of_node_get() before of_find_xxx() API
Date:   Thu, 15 Sep 2022 11:11:21 +0800
Message-Id: <20220915031121.4003589-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgC3nqrclyJjlCu8Bw--.29768S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWUtr17Aw4xCF18Ww13XFb_yoW3CrgEkr
        1fX3s2v3WUCwn3tFnFvFs3Xa4Yyry8uF18ZF1Sva43J345Ar42qr45X395X3sxGFW2yF98
        ur17G3yjkryUXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_lApDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AB9F1pEEQiXwgAAsk
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In ti_find_clock_provider(), we need to call of_node_get() for
of_find_node_by_name() which will automatically call of_node_put()
for the 'from' argument.

Fixes: 51f661ef9a10 ("clk: ti: Add ti_find_clock_provider() to use clock-output-names")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/clk/ti/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 373e9438b57a..7c390cd67e1a 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -147,6 +147,7 @@ static struct device_node *ti_find_clock_provider(struct device_node *from,
 		return np;
 
 	/* Fall back to using old node name base provider name */
+	of_node_get(from);
 	return of_find_node_by_name(from, name);
 }
 
-- 
2.25.1

