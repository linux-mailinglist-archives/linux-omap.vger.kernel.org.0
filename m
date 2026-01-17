Return-Path: <linux-omap+bounces-5525-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A571D38C2B
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 05:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48F31302E063
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 04:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBF628466D;
	Sat, 17 Jan 2026 04:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dr8EaJNM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F8C18C02E
	for <linux-omap@vger.kernel.org>; Sat, 17 Jan 2026 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768624234; cv=none; b=LKzOIJXwvzqVhFx+MJTIFpORtyHAo8/E3UKbNFjs/Q2DVKhu/j384YfUVFrKgbuhZSAZAiroshrXISYcVQ0eoooLqszz+K2Y9HrYiDcq+clYBQQoiBPy+vGPyl4JMYpugI5ic6C85I/ImKwCdO4WcJWWl+eguOpotsFnbeuqTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768624234; c=relaxed/simple;
	bh=59/a8WTm/gWfCxzRJbq7yPBBnub6sQLN8ljF0PmknGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ahl2J/NLklnK32A3nvoVktFiquiVY6YXmsbyPFwb9W4ChwCHkb5ZmEarmRX4ygh523COJEK9/rjNJjtasjOCwnDwQVB8TjEjJYy0v4USh9nJVP0luiIg1w/MltjyIIJQ7JWrDTz39OVOPdfDUG0Sn//3oTzaOdFYah7yGGjRSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dr8EaJNM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so26412075ad.1
        for <linux-omap@vger.kernel.org>; Fri, 16 Jan 2026 20:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768624232; x=1769229032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCrSsGPr19mQwGzLbkxTfgCN7ZB1b84ZZ1vrvJhEPMM=;
        b=Dr8EaJNMXexPCHjNVzP2tIXtWtLq1VV3hlIDdypVXriV/eSV06TE+kYD/yn/Kz3XHU
         8OYonGCjgY/bhj8t2FLPlkku3og3+eSfHUBcixadxhP6qh12AEt+pwZDCl4LF8JNpU8b
         BfiiZkwTO7nLNLYb1pW8mP2F4T/SbH1vFKLUKTjsgnCjL/UkVz6rKTk+buVAYhKpuuMe
         W9B5HgFtVlI9Fxn0maR4YFIbwGx0uzmbzAvX2bo85xM+yA7DKNRHDJWoKtkTsKbMSZBA
         3p2ImB3TXS3Cw/xAFbEmVbCSJWf9rBLzf7PqrAKXFWWD6WRvu/sW3//3CdojoCjnyI1p
         lP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768624232; x=1769229032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCrSsGPr19mQwGzLbkxTfgCN7ZB1b84ZZ1vrvJhEPMM=;
        b=xLpxUmCw7yZ7PJcar67cd1csDouURBgED7FvREdTvUq3PFpZuDYtT9c1Lh3RO6oAsU
         Cw3ct/LVRuquJyoKhFualwMgpy3CWxO9kgffOSlQM6zOvx0twiqYNz9ex93aNVB+BlzX
         DvCIDjIvThPAqHehYw0uthsUZA8xGvmPJQ/aqJPHd6mk9pM/Cc9s9zez5HpYgMQCi/n5
         vIYJhLhUdviztpBk3flX+qewk7qULr4KL+9yBrW+rAnERMs4F1Gh8NmwJC0rxe8FatED
         DE5ufTpuUB1jkTTi08ZJFEQjjbGPB0nVIBEFiq79PUY6ORIi4QQsns1y4fzBBoLOSEtK
         NJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnZ0VBcmxJLLtHZ9wp4cGMsDF0arUQV/q0zgQD5mQvCB6VXPsQu+sctDD+EH0nkYVffHSi7peTS0eo@vger.kernel.org
X-Gm-Message-State: AOJu0YwGbc9S3XNJBY4iQPt2Ef5O+yuw02OpLxikjpTJggHEVdCrCRnl
	kzyljgAMNCHUpkBMzUolRs0Nq8p3CiJroH5XtaCpQ9ABTaknIlVz4Bwd
X-Gm-Gg: AY/fxX4Pli6D+TGjPk516Z/399w8kIYApPFNaeFJXEn0gLuTK4JKYHr+d7RpUw+CVRT
	jmMMD2DQ0y03GW+L1x0jeqIqMSrdP0GBVmxBj6XIgJ3xFA7ZpJMoB1woaCTPb2O+paQHJrwGHvH
	PiSF0HICffPbZd2jczjdHT6dybrDgJy58AilRycsv7qxiRkP3KhdLAR0RemDVDOO7mvknHdSeWE
	dkQUt/MFTX/EGXMFyreXMDr26OSsCGi/OOWkkUTH3Hdds+V40yxeBIjWzNAy+A5jWuwJ71I3a1g
	mHpQeCUL7rUywmksPEAhny63UA0lse3aQ4cJXt3G4unWPPMg8HjcR9mfXSHFEhHlWucuYNvz0CG
	Zancf57Mq5hTczihRRkYsOqMDfHR9NugVuA+K+Xgsz5Nzp8BiEsEqqhVxo4hlzrLfHh4eh14rUo
	Y4uH1aNL6Z0/yiRI2neZyCbF+Dr/yAIin7zA7EG5qZYlU=
X-Received: by 2002:a17:902:f78a:b0:2a0:b066:3f55 with SMTP id d9443c01a7336-2a7174efc71mr45039245ad.10.1768624232460;
        Fri, 16 Jan 2026 20:30:32 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:26af:b454:d793:29de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108b23asm3370159b3a.3.2026.01.16.20.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:30:31 -0800 (PST)
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
	Chintan Patel <chintanlike@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v7 1/2] staging: fbtft: Fix build failure when CONFIG_FB_DEVICE=n
Date: Fri, 16 Jan 2026 20:29:30 -0800
Message-ID: <20260117042931.6088-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_FB_DEVICE is disabled, struct fb_info does
not provide a valid dev pointer. Direct dereferences of
fb_info->dev therefore result in build failures.

Fix this by avoiding direct accesses to fb_info->dev and
switching the affected debug logging to framebuffer helpers
that do not rely on a device pointer.

This fixes the following build failure reported by the
kernel test robot.

Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

---
Changes in v7:
- Split logging cleanups into a separate patch
- Limit this patch to the CONFIG_FB_DEVICE=n build fix only

Changes in v6:
- Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
- Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
  handle the debug/info context.
- Drop __func__ usage per review feedback(suggested by greg k-h)
- Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
  (suggested by Andy Shevchenko)

Changes in v5:
- Initial attempt to replace info->dev accesses using
  dev_of_fbinfo() helper

 drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..1b3b62950205 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 	unsigned int val;
 	int ret = 1;
 
-	dev_dbg(info->dev,
-		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
-		__func__, regno, red, green, blue, transp);
+	fb_dbg(info,
+	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
+	       regno, red, green, blue, transp);
 
 	switch (info->fix.visual) {
 	case FB_VISUAL_TRUECOLOR:
@@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	struct fbtft_par *par = info->par;
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
-		__func__, blank);
+	fb_dbg(info, "blank=%d\n", blank);
 
 	if (!par->fbtftops.blank)
 		return ret;
@@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	dev_info(fb_info->dev,
-		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
-		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-		 fb_info->fix.smem_len >> 10, text1,
-		 HZ / fb_info->fbdefio->delay, text2);
+	fb_info(fb_info,
+		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+		fb_info->fix.smem_len >> 10, text1,
+		HZ / fb_info->fbdefio->delay, text2);
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-- 
2.43.0


