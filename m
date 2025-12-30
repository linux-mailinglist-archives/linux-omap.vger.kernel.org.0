Return-Path: <linux-omap+bounces-5287-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99026CE8B8F
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 06:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DAE0302C4C9
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 05:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E438E2EF652;
	Tue, 30 Dec 2025 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNvpcxIY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C716D2E03F1
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 05:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767072550; cv=none; b=pyXSgG1+fX9zKvaQ1AZAfJEehaT5jfLXV51/y619MKdjdu92xU6TIJOCdRvqnpWQJHgz7cg3id/K/M2iTeNWTN1LZpgUfXe678MyyJMBHSKHiKwbEeaBwbHHg1KFN9BrGVolLKaESU2SFM1kARKamDyX9SZ+rx5rnu40nsqTNpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767072550; c=relaxed/simple;
	bh=NLZLkjHuusyZxcw9lTFQIq8VGGtemLVYiNqCQHZYJL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxWNor3xSylTHTuxMgbm+2SrSMjb5p2E7IIc5UwGiWueWXH4wzrnDpVCP8zZSybPvzfbMwnFKcDqZ1p9vOpGYWWPBzurvm8sDZ5mPQiNimkUtRKJw3NnardCGppogfOrEoB8zFPxkY4NON6q60TWMR493vxexQga8VJc1sh4sns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNvpcxIY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso119082135ad.3
        for <linux-omap@vger.kernel.org>; Mon, 29 Dec 2025 21:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767072548; x=1767677348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ci5hl1fGtHa6SMuwo1VapvWaLUMCAvqlqzaI482cWA=;
        b=KNvpcxIYzc/Nn8MFw9dep+CALY84eksZAo0WvR/gSdQXEs3jXjLIwRcqdMKH1Hmq16
         nz9gJZc38J5sKVNTy1mKQDdBgagvj/46awh1jFTgCB0X1UYh4mhi8yZMq3+Lw70cfV2y
         z6a+nV0ygViFK8la3fDgOOyZaNuIgLwpCZyRclxW7f74KKpNC/NfVTDpIS5/b2Ccr6Lr
         d1GQ0RG4+9nsYFScie75W5L2KZxSXh1/kWnRBePPiUrhjuvNCLDWWU7dG2P8phW7CCEm
         SsFf5Lpxi+5xPEV11uk5zk/1Nyifv+ReDtyCsnzO8uOmgxsTp+nItzT0f3My8laCl7O5
         NH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767072548; x=1767677348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ci5hl1fGtHa6SMuwo1VapvWaLUMCAvqlqzaI482cWA=;
        b=lRAAw/LWh3XqKfRMFY0i+zISb7o5nEDtSoACdp4qXZD9cM4H7YWnsidnzplOYOaisD
         H+e43oZoYcFUmk8cIacyMCpU0M7FqKOVpeJmSBZ0SqpEmzeE/HMxDXDhrcyuk2bjXJ+N
         y2DyXvgZs9rJQSwLkKpFx+ewLd9ZCxQpmDLJ2v3lRN29tFKKzbQwxSG/oE23Crvh2VEx
         RPjKkH8KkUYMbcA356GytJ+IWI8f/d/+TAKZ61x+8Tx/XobGx7FOsMwOpczlhJyKQhwW
         AjfZOioTzBU195EqmVivCspZluyMVQLc2I3/NGijgg5rRErEve7lgqfditJCd++opgrm
         4yuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWjwL9LHgb4Fa6BUbbGQTWjxv3ZA11+EWMy9GhCdsejFHWVx14GyUtmeQibk7WJSwsefNfhgkoWKSs@vger.kernel.org
X-Gm-Message-State: AOJu0YwjBou4KVIk6+sNtkrvSY3QoDPXi4rWCDNWY3do6itAQUtP1UhH
	8zSCNixvYlS/QgAQli5GqV2ymSZwCH3gPpLrpZVEOjbvUodgSSz1jMFW
X-Gm-Gg: AY/fxX55D0/3Bd75LFM7LBhA5losBAdwEzbISzm2Bl3hJuG6DkNvUTMK68yhwWCX9hI
	kVRsii8XWtGE0bQ4PVNnm6Xjp8MN+uKvx6e1VTf5jKDDF+tdUvcU4zuF2aRu6uH0oYrpxakdG1u
	OC++81C22Hil2hki0Vyszmnso6HNutaDWLcgCqeP8bLPAdW4z0RY5ZKRXTTkdsn6XyHPMK5PJ4F
	f/D5yMr0VCpeacikc1ONbkDddISLBIsQoxlKiJCP08uAWaR23VXjzEYHCaodeDb5USb8/qqayUm
	9HJcQODg15ohb5F/xQfWi1JmWn0qBU5qJZJuMWRbynOo4ujffV3yv24L21ZFnwEDFt92fA0KlFw
	5+314ljt0i+vM+WVvWBZCdD9g/3zbwkEcxCQqqHhmHqF37XILH7lpLSlshcszKkZDpb9fYynBgX
	Rn5cXo08B4sa8a0IIPJq4K82G/1xw44ajhy+SeNxwjzQ==
X-Google-Smtp-Source: AGHT+IGHZFAx8HgkjBpBEKVqWvo2fMWKQIfWR+KFRWNCjGwdqjZSd66OErzGlHaqwrUbyJ5EQMboOQ==
X-Received: by 2002:a17:903:4405:b0:295:565b:c691 with SMTP id d9443c01a7336-2a2f22292e6mr304546365ad.17.1767072548211;
        Mon, 29 Dec 2025 21:29:08 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 21:29:07 -0800 (PST)
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
Subject: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Date: Mon, 29 Dec 2025 21:28:21 -0800
Message-ID: <20251230052827.4676-4-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
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
 drivers/video/fbdev/omap2/omapfb/Kconfig        |  3 ++-
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

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
index 831b2c2fbdf9..ef555dd598aa 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -558,10 +558,14 @@ int omapfb_create_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("create sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
 		int t;
+
+		if (!dev)
+			continue;
+
 		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++) {
-			r = device_create_file(fbdev->fbs[i]->dev,
-					&omapfb_attrs[t]);
+			r = device_create_file(dev, &omapfb_attrs[t]);
 
 			if (r) {
 				dev_err(fbdev->dev, "failed to create sysfs "
@@ -580,9 +584,13 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("remove sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
+
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


