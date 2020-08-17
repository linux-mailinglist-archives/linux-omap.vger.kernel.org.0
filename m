Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AC2246784
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 15:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728726AbgHQNmE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 09:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728672AbgHQNll (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 09:41:41 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC111C06134F
        for <linux-omap@vger.kernel.org>; Mon, 17 Aug 2020 06:41:03 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m22so17494477ljj.5
        for <linux-omap@vger.kernel.org>; Mon, 17 Aug 2020 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=frzL2DLHwYvpLbcVF+BQ0a2PY0Hd2ua7rlCrnnnS4iw=;
        b=UQ/wTmknQMhog1wmIO5rJfA79XJvlXor2LAoB70HRnID+sphf9o9+m7gJg3flV1w5O
         uzF9+23Tp5eh1yYLY8A9bXI2HDhC4hZ+GMvRNPyjC8ZEKWR1ejvT1UjpKv0YE6yVPvRj
         khZ/XsvmZkULDjFzlKm9uvxBy6PTfVk3NtYGAy/SnbiwDPMyIoG+CkqodY4aBhvBbUN6
         XtZJkdxNE95L+s2E+dOGSeVXfgXQR4NlVEvdD23dCam8seLxHMDh2heb5+Cq5c6/ak8i
         agWfUJ68D55vR1uU9TYOd8WM0beZfd+Jxrv8GEwZAfqyspwoT900Fhslzksxg/S+IcjT
         XSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=frzL2DLHwYvpLbcVF+BQ0a2PY0Hd2ua7rlCrnnnS4iw=;
        b=dDezYew9mbDDtHO9wgDolV4tHDWzNxekxk7lax/AVZeXHpRWFmPpXRC7QhiRWtMnSA
         KscNMVaUEHLiHLmK4UEoeUjWVJrH1iJfKvhHl5uAc1FXXnmqhGsBCzqL5WQDo19FK1TK
         Gi+PAa60jneqlQmKrgXWqBL8fSuX3UZcMVRojFf3o/IHJtTogxY+rq4jUfsHlXKqvlid
         0QRg7chf90v17hyhGyb1D2FWkjBRjdeLlb9Cp9s2nSME1QwP9tOYK45nzwxJo9BhZCHo
         XLasQ8A+5bipNkhtkm1jJG840jInpuIGP2SR93UsybGEoeZZSTCyZdZB8cPPwmTiqk1X
         sKpQ==
X-Gm-Message-State: AOAM5305hJtPk6OwjxI7kydOhtrp5f6wehEqVF8I9POID6sWGF20y/3D
        jO+K/0LX4P9ZASwEbdg+R9oUbQ==
X-Google-Smtp-Source: ABdhPJy4aaiF8qOICfByVONC0MVmCClxwRzY87w1wPh5D4T/z2ObxWuZzRUVuY6Nc3XgSrGHfxcUCA==
X-Received: by 2002:a2e:3609:: with SMTP id d9mr7131951lja.106.1597671661262;
        Mon, 17 Aug 2020 06:41:01 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id g22sm3443791lja.29.2020.08.17.06.41.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 06:41:00 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [PATCH v5 5/5] irqchip/irq-pruss-intc: Add support for ICSSG INTC on K3 SoCs
Date:   Mon, 17 Aug 2020 15:40:13 +0200
Message-Id: <1597671613-20879-6-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597671613-20879-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1597671613-20879-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
commonly called ICSSG. The PRUSS INTC present within the ICSSG supports
more System Events (160 vs 64), more Interrupt Channels and Host Interrupts
(20 vs 10) compared to the previous generation PRUSS INTC instances. The
first 2 and the last 10 of these host interrupt lines are used by the
PRU and other auxiliary cores and sub-modules within the ICSSG, with 8
host interrupts connected to MPU. The host interrupts 5, 6, 7 are also
connected to the other ICSSG instances within the SoC and can be
partitioned as per system integration through the board dts files.

Enhance the PRUSS INTC driver to add support for this ICSSG INTC
instance.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v4->v5:
- Rename: s/num_host_intrs/num_host_events/ regarding to change
  introduced in patch #2.
v3->v4:
- Move generic part to "irqchip/irq-pruss-intc: Add a PRUSS irqchip
  driver for PRUSS interrupts" patch and leave only platform related
  code.
v2->v3:
- Change patch order: use it directly after "irqchip/irq-pruss-intc:
  Implement irq_{get,set}_irqchip_state ops" and before new
  "irqchip/irq-pruss-intc: Add event mapping support" in order to reduce
  diff.
v1->v2:
- https://patchwork.kernel.org/patch/11069773/
---
 drivers/irqchip/Kconfig          | 2 +-
 drivers/irqchip/irq-pruss-intc.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a112a76..7fe4e30 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -495,7 +495,7 @@ config TI_SCI_INTA_IRQCHIP
 
 config TI_PRUSS_INTC
 	tristate "TI PRU-ICSS Interrupt Controller"
-	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE
+	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE || ARCH_K3
 	select IRQ_DOMAIN
 	help
 	   This enables support for the PRU-ICSS Local Interrupt Controller
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 15f0407..9e540af 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -622,11 +622,20 @@ static const struct pruss_intc_match_data pruss_intc_data = {
 	.num_host_events = 10,
 };
 
+static const struct pruss_intc_match_data icssg_intc_data = {
+	.num_system_events = 160,
+	.num_host_events = 20,
+};
+
 static const struct of_device_id pruss_intc_of_match[] = {
 	{
 		.compatible = "ti,pruss-intc",
 		.data = &pruss_intc_data,
 	},
+	{
+		.compatible = "ti,icssg-intc",
+		.data = &icssg_intc_data,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, pruss_intc_of_match);
-- 
2.7.4

