Return-Path: <linux-omap+bounces-5526-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79426D38C30
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 05:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10D9030321C3
	for <lists+linux-omap@lfdr.de>; Sat, 17 Jan 2026 04:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDA3325722;
	Sat, 17 Jan 2026 04:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDYIrEK7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B244E238D22
	for <linux-omap@vger.kernel.org>; Sat, 17 Jan 2026 04:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768624265; cv=none; b=kBwOg5/Vz1b0IIxo3C/tqEqLP4lSr+WI31OEMitNMe7L+GP5DrcJsKlkWE0o0znzYEIKinsfbLiLkid7Il2KlTY0i3IsoTpH8v2LdB8aUgKHwEpfOeAOIP+r9JazW+9pfhLD2qMfK7XpZaWJZKM9P19LsGoD8NOyK1gkgparius=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768624265; c=relaxed/simple;
	bh=uE69x94dEWXAgSGtMUCZSUPtE0Tydj3bf2EuX68TmvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nh3N+4CvMl8jH9sX6byQIDd6gQHOXhFScUscT4LQpLgXc6ncI3ZFzu4GPR4yZKw1tb7p/U+oAZkKmKDmjVaayc6A5tPvVa41PMdPtaQQT5QvAzCzorPY0lLaZYLb5mexuIHBvq7qt74h19ItXbQMv9995iSym++uWY4runPYb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDYIrEK7; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81db1530173so1289860b3a.1
        for <linux-omap@vger.kernel.org>; Fri, 16 Jan 2026 20:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768624264; x=1769229064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2w/Q0mSJAiu6YE8Oa45NpmmddauxEQc9oB3CUI6p98s=;
        b=gDYIrEK7kw+pFIwGnWPm+9ITFl3jqdvGAWJkX36W5hgrmi7p04T/wsi5vKhD5rDMwW
         e7Tq71jDIfKfm1JB/K11VkZa3XIgwjjJFgGU/6R7J1KllSlDm0GRO34zn3GVDsu0chXz
         iFH/IIeyCWQ9RZw2YKoZifP2+vt+wtfevk6RWufq/RbAc8vF8U/bLrb5pmcO5hpzbJ0y
         i9ZUubziXYpzeZBHun6+BtVfaD2txCo8wdbNa1jPNJrWA0i7lPAr4DMjbNtr1+cpbVn+
         PyJ8A5q9dhtWvs5kN5fOYDE2oY767SiD0FIQWDEHwDK3g+tZrnHahoX/mEg8VcRtcpj6
         fYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768624264; x=1769229064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2w/Q0mSJAiu6YE8Oa45NpmmddauxEQc9oB3CUI6p98s=;
        b=u+D5QfCD79hha/ZAQ+kmb4ff7rsinJoo8BTrYShWo67VhFfEQwKQWyiXy4Sok2FjeV
         7nBmKWixbqeLJqWjiAdduDZhdQkWsxuWKlSTDI9COCTdFtll3rE0trC9jpqTFaATzA4N
         Q8ExTH14SjEZP9UCpZstIsKZ6HNBDLEQmOWBAWzqBdHoPO06EI5lW2OdaTtvvuAdkSCD
         kK+9fxrHvDzQ4slTbiFg6iP7qVhpjK7TXKEXjYCUccVM8wQvsweKjz2pqTFNDqxh0KH8
         oJ/yzAcz7f5nuaZtJ0na3+h6+ourhDOCkaFlO1scMtQxYwq++xacwW85ddhXExnlauHD
         iYFg==
X-Forwarded-Encrypted: i=1; AJvYcCWiIX/x6HDwBiaV5GYnCeVBXMHyAOkJlZD+DOuFR4r7jkbTQWcagv44xCoIlLksMJ2AInS+myWr1nPc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ZSC91HwW6QbF6y6yQ7cf3WixxKFTrsJE7f9dFHFVqrCixBky
	GWHx9KPNTy6tDRnbRHtYSYJT8Pd7TgEyU1qXhmXZP0Scx6UJBhBV81Ef
X-Gm-Gg: AY/fxX65JlUO31WAMK60BbF5UdWkUouXAS+o42O07Z47hxx9hXJ3ASFx7IKJzXRPVTv
	ffBvWYDsIYNuCGtJ+tDXa7iA83ZM9pBMMjcNCMvD+NABJb37/n75IauoGBX/mLrdQVJYHwYFK9v
	y3oMeMJstDeG3yf4u0exFntO7VZFzXhAwcpU1rprp+bPrCuhdcQoR7OVaisx1RFgMtshLVHy9Li
	pljhuC/i+eWq+BivcYAJDO10i//0yFlvLb7RnmTeDfaxeW41UJ73tNtxrCt9cZwMOF++/H8Btdm
	avLAEZ/sICbcDyZzG+lbRHAJPAA9/BvCKvcEVxT6192JKjddjk+b3ZhUw7xnUkPzOpsz0UrOrnS
	ifGE+XpPSquCTwtuLHhjpDZFdb4A2Zc+kttXLnX4bmWCF4N5cZ1ga0ahH4NjwuusPaPZB3RP+Yj
	qxIHHs97DZ/Tl7tHkAXyn1syZNm4pC8BozbBX/khT0AoiZeXs9VcwGEg==
X-Received: by 2002:a05:6a00:2989:b0:81e:af19:34b8 with SMTP id d2e1a72fcca58-81fa01e487dmr4740579b3a.43.1768624263888;
        Fri, 16 Jan 2026 20:31:03 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:26af:b454:d793:29de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108b23asm3370159b3a.3.2026.01.16.20.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:31:03 -0800 (PST)
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
Subject: [PATCH v7 2/2] staging: fbtft: Make framebuffer registration message debug-only
Date: Fri, 16 Jan 2026 20:29:31 -0800
Message-ID: <20260117042931.6088-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117042931.6088-1-chintanlike@gmail.com>
References: <20260117042931.6088-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The framebuffer registration message is informational only and not
useful during normal operation. Convert it to debug-level logging to
keep the driver quiet when working correctly.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 1b3b62950205..f427c0914907 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -792,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	fb_info(fb_info,
-		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
-		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-		fb_info->fix.smem_len >> 10, text1,
-		HZ / fb_info->fbdefio->delay, text2);
+	fb_dbg(fb_info,
+	       "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+	       fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+	       fb_info->fix.smem_len >> 10, text1,
+	       HZ / fb_info->fbdefio->delay, text2);
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-- 
2.43.0


