Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB2924D79B
	for <lists+linux-omap@lfdr.de>; Fri, 21 Aug 2020 16:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgHUOpW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Aug 2020 10:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgHUOoc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Aug 2020 10:44:32 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FAEC061796
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:32 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v12so2108879ljc.10
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Pnk1PBdCwskgZo11wlcqoxMsr/2QaWdSpSmHykFS18k=;
        b=oxt7DyZLruFdQlYgA8nq+2jMUWQ2D70jWTLSkISVaUDsWf2Mkxo9SnHaKBXz9GmTRK
         JWoAUEonT1OsB6BlBQrVrZ5Wg3idPmzws97t7fN4a+PWiOFa9Yt8/ymeqQ/oVuJc+OSR
         GI73dpyVPoHZaJ5rNcncP8PAe6O1e5Verchr+/bHg28dO67n+tlkwhAjUlKBWxpOh8zl
         4/7MIzZuDGAuyzjZAAslhv4fnZyd+M1eXm98DNo3OM+/Nfp8aOtXJyNmmhxL2FT0t4Ke
         sXOEXmnNnR/rHPUA1Y6t0Zkz//IdNUoekJLf7dZ2aPjIKrV7NxtrcfDxNr7Qx1/CCFiP
         Zhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Pnk1PBdCwskgZo11wlcqoxMsr/2QaWdSpSmHykFS18k=;
        b=WNGCErSC85gvsnnNYKidOWzgXsMzjY5N7Lw8aS3lG3gU6HVzzR0b3vQn4CgGCPjkN/
         E9Dfnd+xvJluvYr9bkYLy+G1k3HL4oFBnVS7ZmVPu+qWEgJ/5zVpjdMLdjLKhSLt91L2
         8snQLtyNaUg2/G0KSXE7FN8WDAoWYY8fkPv8C+HbxRMKz2rnR1NDJHO1G89YaTwDs6sJ
         4CiydV1zz28dlyKJ7rlu2pZFfOKjCAu7cTPJ3Bln3X0kCC5hcmfbgNxxui84zQ4BMKXI
         bbZk7hYPz0IjU7DRHbmSDSRq8KhuEE0CS8ue5oMCPAP7x4p7kmyOKRCUAA+dTzl9QQwJ
         96OA==
X-Gm-Message-State: AOAM5331gvTFoyfYk5E+1ajMyZkbjqWtck9AZxK+C2VN9Yw5/2+zAsUu
        ivOpEvedU9J31u4j5qtGHXCdDg==
X-Google-Smtp-Source: ABdhPJxqAt1KydaYvnWIgkMO3IhIFnejMIXIRQylmgtgEN+Tqee+4/nP5WbSDoEL8I66aiQBcJB12Q==
X-Received: by 2002:a2e:9156:: with SMTP id q22mr1760568ljg.348.1598021070683;
        Fri, 21 Aug 2020 07:44:30 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:30 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com, "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v2 5/7] soc: ti: pruss: Add support for PRU-ICSS subsystems on 66AK2G SoC
Date:   Fri, 21 Aug 2020 16:42:42 +0200
Message-Id: <1598020964-29877-6-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The 66AK2G SoC supports two PRU-ICSS instances, named PRUSS0 and PRUSS1,
each of which has two PRU processor cores. The two PRU-ICSS instances
are identical to each other with few minor SoC integration differences,
and are very similar to the PRU-ICSS1 of AM57xx/AM43xx. The Shared Data
RAM size is larger and the number of interrupts coming into MPU INTC
is like the instances on AM437x. There are also few other differences
attributing to integration in Keystone architecture (like no SYSCFG
register or PRCM handshake protocols). Other IP level differences
include different constant table, differences in system event interrupt
input sources etc. They also do not have a programmable module reset
line like those present on AM33xx/AM43xx SoCs. The modules are reset
just like any other IP with the SoC's global cold/warm resets.

The existing PRUSS platform driver has been enhanced to support these
66AK2G PRU-ICSS instances through new 66AK2G specific compatible for
properly probing and booting all the different PRU cores in each
PRU-ICSS processor subsystem. A build dependency with ARCH_KEYSTONE
is added to enable the driver to be built in K2G-only configuration.

Signed-off-by: Andrew F. Davis <afd@ti.com>
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
index 99dbc14..c290343 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -103,7 +103,7 @@ config TI_K3_SOCINFO
 
 config TI_PRUSS
 	tristate "TI PRU-ICSS Subsystem Platform drivers"
-	depends on SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX
+	depends on SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE
 	select MFD_SYSCON
 	help
 	  TI PRU-ICSS Subsystem platform specific support.
diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 5df4caa..d5f128e 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -162,6 +162,7 @@ static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am4376-pruss0", .data = &am437x_pruss0_data, },
 	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
 	{ .compatible = "ti,am5728-pruss" },
+	{ .compatible = "ti,k2g-pruss" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pruss_of_match);
-- 
2.7.4

