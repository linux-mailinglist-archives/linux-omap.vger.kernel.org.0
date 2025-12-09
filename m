Return-Path: <linux-omap+bounces-5135-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B43CAEE10
	for <lists+linux-omap@lfdr.de>; Tue, 09 Dec 2025 05:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FC4D304842F
	for <lists+linux-omap@lfdr.de>; Tue,  9 Dec 2025 04:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95782EB873;
	Tue,  9 Dec 2025 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTpVjikD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824893009ED
	for <linux-omap@vger.kernel.org>; Tue,  9 Dec 2025 04:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254504; cv=none; b=A1Z65aguiuhn55QjRNWYIW88la8MC7jDjHegrrOh4Y/hvg7rB7T7W0tcXGNYq1C4Zuga24jRjISLTxb/C3Q9cSRXpdIUcBH9NQlfxPTAV0AIiaMxia4DwraYZ2PoppoozJ+A/8Des6hSmh9Hi3QTF0/B4OadWh7JKn9rvuP21Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254504; c=relaxed/simple;
	bh=3pidgD9TpcdjmuGEM4+2gj7Du8pBd7MRvFriroyxajI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=echuS9xXMKCedamdyF2bEez6lrk6Fvz0owemWGzlXEv7rGvrRw4PT2SXdZTOxyw2I16LtbkWnQYdGlqTqtWYsH9NZWFsLd5teDVlulD3UmzztxuWhgaU3/ipmbuvFxMkOLCdkj3J8efFaE0j3awsKTWXEQqB52ukqPMyvOCJpck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTpVjikD; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34374febdefso5377257a91.0
        for <linux-omap@vger.kernel.org>; Mon, 08 Dec 2025 20:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254502; x=1765859302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoV8ebquCT6L/RZ0AqbPbGv9Gx9G1WrRRbUTSZpd9fE=;
        b=dTpVjikD2Nh9Nc85uX18Y/CF7eeymtNW82EdDmUYat0Nn0eaW3hWy2d1mDIg8raI0N
         vBYPWMW4+VI/KgaBRhNBMhFJ1138Gu2S+xIAnSwHV+O5n5+iMJ5L/pWbth2xJANeNL2/
         hiU+8+W1RTyvh2mBjgezwdSjVp0GPD8w1StXgX9lPsgCYfW+p/7OKUsz3wIaF2yAJcnd
         ljpa4rcpo7whB7tK0lKapQTP+zMQgESlRSc4LACfyEkhbZOUFCo8POPJbJ7pI38uaTOb
         Tr1tzz0U+Ab40qF1zCoMhfBY0pW/132j99/8IyleurMrGYc3l2XLBawcHT9u7bMxtjTu
         qpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254502; x=1765859302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DoV8ebquCT6L/RZ0AqbPbGv9Gx9G1WrRRbUTSZpd9fE=;
        b=alHhO1s09fVPmbWLax3Db5n2hTpOErZJ3Ef5BfgS8PYEZwbQHztBUYMVsuJiazjwGc
         Mctjr/tSaes7uRk82hTj7w6/Htd2luBZHysc3/S+XjvEE/R7cYWtcy7NM3jHmIzNrj06
         EIXa5qXj7bJjZRs1MNSE9aAcwFqEnrLTiqE8ETddBhIpISNva8rUlYYGHbaWOxyCt6CU
         Z/jK0+Ym45Anf1QryQVUdUlVEUH8+8xKk39OxbLwfjZEday9oWaZBCvYp0ECC5XNmU8T
         9Pi4S2vmC885TeajgpYro00rX+Ezr01x/BycRRRKn6fqqshdRVWxOKnVyAEnptOGviDT
         JULA==
X-Forwarded-Encrypted: i=1; AJvYcCVUESG8yQWjaSiRnhMBwhVYpAbRffILQlPEwyhqVX8+PiWF2WAIfAYd+KW969jFmuneal9VtX+bpx5W@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdr75gK7omWXs/Fz/mJ7/yaguCFAVqUYynQEDAhdPlkgZvoclr
	mcqxvdbUolEnjk0CKkRhi0a+yKpoxsKJNs6FrnafNTU6lcasI6DA3a0x
X-Gm-Gg: ASbGncsgP2Gh9ykh65a0lnonMv3h5IsYYtA0JoOt9W18ZRf/RJXutysz8cvMzGkQFV/
	xNq33Q501D0LyrOBQHaMMZhXeJMGn0E59jzFI9EoeswK3jzxPgqbPaBNCIkEhUxdFIMLxZ38qc9
	j1ceSf0wWucfqZ1FoK4fPZH1V8448qareItqZKF/CEYEBVg541BSymGMERfhNOfCByzw/R2BKWh
	ew+L543qNxl0zUv1dJaRBP//UgozVvIF6JQwrGw3NYR98qZN63LRckDnQPw9dqZLAcrzI2OQH0v
	vXOZ2RYwVZtZPP1VSPyT+wx/z6XzBqECBG+tDCsbNs8mFyp+Y6XgsFPXFeRXAuglKi9Exql85GO
	5Gy6tXOYvhTBozQuXc4g8xN5v26zcUAsREkOQschZiBu8X+2s6wH+1NfF9SLcw6wpYvdmbRC5Jm
	hTNU5YoF7zBVI9Jiutu/gz34cn4XJJ1eyDpVjwc8P0IyA=
X-Google-Smtp-Source: AGHT+IGhZ172wJMCe8Y+hl9H/FCCQtSdsSpkHLmThykFWMzH/YAfrcNiqXS6r43YyTp5Eyv9aHLeZg==
X-Received: by 2002:a17:90b:1a8b:b0:343:f509:aa4a with SMTP id 98e67ed59e1d1-349a260a9d0mr7994609a91.36.1765254501596;
        Mon, 08 Dec 2025 20:28:21 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:b455:298d:48bb:1784])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b90fd5sm765185a91.10.2025.12.08.20.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 20:28:21 -0800 (PST)
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
Subject: [PATCH 2/3] omapfb: Guard sysfs code under CONFIG_FB_DEVICE
Date: Mon,  8 Dec 2025 20:27:43 -0800
Message-ID: <20251209042744.7875-3-chintanlike@gmail.com>
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

omapfb implements multiple sysfs attributes for framebuffer rotation,
overlays, and debug information. These interfaces depend on FB_DEVICE
being enabled.

This patch wraps all sysfs attribute definitions, registration, and
removal in #ifdef CONFIG_FB_DEVICE. For FB_DEVICE=n, lightweight stub
functions are provided so that the driver builds and runs without
exposing sysfs interfaces.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/Kconfig        |  2 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
index f4cdf999a080..ee664decbb64 100644
--- a/drivers/video/fbdev/omap2/omapfb/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/Kconfig
@@ -5,7 +5,6 @@ config OMAP2_VRFB
 menuconfig FB_OMAP2
 	tristate "OMAP2+ frame buffer support"
 	depends on FB
-	depends on FB_DEVICE
 	depends on DRM_OMAP = n
 	depends on GPIOLIB
 	select FB_OMAP2_DSS
@@ -13,6 +12,7 @@ menuconfig FB_OMAP2
 	select FB_IOMEM_HELPERS
 	help
 	  Frame buffer driver for OMAP2+ based boards.
+	  Selecting FB_DEVICE enables additional sysfs interfaces.
 
 if FB_OMAP2
 
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
index 831b2c2fbdf9..0a340f69484f 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -24,6 +24,7 @@
 
 #include "omapfb.h"
 
+#ifdef CONFIG_FB_DEVICE
 static ssize_t show_rotate_type(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -585,4 +586,14 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
 					&omapfb_attrs[t]);
 	}
 }
+#else
+int omapfb_create_sysfs(struct omapfb2_device *fbdev)
+{
+	return 0;
+}
+
+void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
+{
+}
+#endif
 
-- 
2.43.0


