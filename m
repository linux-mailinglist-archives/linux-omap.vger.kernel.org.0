Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C682424D79D
	for <lists+linux-omap@lfdr.de>; Fri, 21 Aug 2020 16:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgHUOpW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Aug 2020 10:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbgHUOof (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Aug 2020 10:44:35 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407C7C06179F
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:34 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g6so2109954ljn.11
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OsJasaQyy7/E+kPEpA8PlFznj7k6c2w5j5pqgaCetRA=;
        b=tnmSau2zUkTpgpUzOkknDCLR9TWzijsVx7GOYiahq4Ohc031GC427oYP5lnbTSJAMK
         22fIY12Q77SJlGbp8+yLmrvZHhI8z3A5WiPPMAMQnpk+nf/q22aD5KnirywVU8dlHime
         d3/uEdm2pvtNJhWs5lSfN1F8p7/TCzrEOFem8u7326iPcdfRxudvh/ehrEUoCrqAn2+p
         TgimM2cnB5klT3KSzAWKLpiAvkGPLjFLzJEU3kJ9Lg02GGAEvgkamtbsxWUIQpFSUY5t
         0KxIiBC6REcvToucSJ/BUnE2dRwkT1XZykuBYFXt1CDQmtukt7yC9yseK7elwufxljPG
         Y9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OsJasaQyy7/E+kPEpA8PlFznj7k6c2w5j5pqgaCetRA=;
        b=U+aYEPmtHZTyT+gNYNR4ZGIedNfHZfpcQG/QykrrAzp57+QGbFZGkzt76qX47j9046
         VhPf5VqpNXjMAdh9vEB8vqWB9IxXpqLv12AIL2yf/eJHDGzFAQAm96+T9NvoKmsKqRWW
         rie8VQvJmG6FJql6Mf0UyxJMvXLOMrMKIUW5QyEpkMFYFIR+FvSSSYl9ZKcPmEX7Gov0
         bTIKFrlmzVbdb5RfFVUG34jTddmhxYn5Cmf3IV6n6fnPp8lkdbnzz5F0N/BZEVQFDBtF
         kzv4iXe4WfaBk3F9tcaEZzhtJQnyXO4/GSeeQXZ/+zl16QkKTiotYUL8rVqpCcpKbGbD
         lx8Q==
X-Gm-Message-State: AOAM5338mklqLIcpOtZVok6Siqzb16T7GSudPtVou+PWdm4+pKNykWCN
        HENTvPDEWAgqFlvD47kujC1OPQ==
X-Google-Smtp-Source: ABdhPJwXsAlyqcJbQaNTiBtkdJNTdJaLN5zakF9xvRHIj687NR42OvYQqWGEycOsw/SSIKxnzRVS0g==
X-Received: by 2002:a2e:95cc:: with SMTP id y12mr1581561ljh.138.1598021072622;
        Fri, 21 Aug 2020 07:44:32 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:32 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com
Subject: [PATCH v2 6/7] soc: ti: pruss: Enable support for ICSSG subsystems on K3 AM65x SoCs
Date:   Fri, 21 Aug 2020 16:42:43 +0200
Message-Id: <1598020964-29877-7-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
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
v1->v2:
 - No changes.
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

