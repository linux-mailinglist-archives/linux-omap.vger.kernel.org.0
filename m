Return-Path: <linux-omap+bounces-3378-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 057F5A5DC6E
	for <lists+linux-omap@lfdr.de>; Wed, 12 Mar 2025 13:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3DE2189792B
	for <lists+linux-omap@lfdr.de>; Wed, 12 Mar 2025 12:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2489F23F39F;
	Wed, 12 Mar 2025 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLhzbbYI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A01D63FF
	for <linux-omap@vger.kernel.org>; Wed, 12 Mar 2025 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781852; cv=none; b=o/SYDug7BIUjdjmyx3TUtezrVNNAUW67BVJ4UbjdM6IoUGB17NJlWeQtcafZOFvdQdSMEOWI//xJqAHLMx8HANtXBfgxdYYK4RoU21CuaDJ5wPEZqy5gMjIaZF+fOdAQrUpMvitwjLTAEQYfVrmA4qEUU49hdkkT+adqAyWviP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781852; c=relaxed/simple;
	bh=rdXkNKeXWew4xzAG4PBwkY6uv6kSEtbnc7+M+xTZvM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTv6VGAHoPWd2UoCfYVE7kfguVqK5fuNgi8BIAOm5sELQhzvdtZoYY28y5TyVxzrXFdIbecBV6A3EAUiF9fBoslIvvDyyKvJ0VHlwEHCafvcQ/U5c72fJndM/2e1FTFbqJ8rCGhVF9VwJjC7wG1nWHaIz4v4NFjRrw9j+qH4fo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLhzbbYI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5497590ffbbso7385333e87.1
        for <linux-omap@vger.kernel.org>; Wed, 12 Mar 2025 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741781849; x=1742386649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++pmmtfiHftyIXzbe5IYh4I8mfHiSJ9y8MZc6wxAQdI=;
        b=sLhzbbYIK8Jc9gW52WOYfpfaQvCXkQ9NOebS41of+TlLpKOd5NBfBnfOpX1rZOzNFr
         mty0bYN8PG393RfAo/n0qukvRTDIPsD3kjudRUB9B7mP4E38iT0kvNNLjiRBOlf/j90F
         myw+YKrg9qQeZbfIZ4Zpp4Kb3WqozAewElCa+SmqsHOFHYCwgb+pVTUqW8cXuU2V2ZI/
         6hcrO9iXTadlk8B3MfZXc9i1Xg9qZqn2j5WUiybnrhFwSYrT8ted0c6svbpki6R46r5O
         VRM1qJkUvFeLVOP3nKl3zvmDWs7uZKYFRqkUNJ/Z7vva87ah09dIZjzgjWhFRmZU12yO
         5HWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741781849; x=1742386649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++pmmtfiHftyIXzbe5IYh4I8mfHiSJ9y8MZc6wxAQdI=;
        b=rPxhLCkI1I0NFpmodd/z8QN8ryEE6gg+S/KMe8OT7uD3YupBIVlbDKU3b0tedxfwLk
         nlA4D620kLOHCd2OOlY6J8gH9MnmkvTzk1Z+9sBeIMAD8cZPyOZzfuB8CObQsL8M0UWP
         v7cs/2/TDAxo3x1m9j5fml7nZ/QcR2LczT5pv4ps15H9pKdH7bDmwc4Nzuz2NvCL6bCR
         4xvhR5J6Bb4hOj11sIu9mWwithdzTzauTp1oUpq3EsCIoZzwdpowJGet+/MCPfPnw0TZ
         +bOERvxO3K7cdH7yiU7nBCiHCVgI11C3FJ5gGUZdoWyhXBbQzEZbFpDOg3dK5G85YBLQ
         7sZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXThJc1+yiwWPMYYYmWX13DaVI3REdNiAFnhZL7kLhOyDMAESAYTyQAXV9L7RRCk+pClTD3xjhXiCIU@vger.kernel.org
X-Gm-Message-State: AOJu0YwRYg2/Z40H8dKOm6Z5ibtVvXsfnzeYtlADTnpBCqSiVUdwjJ3F
	NAcCR5lAfm6AtHfXjyqB3hq1T8pHVwd+bminr9ItQ0RpH/9yu8sG9uCmCL8NFBs=
X-Gm-Gg: ASbGncs3RueGCoYKuCu6kBvZZYFlvHweyeVVwVKYSIg2pmRHXRL2thWDNk0ChV517xt
	UgFd/JlsPSqEkP+Vj5N7oefLHMX5XH+vRqMQ9Ac1oyzSnLT3s4W70aYy5pWZIASEX/2lx4D3xfe
	zxywbywg4ysQMACHvYfyndFIubkfpFQxDOFnN+16gW02SKNDE8uBEso5sWesAfgWLciLVkUN1eT
	5h53RfLU/gcl1wJo6mBJmI/Lv9GA4rsuzBY+RAQTE0do+bx7C7sCCcvseKJvmQOI6OukB7F69UB
	0KPlqPcRcG/KB/oJ1Q+KNcs5IHrKjt1/cJU9VMYnmvUaSsx0UvNpzOfW+2LAtxRmtMrBIDECsxf
	UcC/U5CE9dyyUWDNRLJo=
X-Google-Smtp-Source: AGHT+IGnwuT9UHbasvv/nBdAIly8F0nWcdTRH3MqDpJZ5s98EGwTiAiir5kSAZQLl8Y3LblOfs03WQ==
X-Received: by 2002:a05:6512:1255:b0:549:38d2:f630 with SMTP id 2adb3069b0e04-54990e66e97mr8347422e87.24.1741781849005;
        Wed, 12 Mar 2025 05:17:29 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae46261sm2102082e87.27.2025.03.12.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:17:27 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tony Lindgren <tony@atomide.com>,
	David Owens <daowens01@gmail.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Romain Naour <romain.naour@smile.fr>,
	Andrei Aldea <andrei@ti.com>,
	Judith Mendez <jm@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mmc: sdhci-omap: Disable MMC_CAP_AGGRESSIVE_PM for eMMC/SD
Date: Wed, 12 Mar 2025 13:17:12 +0100
Message-ID: <20250312121712.1168007-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have received reports about cards can become corrupt related to the
aggressive PM support. Let's make a partial revert of the change that
enabled the feature.

Reported-by: David Owens <daowens01@gmail.com>
Reported-by: Romain Naour <romain.naour@smile.fr>
Reported-by: Robert Nelson <robertcnelson@gmail.com>
Tested-by: Robert Nelson <robertcnelson@gmail.com>
Fixes: 3edf588e7fe0 ("mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM")
Cc: stable@vger.kernel.org
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/sdhci-omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 54d795205fb4..26a9a8b5682a 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1339,8 +1339,8 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	/* R1B responses is required to properly manage HW busy detection. */
 	mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
-	/* Allow card power off and runtime PM for eMMC/SD card devices */
-	mmc->caps |= MMC_CAP_POWER_OFF_CARD | MMC_CAP_AGGRESSIVE_PM;
+	/*  Enable SDIO card power off. */
+	mmc->caps |= MMC_CAP_POWER_OFF_CARD;
 
 	ret = sdhci_setup_host(host);
 	if (ret)
-- 
2.43.0


