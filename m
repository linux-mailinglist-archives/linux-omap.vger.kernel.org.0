Return-Path: <linux-omap+bounces-352-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF4838D1E
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jan 2024 12:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5A0928211A
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jan 2024 11:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B96C5C917;
	Tue, 23 Jan 2024 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="WoZgZuNK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A844E1A2
	for <linux-omap@vger.kernel.org>; Tue, 23 Jan 2024 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706008507; cv=none; b=NU0EwcMIvaMC9d+qyaTDkM7g2o1S+HhBlJyqe9gVMOPhUDlyIBehmx5TR9tafPSSQkORCNsm5MHe8YQsyj017DULsdXeYTzwIGsT37d+z818bRZFg9zI9ljDka/IWv9BnPGym6u8VgEwzut2Eylp5TSXZLd/MQeHhLC7/CpQgpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706008507; c=relaxed/simple;
	bh=WFZGJmdSQMFKC+BowbbWmamOzaAd21in/OqCQbgCD1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VNQ28jlnAJksrk+EzRH9M0N/ItRgRr8MCXdBWvShUiUi5rKvyKxRBXkFyLzxSZBg04u5e6wvDpRVdROfYAigpO/iv7VdCw6zZuLE3foFBpQZxbe/2v497OEioNGH3jK0vN5VVg+1RiN0UhuVJR5W9x2tsZYm4dGoKLjTNpRK2Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=WoZgZuNK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40eb2f3935eso9486365e9.2
        for <linux-omap@vger.kernel.org>; Tue, 23 Jan 2024 03:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706008503; x=1706613303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7oVnqcTICZX3fLTf+T67B/JrEVZpFEzkZPYwJisg83A=;
        b=WoZgZuNKB8AQFkDLJAqBEcAld7WitNVZAsJsl7eaN+rAgRP960xBBP4Bn8bfoWtMK2
         yKA0TompxQrL4pv7CEAWgmJX8BjNPBtrfprz7l51cIk6n0cx71ZWM5AZDJf8hd0bEE91
         1Opd00+QEI5WM3ilg/tDwDm5MLdfYz33adR8C4FWMXcSCvR0fbzKtPBVpl0dWnCjSTwk
         I3oI659x71fj+WHePP8TwV341JenFk2OQfJdf139uJnupimPaRZZLxTMCXjhZhvsaVOt
         yHxgrWRt1+AnRYLU9R4XWBJ6KW3Y2aML+057ZHuLbh5lzjIfiC/SIQ0pQhpGI1Vnmfeb
         TQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706008503; x=1706613303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oVnqcTICZX3fLTf+T67B/JrEVZpFEzkZPYwJisg83A=;
        b=VqVlsW2skuMZ3LFlJITRit5mxJnkdFVj7RkpVYnuXkv2xGzrTUJb+qkGBqkfBYBFd6
         pPaeHhwfQQnw8e4EwCwx5x9W8eS2/s3DHUmGI+qAVzxoNrjZI95sxu3UQsi50TlXcFO2
         4uIW3vMYhvOK3DSVcACDMXA+Rjde4ISnWzdB9U0/GQB0cnPHmbS0W53YSN/lscQwI0Nh
         TprIPFJQ7qCpLCZpwU12FTWmZcF/sG+Vof7Vv2L6wS994dhWKwzSPa+8U/sCHRVI8mR0
         3Qdr/mnNRkU2MiHtVkXbC4VVtqIYOIKmAAN8yXlzRpk4D6/JM2QjPKnvfS5Ql6uz9m8O
         7a7A==
X-Gm-Message-State: AOJu0YyQcOe9V9WnA3olqOIChG7FVNLwgqVhkOFl0V1uDUB5V6Xt6mZL
	WwSpHD4KPuA7IeC/0++cWJOluII86KmnryfaSGaz7KfjFlQ05uVwxifrrD+pvOw=
X-Google-Smtp-Source: AGHT+IEsMF4IKcef68K89OWsOempUDLG9nhBgJ6m3fMDfcbJGEDDc5ILFO3fyiXC/f9U0QjIqcy23Q==
X-Received: by 2002:a05:600c:470d:b0:40e:a5b8:a27a with SMTP id v13-20020a05600c470d00b0040ea5b8a27amr430945wmo.106.1706008503003;
        Tue, 23 Jan 2024 03:15:03 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id jg1-20020a05600ca00100b0040d4e1393dcsm45497866wmb.20.2024.01.23.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 03:15:02 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: tony@atomide.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	Romain Naour <romain.naour@skf.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2] regulator: ti-abb: don't use devm_platform_ioremap_resource_byname for shared interrupt register
Date: Tue, 23 Jan 2024 12:14:56 +0100
Message-ID: <20240123111456.739381-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

We can't use devm_platform_ioremap_resource_byname() to remap the
interrupt register that can be shared between
regulator-abb-{ivahd,dspeve,gpu} drivers instances.

The combined helper introduce a call to devm_request_mem_region() that
creates a new busy resource region on PRM_IRQSTATUS_MPU register
(0x4ae06010). The first devm_request_mem_region() call succeeds for
regulator-abb-ivahd but fails for the two other regulator-abb-dspeve
and regulator-abb-gpu.

  # cat /proc/iomem | grep -i 4ae06
  4ae06010-4ae06013 : 4ae07e34.regulator-abb-ivahd int-address
  4ae06014-4ae06017 : 4ae07ddc.regulator-abb-mpu int-address

regulator-abb-dspeve and regulator-abb-gpu are missing due to
devm_request_mem_region() failure (EBUSY):

  [    1.326660] ti_abb 4ae07e30.regulator-abb-dspeve: can't request region for resource [mem 0x4ae06010-0x4ae06013]
  [    1.326660] ti_abb: probe of 4ae07e30.regulator-abb-dspeve failed with error -16
  [    1.327239] ti_abb 4ae07de4.regulator-abb-gpu: can't request region for resource [mem 0x4ae06010-0x4ae06013]
  [    1.327270] ti_abb: probe of 4ae07de4.regulator-abb-gpu failed with error -16

From arm/boot/dts/dra7.dtsi:

The abb_mpu is the only instance using its own interrupt register:
  (0x4ae06014) PRM_IRQSTATUS_MPU_2, ABB_MPU_DONE_ST (bit 7)

The other tree instances (abb_ivahd, abb_dspeve, abb_gpu) share
PRM_IRQSTATUS_MPU register (0x4ae06010) but use different bits
ABB_IVA_DONE_ST (bit 30), ABB_DSPEVE_DONE_ST( bit 29) and
ABB_GPU_DONE_ST (but 28).

The commit b36c6b1887ff ("regulator: ti-abb: Make use of the helper
function devm_ioremap related") overlooked the following comment
implicitly explaining why devm_ioremap() is used in this case:

  /*
   * We may have shared interrupt register offsets which are
   * write-1-to-clear between domains ensuring exclusivity.
   */

Fixes and partially reverts commit b36c6b1887ff ("regulator: ti-abb:
Make use of the helper function devm_ioremap related").

Improve the existing comment to avoid further conversion to
devm_platform_ioremap_resource_byname().

Fixes: b36c6b1887ff ("regulator: ti-abb: Make use of the helper function devm_ioremap related")
Signed-off-by: Romain Naour <romain.naour@skf.com>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
v2: improve commit log and update comment preventing further conversion
to devm_platform_ioremap_resource_byname().
---
 drivers/regulator/ti-abb-regulator.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/ti-abb-regulator.c b/drivers/regulator/ti-abb-regulator.c
index f48214e2c3b4..04133510e5af 100644
--- a/drivers/regulator/ti-abb-regulator.c
+++ b/drivers/regulator/ti-abb-regulator.c
@@ -726,9 +726,25 @@ static int ti_abb_probe(struct platform_device *pdev)
 			return PTR_ERR(abb->setup_reg);
 	}
 
-	abb->int_base = devm_platform_ioremap_resource_byname(pdev, "int-address");
-	if (IS_ERR(abb->int_base))
-		return PTR_ERR(abb->int_base);
+	pname = "int-address";
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, pname);
+	if (!res) {
+		dev_err(dev, "Missing '%s' IO resource\n", pname);
+		return -ENODEV;
+	}
+	/*
+	 * The MPU interrupt status register (PRM_IRQSTATUS_MPU) is
+	 * shared between regulator-abb-{ivahd,dspeve,gpu} driver
+	 * instances. Therefore use devm_ioremap() rather than
+	 * devm_platform_ioremap_resource_byname() to avoid busy
+	 * resource region conflicts.
+	 */
+	abb->int_base = devm_ioremap(dev, res->start,
+					     resource_size(res));
+	if (!abb->int_base) {
+		dev_err(dev, "Unable to map '%s'\n", pname);
+		return -ENOMEM;
+	}
 
 	/* Map Optional resources */
 	pname = "efuse-address";
-- 
2.43.0


