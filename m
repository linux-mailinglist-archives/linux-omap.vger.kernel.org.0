Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60685F10D8
	for <lists+linux-omap@lfdr.de>; Fri, 30 Sep 2022 19:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbiI3R3S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Sep 2022 13:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbiI3R3A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Sep 2022 13:29:00 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F4F1C5C8B
        for <linux-omap@vger.kernel.org>; Fri, 30 Sep 2022 10:28:39 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u10so7738584wrq.2
        for <linux-omap@vger.kernel.org>; Fri, 30 Sep 2022 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=udUbQ+1obdJHz0cNtfdA+qf3/bqQhChlbdPQ4dYxXqw=;
        b=vOX431yMJ2kXB0H34KHaSrROuD5cceT8cYtdInWKv7JjDFQmVX+zL40HEbqOH7ad40
         LsLJJ/CaYxKbjtb5EhhhZcqHTvJh03EASdD4vvMDUsMsqa+J0FaPUwASk19v1IIckoJo
         kW3xdkUpLZ8NXwnu0gw3Z1BnSlDvI16jNjvy+T2RUeLbHxUjuyjE4Nj0ujen1SCwvKSe
         mpSwsLGdAeQTxkTFuEQ95AMiqdW2ren9Gd+efl0f5hyGywH/3TRBh8JTP/aZ5fj0BHj4
         fctkXeoB+VDLlxZ5KooxhwKWeMSxpi5ZW1JpePueZpRYpLj+2aqyfbD27UBVolSQbKFm
         7M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=udUbQ+1obdJHz0cNtfdA+qf3/bqQhChlbdPQ4dYxXqw=;
        b=QXnTDZSvgB/5Q5qIZaNsy/eHNO7XMlB8cPT8tlNzI2wHDIk+uiYCtVtvV5wuLKj5+x
         NurEzE69TfSseaAaE8S9Cwkp72Dh0fSdNppVW1g7yr+dL7bbofVB6VWWD9Xe2vzL6f/i
         ILjKAKEubnSx82x1/R7mey6Tjw/IuTVbZI2w1JLtC4BcqA/v1DC3HwjVru3KDA9Z6oBC
         2UC0xy2OjMC/NvB15+DSk9nEiJeMovEhjvbkI5LE+7aflNWGMPaQSJ9H8i6uu0ohZe6V
         IH5MShSIBPkL7ndsiAukdvrRZg+cdMGBFbTnBkUTuzOx0MGMalZ0e3VmlNMtCKmv911z
         VRGg==
X-Gm-Message-State: ACrzQf1kxF/vMUThMMlxciezrnm+FcE1ya0DBKvju+Eto14RQBJ8kW7N
        I/KCyBfsdSCWoQZQpUxu7r2SAsuQcETOiyiR
X-Google-Smtp-Source: AMsMyM5z0aIR4tqJnzY+7kYVsz/PbqXsfeoXI2uj0g4xirdZr0rAyy8DDQNjLP2adf2sS4YbCpnh9g==
X-Received: by 2002:a05:6000:68c:b0:22a:bde3:f8cc with SMTP id bo12-20020a056000068c00b0022abde3f8ccmr6370777wrb.556.1664558918274;
        Fri, 30 Sep 2022 10:28:38 -0700 (PDT)
Received: from nicolas-Precision-3551.home ([2001:861:5180:dcc0:1a56:87a1:b5b8:453b])
        by smtp.gmail.com with ESMTPSA id bv14-20020a0560001f0e00b0022ae8b862a7sm2525407wrb.35.2022.09.30.10.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:28:38 -0700 (PDT)
From:   Nicolas Frayer <nfrayer@baylibre.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
        glaroque@baylibre.com, granquet@baylibre.com,
        Nicolas Frayer <nfrayer@baylibre.com>
Subject: [PATCH 2/2] soc: ti: Add module build support
Date:   Fri, 30 Sep 2022 19:28:10 +0200
Message-Id: <20220930172810.199758-3-nfrayer@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930172810.199758-1-nfrayer@baylibre.com>
References: <20220930172810.199758-1-nfrayer@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Added module build support for the TI K3 SoC info driver.

Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
---
 arch/arm64/Kconfig.platforms |  1 -
 drivers/soc/ti/Kconfig       |  3 ++-
 drivers/soc/ti/k3-socinfo.c  | 11 ++++++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 74e9e9de3759..85e645c6ab40 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -131,7 +131,6 @@ config ARCH_K3
 	select TI_SCI_PROTOCOL
 	select TI_SCI_INTR_IRQCHIP
 	select TI_SCI_INTA_IRQCHIP
-	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC
 	  architecture.
diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 7e2fb1c16af1..bc55f977f032 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -74,7 +74,8 @@ config TI_K3_RINGACC
 	  If unsure, say N.
 
 config TI_K3_SOCINFO
-	bool
+	tristate "TI K3 SoC info driver"
+	default m
 	depends on ARCH_K3 || COMPILE_TEST
 	select SOC_BUS
 	select MFD_SYSCON
diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index a29f5a23395f..ee22bb886b8f 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
+#include <linux/module.h>
 
 #define CTRLMMR_WKUP_JTAGID_REG		0
 /*
@@ -141,6 +142,7 @@ static const struct of_device_id k3_chipinfo_of_match[] = {
 	{ .compatible = "ti,am654-chipid", },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, k3_chipinfo_of_match);
 
 static struct platform_driver k3_chipinfo_driver = {
 	.driver = {
@@ -151,8 +153,7 @@ static struct platform_driver k3_chipinfo_driver = {
 	.remove = k3_chipinfo_remove,
 };
 
-static int __init k3_chipinfo_init(void)
-{
-	return platform_driver_register(&k3_chipinfo_driver);
-}
-subsys_initcall(k3_chipinfo_init);
+module_platform_driver(k3_chipinfo_driver);
+
+MODULE_DESCRIPTION("TI K3 SoC info driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

