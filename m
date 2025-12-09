Return-Path: <linux-omap+bounces-5134-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F096CAEE07
	for <lists+linux-omap@lfdr.de>; Tue, 09 Dec 2025 05:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2EC8302105E
	for <lists+linux-omap@lfdr.de>; Tue,  9 Dec 2025 04:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33A12D73B6;
	Tue,  9 Dec 2025 04:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsECSg+d"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9F02E370C
	for <linux-omap@vger.kernel.org>; Tue,  9 Dec 2025 04:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254501; cv=none; b=XfKHu4hb7Aa2HNC10N8zUJOHPT9S8Y//NkhdDbHWLCLxZUNJ4R3bsYdSEq1zAZtDMWJzsL7fGht9wtcrQsBkePCfC5SwDvaHceKxFk6asQflJrn6OxS94moaqLWSVXcqK4pUfWDo0cFeV31ThLHBMdv63FcJG+u+HgB/r9CGRkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254501; c=relaxed/simple;
	bh=nshWNu78Q/XMh0LlE3oui168SyNeyp8mzorR1kZ8bsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPWXl3cHyxhAyULMGvSlKvgjKEU2zeWuj2ByDIMqCwMJ2NEXyZ7i9tno55/OJ0hkkMmMJnVS7KeC1yo+XAzw1Hvde0wrvn/g13boxQC8n9MASFte7za9HudWNv7jGGUGLrZCsJj6aps/REj86Pk9CIuBatmUcu39HKEPoIApgI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsECSg+d; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34374febdefso5377233a91.0
        for <linux-omap@vger.kernel.org>; Mon, 08 Dec 2025 20:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254499; x=1765859299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okmIi4vWYl0QHDsaJwQNy/3wmdsCyJzm0p/g7ebWdjU=;
        b=QsECSg+dJ4DzL0l1Lo6jg3hQ2OIjMM4PSdt7Dk+xvAuCoD2luEvLgUaewALpsW4EzZ
         PFNrLx9xaYfhsroyyfXB6ZShfCVopsFgOa2m3V6/+JVZIdTvfxb7DwlZU3FQHFDjh7tx
         Pb5gdDNcbR1xWTd0JCNDW5vhYh21io8pBiXfcsUhCpW1Ms+x9ctFJa4X34TTn5a0cxgS
         P8N/Gu1sMi9FlQRnKNqD9xe1Kps++QDhvwjncASR0DCWC5JPXW2k95bJinff1g3fdNmK
         Nubeefy5VQZ3ttzuvo4b+erx0sbzFIKt1FJUDV7Xe6I3KAkwaucJh1OFuXRvC6UelGvH
         9VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254499; x=1765859299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=okmIi4vWYl0QHDsaJwQNy/3wmdsCyJzm0p/g7ebWdjU=;
        b=FSefJaZ3D7goE/o/sVukFzZl9UBENx57kCdTEwy1DAS1qJevW8nMJba4bcuBzQBPHR
         26wx9NMiZSJxGpoV882qgHh306EHTxkff5KncpOS0DeyrR+hOL85Vtfde/Cjear81obT
         hB/G2SrkcvCTikrb0JhMYuO5elLJO4ssBbSle/FA43wUFGamthMTg9w3RrPspC8BbQqF
         vB4v9UiBHS4Ee0rJUJjuhUzU/To+PfLb0JEVlnnfjn4vAuZ52LpPn4wCeNcWN5a9xSwO
         U1YoGrJBCw/dRLHZIcjl2dCykzYnl9owBHRRdTAFJEs9Qrse3zsXCH6B3zas7tBi+rcu
         gz2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHbveqEltFrYOtxrmdrmljXPSUCihbirt/XmrzI0H+RfnRnr+CNkmMu1lAV/c9PoEs2HBOz5YjJXnm@vger.kernel.org
X-Gm-Message-State: AOJu0YwujS8bPC6prYq50NAJu/wk4swSBBhSI196YTUlGNLnJEniF/n/
	UYnjIs5XuvvstzcP4jLDIqnmIhR8EKKs94Xd5jJshp4Gh4KEc5t+mAWg
X-Gm-Gg: ASbGncsvlSiTHc9jNJgD6KEpj73UqO7d/CfJT/fVOAzCn9E4Lv9YnaUbtulakJNYuyt
	BJYQMJ8veKYUE76jFyYMFBIpsqMbgkML7jsMjeydvdi/o2MgtgmboHc3hXM2fOAAbfjgsTXY0qF
	YOChtySs8yu1cBNPjeuPthpdvtLWfFohwAqH8iL1akB9JToO67uRvFEYcG/fPnrb01hoQC4eBKV
	SQzrWtk6OE38fjA9ceKOmHA78TT5sulpOfgRlSIYHQFPiHZDHqrXMWW7UYyvB0/Rq4oAeFqeL17
	5UHDSvWHATNfWmkpTrA4RQ98GpEerH0aO/h1TbcFTbT7KnwZ6Yo0WZ1vtzxwaj0qa61WEdObk8+
	2ibWhl8NVrMooREPkCtqN804M2CF/U1wj8XI4YxTMlPaUenx3BhxIXG1d8xSPF6fnwshfleaXMK
	lzmwj8AuFofya13J5CzlWRWK/U3wFxL32N+6BIfgnoD2U=
X-Google-Smtp-Source: AGHT+IH/sZjDstHQBk/4kkoOc4q4BWQ69NzeICX5PBywIS3oa9fbeB6YzchPZljjw9QmJ7GHpZIn7A==
X-Received: by 2002:a17:90b:1801:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-349a260ac22mr8426365a91.37.1765254498693;
        Mon, 08 Dec 2025 20:28:18 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:b455:298d:48bb:1784])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 20:28:18 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	andy@kernel.org,
	deller@gmx.de,
	gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH 1/3] fbtft: Make sysfs and dev_*() logging conditional on FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:42 -0800
Message-ID: <20251209042744.7875-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209042744.7875-1-chintanlike@gmail.com>
References: <20251209042744.7875-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fbtft core and sysfs implementation unconditionally dereference
fb_info->dev and register sysfs attributes. When FB_DEVICE=n, these
fields are unavailable, leading to build failures.

This patch wraps all sysfs attribute creation/removal and dev_dbg/dev_info
logging in #ifdef CONFIG_FB_DEVICE, with pr_*() fallbacks for the
non-FB_DEVICE case. This makes fbtft fully buildable when FB_DEVICE is
disabled.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c  | 20 ++++++++++++++++++--
 drivers/staging/fbtft/fbtft-sysfs.c |  8 ++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9e7b84071174..dc967bdeabe8 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -365,9 +365,14 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 	unsigned int val;
 	int ret = 1;
 
+#ifdef CONFIG_FB_DEVICE
 	dev_dbg(info->dev,
 		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
 		__func__, regno, red, green, blue, transp);
+#else
+	pr_debug("%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
+		 __func__, regno, red, green, blue, transp);
+#endif
 
 	switch (info->fix.visual) {
 	case FB_VISUAL_TRUECOLOR:
@@ -391,8 +396,11 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	struct fbtft_par *par = info->par;
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
-		__func__, blank);
+#ifdef CONFIG_FB_DEVICE
+	dev_dbg(info->dev, "%s(blank=%d)\n", __func__, blank);
+#else
+	pr_debug("%s(blank=%d)\n", __func__, blank);
+#endif
 
 	if (!par->fbtftops.blank)
 		return ret;
@@ -793,6 +801,8 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
+
+#ifdef CONFIG_FB_DEVICE
 	dev_info(fb_info->dev,
 		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
 		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
@@ -804,6 +814,12 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 		fb_info->bl_dev->props.power = BACKLIGHT_POWER_ON;
 		fb_info->bl_dev->ops->update_status(fb_info->bl_dev);
 	}
+#else
+	pr_info("%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+		fb_info->fix.smem_len >> 10, text1,
+		HZ / fb_info->fbdefio->delay, text2);
+#endif
 
 	return 0;
 
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index e45c90a03a90..944f74f592d0 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -89,6 +89,7 @@ int fbtft_gamma_parse_str(struct fbtft_par *par, u32 *curves,
 	return ret;
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t
 sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
 {
@@ -145,6 +146,7 @@ static ssize_t show_gamma_curve(struct device *device,
 static struct device_attribute gamma_device_attrs[] = {
 	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
 };
+#endif
 
 void fbtft_expand_debug_value(unsigned long *debug)
 {
@@ -173,6 +175,7 @@ void fbtft_expand_debug_value(unsigned long *debug)
 	}
 }
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t store_debug(struct device *device,
 			   struct device_attribute *attr,
 			   const char *buf, size_t count)
@@ -200,17 +203,22 @@ static ssize_t show_debug(struct device *device,
 
 static struct device_attribute debug_device_attr =
 	__ATTR(debug, 0660, show_debug, store_debug);
+#endif
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
+#ifdef CONFIG_FB_DEVICE
 	device_create_file(par->info->dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
 		device_create_file(par->info->dev, &gamma_device_attrs[0]);
+#endif
 }
 
 void fbtft_sysfs_exit(struct fbtft_par *par)
 {
+#ifdef CONFIG_FB_DEVICE
 	device_remove_file(par->info->dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
 		device_remove_file(par->info->dev, &gamma_device_attrs[0]);
+#endif
 }
-- 
2.43.0


