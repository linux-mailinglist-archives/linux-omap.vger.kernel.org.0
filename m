Return-Path: <linux-omap+bounces-5226-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A5CCE93F
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 06:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66A8F3093F96
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 05:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A552D4B77;
	Fri, 19 Dec 2025 05:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVNZt8B0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD602D1913
	for <linux-omap@vger.kernel.org>; Fri, 19 Dec 2025 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123024; cv=none; b=MLP2qFdG8yQM3Zj7kSSpeWyBg5D+CxlPglcA0syUrDHB6TsmJElqA6DcPyeAozH4LNninloyFVwxQgVmll+3aD9zzwpXKxi75GvKX1TeKOhz7+RCKngjHiGckjlXphkqh4a964VwaxGt6QyZ0iilxNdcFU5Ih87ZlnCIz0kZaAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123024; c=relaxed/simple;
	bh=86Kzw/hKU0nrIm8xZ8jpwyS+2DiCcDwmWTX+qvqHhFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dryFr1agq39+mkv9Jm4ChdTYMrKjINYS1G717jHGw6+FtOekpLo556wrlO3IDYBA9a7kSgyskd5jDV5R/pK/7WyO9VQLxsgcVGlr1Wz7Ye2zgM0HMtWfKuCgDmw1Gw/+VmNUOrKefo6s0WM+eEAkZc75FzO3GvvUD4+elvwmVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVNZt8B0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29f102b013fso18032085ad.2
        for <linux-omap@vger.kernel.org>; Thu, 18 Dec 2025 21:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123022; x=1766727822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
        b=UVNZt8B0eRLdEbUBBnh2zpWq40lqCA+elXS7xzOsTlxlq64QBnZcxPvl6QfxP/kPDT
         tuXIMj94oId9VJbpPx+G/bm80iRYbpaCAu8RODiJajR18I4ieuRN99MjU8TsGQPoGFNX
         5CKj5ktHIgjWDVv/0QFpcpnuqGLBmDPFxCtHOf06uI4Xy3P/SlO46/+d5p+VSEjSK9D+
         ydRm1K58ClGnvON/LdC8qscoEp+kN74teNXzFC0Rm5O+bS2vXp1JzBewGttJ4BSJgdr0
         QLl/irSolSQlNtO1DLuj70gqlfog37mLwDcMVgUru9SmLfsZbKxc6nMQj53KgubYLbPG
         nfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123022; x=1766727822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fKkdwzvSXz/T9pEqrvQ0VdQLUSbrQRl3ctUuH0zUyRA=;
        b=CYgLPlMfHfUUcPoZ3Osu8ZxZWKOKcSXYyapbkioEzx5ciJ4kysRq9kBN4PP7AEr+A0
         ywKOWIlj3U42vY+aIt6kVo/hfHsnxYHlp6kaUslQQcZR6iLuGS+Z+6q2PKRNOI3bWRJf
         0zW8rSL/NUZWMIwZ8vCa1JosfptK3cK9GHWkNNxVKraNJ6vtQDs+A4YHTgrlaa4xPCLU
         n+9x3986mc67cv91DHiQ+iKyf/gspXwImllG/aNhG96r3lEjTQmEIE74fHLAmctZZl9s
         /ZiqIGz6k4ilAU8bCltmClCeDjwADvll/AUtA3q2wgIdglPrvx4VdhjyY5FybKqIug5q
         UvUA==
X-Forwarded-Encrypted: i=1; AJvYcCUJWd4waKDivrvDjaj3nia28B8c6GT+BC/SJRkIhXOzp8+f2gLCEJfEuGKoUqevPm+MeVTng72OOSKj@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHBXnh6Fxpg2pLb4OTdaxecmzK28TB/Cz7F09PqJssv4LgKp8
	l8dap+OIhKFA1ikuxyj5aeVasMu7064rrnNTsypSacBGiuYMU9mFz3uF
X-Gm-Gg: AY/fxX5nkisBzwWhgfqEIYbx2TVySc+nFe2taRYM4IoAZ/t2jim/lj6ufi6pTFV8bYr
	SMSfBbbZgHOvyMFeMe/m7VvIbQmoUyrHtbcf9zpzYouyAUQiwTUsXCn665ynl7k7Y8jttmKSn7y
	DG0HSe7CqCRgwrjbywhkGxREVr665sROcFw1tooe+cFQ+tJ6wG7GxogHQm3yWBOOx37DNgTuA7X
	m43jF0tUR89bmeoGY6BdL1T8r9Jth4JRr9U+NPuf/tXvFy0K2LZHBYlYX/0M6MdRl8/FsgvjAPM
	jfXI5XscUkFfIf47QUTiTYwKU/8scB1SG38TCxSc7+XZYLdywZze60KJMCr5mKUiuurKFtns3Z5
	bjJJV3aE955/2yBDoCA4WBAYUsfPwK8Iav97ZRVbwymNqqIxeHdGBho5LUwLLusCI7y4NQgKJjk
	B51WW23UYDZFpczt6Lku5DvKads3dIZwH0+Pm4ufbnbVU=
X-Google-Smtp-Source: AGHT+IGRBz3LEiHHY3N36Lf2Jbdyl+OtCRRLAqx/kmUDLPH9d4n3KvJgE1piBAVSSdqL472NtK6Xtg==
X-Received: by 2002:a17:902:f78d:b0:2a0:c35c:572e with SMTP id d9443c01a7336-2a2f2836480mr16751125ad.30.1766123021882;
        Thu, 18 Dec 2025 21:43:41 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:43:41 -0800 (PST)
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
Subject: [PATCH v2 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs support
Date: Thu, 18 Dec 2025 21:43:16 -0800
Message-ID: <20251219054320.447281-2-chintanlike@gmail.com>
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


