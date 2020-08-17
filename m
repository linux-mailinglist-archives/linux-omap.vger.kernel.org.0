Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AA624677D
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 15:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgHQNly (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 09:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728636AbgHQNlh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 09:41:37 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8177FC061349
        for <linux-omap@vger.kernel.org>; Mon, 17 Aug 2020 06:41:00 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id i10so17526123ljn.2
        for <linux-omap@vger.kernel.org>; Mon, 17 Aug 2020 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LEzfLtgpOaMr9BZOKDE9VwILcSfLxB9dYWDMk9PYE6E=;
        b=wzldr36YfCFHnuJj0eZdAQh7O82da8ru2uwlm5Jztd0+/UQs5kmiuX4RN8qXZ5ISfA
         OQJ7aJsfp+2qxF/LDingmfanbPvvRYdHYoiYR2eUWB9mdzhEjYuBknkwlntG+J+JLheq
         Fk58ihnKe1E2CuK0R2KbS8jPdO7XbxOqsucW5OpJEvYAPpVoVRdGx/zj0ipaC/IcF2Oc
         AnWEFcQkaDxJFA9wuTxPtBBz+ZShzLC3p3Fj3wxx7Jpnw921A9GnIvAmwHITMmxfZ4I9
         jOmFxS1drNKYn+YBEdcVHMNNihKbIGPLVBgK+43UadKeZEqbCP3lPcIlaHJqinKez9fA
         evbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LEzfLtgpOaMr9BZOKDE9VwILcSfLxB9dYWDMk9PYE6E=;
        b=E2j/kAIliGQHAPEBmmmzXz62apQ82IQzxWYoaCLIrUAqpTcxj38Ox5JLVOO1thwudo
         R5+xasIVXbt0YoKvi94jdCeW8WIcSUy+kWRMei7PQol4ZkpSkEsQtcHC2AIbcqvyOS9E
         H2iT5CsnNlZXhF3oMORv1fbgGBXe+D5+XJkc6rTQH8D+Xwv6zPbSUfO81TceFpXjl7x5
         pcTcjv57M7f9fA3DcF5wC+Hjc26nMYiNHCZIQAgPlYU85oTG/POUkvq7SRAsxc8QHQTY
         EGVYFMqjUjK3GhDqa3bSEhiOG55KCvKaeMoMKgvP+VoaZ1ju6ZyXQLy3Ztf8AHu7EYh1
         olbQ==
X-Gm-Message-State: AOAM5321QdZYON5cZUBCIHI+c0Z1qlCAf9aoEisX8wc+3F9IVW21fedK
        cho+QbWv9U800CQf9UMmrTxJ/w==
X-Google-Smtp-Source: ABdhPJwTN8X9mU+NpaHzd414/e/35u+5H0aSg0yjp7vVPcmFhJd2JxCxJFOKKx4mVQ2nXmufiFPUkw==
X-Received: by 2002:a2e:7813:: with SMTP id t19mr6874572ljc.255.1597671657357;
        Mon, 17 Aug 2020 06:40:57 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id g22sm3443791lja.29.2020.08.17.06.40.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 06:40:56 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [PATCH v5 3/5] irqchip/irq-pruss-intc: Add logic for handling reserved interrupts
Date:   Mon, 17 Aug 2020 15:40:11 +0200
Message-Id: <1597671613-20879-4-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597671613-20879-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1597671613-20879-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The PRUSS INTC has a fixed number of output interrupt lines that are
connected to a number of processors or other PRUSS instances or other
devices (like DMA) on the SoC. The output interrupt lines 2 through 9
are usually connected to the main Arm host processor and are referred
to as host interrupts 0 through 7 from ARM/MPU perspective.

All of these 8 host interrupts are not always exclusively connected
to the Arm interrupt controller. Some SoCs have some interrupt lines
not connected to the Arm interrupt controller at all, while a few others
have the interrupt lines connected to multiple processors in which they
need to be partitioned as per SoC integration needs. For example, AM437x
and 66AK2G SoCs have 2 PRUSS instances each and have the host interrupt 5
connected to the other PRUSS, while AM335x has host interrupt 0 shared
between MPU and TSC_ADC and host interrupts 6 & 7 shared between MPU and
a DMA controller.

Add logic to the PRUSS INTC driver to ignore both these shared and
invalid interrupts.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v4->v5:
- Rename: s/invalid_intr/irqs_reserved/
v3->v4:
- Due to changes in DT bindings which converts irqs-reserved
  property from uint8-array to bitmask requested by Rob introduce
  relevant changes in the driver.
- Merge the irqs-reserved and irqs-shared to one property since they
  can be handled by one logic (relevant change was introduced to DT
  binding).
- Update commit message.
v2->v3:
- Extra checks for (intc->irqs[i]) in error/remove path was moved from
  "irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS
  interrupts" to this patch
v1->v2:
- https://patchwork.kernel.org/patch/11069757/
---
 drivers/irqchip/irq-pruss-intc.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 461e81e..1a72591 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -477,7 +477,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	struct pruss_intc *intc;
 	struct pruss_host_irq_data *host_data[MAX_NUM_HOST_IRQS] = { NULL };
 	int i, irq, ret;
-	u8 max_system_events;
+	u8 max_system_events, irqs_reserved = 0;
 
 	data = of_device_get_match_data(dev);
 	if (!data)
@@ -497,6 +497,16 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	if (IS_ERR(intc->base))
 		return PTR_ERR(intc->base);
 
+	ret = of_property_read_u8(dev->of_node, "ti,irqs-reserved",
+				  &irqs_reserved);
+
+	/*
+	 * The irqs-reserved is used only for some SoC's therefore not having
+	 * this property is still valid
+	 */
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
 	pruss_intc_init(intc);
 
 	mutex_init(&intc->lock);
@@ -507,6 +517,9 @@ static int pruss_intc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
+		if (irqs_reserved & BIT(i))
+			continue;
+
 		irq = platform_get_irq_byname(pdev, irq_names[i]);
 		if (irq <= 0) {
 			ret = (irq == 0) ? -EINVAL : irq;
@@ -532,8 +545,11 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	return 0;
 
 fail_irq:
-	while (--i >= 0)
-		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
+	while (--i >= 0) {
+		if (intc->irqs[i])
+			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
+							 NULL);
+	}
 
 	irq_domain_remove(intc->domain);
 
@@ -547,8 +563,11 @@ static int pruss_intc_remove(struct platform_device *pdev)
 	unsigned int hwirq;
 	int i;
 
-	for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
-		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
+	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
+		if (intc->irqs[i])
+			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
+							 NULL);
+	}
 
 	for (hwirq = 0; hwirq < max_system_events; hwirq++)
 		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
-- 
2.7.4

