Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C124A24D792
	for <lists+linux-omap@lfdr.de>; Fri, 21 Aug 2020 16:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgHUOov (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Aug 2020 10:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbgHUOoa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Aug 2020 10:44:30 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14619C061795
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:30 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c15so1042968lfi.3
        for <linux-omap@vger.kernel.org>; Fri, 21 Aug 2020 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aXHPVuBnUltzTW16E/CnLpjc3EIf1ZbgHUhxEqUcDwc=;
        b=r0iV8Pe4LG5mSz7gWwPDu4qiBMSkQWiFp7Zm5mwLQ7zpUwsfMOkaZahYP+quUzI+0K
         5doGgwPxZPE6l+dMP7Neddt7GCsYf1u3+kRV64Qla5r8XyELCd9SsQ5EplzNXrhVEDeq
         yZMUqfMnjPBEI47t28a1wbGXhTJ/7f31kMz8WqoroRR3oXQLwbGD62spf+4bpIGm25+b
         uSRB1nK98lesOQx+FjHhkDCVjo2wevq73W0IixXBhuvxbeB9KI6CyCnJtpJqvvBLm9rb
         dlNbupG9u9jWPQauLWG3GM1vLnqrx412PJW2UD1w3aGtR+zNUW887QoFiHz7U/aHuJaV
         zh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aXHPVuBnUltzTW16E/CnLpjc3EIf1ZbgHUhxEqUcDwc=;
        b=KEfQeXcCQPQpMw/SLMV3z81X/XMJ+xxkzlx0H3T46XpF5bzExWe5WiP/TmXirE73kP
         jeNcmmW+9Ymo+Vpt1kC0HT3RTaSl0oXmSRVmuAGHo71r21LvmDmf9IyimEURl3lWxnYE
         TzSItZ7DaylRwB4U6OOHIcjSL55jjFuMnrtzs5wn034VhlVNXNDtjpgcidG69sJhZa2/
         dD6OS6shTL57RPj6eWlkhfUEM3Ob4pIP5Tgjod/GTiJYEmorTGZajL2ch+dWrTzGr+zS
         +Nz11ptu+3QF9jdfhHRllLKhDN0dNVhaN5d1BFtdXRgcP69Vecec0UAMr7h/QP+560AR
         lR7Q==
X-Gm-Message-State: AOAM532mvv4NY/0EiGIedNO7iwN4i6JThjll/YqDXC5mf7mlb4ug2dxS
        d+ir46W6jZM9d+5IQwuY7EaDCQ==
X-Google-Smtp-Source: ABdhPJzjQWabtQpT9hIy6AInrgGe6Wh4JUvT4Eh1HedRmvlwoxUEQ8fIhonVLJ3w0OSpcpT3KBRQrQ==
X-Received: by 2002:ac2:5338:: with SMTP id f24mr1606706lfh.5.1598021068437;
        Fri, 21 Aug 2020 07:44:28 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:27 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com
Subject: [PATCH v2 4/7] soc: ti: pruss: Add support for PRU-ICSS subsystems on AM57xx SoCs
Date:   Fri, 21 Aug 2020 16:42:41 +0200
Message-Id: <1598020964-29877-5-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The AM57xx family of SoCs supports two PRU-ICSS instances, each of
which has two PRU processor cores. The two PRU-ICSS instances are
identical to each other, and are very similar to the PRU-ICSS1 of
AM33xx/AM43xx except for a few minor differences like the RAM sizes
and the number of interrupts coming into the MPU INTC. They do
not have a programmable module reset line unlike those present on
AM33xx/AM43xx SoCs. The modules are reset just like any other IP
with the SoC's global cold/warm resets. Each PRU-ICSS's INTC is also
preceded by a Crossbar that enables multiple external events to be
routed to a specific number of input interrupt events. Any interrupt
event directed towards PRUSS needs this crossbar to be setup properly
on the firmware side.

The existing PRUSS platform driver has been enhanced to support
these AM57xx PRU-ICSS instances through new AM57xx specific
compatible for properly probing and booting all the different PRU
cores in each PRU-ICSS processor subsystem. A build dependency with
SOC_DRA7XX is also added to enable the driver to be built in
AM57xx-only configuration (there is no separate Kconfig option
for AM57xx vs DRA7xx).

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
index 40d6a22..99dbc14 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -103,7 +103,7 @@ config TI_K3_SOCINFO
 
 config TI_PRUSS
 	tristate "TI PRU-ICSS Subsystem Platform drivers"
-	depends on SOC_AM33XX || SOC_AM43XX
+	depends on SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX
 	select MFD_SYSCON
 	help
 	  TI PRU-ICSS Subsystem platform specific support.
diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 04938ba..5df4caa 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -161,6 +161,7 @@ static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am3356-pruss" },
 	{ .compatible = "ti,am4376-pruss0", .data = &am437x_pruss0_data, },
 	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
+	{ .compatible = "ti,am5728-pruss" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pruss_of_match);
-- 
2.7.4

