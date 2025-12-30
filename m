Return-Path: <linux-omap+bounces-5285-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA7CE8B83
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 06:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8719430204BA
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 05:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE3D2EB5DC;
	Tue, 30 Dec 2025 05:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJzkLHf0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012F82E6CA0
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 05:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767072547; cv=none; b=qto/YjUGq+RfX61lFyOephJGhqdqR3tKwzFBTGlDYGkJ5nr6xJ/2Spt4/RYSH4pkAdKdw1Bwsb1zVfJzVOGffEb63iemVGPfdMQr/bjCmy+IrraX+M2RQkgLmzqAPgvku4xPLv0Wa/xAgf1BhLwAIh/BDW294V6/Ygs9rCfTfYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767072547; c=relaxed/simple;
	bh=86Kzw/hKU0nrIm8xZ8jpwyS+2DiCcDwmWTX+qvqHhFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdvEwtC6mJshEL37zRscPlmyGg1ONASjkLOAb8eZF6BJvcH/0kil/P4uSStJnbl+Xf+zAI9gexvMURSL3n1FywWC8G6PbtrxKHOTjX02Td70BzO8XvNxWAaJQAvI5nZyZ+mfnE55PxwZsA/EvydV6LwLsREcw5otfapwaSbIX3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJzkLHf0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso101123965ad.1
        for <linux-omap@vger.kernel.org>; Mon, 29 Dec 2025 21:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767072545; x=1767677345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
        b=HJzkLHf06dwAcn9J4Ab7958kyg5hAF0iIVEkXaoxbcEv0m0K6stJusjo1zc/w1K/lt
         Tr/19rFS1zNs5R/rJe9uvFxujaOYHYdCLdILTCxqDoWykR1n3pCR+JXzl4n2SobSgt0p
         zX1MyEOUWaAIBj3iRZa+7BSqoVrXNOqYHXN67UCA/3lMP2KJH2GfhQdPGrD/qJKRe4+/
         BkMRIIldwFvgqZRXwS1kXyXPSuJIZHNotrQ+5vT0g6Zy9PNqQbak/Fl5kAc+F+9B+W+9
         XOHU+uTLi6r52e1Zk+bQxL2BJNVFCU30egBOY5T7qW5S9RL3lL+fvpuSJPhvdDog2XWv
         f43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767072545; x=1767677345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
        b=us2BZ68rSEo85thPFR4v8IwutB6p3f8Dg9P9EESSacPaTSFxbQUdUgw11zaB2vpvN1
         ehu98vMjtjLBD29x781D6/a0kz7nFshIns/HvWbgATbIGfnfOXo8zb82hBUNLZ0tV0QT
         XWw64X/xpeB3VY2CGJl7LtGz1/nt89yMJ6DuvhLbUeNlSmPBeLehClVa+ww5oVKRaxL9
         Ci9rON7IZGSJu8ty1A0dWNjutE/xoxul3fiLPVYKTGE0O7JOHbIndh1YB2qbJzDuHsE9
         GsqJCiRbUmUIgwsX3xruqUkWZ18nUrAZ20aq7pNaDpI7nUDMk00Wv7QXIvlEsXUqFjXV
         WMdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN/OXmQ59uwxG48X8XX0Wgtx7M5e+whZyAZl52TiO7HjRmwC+I9mrjzF2Nxw3tEN43WSHQtc04V0HJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDUlOe+HZ0N+2X8zxSjQy+kbts8UFKpgbE9Goi+hWx6K+D+Z3
	n2/Nx+WwqP6Dwb6qm0kqfkddcZu2QDjPDs2rEZxMmhDTSCdrjLwBfKR4
X-Gm-Gg: AY/fxX42BZwVyf/47Wtfj3hkmQH/Gt93Snwc67RLhVqotJsfipok0RR5YPFVRVzrbFz
	/rVjf3Et6PT9dpzzuOfalY5XL91VXMNjI62Ic4LuBXXh4qYoM2NLcjbkbClQI+xizKrb78La+VC
	OrG39sHvMfx+teq07k7DmH2rtRsOXJqNzzNIp6kVb1hy+Wye136bTkTdXC274/cSdFaXfzanS7u
	pc/TeLWgzwdKV2ynAWnYiSj9x21zNgAtr44+UNxIKfHPOry4zgZ01vWThT9N1Dp2tTYWDfDivBq
	vH2rl1z//JBUGok7SPBuOB25+nh31CXvmEApMeYO/5fi6eH0CRLrv4nYgcjc1vmILNVwbZnOeIj
	kJYqQQnzsng+1nl5DaMZob/IBWwgEc2n8pIs76MZIR6FXs9VpBVwRm4Q2tLDnv+ID1GzcdYpC0G
	rVtBjqggh1gKQ11N+cuh96o8r8i6W5GvoBnEEqYXuEsXC9oEoGN4g5
X-Google-Smtp-Source: AGHT+IEF20IOQ3ACEEG5Q9roz15yiegJkgEV49gziCCB4yVsuyx2zyUl9Tnp5LPbFSW7p23DGv+NWQ==
X-Received: by 2002:a17:902:d2c4:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a2f1f789ffmr344796915ad.0.1767072545159;
        Mon, 29 Dec 2025 21:29:05 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 21:29:04 -0800 (PST)
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
Subject: [PATCH v3 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs support
Date: Mon, 29 Dec 2025 21:28:19 -0800
Message-ID: <20251230052827.4676-2-chintanlike@gmail.com>
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

Add dev_of_fbinfo() to return the framebuffer struct device when
CONFIG_FB_DEVICE is enabled, or NULL otherwise.

This allows fbdev drivers to use sysfs interfaces via runtime checks
instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
remaining fully buildable.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 include/linux/fb.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05cc251035da..dad3fb61a06a 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -628,6 +628,15 @@ static inline void unlock_fb_info(struct fb_info *info)
 	mutex_unlock(&info->lock);
 }
 
+static inline struct device *dev_of_fbinfo(const struct fb_info *info)
+{
+#ifdef CONFIG_FB_DEVICE
+	return info->dev;
+#else
+	return NULL;
+#endif
+}
+
 static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
 					   u8 *src, u32 s_pitch, u32 height)
 {
-- 
2.43.0


