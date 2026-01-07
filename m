Return-Path: <linux-omap+bounces-5373-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B196CFC01A
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 05:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01EA93046756
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 04:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DFD272E56;
	Wed,  7 Jan 2026 04:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvG32x9V"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C922609DC
	for <linux-omap@vger.kernel.org>; Wed,  7 Jan 2026 04:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761002; cv=none; b=p1EBjGv6Bfzihk/NvPhA6tGVP1lmOkpRk3B63oKEsABJmNN3hNpXskZ2NIHDKgAGuGE6fYy366BFrlGI0XUwju74nYm2BG0tyvw/QzYb9Z9xWPBJn/xICuqw4CnXgzHuBWUlpSp5bD4/md1CvyT4fDz+q1DXjWAdEWZoMnDSjhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761002; c=relaxed/simple;
	bh=tRNeZwnYBDiJ5gpYRj3YNtC9pI+I0JQn8tmEq71PS0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/8x+pFcHl3e78gk5fuCIf6iIJN2oN+R0BBOPHJ242uMGeUzn8FxfMOc3wrpahtm48mhCZiurjpa/mloUt3fyqI+aBtlR5spZTdOjE6BGzkuF+JVUW5DJnpo9na3rGQMBPf8v7Mhv1UnDRXT5DN9RLQFPYL5wMHp+JZWUt8gePk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvG32x9V; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0c20ee83dso17585065ad.2
        for <linux-omap@vger.kernel.org>; Tue, 06 Jan 2026 20:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767761000; x=1768365800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rLU7DAV9qpUwuBQAOxfbjMQs4IqSMkv9fgfYLMr0Ww=;
        b=jvG32x9VHN8R+LNmGb8I5yrXn8sT4yGVC6XgnwQifJodOgrbV7CuVUylqWIazH8I/S
         Qd8WaqzWgUlklP5mDt5vMzGdCBozmCqRF1pjT+IwDWftfMoiKUSyLESGzN0PbyDO1GgG
         sYtlTac3LeWeTrXXHlSbyS0q2TiKJ4UW/3td1UzaWtfBg3oKmbL1Tsg+/z2Da2EoamDF
         dX9Wjqz7cdOaktw56xY63un67XyoTjoJfY/c729WjYBJu6VFG5oe3VVDqCWR3QCkDoHS
         ijCdh8jT2XH3IcRj7XMvLv+wvWz8OcFb6W5PpscLBpHoP14cTfCfb7FIUIU2VBERajeM
         yymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767761000; x=1768365800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5rLU7DAV9qpUwuBQAOxfbjMQs4IqSMkv9fgfYLMr0Ww=;
        b=b9S56wxHvOBPhVHOYIcoTXQMcdwYeGeaswT0FF4impb2EsuyTXPC3778AahXCa/HVx
         +EahVLZ5w5EsyJIZS9+Q/9WoQ+ubTgMmfEHCXZDiQcv/vbB8v8WVr2fnwXxTmHinT5PV
         QVZrRftyG0dnhEomqsFEjJfVXjAj3Oed2vhWcwHfQkFiovqlmy5C9CmGXeXSijAcGq8C
         pMzsGoG+oEtyRbXtScc0RQ8qFxxNn5ENDBPbpjayRQ3iEC5yh7ZEgw0/y2MrouavjY79
         4E3H4mOqr6yxwh00JZ7qBiIMLL4xbnobU9cEvwDVCHe5ndBjpqnPs6p9QxQ+mUnqVtdc
         M7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9qcw2RyhhINQCv8Duv4sXj/zu/rpNPQ+eVwAvkZYeMlTF0Ql4hYAOh+e38P7r9jaF3cOxp4lJGsmo@vger.kernel.org
X-Gm-Message-State: AOJu0YxLb1ucovyBm9tdIARL0yLDwoeKWrVrqsZZAPpLyHdMNc8QORpq
	ArdQ1+SFTZWYalnyuqQ+8qwAETB/oKjUeD3IlRvbGaklu41br+39/u7x
X-Gm-Gg: AY/fxX5GeJJifc3VdbNf0+1porkkXKACwQZ2gcTY0HH2J6tsk+ecMR/ESdju7LNlBrz
	Zvw21qYCfcjUW4ueHFALNqGYX0YvokjbvabF0L83oztJvSHdr/9XoOSFlHiWBar+7ZXd9GzSmCB
	g9l9KUd2SHNJJTZWvbfkL5kT2utU1JSHsst0R+GFuhdbMdurVUWYkdWWA8Qtg03v6VDWtP2e7yd
	qXxGUjLQKjphl5iP/U3G7PiPbJkhWATM/gg809mZIpHGH1j1EQDnv4VYCilixemd8e3zG3MsLRC
	fu/JrePiEum1XX5jDt5/1LXi99jR1Tmx5MY5UzIofb3/gHlyFKWQ/dX9mY46y9oB8B5FFBQUJG1
	rVEDVD/eT83hUz/Ay3zyjbCDobJPhwvuVs0AiANr5qFKxRP5j1grMapagdWNQ6NqdcRCbhZern9
	zHhdsPihgba3cUXb5RSuztfI8TuwJnMw5jS0gu5lPx/1g=
X-Google-Smtp-Source: AGHT+IEc8TO2toWTGIaoXuv5rNAydXLamcJRscYf8Qm/aRVC4j2jXnovQzTTCfCrrqFWoia694nIZA==
X-Received: by 2002:a17:902:e952:b0:29f:2f40:76c4 with SMTP id d9443c01a7336-2a3ee48ace2mr10688365ad.34.1767761000170;
        Tue, 06 Jan 2026 20:43:20 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:19 -0800 (PST)
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
Subject: [PATCH v4 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional
Date: Tue,  6 Jan 2026 20:42:57 -0800
Message-ID: <20260107044258.528624-5-chintanlike@gmail.com>
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

The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
core driver does not require CONFIG_FB_DEVICE.

Make overlay sysfs optional so that the driver can build and operate
even when FB_DEVICE is disabled. The kernel naturally ignores the
missing attribute group, preserving buildability and type safety.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..5f3a0cd27db3 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1343,14 +1343,17 @@ static DEVICE_ATTR_RW(overlay_mode);
 static DEVICE_ATTR_RW(overlay_position);
 static DEVICE_ATTR_RW(overlay_rop3);
 
-static struct attribute *overlay_sysfs_attrs[] = {
+static struct attribute *overlay_sysfs_attrs[] __maybe_unused = {
 	&dev_attr_overlay_alpha.attr,
 	&dev_attr_overlay_mode.attr,
 	&dev_attr_overlay_position.attr,
 	&dev_attr_overlay_rop3.attr,
 	NULL,
 };
+
+#ifdef CONFIG_FB_DEVICE
 ATTRIBUTE_GROUPS(overlay_sysfs);
+#endif
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
-- 
2.43.0


