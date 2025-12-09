Return-Path: <linux-omap+bounces-5136-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E04CAEE13
	for <lists+linux-omap@lfdr.de>; Tue, 09 Dec 2025 05:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A09A300E7B8
	for <lists+linux-omap@lfdr.de>; Tue,  9 Dec 2025 04:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A7030147C;
	Tue,  9 Dec 2025 04:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goJwjEoq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5AF2F7442
	for <linux-omap@vger.kernel.org>; Tue,  9 Dec 2025 04:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254505; cv=none; b=ADadOTw79iDU8Cxz8SnwJeJ+u180WPT/4g2h80czPdlZyMi0BXKoExsaO+7/QcnKfGBQJD2fDlcR+nvU0b9C71otMVYDvOCGAHeCDt+6hdEBXKYIU7dReWM0P7th54Pg/j4zqNm3itL6CQEEu61vfh7I2ckB8fr4OP3ySSNjPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254505; c=relaxed/simple;
	bh=LxCofJzFToPOuZEjMx+TyTe6Tdr2NQUdvBjzyB7tTZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X49OH0Cfi+XUXCbcZnerLpU7HQM7LjY/+Zf+GKJC59P3z4nyiU5igXaJP8j+rWn5cYsc8W89YA9+hpTARJnbMs1hf6F5Udg/TSQl1szN51MYDobHCOL3uWoE4b/UAOm2lGq1645uOLU3tZzN9K00qrFQcUumekBXcEdIhvgM8ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goJwjEoq; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3434700be69so7349252a91.1
        for <linux-omap@vger.kernel.org>; Mon, 08 Dec 2025 20:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254503; x=1765859303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pa1Xejftpj9ZCjaie2sXROdWsX12z9SbomyYLGQRdM=;
        b=goJwjEoqVOr6p7uDo7IzL9xDE4qhUn0v1XiAr1rrsELp/IGup24aKtS62i4PlweLln
         +0/953zqSjBqzpeYJwOLf2j6bY8entu+OeUkZa1VUppTc+CjdajO3+IqlOYo3RubV1ix
         f//+XOjaNgw5GBNf6KuYrgw9mHzR5stoYs9uKH5QKb3dqmNWaR0y+DfF4eAH1FHEVfAg
         doqZTD81Z67tBWN7d4TCx4mC9dmafUMgsJNgzSB7Ljz/Dxy/KAMpug++hlhCzewYNTQ5
         1idvTp2rM+G13w+dymJnHiMrRHdZNSDAHaJ/nYfgypC1ERMFqQaZChUkDobYrbxDLXTC
         H5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254503; x=1765859303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Pa1Xejftpj9ZCjaie2sXROdWsX12z9SbomyYLGQRdM=;
        b=LUqmh5f/Y651lS/XX4ziSt0jsRM5K0tsv3r55C2aRYTQwK4e8jIvBT0qCBTkwULHIt
         nLRs6tielE7n3tWCEYOSNP0qfLrjsbAmWV4D6QDWKkOOV2ldBpSFa93aWKMAjEdfqfZa
         hl6HUTN32FvUzyh55vlBnhHBhZXVd3nEthlnjKnIbuN77LNwdGlNNZcH3H9rpy8JzdC+
         X6qMaTgmjPLjQ3uXli7aG07prn8YZphs5+Anq7+0LIP5JOF2vOy+TaUiY0jCy2AcLx5T
         ZJtds0D/kHZX3t/XivUs6tmefJjWuNgMQb8Aq/9+YTgOg5IFWRrwPF0rpYPZE3KqsHWr
         udGw==
X-Forwarded-Encrypted: i=1; AJvYcCVSbVGZjwbwvG6cf6tljkHSb5lCgno5rJSKYzvJdLCE1nXuO9ysDMbi2NzgtxPAinYqKQiFTtFYVgUC@vger.kernel.org
X-Gm-Message-State: AOJu0YzgE4O/kKWjeCpdqBCAXT5hgKRoayLsG13Cmccj+ZZKIYZj/qlR
	iEr07BHrLk9qd5LpXlsXrEV9LTNayoOY9E5PRGiHdTTDYnoMWmN/neRv/KR1KAVDWyw=
X-Gm-Gg: ASbGncsRRUg0HjHnRNpcuh8n47jYNqlSv3q3G61uCxRAiT5J0rPwSPh70LETNEQIL6A
	PA3uUwwlB0RKhwQ09/GyeZ2Qcrs8udh6ugMBiIDcsAw+N2lU2im9dINYcq8TGcJCGk6w6g7iw+F
	0mM8ABjpv0kVW4OUie4iVKt/PSy+B3kLFPNJ2Nn+MnBHJcyNm6QgkPBEwaDT4b9/sVcGXCWcE3R
	8kK6/cP79ugp+E2rPpYsUG2gbcHPHNbZTfvS5bVxEjxpGWskmqTKlqJulPKuH6KzlClrbXJV/Nr
	aKXyXLIzjSaMBBuilCoxXKynT510mQvHsxSurEkQP45dYGNJXJA5iYHHywSPcEkMzYxEQPkF8V1
	ck/cC1un5Yam5lpcRh54elBINHGoP/ZbvtvqR85SXkQs7o1zafJXBB6MeM0fZlRl4yU9SEXwzGi
	PceY/VTzK28/wnI4bcaXnuLTwoYboue9HG3BYfC3ZkfH4=
X-Google-Smtp-Source: AGHT+IEAgpMVzxFDELmSe1EcFgFHHrMmtin3pr01zEUtdDpWNY9djhS44HySFgwBkRAy8M6k41HDxw==
X-Received: by 2002:a17:90b:58c5:b0:340:e517:4e05 with SMTP id 98e67ed59e1d1-349a256431bmr9237622a91.12.1765254503018;
        Mon, 08 Dec 2025 20:28:23 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:b455:298d:48bb:1784])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 20:28:22 -0800 (PST)
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
Subject: [PATCH 3/3] sh_mobile_lcdc: Guard overlay sysfs interfaces under CONFIG_FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:44 -0800
Message-ID: <20251209042744.7875-4-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209042744.7875-1-chintanlike@gmail.com>
References: <20251209042744.7875-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SH Mobile LCDC driver exposes overlay configuration via sysfs.
These attributes depend on FB_DEVICE and cause build failures when
FB_DEVICE=n.

Wrap all overlay sysfs attribute definitions and group registrations
within CONFIG_FB_DEVICE. When FB_DEVICE is disabled, the driver still
loads but without sysfs entries.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..a46da10789c3 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1182,6 +1182,7 @@ static int __sh_mobile_lcdc_check_var(struct fb_var_screeninfo *var,
  * Frame buffer operations - Overlays
  */
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t
 overlay_alpha_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -1351,6 +1352,7 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	NULL,
 };
 ATTRIBUTE_GROUPS(overlay_sysfs);
+#endif
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
@@ -2637,7 +2639,9 @@ static int sh_mobile_lcdc_probe(struct platform_device *pdev)
 static struct platform_driver sh_mobile_lcdc_driver = {
 	.driver		= {
 		.name		= "sh_mobile_lcdc_fb",
+#ifdef CONFIG_FB_DEVICE
 		.dev_groups	= overlay_sysfs_groups,
+#endif
 		.pm		= &sh_mobile_lcdc_dev_pm_ops,
 	},
 	.probe		= sh_mobile_lcdc_probe,
-- 
2.43.0


