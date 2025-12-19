Return-Path: <linux-omap+bounces-5229-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9858CCE924
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 06:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D602D303F812
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 05:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9211E1DF0;
	Fri, 19 Dec 2025 05:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqUXsznZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15262D4B77
	for <linux-omap@vger.kernel.org>; Fri, 19 Dec 2025 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123031; cv=none; b=ttsbjWkc4HNIRtQmHYdg453O/cXlypI2fRXYexU2ch5PEkypAmXkHa1IuoVS0Zrm09+Wa5ZyXP5MEmo12150O9tlgPBRj7BgTFLw1FBCR4Njh0wVqUIw5y9zPIAjzsQcO6eB+UWUJlevjtB69zSNP4frML7vTdLESHKwg/qd4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123031; c=relaxed/simple;
	bh=wTBNcJt2rI9S3EuSYIzTN+CG+sDnu9ds+FK4O8Ikt9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCxGUEXii9DG5BvlzWUMBESIFD1HyyonrHtmLlaAq40TxesapStNht8e+k8lHAIYusID+JZgEvN4JEmUtnTDVpcrsD0I+yoc1TYZ3+kjut6ZMSIHmcTiTgroKy8XDzveAfok27MxdRYduarTHpkVbQNFICczOxKa302mYNqbizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqUXsznZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0834769f0so12956505ad.2
        for <linux-omap@vger.kernel.org>; Thu, 18 Dec 2025 21:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123029; x=1766727829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyhsaHMpowAoVL5AwJvNjQeVURBtbaVBE0KV9gHYSKY=;
        b=BqUXsznZ8P4OyXHuXngaPVscRGGIN/svI91ndgycwFbrr3iCcwu5Wn2+sFPD7AOqlk
         kXcxIW8kg1HeXADbKto+/VAnpIErudnnYXfZh7TopzCAI5uMtMeuVGs63CsH5aW7X3eb
         koehOKM4CqKu/7rRtLf4ezvx1k9ZZ6ovrvkKZI1mi1TA9/X7Vi6hFSn7Ttbcnlvtdrvq
         lIC7ugaXETfdBVwpsloxNv7ijcTtBBODJ34LxSmk2bGuUiO6KQa82Q5/ulYCx15DeqNv
         HyodnIMuUS5nHuaVni4opLEi8xaHtL5oc7ZJFMs5w20s0VtXyd+r2eGzucpOSXneXhEH
         /K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123029; x=1766727829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GyhsaHMpowAoVL5AwJvNjQeVURBtbaVBE0KV9gHYSKY=;
        b=VQrFs+tyTSqcTyE214OyH4eF/q0HmH5k/3hljKWW7yryswe5Lvmq/LwRg6AliIfAXt
         v2eZcKo6+pjK5t0iOE2CGR0QyYfZ70eq2odYRhfQeMBhUZNnRIaKyfsXbqa0W64I9pll
         gaqR2Re/WMjE1W5jc23wnn7s8rAWl8oLYDaKuU7cxS04hCcWX83HLPfQWmtGqaoe2svh
         0+pxKq3N2m6Jg9hvKhvv5w4XTD3ywxuh+L3jtJ8N/LuDFXuGVpBFdRMO7wAT69XUJHOF
         l1079xN8WOBwUcsxHhnZVQYc6QwZ3gI9Owj6E1t87fMCPPHR/EMgqm80ces8r/WSO3Z9
         Ayaw==
X-Forwarded-Encrypted: i=1; AJvYcCWdmVUiIYmF6xn04iX7iLFQTrZik9TE8X0DI87sn6bPBkOKO2VFURX++P5xUzTzi9ql50IBJWzNqcAx@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKl4MdLI0gjZRC+sjB6PF9lJJ5ubHopKTdARmcgy57o1mhTpz
	fkRvCoB/viR7svLcS1hsNXYfUXB3w6vaR1iRm26iglmfVqsfad9zOvXh
X-Gm-Gg: AY/fxX75CdvaBfmxkWd8ysT1cAYPy9UI6IUv1R4DLpMc5JzIirS1Wz5yHJzakhL/a2R
	2aQBJikL/BW9KBuX307r9d7eL351fvPJLEmGRGvivkrPaf55dO+DvySf9w9FjR4w2T3AyYWMi1L
	V/Jl7XnhHjGsPUrxqWAE5Su2IACQdqzjtE20RrNk2nLpETaWgVMa6nQUL497sRYMtPJmpaHU0HV
	T5lFSxpTaZyKXl+JLcKA/eWPRikiyaWuuRZ/9oPYN4fCUBIuT81Fi/rwFRUbxjqTxmsG+KwnShb
	72Rc6n0VQ2DNGa+xq3CWDbhzFHrR1wQply3PKAIiBEScUMTfvCg3JGrMyEDCBpAXLcTqdQcWaRL
	0U7zdr9sNd3CD6u7zKdOWssgPNubkI70zjZbRx07siEgMYxh7sAj2IzyIa2EdJ89dyxs/TK/7Zh
	+vlBWdwHeZl7R7dchzMFN4Al+Za3Dz+BHDG4FBzay1H80=
X-Google-Smtp-Source: AGHT+IHXEchSi8iM+Y5+MS3Ww91XngpXuQu21mxZ8hWmVfsLgeWot8cDnyt6+QWma8zqSPX6kmHH4g==
X-Received: by 2002:a17:902:f68f:b0:29f:1fad:8e56 with SMTP id d9443c01a7336-2a2f22049acmr15569505ad.6.1766123029021;
        Thu, 18 Dec 2025 21:43:49 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:43:48 -0800 (PST)
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
Subject: [PATCH v2 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional
Date: Thu, 18 Dec 2025 21:43:19 -0800
Message-ID: <20251219054320.447281-5-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219054320.447281-1-chintanlike@gmail.com>
References: <20251219054320.447281-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
core driver does not require CONFIG_FB_DEVICE.

Make sysfs support optional by defining overlay_sysfs_groups as NULL when
FB_DEVICE is disabled. The driver always sets .dev_groups, and the kernel
naturally skips NULL attribute groups while the code remains buildable
and type-checked.

v2:
- Replace CONFIG_FB_DEVICE ifdefs with NULL overlay_sysfs_groups
- Always populate .dev_groups

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..704c17ad241e 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1350,7 +1350,16 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	&dev_attr_overlay_rop3.attr,
 	NULL,
 };
+
+#ifdef CONFIG_FB_DEVICE
 ATTRIBUTE_GROUPS(overlay_sysfs);
+#else
+/*
+ * When CONFIG_FB_DEVICE is disabled, define overlay_sysfs_groups as NULL.
+ * The compiler will optimize out the sysfs code paths when dev_groups is NULL.
+ */
+static const struct attribute_group *overlay_sysfs_groups[] = { NULL };
+#endif
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
-- 
2.43.0


