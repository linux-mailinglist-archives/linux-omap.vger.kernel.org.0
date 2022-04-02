Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604074F0149
	for <lists+linux-omap@lfdr.de>; Sat,  2 Apr 2022 13:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236730AbiDBL4u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 07:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiDBL4t (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 07:56:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD5210BBC9;
        Sat,  2 Apr 2022 04:54:57 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h7so9287678lfl.2;
        Sat, 02 Apr 2022 04:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O7nG8AJS/R9S2ZJAIN62cFFHL53dA2MgyCxhgMT/sn0=;
        b=T3J+o4FO/uAU8qIqjeZbmKanNd/OutwBIyxA3oYPX/iFeQk5dFNYTdCPRjhF1Mz+hw
         bVDeLx6EUfipSXgpLnH+v77PPj0OOIzO6pk1EUfG4E0eok9EF0IJtTfs8C04iGZzh0zG
         x4gjByHDoiNzcqWuk68Y8E4qet8Lh6QkRRpVvWPbyFATUHLwSXYNHBPa0E69Pfx1SMbM
         IEhvuTxpdWH53mfWOiL25ReVrTN4ZX305vwlBvwUknlwx+h5HrE0oPu7XvRO3BriZqqp
         8Jz0w0RmJGjEct2OxMKkmyKX1gQjy0vu7Ye5oHcw/zXSU1elj94BLcy2F1pBG11OQ11d
         chzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O7nG8AJS/R9S2ZJAIN62cFFHL53dA2MgyCxhgMT/sn0=;
        b=KGSnXTaBvIsF4L12B6ms7tNTI6ilX1wiBFh7j1+85YNgaXKWl+lpwpEx4X46xoPY0S
         hh5x09f9qMjMWyFtDEUUPZkYRwm8rTdhgBNOt9sxajxo8I4jnrcqhbembY4L7nDxubrD
         kIHt8WgvOmSmDWw8PQwACXS9U2VDg8AJ+0rFyehvfjlnZiplGB43IZFzasZXsh6yB2YJ
         /XObhpoBbWM6IGcRPmlrfVUAVr8Px2SjHvwo9aqTo5sWilaoAAedviJBKf9/cySQBbEh
         f36rtGpNYbI+pnCVKA9FIN/9oODcyzZfHmAMymI66kSkiebp2sWl1uzZh5StFyTHEmZC
         81mQ==
X-Gm-Message-State: AOAM532gb8tK5SCf96+OrN0RQIK9uHSUMkvQHOZDs7wGZxKbIKHhMqIp
        1Zg/Cq7dVQxsNWNxxmvVPGubukPnmYKM5hsa
X-Google-Smtp-Source: ABdhPJza7N3uBhLaWceoecrnl35xtMsLyegy8nmRMBZtbKetasJkvfws4mM6r4sHWGm/uLh6CNAfsQ==
X-Received: by 2002:a05:6512:130c:b0:44a:2dd3:91d0 with SMTP id x12-20020a056512130c00b0044a2dd391d0mr17253016lfu.234.1648900495457;
        Sat, 02 Apr 2022 04:54:55 -0700 (PDT)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id m2-20020a05651202e200b0044a0d0f99b9sm504846lfq.278.2022.04.02.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:54:54 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] video: fbdev: omap: Make it CCF clk API compatible
Date:   Sat,  2 Apr 2022 13:54:44 +0200
Message-Id: <20220402115444.130999-1-jmkrzyszt@gmail.com>
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

OMAP1 LCDC drivers now omit clk_prepare/unprepare() steps, not supported
by OMAP1 custom implementation of clock API.  However, non-CCF stubs of
those functions exist for use on such platforms until converted to CCF.

Update the drivers to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/video/fbdev/omap/hwa742.c | 6 +++---
 drivers/video/fbdev/omap/lcdc.c   | 6 +++---
 drivers/video/fbdev/omap/sossi.c  | 5 +++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/omap/hwa742.c
index b191bef22d98..9d9fe5c3a7a1 100644
--- a/drivers/video/fbdev/omap/hwa742.c
+++ b/drivers/video/fbdev/omap/hwa742.c
@@ -964,7 +964,7 @@ static int hwa742_init(struct omapfb_device *fbdev, int ext_mode,
 	if ((r = calc_extif_timings(ext_clk, &extif_mem_div)) < 0)
 		goto err3;
 	hwa742.extif->set_timings(&hwa742.reg_timings);
-	clk_enable(hwa742.sys_ck);
+	clk_prepare_enable(hwa742.sys_ck);
 
 	calc_hwa742_clk_rates(ext_clk, &sys_clk, &pix_clk);
 	if ((r = calc_extif_timings(sys_clk, &extif_mem_div)) < 0)
@@ -1023,7 +1023,7 @@ static int hwa742_init(struct omapfb_device *fbdev, int ext_mode,
 
 	return 0;
 err4:
-	clk_disable(hwa742.sys_ck);
+	clk_disable_unprepare(hwa742.sys_ck);
 err3:
 	hwa742.extif->cleanup();
 err2:
@@ -1037,7 +1037,7 @@ static void hwa742_cleanup(void)
 	hwa742_set_update_mode(OMAPFB_UPDATE_DISABLED);
 	hwa742.extif->cleanup();
 	hwa742.int_ctrl->cleanup();
-	clk_disable(hwa742.sys_ck);
+	clk_disable_unprepare(hwa742.sys_ck);
 }
 
 struct lcd_ctrl hwa742_ctrl = {
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index 7317c9aad677..97d20dc0d1d0 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -711,7 +711,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 		dev_err(fbdev->dev, "failed to adjust LCD rate\n");
 		goto fail1;
 	}
-	clk_enable(lcdc.lcd_ck);
+	clk_prepare_enable(lcdc.lcd_ck);
 
 	r = request_irq(OMAP_LCDC_IRQ, lcdc_irq_handler, 0, MODULE_NAME, fbdev);
 	if (r) {
@@ -746,7 +746,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 fail3:
 	free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
 fail2:
-	clk_disable(lcdc.lcd_ck);
+	clk_disable_unprepare(lcdc.lcd_ck);
 fail1:
 	clk_put(lcdc.lcd_ck);
 fail0:
@@ -760,7 +760,7 @@ static void omap_lcdc_cleanup(void)
 	free_fbmem();
 	omap_free_lcd_dma();
 	free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
-	clk_disable(lcdc.lcd_ck);
+	clk_disable_unprepare(lcdc.lcd_ck);
 	clk_put(lcdc.lcd_ck);
 }
 
diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
index 80ac67f27f0d..b9cb8b386627 100644
--- a/drivers/video/fbdev/omap/sossi.c
+++ b/drivers/video/fbdev/omap/sossi.c
@@ -598,7 +598,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 	l &= ~CONF_SOSSI_RESET_R;
 	omap_writel(l, MOD_CONF_CTRL_1);
 
-	clk_enable(sossi.fck);
+	clk_prepare_enable(sossi.fck);
 	l = omap_readl(ARM_IDLECT2);
 	l &= ~(1 << 8);			/* DMACK_REQ */
 	omap_writel(l, ARM_IDLECT2);
@@ -649,7 +649,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 	return 0;
 
 err:
-	clk_disable(sossi.fck);
+	clk_disable_unprepare(sossi.fck);
 	clk_put(sossi.fck);
 	return r;
 }
@@ -657,6 +657,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 static void sossi_cleanup(void)
 {
 	omap_lcdc_free_dma_callback();
+	clk_unprepare(sossi.fck);
 	clk_put(sossi.fck);
 	iounmap(sossi.base);
 }
-- 
2.35.1

