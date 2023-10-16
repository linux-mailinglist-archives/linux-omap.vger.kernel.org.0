Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABABA7CA695
	for <lists+linux-omap@lfdr.de>; Mon, 16 Oct 2023 13:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbjJPLUB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Oct 2023 07:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbjJPLUA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Oct 2023 07:20:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AB2D9
        for <linux-omap@vger.kernel.org>; Mon, 16 Oct 2023 04:19:58 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-405505b07dfso33475555e9.0
        for <linux-omap@vger.kernel.org>; Mon, 16 Oct 2023 04:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697455196; x=1698059996; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8KsGpPOOoWej+EABAJ7O0MnezxzJN0p6iOYP9JLBdQ=;
        b=bsEAkxWY0dzw4kb9IARJlAMASvaxvEHrkDR1Cv7mzOkiEEKWZjplB5nQUpTsjP5tLo
         D8wTUqty9LpDUOXUNPX3iT4cZ2uMT0Lq4LDSM5Ll4e79Cg7eGCLQPNCgtdglsyxFqAAk
         Qn2Sdx+IIJBF8LsBEk5ltng9JGnt8XAiYLqa16SUOTSaYwX/4tf95RNM1USnuaz7CeUw
         ENfWZOH11Uu6S9nGST6hoCE82Pc29C3QdlalUd9s2YbHzhIn9IAO2qUY9eBQL+wdSi7C
         GjykIu4ItNhuHfnRPiC7qm4cX9oWlJ/g0igZHj10JaGnUQ3a+2E5EzZbEFjwQkWfbNeQ
         Mu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697455196; x=1698059996;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8KsGpPOOoWej+EABAJ7O0MnezxzJN0p6iOYP9JLBdQ=;
        b=GHznVOGkOLhIyli61spcJwgli8jhHas+fjvWHkHxLR7I8sNIQV7s4qolNySaCjEtUB
         mAEpsOelu0ekYnI4L/UzaGuZjewgTCaJrSp1qAqda4UBt60n5i69COXhj9Ye0ueVb8/y
         pgta2LunyKsUOPP0sipB1sH13aseSYhMUCjX2OYWE5ONulkoama49EMNe1iUtvWJZ92C
         AFPAEaOP6Xe9NRafDz3RNrAL0KAPpSCBJ0XuWHyO9QrlrsEJPrOqAmKA0G9wDxNuAO+F
         IFdsUNq41wgzN3FGeINJDyiE4AJYH9eIoXqlCKgcaC1v1zZffA5BnTCsuccc2gjIJBH4
         hG9Q==
X-Gm-Message-State: AOJu0Yy+p0avT9z5a+hDqsN2tzfVla+BHHL5uCAqB+JWRtnSq5IjWCSw
        7JKdn9TUVpjk9EhJefkFGIzvAQ==
X-Google-Smtp-Source: AGHT+IEwsg3DmJum5HD3wiLEYwzwIlJS3Ala8HDGksmUXDObbnciWs0r3lFHIdZY4gQew0/dSIC84g==
X-Received: by 2002:a05:600c:1552:b0:407:7def:382c with SMTP id f18-20020a05600c155200b004077def382cmr4012116wmg.13.1697455196603;
        Mon, 16 Oct 2023 04:19:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c358b00b004075d5664basm6983560wmq.8.2023.10.16.04.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 04:19:56 -0700 (PDT)
Date:   Mon, 16 Oct 2023 14:19:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Helge Deller <deller@gmx.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Yang Yang <yang.yang29@zte.com>,
        Xu Panda <xu.panda@zte.com.cn>,
        Lucy Mielke <mielkesteven@icloud.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fbdev: omapfb: fix some error codes
Message-ID: <843b063c-ee4a-4e17-add6-75e2cc82c2f4@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Return negative -ENXIO instead of positive ENXIO.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
No fixes tag because the caller doesn't check for errors.

 drivers/video/fbdev/omap/omapfb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index f28cb90947a3..42c96f1cfc93 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1645,13 +1645,13 @@ static int omapfb_do_probe(struct platform_device *pdev,
 	}
 	fbdev->int_irq = platform_get_irq(pdev, 0);
 	if (fbdev->int_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
 	fbdev->ext_irq = platform_get_irq(pdev, 1);
 	if (fbdev->ext_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
-- 
2.39.2

