Return-Path: <linux-omap+bounces-5370-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041BCFC032
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 05:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9162E3061294
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 04:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D647C25A2A2;
	Wed,  7 Jan 2026 04:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JG7zYWX/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96E4264638
	for <linux-omap@vger.kernel.org>; Wed,  7 Jan 2026 04:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760998; cv=none; b=gyv17/xtspoMMlCCgrL8esW0o0MwGdtl4xg77k+J/nq7mFc8IOYjgJzefE9AGGpQHMEuzVP45CdDGCPgkkRvo301HQ4urcbz1NtYqfVOENOmMdPMED3dzi7ZII70hTAvgC8Jdgsndpon/se9pNlMh16XSPt2rZDuf8bppKs5ar4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760998; c=relaxed/simple;
	bh=MkQ4XoQfjzxb5Bd22BM0zqSZxNNCZ/iSlC3xOfhPAgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bC1az1z/oOpwingTLEZUUcqF9FZTtyrtAwIYuGMpYlPxlFlEbG2PdiLKsjz1zYSoIt2qbYyr3SgdPAU1L3aqLxZlOo5JRV8h5IfXoEkpAHlovRYIdA8ppuPtovGesq6GhvZQcEfvCHEHmOTBBGmGYSz837SgU4nzCU5rZJkTyR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JG7zYWX/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0a33d0585so12955245ad.1
        for <linux-omap@vger.kernel.org>; Tue, 06 Jan 2026 20:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760995; x=1768365795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thb/F5AmFMs9ckn4s6Vf7Io+bFyVo1RiT6S4i8FpYAM=;
        b=JG7zYWX/FjhL7HpVb4rFz2BAlgK+eaKtkHRlqawbqC7OpGnRCJY8rohzUlw0ld4bfS
         c7nnNYT/XygubUATnfbuEHozZrXIoqn/mWygovd/72udEh78xrlp3PQN79a1X+BbeC25
         4ySGRZw8TjVq7InWZhEKZef6fBFlQQnwj0tMsXFlww/VnoQR8bkJwCpynAQqaf+oLL1a
         ua3z7H4IEfcyb/gq2vccH7/RlI4+q8ZMqVED1dH/afSH5BmdALHq1n1LTMIuI/hjtP7D
         fFycLaHbnvVWJIOSgc0LY/t+3Dnb8EMkL16AnQCTQ2WAGNEG8U7Vhh/2iiMI7Xy+tjTR
         xlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760995; x=1768365795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thb/F5AmFMs9ckn4s6Vf7Io+bFyVo1RiT6S4i8FpYAM=;
        b=Np+pNW3crjv/WMrpOpuwND+l5uArxNJ2V+R5lGJjlwlmSYJqKqITCCI+Njr00fx7Hb
         CqFco12AFW5sc4OSKDKMqGkFxdKEqpI9vHYrF6MTjANzkUWPEh82Os27ssNCbovVKqhF
         NJ6XzB9GJZSo+bTAIqKu71V/pJkSmSWHqXSfYHxbWPOhA2s2upyY/6tC0PaQGBRLmUb8
         M+wHExPqoQxQLh9zDfnqNlufFEuXntdcyk257VUqiPNIvtj1MRx1G+Z4WG7oSlcPPcjj
         cWq4n2am9QlsbFb/96RCDUiGcNTbMTWDuxf1T0GlbWMmPPDl5nHy7Ktd6O35N9va5j1N
         HEXA==
X-Forwarded-Encrypted: i=1; AJvYcCXmWNcHg2gVYSzrEcc+4hGtnpArtjYcJYC/VZ0zKW4mJ6q64djtLpU0AuxyUGP0xRbimiXaL/HeEFO9@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFKHxIAC0CiKTMyu6r8BDybKFU52dNJzWQV9CWdbBMKCUCXPi
	r02otZxhzkasDvqdsiI7y3bsn7TTATFczMwm/0eJMy6oz8czFzfoPxyq
X-Gm-Gg: AY/fxX6dm94wW4o76Ur7IVg2STFrtOAqLVxugNQHo0UFIPV120+BDKo6+LnKxTS1gOz
	XKKd7T9LsaCxiQJvCD28wD0T3ZNIUbC2RniPRxnGDOCBTBbIed73MYk94f9gtBkDRbEl93rGRqI
	DKMBipG6YUvOL6ntty6QjuQw3iMopBO1iaHq/mjufXpHytxh8vsLY+4hqpjfQOYCnBek3xrW6vb
	MbnY9y8w/vjyAR7A6wtv2Pkmnzj3jil5v2iK/qdRDjF7b90VhklXQnsk1clDhSud1WOK6HB/Tsg
	lFTubGyWd9PjWwbAo36I21MgXeCY+nenAMauOA/5OfBiqWwSyaKdkAJlybQXb/e0yzc5OrPSBOt
	47ZVeE7vC7CcVHovZZcwiTAx31JI2Z/Y3ynEXpOUiamd4hATrkatpbYzeTFeFOz0ZYaxoi6bNjI
	K/qXpjjx2MGhX6KB9ByHxFBDHGc8jdceVcPFv9IryuI0g=
X-Google-Smtp-Source: AGHT+IHEaO2WdOiPYRPaVMlPLug2wHz5JWNqR4SeeEsDG6lB5tEtYaBOclypPoot3PX+4+bsXooZ1w==
X-Received: by 2002:a17:902:ce92:b0:2a0:d63c:784d with SMTP id d9443c01a7336-2a3ee4a7dccmr11794585ad.40.1767760995098;
        Tue, 06 Jan 2026 20:43:15 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:14 -0800 (PST)
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
Subject: [PATCH v4 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs support
Date: Tue,  6 Jan 2026 20:42:54 -0800
Message-ID: <20260107044258.528624-2-chintanlike@gmail.com>
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

Add dev_of_fbinfo() to return the framebuffer struct device when
CONFIG_FB_DEVICE is enabled, or NULL otherwise.

This allows fbdev drivers to use sysfs interfaces via runtime checks
instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
remaining fully buildable.

Suggested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
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


