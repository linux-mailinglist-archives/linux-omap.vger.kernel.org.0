Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1536E551FF1
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jun 2022 17:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235564AbiFTPLT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jun 2022 11:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241643AbiFTPJz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jun 2022 11:09:55 -0400
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D9C5E24957
        for <linux-omap@vger.kernel.org>; Mon, 20 Jun 2022 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3eKGN
        YWL67QmLkoPrbS4HWxqUhh00seNg2vEcPJVrT0=; b=bNLwxeyDUadqZMV6bcH3X
        eJx4UmDeNLzXSSiW0wg7aowRbEs0k5GCJj4Yd4NJvyM/DVdOXH2HqPajaU/iCEY9
        bgGLt6s9nRTxkJsJfarVjYrCUYJdxFdwmgcCts0o1CEQHhh9uptSMY+b2NIm01AF
        BvwrSs+R0ZP6M7U6720/IA=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp1 (Coremail) with SMTP id C8mowAD3xDWTirBiBZkQFA--.60220S2;
        Mon, 20 Jun 2022 22:56:19 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, p.zabel@pengutronix.de
Cc:     windhl@126.com, linux-omap@vger.kernel.org
Subject: [PATCH v2] bus/ti-sys: Fix refcount leak bugs
Date:   Mon, 20 Jun 2022 22:56:19 +0800
Message-Id: <20220620145619.4074665-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAD3xDWTirBiBZkQFA--.60220S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1fCr15CF4xur1rCF1kAFb_yoWkZrX_Zr
        nagr47Ary8Gr40qw4UZrZxZFZ5ZrZ5Wrs3uas3Kw43A340y34rAFn8XFWvqw13uFZYvFZ8
        KrsxZa48JwnrZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUyrW3UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBQmF2JVj80kCAAAsE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In sysc_init_stdout_path(), there is only one of_node_put() for the
second of_find_node_by_path(). However, we need to add one of_node_put()
for the first of_find_node_by_path().

In sysc_init_static_data(), we need one of_node_put() for the
of_find_node_by_path() to keep refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: merge two bugs into one commit
 v1: only find the bug in sysc_init_static_data()


 drivers/bus/ti-sysc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 9a7d12332fad..85a1003eb8e2 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -751,6 +751,7 @@ static void sysc_init_stdout_path(struct sysc *ddata)
 		goto err;
 
 	uart = of_get_property(np, "stdout-path", NULL);
+	of_node_put(np);
 	if (!uart)
 		goto err;
 
@@ -3138,6 +3139,7 @@ static int sysc_init_static_data(struct sysc *ddata)
 		np = of_find_node_by_path("/ocp");
 		WARN_ONCE(np && of_device_is_compatible(np, "simple-bus"),
 			  "ti-sysc: Incomplete old dtb, please update\n");
+		of_node_put(np);
 		break;
 	default:
 		break;
-- 
2.25.1

