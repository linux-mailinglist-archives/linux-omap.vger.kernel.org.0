Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E00C257BE2
	for <lists+linux-omap@lfdr.de>; Mon, 31 Aug 2020 17:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbgHaPMQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 Aug 2020 11:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728220AbgHaPJz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 Aug 2020 11:09:55 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E61C06123D
        for <linux-omap@vger.kernel.org>; Mon, 31 Aug 2020 08:09:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y2so7138093ljc.1
        for <linux-omap@vger.kernel.org>; Mon, 31 Aug 2020 08:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LEzfLtgpOaMr9BZOKDE9VwILcSfLxB9dYWDMk9PYE6E=;
        b=czB/82J21rLAadLkXAeNcKBWQ7ZVAdU/qLJIc590zSwb5Wbj/jIPEMJIGYo8cHSqXA
         rPCEBEbFDgbMQ3HaWcrdvQCjRyNEnND9ZXsA1SOTUV9yn58PeugbFwt/mMIAVCp7DVzV
         8PqC4bKuJUy5r7dFTBLyBMc3v3moQlW2OZeeOSOLZlpHUM2nMD8Xd+6LVW3jnK/JQBVD
         fYphWZita9M9VanLRKdz0wtrBKeKHGpdp/6uqlDma4XpweDqotcyKCOXJ6vGU1T9Yd+I
         GDbs//O97c0OvXoNG1y9TVsOc05Az5KAEhnea5UEZ34BBsUeQUCKXgYdXQGPDJCPRQf7
         fUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LEzfLtgpOaMr9BZOKDE9VwILcSfLxB9dYWDMk9PYE6E=;
        b=mWYgT0DQDIznEpPM1Iqi70nHcIueJyrST/ZKyr42glRGV0bsmkOStR1LFQ2CE6Bm/H
         9iqadGK5eocm+J//CSj418Y6XM2/GZOMSpLkOoy4cDiMG6Lx7wg4OomPZ3lmd1ip4z2B
         u5rIxsHWLGZLU5f+Y23Ofzv9/QjhC3uSb7hrjipehSlqGij8lQtcpQ1a7YTqicC2jYQm
         mYpc7If+afc1GkXbzLQ/5j3m9PpOOKAEHxPlb1Yyc+Efm31R0wSmfhGncnp250NLdV40
         KceZ2Lte+YNfnKgxyBg3/ZNWg87GOI7B+ayIWVoywNBTS84wmoFUl4jf3v9nF8fF8GEh
         nbPw==
X-Gm-Message-State: AOAM530wVB9hkUJ/KKGJ3zpK5cnKJOPUZQiUFo81nksaDQe1yhD4DHIT
        fB6DfK7Q5Cw5RhvdJFr/wonYxg==
X-Google-Smtp-Source: ABdhPJyIdzJ8dow4XZ5A+0IxIt5Lg+V1WTcIDhXXSuS4zMiKQBlev1qPslEB4nSon/nwsg7NFADG2A==
X-Received: by 2002:a2e:8612:: with SMTP id a18mr886839lji.149.1598886592206;
        Mon, 31 Aug 2020 08:09:52 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id w6sm2034388lfn.73.2020.08.31.08.09.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 08:09:51 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [RESEND PATCH v5 3/5] irqchip/irq-pruss-intc: Add logic for handling reserved interrupts
Date:   Mon, 31 Aug 2020 17:09:16 +0200
Message-Id: <1598886558-16546-4-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
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

