Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A796B4F010C
	for <lists+linux-omap@lfdr.de>; Sat,  2 Apr 2022 13:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348921AbiDBL3F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 07:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353385AbiDBL3D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 07:29:03 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEF61A6E4C;
        Sat,  2 Apr 2022 04:27:11 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id b21so698167ljf.11;
        Sat, 02 Apr 2022 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uKHBwkgQmA5yCNC6nuiAXHQHMpfWkpsJsuC+jWIWFR8=;
        b=nQodKw4tVkOY7lVW2Jr6FhmA7U9fPr+z7gYQtiwMlngBjFSbGGOscJ5F7QasJk3y2o
         ydj9YYT5SgxRCQG9cYgqt/AOE3cLSmAE5r/pKG/L1amCxNTXv+l9xbmDxqQYMgCvADxR
         r/UiGGoWREmkui4Lgc2WFRyOym2KRq3Fv76ZBoQwiv039WweKJ28x4n7Yn9QJ8xX/ysj
         0H49p/ZNWSF1aotpJeJcFzanvWHngD8AomTNz1gcEQVygGHf0ayerVNP6Yww2NlfN0le
         TCMIEuM9UyobwdyQ+fl+nBfnueoFx6uwRVqnD9rq4K/GpESfrQT1zw/WzMxw34fxn8G1
         ErKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uKHBwkgQmA5yCNC6nuiAXHQHMpfWkpsJsuC+jWIWFR8=;
        b=uS7iXsyODp8bbXUeIrnClLdr1XphshHTVglLC7KC60aNRCMVlr8ueLlG2SKY3alBQA
         8QniHQE1J3HlX+uF8ReaF1zFermbUfblFDICCbBauphHryNhYpSLgYI44NE5LJo3kiau
         ZbwLt//MctM7Zjh6YW+aK1tI8aXpYtekYQSPgpbHCs0kGjBHAOYZ3T/5HFqFn7c7mHuh
         q+YraOnq412UK0YZhJUaVzWLBOOntnUio71miKp8ycv8pYeR788luZQwPb1yUv9RDjnH
         egtf7HBcECyehk7H6tntHxO/O/cNGHLf56BowAo8YZZMYaPnBw4smqYoNDeRAJIEO9EF
         6nYg==
X-Gm-Message-State: AOAM532lIv1odKPZ3o7BpJEaRItZsBR2AnEIYRs/EDd2Nm8JdsGz9AvP
        0c/Dac+ZZ4kHxNtKzoWtTROtJg2csI1UAITm
X-Google-Smtp-Source: ABdhPJzrUaILEwfgsKz2jI2/NDiDEBJmjnJ7+A8BzsdH8iJKNkSRgmCCokziTmEGIyapCRTIiERhmg==
X-Received: by 2002:a2e:b88b:0:b0:249:8a0b:ad3d with SMTP id r11-20020a2eb88b000000b002498a0bad3dmr16476474ljp.53.1648898829358;
        Sat, 02 Apr 2022 04:27:09 -0700 (PDT)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id n11-20020a0565120acb00b0044aa30cb30csm501445lfu.6.2022.04.02.04.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:27:08 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] usb: gadget: omap_udc: Make it CCF clk API compatible
Date:   Sat,  2 Apr 2022 13:26:58 +0200
Message-Id: <20220402112658.130191-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP1 custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/usb/gadget/udc/omap_udc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index 494da00398d7..8768a3280e19 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -2604,6 +2604,8 @@ static void omap_udc_release(struct device *dev)
 	if (udc->dc_clk) {
 		if (udc->clk_requested)
 			omap_udc_enable_clock(0);
+		clk_unprepare(udc->hhc_clk);
+		clk_unprepare(udc->dc_clk);
 		clk_put(udc->hhc_clk);
 		clk_put(udc->dc_clk);
 	}
@@ -2768,8 +2770,8 @@ static int omap_udc_probe(struct platform_device *pdev)
 		hhc_clk = clk_get(&pdev->dev, "usb_hhc_ck");
 		BUG_ON(IS_ERR(dc_clk) || IS_ERR(hhc_clk));
 		/* can't use omap_udc_enable_clock yet */
-		clk_enable(dc_clk);
-		clk_enable(hhc_clk);
+		clk_prepare_enable(dc_clk);
+		clk_prepare_enable(hhc_clk);
 		udelay(100);
 	}
 
@@ -2778,8 +2780,8 @@ static int omap_udc_probe(struct platform_device *pdev)
 		hhc_clk = clk_get(&pdev->dev, "l3_ocpi_ck");
 		BUG_ON(IS_ERR(dc_clk) || IS_ERR(hhc_clk));
 		/* can't use omap_udc_enable_clock yet */
-		clk_enable(dc_clk);
-		clk_enable(hhc_clk);
+		clk_prepare_enable(dc_clk);
+		clk_prepare_enable(hhc_clk);
 		udelay(100);
 	}
 
@@ -2927,8 +2929,8 @@ static int omap_udc_probe(struct platform_device *pdev)
 		usb_put_phy(xceiv);
 
 	if (cpu_is_omap16xx() || cpu_is_omap7xx()) {
-		clk_disable(hhc_clk);
-		clk_disable(dc_clk);
+		clk_disable_unprepare(hhc_clk);
+		clk_disable_unprepare(dc_clk);
 		clk_put(hhc_clk);
 		clk_put(dc_clk);
 	}
-- 
2.35.1

