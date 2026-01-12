Return-Path: <linux-omap+bounces-5418-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD4D103A6
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 02:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9F1D301D66E
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 01:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AED215F7D;
	Mon, 12 Jan 2026 01:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9Un5G8A"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C0A29408
	for <linux-omap@vger.kernel.org>; Mon, 12 Jan 2026 01:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768180078; cv=none; b=kIrQYmCpvu5YU/uHx75c0RWMQ0D8VsUyAzRvvgRVdFGJXRYcnBiy23kYvSycue2vbbaEGf2d+isXzV6Sa9AGzOUQ51+lsW0SUyjnenuStUKlSdP8GR3AgFjEB7dVOuxWdwYYQkltTRvopM4PkVwNlCHMdLwg/Dylv2fgjh25S8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768180078; c=relaxed/simple;
	bh=zwIEUKzTF3+7hMI67z72W4djedysLxpt1Bovb4GGn2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ClLjyKy80ZkdJoCtstrGfpODDogsvokQ8+Oup8dYUSxp85cX6K1cux+BjGT1QY6UitBeJWh0tXRT4/FNJgroggQCI59Rw2oOkz74ycyzA8gUi+1HP3UEVhXobR2SBhH/nQrGJS7NKxkNjsesFLykXNwQRtlULmrK1B4CPBlouk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9Un5G8A; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81c72659e6bso3338002b3a.0
        for <linux-omap@vger.kernel.org>; Sun, 11 Jan 2026 17:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768180077; x=1768784877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TkOZXJ1yiBIweSUTCBJOqJ16hNtrAInO8IpS+8lGicY=;
        b=V9Un5G8AS9O0EYHVSZO1I9uQw3ruYjdLtGKV3S6dsKXWMjUtVgYI38JnHhyHYmgH0x
         TQ3ys/XR0I5+oqfg6Vpc3Zj34atYmO0tuGH7ocA2PMLn79BIahsAmnhPtbqupAYSz8+5
         hp3vC0PyRl1f+BPbkVXi1oi8quT1GweB/+uvLH8QKbfqszm0S6IVBnxa59hBO+D6mJT4
         Ja3ZHpXNw+Q06qQ0JzWWyvJj1ls/iCNceskI019G9IASyOqbhTBrHgWcCTPl4V2v64fs
         IiwDmPcE8QMxXFqhMTiVwfeqKCwRKaUKWc7+p81tNw8ipnCacsnCFg7MsRhNPSSYM9oF
         /APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768180077; x=1768784877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkOZXJ1yiBIweSUTCBJOqJ16hNtrAInO8IpS+8lGicY=;
        b=a1gw8/p7vC7078UeFiprq2oWNiSkW3X+Qj/JrQybOBYvJij/ayM0YM8AdFx2LIECeM
         TWTQWQQIkYYn6iE90j19uhAk1i2D/TqWhE6rtgM8RFApOeGS+qxVvCGyzGmMK9GZjWUr
         BbyxFrJ12BMMVzvnQuxb+gYWaPSZfg0wqcJYmWxL9VCiA+8KeJKadCxtqgiv4aA1AoOx
         9gpBTFjy/jNN84as73C+acEteTk4pj0eMzdUZJJxZkqnXFCgxmfSORZ7vUB8HBPjPxIU
         /SdsgwK2dqUpPCrCkQZ8ECL9+MDOq5TwA6JLUT7cTG1jH7JNWa94x25cqPypMg0TcwFn
         zK9g==
X-Forwarded-Encrypted: i=1; AJvYcCVpC/9tkpsbXFxv0SnpcJO3J5NMe1j7jjggeV3l+2biazaso1/okshn5KQSz8tSUAVCgO4SzNQYoAmC@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7j2USRyFfnAfnX3b/IgRvjUpb65OVscNUuNlyxFdxTfYG3cg
	9NRRIxDUJ7KJnIcRe01WLlZbwGJuCBdv1DDTi5A0uPm7GGvtXL1XwVrL
X-Gm-Gg: AY/fxX7P1vT7g425UwNLjkBNoRHWuwdiUuK16Macn1h1eg3LhMJTvkfUeczCm3ctHdO
	d4Zc84P4GUYP/14lFdPIUAD9/VQRtxD1WRAqTYg/B9uMP2acsyjpPFE3eSA42iZMexXTxtwpQcJ
	qTmW+KDfG/19FAx9wamfUx2P6GweaJKLXMlK+wa+7yc3ABuofhmpmCDqCtnyJYJCk+KWqqJppS4
	QZTdIJ3FEOfkLohfElB8ozNkVOFXaQbiK90AEAtiHxnu3Y4Pe9PSVdq/Ol+LoJiGKKkTCR3IgGp
	5RI2rGwwf1DeE0sOBaJUPnTu/VYMgk58YLcycpxGKrNKWppeQRKf1dS2d88sJysLHuMVzx/+mO6
	cWn7oodRxAfd1eRqdhE4U5rUeIu0do6QvlilWs47lkQ+TFztHAjsBP1TW2GXoka3Oc7Ni5SllRE
	BRQmU3hEPEr+rMsFuQcBtVXJWnFXj0G9e4Q+Xds3eG41c=
X-Google-Smtp-Source: AGHT+IEqSuoKlQd99SJwcfXAwafP6Ad6qD2z83UEaG0kD39I3j77hVcCOmXZQVclGkZssS94ypX4yw==
X-Received: by 2002:a05:6a00:a883:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-81f31c33305mr4830490b3a.25.1768180076713;
        Sun, 11 Jan 2026 17:07:56 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:a2d6:d17d:ed6b:f017])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e042e75b1sm3980489b3a.21.2026.01.11.17.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 17:07:55 -0800 (PST)
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
Subject: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of info->dev
Date: Sun, 11 Jan 2026 17:07:39 -0800
Message-ID: <20260112010740.186248-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes commit
a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")

from my previous v4 series:
https://patchwork.kernel.org/project/dri-devel/cover/20260107044258.528624-1-chintanlike@gmail.com/

All direct accesses to info->dev or fb_info->dev are replaced with
dev_of_fbinfo() helper, improving readability and ensuring 
compilation succeeds when CONFIG_FB_DEVICE=n.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..309e81d7d208 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -364,8 +364,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 {
 	unsigned int val;
 	int ret = 1;
+	struct device *dev = dev_of_fbinfo(info);
 
-	dev_dbg(info->dev,
+	dev_dbg(dev,
 		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
 		__func__, regno, red, green, blue, transp);
 
@@ -389,9 +390,10 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 static int fbtft_fb_blank(int blank, struct fb_info *info)
 {
 	struct fbtft_par *par = info->par;
+	struct device *dev = dev_of_fbinfo(info);
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
+	dev_dbg(dev, "%s(blank=%d)\n",
 		__func__, blank);
 
 	if (!par->fbtftops.blank)
@@ -739,6 +741,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	char text2[50] = "";
 	struct fbtft_par *par = fb_info->par;
 	struct spi_device *spi = par->spi;
+	struct device *dev = dev_of_fbinfo(fb_info);
 
 	/* sanity checks */
 	if (!par->fbtftops.init_display) {
@@ -793,7 +796,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	dev_info(fb_info->dev,
+	dev_info(dev,
 		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
 		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
 		 fb_info->fix.smem_len >> 10, text1,
-- 
2.43.0


