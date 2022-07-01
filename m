Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC2E563288
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 13:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234108AbiGAL11 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Jul 2022 07:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbiGAL1Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Jul 2022 07:27:25 -0400
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6DA66814A5
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YS3HD
        oiFxyAoNpF4CK5ulUAvVzxrypMS5E6OHvbV/UQ=; b=bGQpEJEp1uV0JM5twlKrK
        4pkc5KlulOCqYZh5bp8datHayWk74EoZN+BM6cVexuCplrW/uafQbXIhkTspu/X2
        xBanEIoqve/XO8FDZbWftvLsowL6rJy0r99yHh8MnTwrOfVjcY96j/faC/i3vnD5
        YLgnv54EJ49tSYcyTpHlWw=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp9 (Coremail) with SMTP id NeRpCgAHJtD62b5ibZSuFw--.17397S2;
        Fri, 01 Jul 2022 19:26:52 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, windhl@126.com
Subject: [PATCH 1/3] crypto: nx: Hold the reference returned by of_find_compatible_node
Date:   Fri,  1 Jul 2022 19:26:47 +0800
Message-Id: <20220701112649.233322-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgAHJtD62b5ibZSuFw--.17397S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1UAry5AFykur17Kr4rKrg_yoWDZwb_CF
        929ry7ZFWj9rs3XrsxZr43ZryYv3yfur48Zrn2v343t3y7Zr47WFn8JF1xZ348Wry8JFZx
        ZwsYyr17Gr43ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRWpBSUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhwxF18RPabT7QAAsf
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In nx842_pseries_init(), we should hold the reference returned by
of_find_compatible_node() and use it to call of_node_put to keep
refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/crypto/nx/nx-common-pseries.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 7584a34ba88c..3ea334b7f820 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -1208,10 +1208,13 @@ static struct vio_driver nx842_vio_driver = {
 static int __init nx842_pseries_init(void)
 {
 	struct nx842_devdata *new_devdata;
+	struct device_node *np;
 	int ret;
 
-	if (!of_find_compatible_node(NULL, NULL, "ibm,compression"))
+	np = of_find_compatible_node(NULL, NULL, "ibm,compression");
+	if (!np)
 		return -ENODEV;
+	of_node_put(np);
 
 	RCU_INIT_POINTER(devdata, NULL);
 	new_devdata = kzalloc(sizeof(*new_devdata), GFP_KERNEL);
-- 
2.25.1

