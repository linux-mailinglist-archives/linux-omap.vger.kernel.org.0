Return-Path: <linux-omap+bounces-5372-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D2CFC029
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 05:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EF0E300F264
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 04:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EFE26FD93;
	Wed,  7 Jan 2026 04:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d91zWun3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7221125A2B5
	for <linux-omap@vger.kernel.org>; Wed,  7 Jan 2026 04:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761001; cv=none; b=r8ety+xlSub/xz3oreFEVxkQc+OJmVxTVDw10/1ANKHOKcQymZGAdCDG9hS4g6j/gNU27e/ZGMvPWr0GrFAkAAW2RBKmrjULmFMTBMHiEUEsQxOyDvRIDd1bcTq8lencu8Iuo4AHpiM3noQjGqBn62VC66gC7lRvsVuilyUKzqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761001; c=relaxed/simple;
	bh=+Fzr6kEopBOBGruOQNRZeskEAAtW+K4Nv+xnTvdpk0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkuff7PP8DDJSvLI/8kLzC4adGcN37RKLffH7bHW0yFBZrst+UlkBqZ0/rNcmfCoqtSg0X86vUDJHty7WM4MtBKZuLKIRbcXWWbedbL/2iSn2w1oPMpD1nMlep6k3bZtlweY3kWChJazSFAitCH/bmKXjXgA27Epe7wTumhOxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d91zWun3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so1307946b3a.1
        for <linux-omap@vger.kernel.org>; Tue, 06 Jan 2026 20:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760999; x=1768365799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmNZiMiLRz7C+tpqpi8aiFEIQgPCT214fV1yD6bvzyk=;
        b=d91zWun33bl4mNjzP495EmDnaUPUtEJAvMFui/KnC02a5zjaqup1O8FFjsb6u4FBkJ
         PKIo412pF/BZpfTtie5PUq6p0PHNvRR5GD9SkDPy86oEsTa9t/qiscwrUnl22BandhKQ
         vfbBfxmsYyDLUB5GDJ16lf/4CStn89aL399DO4jX11Bv0wUhatwz3xSPKQi+kiD7LB1+
         Jop825fHoOOcIVGbTlEmWt1C1h5A7m1CPfpFFey8zUExmG6++CKm3lHJpm5sTGHQzK39
         oVCPAuclW6z/JF6cCznyVBujOXjuQTa+YQH5kAH7h/uRx6OtOti5zFUadxMEi20o1Ojm
         /T0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760999; x=1768365799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CmNZiMiLRz7C+tpqpi8aiFEIQgPCT214fV1yD6bvzyk=;
        b=p76S3qILpkdtmMlhbeW0hyqWGq3ikEIaw6NULSF3BNQUFjF3f4rXrL5hIbXveOsoTG
         PLQC6+GiEPfqTSUGnzTwIRUKAJ+RlY8dbK2JnQcctiM4+dDZVjRmI02ryjD0L8d2yZ8T
         YhYmu1U9IBBqytdICWOC50LRfrHOvEuE1wY7/VyH2SzQZzsPHYovpcQqqBC/1XLUlWlP
         wDMiHHGmbg1FeJMhV4xi1jOAvz0w+FUjjjXq5j8HGd3vCO0F4QWwr5vpZ2Cf452qsQ8t
         Wr5T9RZ3VTW/CNK2+MC0ZdeoKeM3FLnYwha2wj73NcE+bGURzZIkHbI/ozKIwYyqWlYf
         cERA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6kxi7E/QDmDB4POXrkFuYpJMMbqaNtdsrNmzyHAvu8XjccUpOWp5yhthWKQAQbLRbEjTgeOA/IKT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1/fKCSd0Xg++EdlsU+1kN/2WVAbOa72C9iF/nuyjw6VrtKe2k
	wO+pdtUg70WGaEE6sEmHFGsSCLOO64j4sIC/mnr2/pY+xmoLVxOyiZf/
X-Gm-Gg: AY/fxX5qHJ4fxl7HlqVaF3TaK4UWTfmuykjnA3GSCYsuSOts07pBoRXcvMFZvCcxu5x
	8JcLECE2Y5l7adaeKCAfZoahMEsVKhQ7dFGt1bdughWo7dyHGMSqjbcQL+s91l/hIzTdjgE83Lm
	66X2ZOaFW4PAB/4WLispRMRX9MMWdGyq2pYeAdq6xqsJaMuWh/JG7pbFouHRGY9Eh5F88ghX2ap
	TGUmZNgmiJrrfvsvBXhh+UGVnV7MDkCG1qbnT/dHDhvnCy1Gs/DaEWvWBeLo1IcXuYlQN8uU5LG
	MW5pfj/eRUGKvvO8FzJDCkYQNBr2PYMUCs4k0eqKfmjYzQy/W92WUA9+PGTX4KwKr4nzgwn0WXx
	c31MQP+zA5GwY1uR0gvkHtAofb0m581tM0oIu9R38WkoRvRoYJaS+LCDSPXc2eXMU3GAE+zinRC
	b1ik70WT7CUm0Vrwd42LVjHH4xrEDRD4Pqmn9xd79X3wyGh44vbAL68w==
X-Google-Smtp-Source: AGHT+IGyLXpHnLdUccdHLbJKV2U55q9FpnJ0qEZouF7Rk2ZDPQCEjkM51aika9hOgCehETQQWJIYhQ==
X-Received: by 2002:a05:6a20:918e:b0:34f:b660:770d with SMTP id adf61e73a8af0-3898f9dd14cmr1103698637.55.1767760998777;
        Tue, 06 Jan 2026 20:43:18 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:18 -0800 (PST)
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
Subject: [PATCH v4 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Date: Tue,  6 Jan 2026 20:42:56 -0800
Message-ID: <20260107044258.528624-4-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107044258.528624-1-chintanlike@gmail.com>
References: <20260107044258.528624-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omapfb provides several sysfs interfaces for framebuffer configuration
and debugging, but these are not required for the core driver.

Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() to obtain the backing device at runtime.
When FB_DEVICE is disabled, sysfs operations are skipped while the code
still builds and is type-checked.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/Kconfig       |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c    | 18 ++++++++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
index f4cdf999a080..2d20e79adefc 100644
--- a/drivers/video/fbdev/omap2/omapfb/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/Kconfig
@@ -5,7 +5,6 @@ config OMAP2_VRFB
 menuconfig FB_OMAP2
 	tristate "OMAP2+ frame buffer support"
 	depends on FB
-	depends on FB_DEVICE
 	depends on DRM_OMAP = n
 	depends on GPIOLIB
 	select FB_OMAP2_DSS
@@ -13,6 +12,8 @@ menuconfig FB_OMAP2
 	select FB_IOMEM_HELPERS
 	help
 	  Frame buffer driver for OMAP2+ based boards.
+	  FB_DEVICE is not required, but if enabled, provides sysfs interface
+	  for framebuffer configuration and debugging.
 
 if FB_OMAP2
 
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
index 831b2c2fbdf9..38a635d38d58 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -558,10 +558,15 @@ int omapfb_create_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("create sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev;
 		int t;
+
+		dev = dev_of_fbinfo(fbdev->fbs[i]);
+		if (!dev)
+			continue;
+
 		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++) {
-			r = device_create_file(fbdev->fbs[i]->dev,
-					&omapfb_attrs[t]);
+			r = device_create_file(dev, &omapfb_attrs[t]);
 
 			if (r) {
 				dev_err(fbdev->dev, "failed to create sysfs "
@@ -580,9 +585,14 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("remove sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev;
+
+		dev = dev_of_fbinfo(fbdev->fbs[i]);
+		if (!dev)
+			continue;
+
 		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++)
-			device_remove_file(fbdev->fbs[i]->dev,
-					&omapfb_attrs[t]);
+			device_remove_file(dev, &omapfb_attrs[t]);
 	}
 }
 
-- 
2.43.0


