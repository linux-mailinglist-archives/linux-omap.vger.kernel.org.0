Return-Path: <linux-omap+bounces-181-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7C181A08C
	for <lists+linux-omap@lfdr.de>; Wed, 20 Dec 2023 15:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 404811C2353F
	for <lists+linux-omap@lfdr.de>; Wed, 20 Dec 2023 14:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42472405CA;
	Wed, 20 Dec 2023 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKHZDJnn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C16D3FE2B;
	Wed, 20 Dec 2023 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so61872465e9.3;
        Wed, 20 Dec 2023 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703080793; x=1703685593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E0iVmziROlq72RMXzu834ciMgyzu2aToyegIGJ3TFKw=;
        b=MKHZDJnnIv4a9okH/DSijf+tTeafAxTba5nSnHr0Fxpt675o0uvTDFE4QAeK2qp9HG
         aHPWCir+63NR28bwOmtuQUZyJr5rYJn7yoUU/J3nk9FuBEg0MzPmm+UJF5xUJYue2z30
         gXZKNtEHL/VwsGoeAnZ0Dch1stIudgWWsqA4ANei+y+bz981Yg/Ox1iPREiv1nbcSf4j
         G/wRlsF8WjNpooTiEYZaofINQnKT1QOTYea/UghzU7ZYCfzwzaW35/1z/yjxqgsYf7Kd
         qIm8kwJLuf4EXPy3wXsxZNI1YATnEBV6FeclrWbqfe9U9sXJcMoq/SAmEqHmQNoVjXup
         Kh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703080793; x=1703685593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0iVmziROlq72RMXzu834ciMgyzu2aToyegIGJ3TFKw=;
        b=mgH+/uizanv8Upkr43J0Uc+Egv7kV5swSdZJ8bkJU6YBIDCv6Fl5/13xliDCKLKVVy
         Wgraw2HaT1vrl+hYww8ZCRV9kilKFxHAfAAivn/v8fxDwG5XPDDaqlbLTCKcqaR4X1A/
         CD+qJQGkIHNyj0e5qAGuu/FiBXmp+XKcx/9KVpCh312CZuj0of9Jb2/y6iIQXTKg/2S9
         Yk/zOR/pmzILp1sIUKHb6wZvANNlBmf4dd7/mnTA05Sdk/298gC/0xFihIMU6P1g/Yz2
         dyZ4zuUcHqqBya9nFluV625qVdz9ryIri1OYK6h6r4RZ+O/NTsqlsYUq6QRFdorf/v8p
         iETw==
X-Gm-Message-State: AOJu0YwgAf5u9n8EfZEODMzzox981pHwygKm88EILLd5wIpziW28ti0E
	DDTFWd4x/J89C8EaF2wpDXM=
X-Google-Smtp-Source: AGHT+IF7nMAj8DT2uFwVeQAmhgwNYP1xh1ISAnPqTCZQung9/18pW22fFH48zFNaszExOhgsp4hrgQ==
X-Received: by 2002:a7b:cbd4:0:b0:40c:317b:a3fb with SMTP id n20-20020a7bcbd4000000b0040c317ba3fbmr9729581wmi.117.1703080793362;
        Wed, 20 Dec 2023 05:59:53 -0800 (PST)
Received: from morpheus.home.roving-it.com (2.1.9.e.d.3.3.1.6.1.e.d.5.3.a.e.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:ea35:de16:133d:e912])
        by smtp.googlemail.com with ESMTPSA id t3-20020a05600c450300b0040c4acaa4bfsm7513588wmo.19.2023.12.20.05.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 05:59:53 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Faiz Abbas <faiz_abbas@ti.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-mmc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 1/2] mmc: sdhci_am654: Fix TI SoC dependencies
Date: Wed, 20 Dec 2023 13:59:46 +0000
Message-ID: <20231220135950.433588-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdhci_am654 is specific to recent TI SoCs, update the
dependencies for those SoCs and compile testing. While we're
at it update the text to reflect the wider range of
supported TI SoCS the driver now supports.

Fixes: 41fd4caeb00b ("mmc: sdhci_am654: Add Initial Support for AM654 SDHCI driver")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/mmc/host/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 58bd5fe4cd25..24ce5576b61a 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -1041,14 +1041,15 @@ config MMC_SDHCI_OMAP
 
 config MMC_SDHCI_AM654
 	tristate "Support for the SDHCI Controller in TI's AM654 SOCs"
+	depends on ARCH_K3 || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM && OF
 	select MMC_SDHCI_IO_ACCESSORS
 	select MMC_CQHCI
 	select REGMAP_MMIO
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
-	  support present in TI's AM654 SOCs. The controller supports
-	  SD/MMC/SDIO devices.
+	  support present in TI's AM65x/AM64x/AM62x/J721E SOCs. The controller
+	  supports SD/MMC/SDIO devices.
 
 	  If you have a controller with this interface, say Y or M here.
 
-- 
2.43.0


