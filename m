Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D065F551FC9
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jun 2022 17:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242691AbiFTPId (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jun 2022 11:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243322AbiFTPIY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jun 2022 11:08:24 -0400
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 097AC255B7
        for <linux-omap@vger.kernel.org>; Mon, 20 Jun 2022 07:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FWv6p
        y6/Q5uvOySSwS589BucWKpP/d6jpvpGiOHJyxY=; b=Ec3MeFTykwcHCnGYSK9ic
        eMSEzTyN9IJg2aoD/eh9k6v3HgPwcTZIXjizmVa2zrk+JQ0khSHv5O668yPHtnnD
        eKLF2lXYh9r9IUDgIti3jRTQybkQX15BkHHiP4GWV6wd3twrP9JYTvtoxvKyfBEI
        5+jJk+45jKE2D5XyS8xTMg=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp10 (Coremail) with SMTP id NuRpCgBnf4DWiLBiqdQTFA--.24800S2;
        Mon, 20 Jun 2022 22:48:55 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, p.zabel@pengutronix.de
Cc:     windhl@126.com, linux-omap@vger.kernel.org
Subject: [PATCH] bus/ti-sysc: Fix refcount leak bug
Date:   Mon, 20 Jun 2022 22:48:53 +0800
Message-Id: <20220620144853.4074378-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgBnf4DWiLBiqdQTFA--.24800S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW8urWrJF17KryxCr47XFb_yoWxurc_Zw
        4Igr12yrykGrsFg3W5ZFZ3XFWFyrn3WFs5ZF97K3yfAw1xZ34rXF4DXFW8Wr13uFZ5tFWY
        9rsxXry0kw1DJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKrWF7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hcmF1uwMPuAzQAAsR
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In sysc_init_static_data(), we need a of_node_put() to keep refcount
balance for the of_find_node_by_path().

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/bus/ti-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 9a7d12332fad..d0400fde6637 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3138,6 +3138,7 @@ static int sysc_init_static_data(struct sysc *ddata)
 		np = of_find_node_by_path("/ocp");
 		WARN_ONCE(np && of_device_is_compatible(np, "simple-bus"),
 			  "ti-sysc: Incomplete old dtb, please update\n");
+		of_node_put(np);
 		break;
 	default:
 		break;
-- 
2.25.1

