Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0726C49C1
	for <lists+linux-omap@lfdr.de>; Wed, 22 Mar 2023 12:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjCVL7h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Mar 2023 07:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjCVL7h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Mar 2023 07:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890AD570A7
        for <linux-omap@vger.kernel.org>; Wed, 22 Mar 2023 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679486331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=B1IhaCFxKJpjAg+q0LEfIaM0Q2vc1KJxe/aPBLF+J8s=;
        b=DmE6m0+W6xUgcpUYlLWtGVR27Y5tD8wE/rwG4Lk2PxbKLjXfod+/IcIGa8oULfKpx1iyur
        eD8lrwpJ3BeHjwv4jE0etTb1QRMpy1r1RJo11XV7yVRoNxkpkePJejynPOz1g59yMCZEnP
        5uLpDYaaHGGlMuENh6ZLwrgcEBMWoyw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-Mm-YoK2BMHKHVlfO74MWKg-1; Wed, 22 Mar 2023 07:58:50 -0400
X-MC-Unique: Mm-YoK2BMHKHVlfO74MWKg-1
Received: by mail-qv1-f71.google.com with SMTP id dg8-20020a056214084800b005acc280bf19so9131686qvb.22
        for <linux-omap@vger.kernel.org>; Wed, 22 Mar 2023 04:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679486330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1IhaCFxKJpjAg+q0LEfIaM0Q2vc1KJxe/aPBLF+J8s=;
        b=UzDlqZTHnrEQ5OTPRB/pDsPslimBixAaTVpWwamwnVxQWx4rsdcFgb81kvXw+fd+Mz
         VxMEji32con7EY1RfTrlLFrAtZZBWwXY6oqgNNP47P+nhsq4N0vc9/kMXmh82GrL4xWK
         XqCiv7DU1P+juildKqcABRivkv4NhUjfY7fowGG0Fem+Mew6lfYprI5OJGbRWUIjbmqy
         PN3SFaCRS/mHOtI3yC0DuElrotJKzgI5m1bSeAuhPxvJpv8synid9AWAHEGAjpGaaVm5
         GfYdNayQo3MFptuFOgKcT0Ut65IZ5Z4TKN0stNs5ImpNsrq8Jc9YcCtHX6USf+BgV+jD
         yFkg==
X-Gm-Message-State: AO0yUKUu0N60X0nbO2PJFfLylIdS5tu/wBVu/UnKru8PsTQQp5MqQc5Y
        hlD3tQQanH0PdfJtHit2jTvllloI/mgRjDnXFaJwvnYwIkfpRFym+LLSoHByMJ4ji0PrvYG55CY
        Yy5CEy8W0DeXbv86npNG6Gw==
X-Received: by 2002:a05:622a:103:b0:3d7:3cf4:33f9 with SMTP id u3-20020a05622a010300b003d73cf433f9mr4956975qtw.68.1679486330208;
        Wed, 22 Mar 2023 04:58:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set8+LElrkvdjPI0dbh2Q4k8yW/bECWQ3fu0cFt9+TXxvztfQIZdsEIppTbtwkLz4UzzOc60T9Q==
X-Received: by 2002:a05:622a:103:b0:3d7:3cf4:33f9 with SMTP id u3-20020a05622a010300b003d73cf433f9mr4956958qtw.68.1679486329994;
        Wed, 22 Mar 2023 04:58:49 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t10-20020a37aa0a000000b0074683c45f6csm6337273qke.1.2023.03.22.04.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 04:58:49 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     tony@atomide.com, lee@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] mfd: twl-core: remove unused add_child and add_numbered_child functions
Date:   Wed, 22 Mar 2023 07:58:38 -0400
Message-Id: <20230322115838.2569414-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

clang with W=1 reports
drivers/mfd/twl-core.c:654:30: error: unused function 'add_child' [-Werror,-Wunused-function]
static inline struct device *add_child(unsigned mod_no, const char *name,
                             ^
add_numbered_child and its only caller add_child are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mfd/twl-core.c | 65 ------------------------------------------
 1 file changed, 65 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index e2d9a93be43b..e801b7ce010f 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -594,71 +594,6 @@ int twl_get_hfclk_rate(void)
 }
 EXPORT_SYMBOL_GPL(twl_get_hfclk_rate);
 
-static struct device *
-add_numbered_child(unsigned mod_no, const char *name, int num,
-		void *pdata, unsigned pdata_len,
-		bool can_wakeup, int irq0, int irq1)
-{
-	struct platform_device	*pdev;
-	struct twl_client	*twl;
-	int			status, sid;
-
-	if (unlikely(mod_no >= twl_get_last_module())) {
-		pr_err("%s: invalid module number %d\n", DRIVER_NAME, mod_no);
-		return ERR_PTR(-EPERM);
-	}
-	sid = twl_priv->twl_map[mod_no].sid;
-	twl = &twl_priv->twl_modules[sid];
-
-	pdev = platform_device_alloc(name, num);
-	if (!pdev)
-		return ERR_PTR(-ENOMEM);
-
-	pdev->dev.parent = &twl->client->dev;
-
-	if (pdata) {
-		status = platform_device_add_data(pdev, pdata, pdata_len);
-		if (status < 0) {
-			dev_dbg(&pdev->dev, "can't add platform_data\n");
-			goto put_device;
-		}
-	}
-
-	if (irq0) {
-		struct resource r[2] = {
-			{ .start = irq0, .flags = IORESOURCE_IRQ, },
-			{ .start = irq1, .flags = IORESOURCE_IRQ, },
-		};
-
-		status = platform_device_add_resources(pdev, r, irq1 ? 2 : 1);
-		if (status < 0) {
-			dev_dbg(&pdev->dev, "can't add irqs\n");
-			goto put_device;
-		}
-	}
-
-	status = platform_device_add(pdev);
-	if (status)
-		goto put_device;
-
-	device_init_wakeup(&pdev->dev, can_wakeup);
-
-	return &pdev->dev;
-
-put_device:
-	platform_device_put(pdev);
-	dev_err(&twl->client->dev, "failed to add device %s\n", name);
-	return ERR_PTR(status);
-}
-
-static inline struct device *add_child(unsigned mod_no, const char *name,
-		void *pdata, unsigned pdata_len,
-		bool can_wakeup, int irq0, int irq1)
-{
-	return add_numbered_child(mod_no, name, -1, pdata, pdata_len,
-		can_wakeup, irq0, irq1);
-}
-
 /*----------------------------------------------------------------------*/
 
 /*
-- 
2.27.0

