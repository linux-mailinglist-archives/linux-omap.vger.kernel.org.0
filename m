Return-Path: <linux-omap+bounces-5288-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6469FCE8B98
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 06:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ED913033700
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 05:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8A42F1FE1;
	Tue, 30 Dec 2025 05:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+Lno6PO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB22EA73D
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767072552; cv=none; b=nmQ0bCyjLTc5PrFfKRl0xEOi5ZdRE7kiSdxKr1VG3RmMtyAV4p1KcmOZfg3KCvzzm1baHQsqMuZKkvHzTGb03J2FpCqjICI3N/9cCfSWjOV3vnu985cPxHDQ/Abcd4mvVe4W9kQ7PfBDRXNPgh0uELJaK5Pv2UO314Gedaybusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767072552; c=relaxed/simple;
	bh=GAGjpPhjgIvIUqlyfKlbs+tqnrLy69m1dh/HDqos+sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQm48zZWtfAJbc6DepH5iFLAf+fG8TznYG+RrTf+Mxa1sVWXVw6Owgi9Mp94vRHkaHT6Mqw6XehwIr5DrvcVaBvnBaw/LsbWZgZAFVwQa2PE1h8gl8UClJ8canTiPu3XtmM8z3jtY3qunobbFL8emh8TZwKCbGA0SG0LT9mWirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+Lno6PO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0833b5aeeso132176635ad.1
        for <linux-omap@vger.kernel.org>; Mon, 29 Dec 2025 21:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767072549; x=1767677349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJqOs0RXEJY8E2s1bb5OeUsv+WqHfc5EFgK5KbB75l4=;
        b=H+Lno6POnxup92vGJ1f7ihfIfbwleJVor6tXER17rp/zQBaa0niWobKLm5AbfdzeR/
         1LFNoT44dIFX6+X+48yM9SvwxfIhQ5uDHGd1aPQTALn0LxlKaT6G9XcL9Ib661xNUxh9
         MEKivs33TvK/o/XVoU6qIeN6WNA5/Q5ibLmKKXG8W3dYzvgahRTmiLoFsZuTRzWak/1E
         8ddAiXOPjqKc07lcqS7we5idlVmNHjULmlY4ELJ8mgPHI5hoQLOZ4v2kbTEBZXML4C2b
         qjwa9cedy+B2EtA4/z0dvZqkG4woKTpUna8tDuOfsehAMaVRjq9MEE1AJ1DfEagYeITw
         0XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767072549; x=1767677349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJqOs0RXEJY8E2s1bb5OeUsv+WqHfc5EFgK5KbB75l4=;
        b=SMKBLwJ+qFJoHHWFSewrovDlKwnpzEHMB+cz59be3yrTvD2e4zKyXufr8+c9Pi2UFT
         LxbchP2E+pG7SvjOXPCYHFrGzJym4cEV8PYGFpGyG/ksAKRIjMaidUQVRxSuor9AxRmP
         jIbhHNfsTiLjQjxioUYINMGGtGYmBNcjRvAnH0DtJAhf8wWl/gB4YWO+CS+RBjBurJb2
         6W+Lev0Z8G6dQvmr47P5JXs7Oub6BmXlJRF7eQB3S/oS+3TEG3Rz3E3YPAsP4jb2Am2S
         cso3HYBZtpwgKSMB3zQAYaQusRGWmvqYGYDnJUaITj8rCm3DsdkjR5nGwYlIA7xuHvJJ
         TVdA==
X-Forwarded-Encrypted: i=1; AJvYcCUCtXqWLUz6O00OquNhxHtmZ3SzeEUu5VXDLJhzo1UjoLrMwPAR2E/VuBeU7WFWPdmQYlNX8pUjaAke@vger.kernel.org
X-Gm-Message-State: AOJu0YzHsdQT/p+uFl1Ln3P4RlP6CrK2RUCZOWL3H3jVTMVzvQOkT4lG
	GlSIJhHBviDNxiZOCqbv5OZGi/qrzm7HTEPr9JDCsDvVbHN6s2quO7Xq
X-Gm-Gg: AY/fxX6+jPjdoVC35t4+t5jviGBcDPuf4PDZ2d1pGoujGJHSggYBwKBcvW9CC4JSZuX
	n9qAXYcNTtvFhdPCONascQ3yaXisIAHZKcI2nqEJF+WW2BUqCh2/Ba/bxzanqe8koOO4W+B6rpX
	xNPVvOm8bDurVYfbu3Qxhi/MOfxdAl4Yxwlo0wNwZcBhJBUtI0AVbJYkj2wcQeTr1DfJq/jf7h+
	6NB14W92l/Z2wEQRCdWgL0aigoWbWdOeaBJgjeoKUwyzEQVa8qRIoxAy/SyOipVfZ2krFRvtXJ8
	+y+j/8y93whRMz7Cu+U+xyRdE64qHhUubou5a2Qq6zWZgYnfopEquaQssgs24N/fHPvsF5kq3v9
	zyb8fiZYoRYk07wpqilJ98Sp3/U40qauGLnIgMmqFZuy1e0C4KU+3lYyyU2HNiIkufAxYPyoEkW
	jbFHkWTl0dN6AXRJKZNyumF2/QFKMi0Ko4eAt3vXz7wAzEx5QPAPAg
X-Google-Smtp-Source: AGHT+IHpNTh/+mtzP6KtG3m//yZa/VBoJcww6MwkW4PNCEdqrAaxVfXefkHC54eoavSEs+b2060qpw==
X-Received: by 2002:a17:902:cf08:b0:2a2:ecb6:55ac with SMTP id d9443c01a7336-2a2f220cbf6mr374425555ad.7.1767072549441;
        Mon, 29 Dec 2025 21:29:09 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 21:29:09 -0800 (PST)
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
Subject: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional
Date: Mon, 29 Dec 2025 21:28:22 -0800
Message-ID: <20251230052827.4676-5-chintanlike@gmail.com>
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

The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
core driver does not require CONFIG_FB_DEVICE.

Make sysfs support optional by defining overlay_sysfs_groups conditionally
using PTR_IF(). The driver always sets .dev_groups, and the kernel
naturally skips NULL attribute groups while the code remains buildable
and type-checked.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..cb7ed1ff9165 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1350,7 +1350,17 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	&dev_attr_overlay_rop3.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(overlay_sysfs);
+
+#ifdef CONFIG_FB_DEVICE
+static const struct attribute_group overlay_sysfs_group = {
+	.attrs = overlay_sysfs_attrs,
+};
+#endif
+
+static const struct attribute_group *overlay_sysfs_groups[] = {
+	PTR_IF(IS_ENABLED(CONFIG_FB_DEVICE), &overlay_sysfs_group),
+	NULL,
+};
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
-- 
2.43.0


