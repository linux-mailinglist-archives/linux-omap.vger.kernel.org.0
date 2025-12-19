Return-Path: <linux-omap+bounces-5227-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0FCCE948
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 06:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E55F309B349
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 05:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3788A2D1913;
	Fri, 19 Dec 2025 05:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEMGQLF7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34A62D0C92
	for <linux-omap@vger.kernel.org>; Fri, 19 Dec 2025 05:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123026; cv=none; b=rQGltzYNYfuCcs4amyhEySJ0nLqVW3oywJ67cKOSNsiL3eKYvxVIWa4SRt4p/zRuQwMWXYpkY/64jv3JYc82yyhRXK+ZtRPZyduI/9scpiZI/ZhXTPAjj2lQEAc324rn/R6tbodko1soiVM1GXjbq7oWdfkDcWlGA3CXCOIcXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123026; c=relaxed/simple;
	bh=/h0B2MrEIB8vw1/0qkLk8pblOQDpqw3e0E/7EdgwDz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CE0vS74aya1cIqvxXGGyOi9SYnMRrJ7uj/KUR6SMCRGD70YoNdsPMQBJnO7ANmnQ0V2HsYykcpbF11vCgVqpzuowdS5BKKHFmUk9mbcgA2ZfobKxiGUdM7DsAHr+XM0AJ4fXviMQsg9IvsmEOXcCzV/JOt4you4miM31gFplyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEMGQLF7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0f3f74587so19560175ad.2
        for <linux-omap@vger.kernel.org>; Thu, 18 Dec 2025 21:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123024; x=1766727824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLowgtUxpf7Ylc32b4gcev+kc2iAvzLFrJvCpgPdl8s=;
        b=MEMGQLF7wLCH7OpEDUVaeJDgrsjKFUWkDuTpFnx68L9JLQGVqnOKVr3h5P2gLMuyOW
         exuw/wisARzusZqbKf8LBe6QvrY/8BXg/hvpQodRQts4DHIY5VaCMkMfKHxLAA8Ns4P6
         /Ny/SY61iHs4hHSwAuURv7PQXQZR9w6VAqgq9BzlnqlbM4F6+FiDC72mVVXAf0muTirB
         +6mW1Bqqtw8vtQm7o07NdHyU3ccWcMjCVdbokwywQYw8S/sBn46uQQyT0sxHOznYPQ/M
         xunbDVL7QbCo7owcg9G/pa1yu0yyfSYmN2GaaAefjDBqQm3x9N0FjZ22vtIKazBYuZyu
         SwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123024; x=1766727824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLowgtUxpf7Ylc32b4gcev+kc2iAvzLFrJvCpgPdl8s=;
        b=Y1bwsyhkIHMUO8vdh9CiADVtN5WcICFCkoYPz8GPhpobTSiTI++I2kiEcu6hmkxIht
         1LVzQMR0+KZgp6c04E1uT6XX5QNhM60Q9nucZCKwS1szX+3ZIRsIAdDg7LvFZbmmOZVm
         K5bb4+bDLyUDz1c7c51Zt3kUix9kjZgpgxrus3wFYe0L7AmTjc/Ctnde+F5PHt7AwmHd
         XwDtBA9lYf2guudYqazk+BhwvPgJeDYiP6HnXlOEDDqjlRyeC7MnzPdsbeXLhFMAsFuk
         rNfhWL2r2nJfCReTFS0E7vRXyOLed3zl67EvSWKTEwT89uucWpMRsSuTitLM1TfmL4pb
         CsTw==
X-Forwarded-Encrypted: i=1; AJvYcCXs2h+6brePPTlaAhN4f25i6NVrYrUqnOIV6JhDAqou/zIjn01PagQ84imwlR2DfoRky5E069xJR4P1@vger.kernel.org
X-Gm-Message-State: AOJu0YyljAd6JfRdgyjgY0VCG1/byXR/kiB4sHljbt7WkP6iy96CopJT
	x8JV2NEUbXwYPZUGrth+0K8N2uyLgRZCYifEHZupv4Dj/2mqqS5SGl+y
X-Gm-Gg: AY/fxX6GKUUI6RxDuHCGm36SJX1RzJ5X2QyZJoM3YPN3uAaCLBI0dX2sXLlsDuXU0OJ
	q4ISHEPbLhKCltYKSBxOf6QUKnsKf8wlgzjIZRTL9LjXHXTNHi7uOcVStQomW8wInntRIRaorxQ
	j/RuVRuemi99HnNKKvZY45wf1weUKN8LMRex3D5yOmfESsQwVDXL+gKgJLcmR0mRC/vF3QJOQmq
	Y9P9/ie23Z/x7AirpwtQ+ilqF75cvVJs4tWrbD2zZigtiIFG+qSjiKbv+bry+fobtnHBv4+MYyB
	Fzrimoa+J7lxPtmtFE5fgWztdw5tzzvSlMG0ZjaQ7EmC7b58mIlnhqLH0lZEfTXvtQL8BFPrlDn
	BWKZzkdRZNioeBBFZx4P6iSiaOMmPg9REOcJYTLWPycgHDTI/ofoO+bQinNt58UGmPBjG1cpJeD
	fdPYMUfIhWjpSC2e0DlV6eKkIkn0BABtjj5kEo0X3v6Qw=
X-Google-Smtp-Source: AGHT+IHapH6OsO1AHtO1AIXlBe8ewsFWc/T53IxGs44x5WRWKW2jyFjQP7saYVlxU5+BW4fZO8YydA==
X-Received: by 2002:a17:902:e809:b0:297:cf96:45bd with SMTP id d9443c01a7336-2a2f2231b01mr17507025ad.19.1766123024262;
        Thu, 18 Dec 2025 21:43:44 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:43:44 -0800 (PST)
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
Subject: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Date: Thu, 18 Dec 2025 21:43:17 -0800
Message-ID: <20251219054320.447281-3-chintanlike@gmail.com>
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

fbtft provides sysfs interfaces for debugging and gamma configuration,
but these are not required for the core driver.

Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
sysfs operations are skipped while the code remains buildable and
type-checked.

v2:
- Replace CONFIG_FB_DEVICE ifdefs with runtime checks
- Use dev_of_fbinfo() to guard sysfs creation and removal

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/Kconfig       |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index c2655768209a..578412a2f379 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -2,11 +2,14 @@
 menuconfig FB_TFT
 	tristate "Support for small TFT LCD display modules"
 	depends on FB && SPI
-	depends on FB_DEVICE
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on GPIOLIB || COMPILE_TEST
 	select FB_BACKLIGHT
 	select FB_SYSMEM_HELPERS_DEFERRED
+	help
+	  Support for small TFT LCD display modules over SPI bus. FB_DEVICE
+	  is not required, but if enabled, provides sysfs interface for debugging
+	  and gamma curve configuration.
 
 if FB_TFT
 
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index e45c90a03a90..848702fc871a 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -203,14 +203,24 @@ static struct device_attribute debug_device_attr =
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
-	device_create_file(par->info->dev, &debug_device_attr);
+	struct device *dev = dev_of_fbinfo(par->info);
+
+	if (!dev)
+		return;
+
+	device_create_file(dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_create_file(par->info->dev, &gamma_device_attrs[0]);
+		device_create_file(dev, &gamma_device_attrs[0]);
 }
 
 void fbtft_sysfs_exit(struct fbtft_par *par)
 {
-	device_remove_file(par->info->dev, &debug_device_attr);
+	struct device *dev = dev_of_fbinfo(par->info);
+
+	if (!dev)
+		return;
+
+	device_remove_file(dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_remove_file(par->info->dev, &gamma_device_attrs[0]);
+		device_remove_file(dev, &gamma_device_attrs[0]);
 }
-- 
2.43.0


