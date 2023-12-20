Return-Path: <linux-omap+bounces-182-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2505281A08E
	for <lists+linux-omap@lfdr.de>; Wed, 20 Dec 2023 15:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA1B9B249DA
	for <lists+linux-omap@lfdr.de>; Wed, 20 Dec 2023 14:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E6C405E0;
	Wed, 20 Dec 2023 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeVgKMHU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EE53FE3D;
	Wed, 20 Dec 2023 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33662243274so464594f8f.1;
        Wed, 20 Dec 2023 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703080794; x=1703685594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1luSLAowvvRtdMQZpU+cNi6jQOPA0wTcpry6O/W+TOQ=;
        b=WeVgKMHUcT+VWe6yjx1xpwWOU2bgzx3lWvSHAU9bo6KpjZWKlUZRc+czjAtAIq20CL
         yzZDmuKeLnvfecN4HPbVbf+ZmstRRLKS31iHxG1au/L063WVFB3RsOFE/ciHER/iuUYp
         LVC9ntI1RK3+w1sXQNmxVccwJw3zNCLB6yP+C14O5OpJbWOR/HqZdWUr5FGDZji4+ZXL
         D3C/+iaQBqyf0OYVEM9jh3DHzM8EDWMCfX0oZqxEOx+CnoWGHH9Zp2yQn7jEh39qOzrV
         wuYd0acTb8AsbBA+QItQnx+dl0dQdSSD/CY27d3jc20JofREQ2YbpC7+AhChvWkWI7qH
         O2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703080794; x=1703685594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1luSLAowvvRtdMQZpU+cNi6jQOPA0wTcpry6O/W+TOQ=;
        b=BBrXJCJYD9ChpCzEstu8z8SgAeuQjY2iterWNAzGlO0MDmQeCk8lXJSfNWg3MbvFQF
         IVrNE+iL2K2y//8FVHtBb+N3pf5EL4syDN/bGNz30T3RlPfAt/AIUylWW4xr9Zkhsw1+
         mkoRaLCidMbBdbSyHidWkAE6czrcKO6ihVo9GeD/Yq0Ot9s7gdCuBebARhQXZsYwRd0V
         FmtK6rNCUO0UaUIdSb0zOkwX654HE9rilfkRB46F1Qsvn1IZG1DJh9XR9LJFOqbhmeIl
         G0mAgDyYZ8DqCVLZkKbMhTlaj8tV3hhUfv0DYmgFTsYIdR9D6Ra4sZcvJyWsegvoetHm
         cPYA==
X-Gm-Message-State: AOJu0Yw9C0939cDUKGq7g4YlawEn/dGR9Hr/ezesPKdoHfABt2Yx67E4
	JMKLdjMOQZdwJRvDSUfTyBg=
X-Google-Smtp-Source: AGHT+IHZLxcIpS9u3riJAcmw8sb3s9Qg9hXaZW5mKtW8ORqAOpWEK+tYa/PBN9psW/5xtADJlENvhw==
X-Received: by 2002:a05:600c:3798:b0:40d:3141:8086 with SMTP id o24-20020a05600c379800b0040d31418086mr830531wmr.101.1703080793927;
        Wed, 20 Dec 2023 05:59:53 -0800 (PST)
Received: from morpheus.home.roving-it.com (2.1.9.e.d.3.3.1.6.1.e.d.5.3.a.e.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:ea35:de16:133d:e912])
        by smtp.googlemail.com with ESMTPSA id t3-20020a05600c450300b0040c4acaa4bfsm7513588wmo.19.2023.12.20.05.59.53
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
Subject: [PATCH 2/2] mmc: sdhci_omap: Fix TI SoC dependencies
Date: Wed, 20 Dec 2023 13:59:47 +0000
Message-ID: <20231220135950.433588-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220135950.433588-1-pbrobinson@gmail.com>
References: <20231220135950.433588-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdhci_omap is specific to  older TI SoCs, update the
dependencies for those SoCs and compile testing. While we're
at it update the text to reflect the wider range of
supported TI SoCS the driver now supports.

Fixes: 7d326930d352 ("mmc: sdhci-omap: Add OMAP SDHCI driver")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/mmc/host/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 24ce5576b61a..81f2c4e05287 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -1026,14 +1026,15 @@ config MMC_SDHCI_XENON
 
 config MMC_SDHCI_OMAP
 	tristate "TI SDHCI Controller Support"
+	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM && OF
 	select THERMAL
 	imply TI_SOC_THERMAL
 	select MMC_SDHCI_EXTERNAL_DMA if DMA_ENGINE
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
-	  support present in TI's DRA7 SOCs. The controller supports
-	  SD/MMC/SDIO devices.
+	  support present in TI's Keystone/OMAP2+/DRA7 SOCs. The controller
+	  supports SD/MMC/SDIO devices.
 
 	  If you have a controller with this interface, say Y or M here.
 
-- 
2.43.0


