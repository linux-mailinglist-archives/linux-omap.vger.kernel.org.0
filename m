Return-Path: <linux-omap+bounces-5438-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25817D16A5F
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jan 2026 05:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D8F6302559D
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jan 2026 04:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36D7352C36;
	Tue, 13 Jan 2026 04:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROu4u9rg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF31A9F97
	for <linux-omap@vger.kernel.org>; Tue, 13 Jan 2026 04:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768280383; cv=none; b=Cx8A8MjZXxYnQTutr/L25aNnGIJDzKqAtPtDECVJeO+XB8Q1L09UfC02R0NPtMnWchwJuFX3wPxGL8i1e0FuZfHnjl8T7newt7C0c9JR8y9plVuiNggWho91DL+UjOg502qMbS2ZQBUia/duV2VZTvckICQumqorBV8pzsHVTOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768280383; c=relaxed/simple;
	bh=bCEMHZ6kz6Fm1BrBwVu56MAE7W4gVEikAeeavZ/Di9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=db8Zeo90Mds104SvyCO1G9rfmP6KZrWOoj3QpDDKIP5OqHr7WgJRcC3UTnVw4nHBIQrTIiAfLqPYZWxWZfLyTRubj+9jafo56RFM4Q3yBl8gquyZuaQjVGpQynCyxGwxmsM568yJGRIEJe8zSRsxyoHLXBJkXRiBFRJC69p+hyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROu4u9rg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso4008828a91.0
        for <linux-omap@vger.kernel.org>; Mon, 12 Jan 2026 20:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768280381; x=1768885181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTvxo6KbWMtGy6RGpj72F7tdPe/SFWx8IlZmuHDEiGo=;
        b=ROu4u9rgjOCaXGJEOSbb5pNZ9vmHO3Tev3hoSEt5orAw5hu84/0oqAgsEGjFT5M8Vp
         XrBD9LBYWzOMjJzJvxP3TyVutZ3dKPFHSM+t8A2f8h2MXYN71EbCbNL7kiecA++jpbJs
         5pGwQ/ixsl9ZHiJkjrpMK/FpmSEefHBnFB2qjoJZuwU8B1L4G+R1Ic3Gvs2Tudl8IX7m
         K68viRaUe0lj2cgrbnlOCeKpUsvZsIn0A6Eef66rFl90Ns8rqxUZWHderY4SK76ODJXr
         8d4MgwLD3UtFP/1chuXyKl9egz/n6qgrNo6ybwNSD75CZN+GTXCbWC0fkSJbdpNflreA
         T4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768280381; x=1768885181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTvxo6KbWMtGy6RGpj72F7tdPe/SFWx8IlZmuHDEiGo=;
        b=geuuPCvcdbTPmX3d1tUYyhZEUnfM18/kqIHhm5/NesbMi3uSZ8s6ZCF5OgxqWGnt1X
         JUq7SIDwTkRfVSGfe+24EzQrCVNNq6yXrojLZlVTJ6UNyxEACIKoJfRby+HnilZsQ/U3
         YN87RrrF/7K6db9xfVIS6qHMNtnCK3E6NnJB/qYceru72SdL23YazW6J0i2i5+Kd/Mxe
         13LxIlI/GpWjRH7TdAx64KHTC+MTNpmQERoQLyVkbrh6CCX1oRg7k3sE82qtKa2hCYkF
         nU0g6y/yYXgKF96XEWOmlCCavHq//gelAsJ4UbcE0z/KUQ/X+7tWihuahm9h40zysZa6
         reqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa9b3hib62QaNGaX94bqkJ1u3+npiTtG67NsE9LEnQN/fag7iiiycr8EaLIGe/i6oTCyr6USMt7fU+@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQOGYZ+OJHk6It+58Wfj4S5jsXPFYNovMJuwyr43aD44xdF2r
	LXcr87F2qN9wZG1PnEH0Kox3etQQVr1Hp6SdiGhksJ+joYu+wMQCh/sX
X-Gm-Gg: AY/fxX67J++GZRGTLvY4gWD4GOPdxRyJI5I++SOEM/dGW/gw7fDUyxl26koqkWa53JS
	x2fsmRmB82YgEcsQACFb6H71CTNPQis+4ZLeGZOalvjvA34IsG0lm+pInWfR5yqu/dK05jvoxvG
	lW/C2i9fwma1vBFNlvwOWoe+oSJSM0tDR1cVotJd1q0ZwGNJqRy++0B1oIwpNJWo+SgmfHSoCaI
	vF5oyaQkXlklAn+zQKxOPD+lt8haPxzU/NABHPQ5kFEMoqHr24iOTGLSMhup1Df/jOOiwm/mt/S
	OS5xSQGW6a0HQFxHTedHpfxo2jyKa3nmeZr/AnEoBJO9k4wYlpnztNnn5bICdZerFmf2/RR8ZXt
	9Ns24GTeD+JOTOcy9MeE5woOHBeilxyaVKwRTQlyYpHNez3s2IdW/iba98fDZ6eA0c9jVMSzTI2
	9ud8IoW7bLGFWqfHrsYvb+q1DKL5wtQOpJ8qoBv06KYz4=
X-Google-Smtp-Source: AGHT+IF5y3wMzzLD9O647B9Fwv+OhX6pLmVT/zSElB3m1p3Mv2vCh9yICG/2VmelPoTP3BFPVF2CNg==
X-Received: by 2002:a17:90a:d40c:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-34f68c023eamr17396933a91.1.1768280381428;
        Mon, 12 Jan 2026 20:59:41 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:6652:1d71:eee0:e3bb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb74436sm1341597a91.14.2026.01.12.20.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 20:59:40 -0800 (PST)
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
Subject: [PATCH v6] staging: fbtft: Use fbdev logging helpers when FB_DEVICE is disabled
Date: Mon, 12 Jan 2026 20:59:09 -0800
Message-ID: <20260113045909.336931-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace direct accesses to info->dev with fb_dbg() and fb_info()
helpers to avoid build failures when CONFIG_FB_DEVICE=n.

Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

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
---
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


