Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10877548BC
	for <lists+linux-omap@lfdr.de>; Sat, 15 Jul 2023 15:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjGONZ4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 15 Jul 2023 09:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjGONZz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 15 Jul 2023 09:25:55 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6322D130
        for <linux-omap@vger.kernel.org>; Sat, 15 Jul 2023 06:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=6OpRiJ9dgJrUBOEZNF
        94oNDctrqTYwJHTR2r8xy1+Gk=; b=DDaKTZglWkF1LIPY9xiyf8guSHudmvwX3B
        1HzAPhhfc8gWzZc5vuutKeJrO3PFrvecDVjwlEYhoAEVmw7Wch7ljy6n08oMGhkh
        Z+ZnbYAaNZJNpUJIJidGbe6HDY5OCtFvFlLnJnVHKpRIs2I2+r/wkbQSUv4hIw5w
        jxY0a5pSs=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g1-3 (Coremail) with SMTP id _____wAnlwM5nrJkfA2FAQ--.11690S4;
        Sat, 15 Jul 2023 21:25:37 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org
Subject: [PATCH 1/1] mmc: fix potential memleaks in mmc_omap_new_slot
Date:   Sat, 15 Jul 2023 21:24:49 +0800
Message-Id: <20230715132449.2217-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wAnlwM5nrJkfA2FAQ--.11690S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1ruFWxtrWkZw13Zw47Arb_yoW8CrWkpF
        sYvFykKFy5Ar4fJrWrJa1kX3ZY9r1xGay8Wrs2gw1xZF1ayr1kKasrKFyYvrn5CFykXr4a
        gFWrXrW8CF9xWaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUb18UUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiUROt5WDESR8NWAAAst
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

'mmc' allocated by mmc_alloc_host is not freed on the error paths
of gpiod_get_index_optional(), causing memory leaks.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/mmc/host/omap.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 6a259563690d..eeb5a1b493d9 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -1261,19 +1261,25 @@ static int mmc_omap_new_slot(struct mmc_omap_host *host, int id)
 	/* Check for some optional GPIO controls */
 	slot->vsd = gpiod_get_index_optional(host->dev, "vsd",
 					     id, GPIOD_OUT_LOW);
-	if (IS_ERR(slot->vsd))
-		return dev_err_probe(host->dev, PTR_ERR(slot->vsd),
+	if (IS_ERR(slot->vsd)){
+		r = dev_err_probe(host->dev, PTR_ERR(slot->vsd),
 				     "error looking up VSD GPIO\n");
+		goto err_free_host;
+	}
 	slot->vio = gpiod_get_index_optional(host->dev, "vio",
 					     id, GPIOD_OUT_LOW);
-	if (IS_ERR(slot->vio))
-		return dev_err_probe(host->dev, PTR_ERR(slot->vio),
+	if (IS_ERR(slot->vio)){
+		r = dev_err_probe(host->dev, PTR_ERR(slot->vio),
 				     "error looking up VIO GPIO\n");
+		goto err_free_host;
+	}
 	slot->cover = gpiod_get_index_optional(host->dev, "cover",
 						id, GPIOD_IN);
-	if (IS_ERR(slot->cover))
-		return dev_err_probe(host->dev, PTR_ERR(slot->cover),
+	if (IS_ERR(slot->cover)){
+		r = dev_err_probe(host->dev, PTR_ERR(slot->cover),
 				     "error looking up cover switch GPIO\n");
+		goto err_free_host;
+	}		
 
 	host->slots[id] = slot;
 
@@ -1333,6 +1339,7 @@ static int mmc_omap_new_slot(struct mmc_omap_host *host, int id)
 		device_remove_file(&mmc->class_dev, &dev_attr_slot_name);
 err_remove_host:
 	mmc_remove_host(mmc);
+err_free_host:
 	mmc_free_host(mmc);
 	return r;
 }
-- 
2.17.1

