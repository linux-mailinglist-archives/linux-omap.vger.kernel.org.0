Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E775855C805
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 14:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiF1JcN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 05:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344032AbiF1JcM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 05:32:12 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED151CFD5;
        Tue, 28 Jun 2022 02:32:11 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o4so12825693wrh.3;
        Tue, 28 Jun 2022 02:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GlTCU/pDd8z5kkonA/3Q+QsT4Z3vXQkNoVdPEKFv9qU=;
        b=KYM+NidKnuB8FoMX7BnID6f7bD+pnTyrKKveCtaPHGJOO5YhJIGPCqEhmYRZoekXMS
         olg4lXIpMALJeLAE2/0o/e+awhFtClYCPCz2lUgpXCKFokc2McMhkjLBfXpZn/OHmntb
         PNU2Z8UvT9f2t9BlLNtIDRzfX4x962DIKkypQ/Lk4X+CBetzyYEMVqj9/bFH34ze9cTj
         ixQDlc4LCitPc+C9lEpheyCQFVuRvg9o/CWbvIuO+n0IJWANHFmb9nXI+uxcc6WwP0C5
         W/gYO4tGNUvbauE59lqfi58DmSLLqaNmoWnwpbjGaYMtm3nroCVgZHwHQ3O7Kjs825/r
         3Qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GlTCU/pDd8z5kkonA/3Q+QsT4Z3vXQkNoVdPEKFv9qU=;
        b=pRXoKwP7uQ+08g/M0j1ZoTt56+f/9ez0CwRaQ3cbX5G6kQo8oPYjQeFkQG3vmQOR8c
         5JqMu6MHu+Q3JGNO0G9DK0GL4kGPl7X6+pNib7Dx4WgnCmR1NBr4nY5U0GQhYb3/UpGO
         QWoyicDxSuoGjhs8IiYNP7wxrsVJ598Q/1TeKDqFvGOvj0pmSUPIIwi8TubLjqEpm2kG
         MJIUVjKzcig+BVaV+PqjSTWIwbNBL5kDR38uHOfZf1wNeuegRIsKyzCR8bLRoemsG5fy
         ED8cQ1bX9OV0CVh5+oWWbAEghoJoqICTC3g7WYMiHKecTguzhBPZ+HUgnOJKsoqOUCNu
         k3Pg==
X-Gm-Message-State: AJIora9lyQIFy0Dyo9RUaHzAEdsYoML6ZYTEK6dED4UWGVJfeV5YYwRV
        Mh3pnq3jXN7ZO6aXG1m2/zqclGHIc6M=
X-Google-Smtp-Source: AGRyM1vZjDqg6KZB4LUjX6UnzfbiKRjAExemsh5k2lxh65teVE651z4Iwbo5who+Pu9fRB9/TeKVaw==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id v8-20020a056000144800b0021bb7dbc40bmr17278255wrx.279.1656408730424;
        Tue, 28 Jun 2022 02:32:10 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id j10-20020a5d448a000000b0021b8c99860asm13192537wrq.115.2022.06.28.02.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 02:32:10 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     linux-omap@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-mmc@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] mmc: sdhci_am654: MMC_SDHCI_AM654 should depend on ARCH_K3
Date:   Tue, 28 Jun 2022 10:32:05 +0100
Message-Id: <20220628093205.103182-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Texas Instruments sdhci_am654 SDHCI controller is only present on
TI K3 SoCs so add a dependency to reflect that, plus COMPILE_TEST.
Also update the help text to reflect the new SoC support added since
the driver was first added.

Fixes: 41fd4caeb00b ("mmc: sdhci_am654: Add Initial Support for AM654 SDHCI driver")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/mmc/host/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index d6144978e32d..6b5c4d812988 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -1073,12 +1073,13 @@ config MMC_SDHCI_OMAP
 config MMC_SDHCI_AM654
 	tristate "Support for the SDHCI Controller in TI's AM654 SOCs"
 	depends on MMC_SDHCI_PLTFM && OF && REGMAP_MMIO
+	depends on ARCH_K3 || COMPILE_TEST
 	select MMC_SDHCI_IO_ACCESSORS
 	select MMC_CQHCI
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
-	  support present in TI's AM654 SOCs. The controller supports
-	  SD/MMC/SDIO devices.
+	  support present in TI's AM62/AM64x/AM654/J721E SOCs. The
+	  controller supports SD/MMC/SDIO devices.
 
 	  If you have a controller with this interface, say Y or M here.
 
-- 
2.36.1

