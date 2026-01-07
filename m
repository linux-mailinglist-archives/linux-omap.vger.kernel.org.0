Return-Path: <linux-omap+bounces-5371-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 741F4CFC005
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 05:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38FBC300DB06
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 04:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD47244667;
	Wed,  7 Jan 2026 04:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsRk2Atz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621421772A
	for <linux-omap@vger.kernel.org>; Wed,  7 Jan 2026 04:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760999; cv=none; b=CAoAYy4aAIha4BDXCZn8/GWWXeU6/YVJcztiLMkLa/y5QjxfGQQPSveS0sP7fJoV7iqDYpVUkUDn1G2/VJ7urg9/aEUpTacPx06AwCmUasLYNPvyZ0/2xGh+NwMoiJiMTZeN3q659j8Xatb2CHefkYfuR3Z+IJ/QYT3XeWCz9gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760999; c=relaxed/simple;
	bh=FnV0IJmLlwk0Yk8Amd2W/sf6pDwZoG+c8cE9oXjsy6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNdKyef+j1jlmq6Bcv9++I8v5X6d/HgjfsbmN+NN5SaegEcnmzL/9yDBCNXQDtAo1Wok0fm9yswiJA3gIJOIT80YwEh0IrFcDlFArfpppvqTunhUatDnCqgELXBNB92yt8mLEAVrurkVD+Uo0YOrNK1XmS32HdplhCffUC94sNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsRk2Atz; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7f1243792f2so983387b3a.1
        for <linux-omap@vger.kernel.org>; Tue, 06 Jan 2026 20:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760997; x=1768365797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLWOELcEjrI2iHJxLfRXTvBZahch6VAgebKRz7irVnw=;
        b=OsRk2AtzqxcSndp5aSNLRXCQSAd33VenZRHISibKT3i2mt1kRTM6JYnUq2/X0zamm+
         SpCL5X5koCLvjjK9WFwvWxmqVJQ9Ct26MLdS1A+OYWm3gT1bECSAflMZjhhIkRvKQ0fx
         q1r6DSkPyY6/c0xflLi2chwaIwJzxnDwo+v3WyIZ1oc/E77Tp1vY9zEbXoEfbQ1SEX49
         i27/VdIfdSD0j1ohtrQN9UhcuSWTW0HS0qKXjc8VBM7KLOLYV1uHoxzGYs8Dm3dsGXDW
         6Jmeppl6rQT+veyHQvH76rLXmZCNfXA16KwpnmPkcwItFyjsVW7J9UOC9CDm8aixNuN9
         mEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760997; x=1768365797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLWOELcEjrI2iHJxLfRXTvBZahch6VAgebKRz7irVnw=;
        b=B9NruIZUYvMOg3pyKDDlZW1fmNxdygno/TpRD28E9PEP0dU201HxR2YkMVfo0PgGpS
         hZcI/AQUtprQmDHLRIlIGPk4YbqFl7XMxlRPKvoCkppCBhRDXeMt3iDt2HjFVwXstEvv
         EPDbCYKWzYgQzIECo9lGYi4wFnupITEdWVG0K2qD9bkAERy7O9ExnIFriZA5t1U0vXYO
         iCPahwEbAcR6uNtIJhvmfM5jYOqCFMCu3JHbqVs0HLghzAldcQ6MRkCsH1qHq+AY+/wp
         TBG0LLuLY3A4M2EPOCNLeL0A5WppeTEYiDjRpbdcn/X3bm2WgjUpoU6DwgfuzTYeJAd9
         7Mfg==
X-Forwarded-Encrypted: i=1; AJvYcCWXA01jQtkzcV8fxTAGQv2UOBfxx8yjMoOYpBtomQZKCYrtBJU4ksNT/FPLQ1/dIVnL4RGduShThX86@vger.kernel.org
X-Gm-Message-State: AOJu0YwofJ04z5XXfMvx+/NIvOZ4tfC08WeW7vJyxSaxQ7kWIAeLl7Ju
	vEEU+jJN77P0smLcCnTVlx5XrdpnUz49yAbPldY8jHNvvL2QX+O0fdus
X-Gm-Gg: AY/fxX6IFC9ZXH2vwcgk8bm6BDtVHO71ySfsjzs0Lh67+yH6a604zWbmOkw0Ovsba5u
	xq6OXvLARBAKviac1zJBsdfir46wQvfH90d7/ZU5ICVj+wAW4avpkp/VvC+R/uGgFP1JmFWYfK0
	tv9ANLVq+4OlwwQnAJ9rd+MKjGraVMfiJMEl8r8BlMolaD9zfUmats9gQM9HAoS3Y8tPqveb+66
	ghJ4FbCQNFzllVV6IHXPJo2e8dZgwzHgrrrJjXqCeQTbHxEaoOk7n1Syo5vo2E2/7MyqsOZFlQ3
	MhAtdHOnjlJO7pLHDLmVeOxxoZdE8APbJuN1t/jt/olNPDb30O8F2g28cUacY8SdhNiwWkE64UZ
	1bSVk2NlmcqYLdgZ+Nr3M6zUz7E5IjxGcjs1GZnP/4n4Z/XICgNnczxLa28n4bcSfUhBuIZaxDW
	Vo0PpNzsGPE87VYkpGg69NhBsEpExlsJg340YUmeMwt3DlQQMCQVSVcA==
X-Google-Smtp-Source: AGHT+IEF2tiwIdEjUKJoleA4BSAnBVhOgZtlhWyisn+mWM00+oMK/a966pLLKiRVpDOA/U4Wkrlj0A==
X-Received: by 2002:a05:6a21:32a0:b0:366:2677:4b38 with SMTP id adf61e73a8af0-3898f8f5458mr1134448637.8.1767760997324;
        Tue, 06 Jan 2026 20:43:17 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:43:17 -0800 (PST)
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
Subject: [PATCH v4 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Date: Tue,  6 Jan 2026 20:42:55 -0800
Message-ID: <20260107044258.528624-3-chintanlike@gmail.com>
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

fbtft provides sysfs interfaces for debugging and gamma configuration,
but these are not required for the core driver.

Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
sysfs operations are skipped while the code remains buildable and
type-checked.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/Kconfig       |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c | 20 ++++++++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

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
index e45c90a03a90..d05599d80011 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -203,14 +203,26 @@ static struct device_attribute debug_device_attr =
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
-	device_create_file(par->info->dev, &debug_device_attr);
+	struct device *dev;
+
+	dev = dev_of_fbinfo(par->info);
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
+	struct device *dev;
+
+	dev = dev_of_fbinfo(par->info);
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


