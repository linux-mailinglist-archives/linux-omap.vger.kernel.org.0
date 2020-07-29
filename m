Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5AE231D24
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jul 2020 13:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgG2LDQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jul 2020 07:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgG2LC4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Jul 2020 07:02:56 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E75AC0619D2
        for <linux-omap@vger.kernel.org>; Wed, 29 Jul 2020 04:02:55 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id t23so1034170ljc.3
        for <linux-omap@vger.kernel.org>; Wed, 29 Jul 2020 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gf7cv2SFIbdtlnGIIkL7k9OE8WL9LTH6+emgR/zQp4Y=;
        b=ZLHbE57Xrx/TPW6fyBjKZ4HFPTD8aCMjiF/g9R77/NYupMLxx0EkeWq8hl66ENUsJn
         AvubfKp5u5Gv7drFCny8A1HL+Yd5qU8PG6b2Yp+6K8v0iufbi1Z1XkAG0pG1m8Y2MVN8
         s6KGiIvAnieDGi8/CFOkjP2KEUnPozZ1X7o3voWYEXDwhZd2QXKenDTQff6spCGx2rdR
         +rEF9n9gnL+Rp0fQGFDQ38POtiTNTI4QpNfbRQw34nA8z67m6VhIUFSKreBbuQdbfx4O
         cxRqko6iBR8sYfvOIK80V3I3xSbbPwJGocWUinntbJUpLAQLee9Ene5dMwcxjbR2JJWU
         HVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gf7cv2SFIbdtlnGIIkL7k9OE8WL9LTH6+emgR/zQp4Y=;
        b=iWYVe2/o1E4iZ3c7Bl8C1xmaXWUWhuqlCLTsJPXqsG1vrdqCPyVjmAndNOjdrnBg5V
         gSzqsk9dVLNekHR7s+Go634TiStpi3kb7fXokV7KigAmzHnQd0ftssT3xE7J32l2RKt5
         AM2yRrNYeJs0kk4FsKwXKrMNpFm8pHfcBitEdbxm71SFPl0hm7KLzAceSfSU5nZdr16U
         ShQvw7Jcf/Vf0o0XNgSlaF+nw2JZO6OqiRTmSz+V3yHAxOiBMJjhzXBFyOGYB8jXAJK4
         S/hRp3FtzJoJNEHsud8NaP36lVDnSm6az7Yiw/FapPYzIAeLvcNQAp0Bp+oUZ1BHmOB0
         oJCw==
X-Gm-Message-State: AOAM533XTvGRels8lLvUmWOcK0Su2TDc9BuR9bNnU9oor5iJjn+DGbHm
        Qw3HPKVHoqrklUcvBJvGilsV2Q==
X-Google-Smtp-Source: ABdhPJyitBHf4z//24bE/wVIWN+Nxe4X98g0ie3HwNXAk9SBLq5d3xt7fZLrj9T/mgXKz48baDAFMg==
X-Received: by 2002:a05:651c:319:: with SMTP id a25mr15139192ljp.272.1596020573965;
        Wed, 29 Jul 2020 04:02:53 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id e12sm329283ljk.74.2020.07.29.04.02.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2020 04:02:53 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wmills@ti.com, praneeth@ti.com
Subject: [PATCH 6/6] soc: ti: pruss: enable support for ICSSG subsystems on K3 AM65x SoCs
Date:   Wed, 29 Jul 2020 13:02:08 +0200
Message-Id: <1596020528-19510-7-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 AM65x family of SoCs have the next generation of the PRU-ICSS
processor subsystem capable of supporting Gigabit Ethernet, and is
commonly referred to as ICSSG. These SoCs contain typically three
ICSSG instances named ICSSG0, ICSSG1 and ICSSG2. The three ICSSGs are
identical to each other for the most part with minor SoC integration
differences and capabilities. The ICSSG2 supports slightly enhanced
features like SGMII mode Ethernet, while the ICSS0 and ICSSG1 instances
are limited to MII mode only.

The ICSSGs on K3 AM65x SoCs are in general super-sets of the PRUSS on the
AM57xx/66AK2G SoCs. They include two additional auxiliary PRU cores called
RTUs and few other additional sub-modules. The interrupt integration is
also different on the K3 AM65x SoCs and are propagated through various
SoC-level Interrupt Router and Interrupt Aggregator blocks. Other IP level
differences include different constant tables, differences in system event
interrupt input sources etc. They also do not have a programmable module
reset line like those present on AM33xx/AM43xx SoCs. The modules are reset
just like any other IP with the SoC's global cold/warm resets.

The existing pruss platform driver has been updated to support these new
ICSSG instances through new AM65x specific compatibles. A build dependency
with ARCH_K3 is added to enable building all the existing PRUSS platform
drivers for this ARMv8 platform.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
 drivers/soc/ti/Kconfig | 2 +-
 drivers/soc/ti/pruss.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index c290343..f5b82ff 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -103,7 +103,7 @@ config TI_K3_SOCINFO
 
 config TI_PRUSS
 	tristate "TI PRU-ICSS Subsystem Platform drivers"
-	depends on SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE
+	depends on SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE || ARCH_K3
 	select MFD_SYSCON
 	help
 	  TI PRU-ICSS Subsystem platform specific support.
diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index d5f128e..ccc9783 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -163,6 +163,7 @@ static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
 	{ .compatible = "ti,am5728-pruss" },
 	{ .compatible = "ti,k2g-pruss" },
+	{ .compatible = "ti,am654-icssg" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pruss_of_match);
-- 
2.7.4

