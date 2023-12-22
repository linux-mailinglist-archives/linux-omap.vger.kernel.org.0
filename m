Return-Path: <linux-omap+bounces-190-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5781CD32
	for <lists+linux-omap@lfdr.de>; Fri, 22 Dec 2023 17:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 104DA2812C9
	for <lists+linux-omap@lfdr.de>; Fri, 22 Dec 2023 16:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FBA24B49;
	Fri, 22 Dec 2023 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="QkHeO8Iz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE324B38
	for <linux-omap@vger.kernel.org>; Fri, 22 Dec 2023 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3367a304091so1836533f8f.3
        for <linux-omap@vger.kernel.org>; Fri, 22 Dec 2023 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1703263038; x=1703867838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wbrJvh9lIxoYGsydKb1lH+eTos4Oj21/sKAWbJl6tRk=;
        b=QkHeO8Iz8i8acCN4oC0amm6vh7MtD4fiGOUCj1G6TxT1mIFXMxpPehlm8CalttGbwg
         KFQwgS9tvdZaQ9b5qTo8cx9+w40QPcPfJCIHNMPpRYip6tfnsWOo/0njaYKDU05naNjT
         IvyPL3qr6NJWa50CglTTFwXCOjKhpVa/wPFgohr5f1nyVOsa4ECEEMVwEZNVT5FsHd+D
         +Je/1QZGv2AH7287BfP3aFdq4ejoeOLwr1rNmnPg8uxsKaU7sUkvWHvEh5xKmeLvsSHG
         rD41Q7SziDDRFxJxFq6afYcQuCa9lfI6Z4eGOEOWjwiJGcyV6lrCNNqtC8W16UtsGA+j
         luUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703263038; x=1703867838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbrJvh9lIxoYGsydKb1lH+eTos4Oj21/sKAWbJl6tRk=;
        b=flsN0qn43dZf8aPh/IC14p/1ZcujH4wZbejcxSdTxOHEhMjNIPGUmtjXhkFpc9RS0q
         2EF58a1+ltnNRqHNPYHbI65e2vKo3FmcqI9i+JQu92dCVyVIfKktcAaT5XsWpbUBM5or
         HDTkdDr8wqwat8MXb+KKEec3UXx7DC7aFMPk4232z/RZUe/EbbU4cPKiRzg11+61JFQE
         opUw9IrHpKjloV0s+78G2LGVt6VUGXcKly2rKOSVWWqbwaDjk3GHl+GyRlzgQ7zQE2tZ
         YWGosULdStgu577R2dDF5rMIqzUaT4hBkMtGAeDzUtsuN8uwMi6ctRQgO//RHmVElObb
         1cMQ==
X-Gm-Message-State: AOJu0YwQBTb+0v9A/PHOQjALO4v1EHBT95obPoqqVBkgK3uqt/9jyw/v
	VgBVtoPKQ/yyLX5QXQBf+1gu4DGALTWsOw==
X-Google-Smtp-Source: AGHT+IEAbLqJO6ESoIO27y2wCcaU7N1Fa3mcz15DestwywoCM/H9DZYkVt4q8w5KBzUYbCY+rklUFg==
X-Received: by 2002:a05:6000:18a:b0:336:8488:f41a with SMTP id p10-20020a056000018a00b003368488f41amr676705wrx.139.1703263038478;
        Fri, 22 Dec 2023 08:37:18 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id q21-20020adfb195000000b0033674734a58sm4757397wra.79.2023.12.22.08.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 08:37:18 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: tony@atomide.com,
	linux-omap@vger.kernel.org
Cc: Romain Naour <romain.naour@skf.com>
Subject: [PATCH] bus: ti-sysc: Fix error handling for sysc_check_active_timer() again
Date: Fri, 22 Dec 2023 17:37:10 +0100
Message-ID: <20231222163710.215362-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

sysc_check_active_timer() has been introduced by 6cfcd5563b4f
("clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4")
and initially returned -EBUSY to ignore timers tagged with no-reset
and no-idle.

But the return code has been updated from -EBUSY to -ENXIO by
65fb73676112 ("bus: ti-sysc: suppress err msg for timers used as clockevent/source")
and introduced a regression fixed by 06a089ef6449
("bus: ti-sysc: Fix error handling for sysc_check_active_timer()")
since sysc_probe() was still checking for -EBUSY.

Finally the sysc_check_active_timer() return code was reverted
back to -EBUSY by a12315d6d270
("bus: ti-sysc: Make omap3 gpt12 quirk handling SoC specific") except
for SOC_3430.

Now sysc_check_active_timer() may return ENXIO for SOC_3430 and
EBUSY for all other SoC.

But sysc_probe() still check for -ENXIO leading to the following
errors in dmesg on AM57xx:

ti-sysc: probe of 4ae18000.target-module failed with error -16 (timer1_target)
ti-sysc: probe of 4882c000.target-module failed with error -16 (timer15_target)
ti-sysc: probe of 4882e000.target-module failed with error -16 (timer6_target)

Fix this by checking for both error code...

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
 drivers/bus/ti-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index d57bc066dce6..0c6d5e3d5dc7 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3314,7 +3314,7 @@ static int sysc_probe(struct platform_device *pdev)
 		return error;
 
 	error = sysc_check_active_timer(ddata);
-	if (error == -ENXIO)
+	if ((error == -ENXIO) || (error == -EBUSY))
 		ddata->reserved = true;
 	else if (error)
 		return error;
-- 
2.43.0


