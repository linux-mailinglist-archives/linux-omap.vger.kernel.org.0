Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E420230660
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 11:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgG1JT7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 05:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbgG1JT5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jul 2020 05:19:57 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A4DC061794
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 02:19:56 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id j22so4714530lfm.2
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ipzuo+HQ11391SYa3h/EWapjP3MjJlhfg4aV9wFpeFU=;
        b=S3EP0KuwN1R6cnsfr0mYO/fkbWqWX9PjdYAhnw/6+6OAfhsGKEI3lBxmKCxl5RV4Ds
         DIvtdClTy7q3UqdQAeRNc0nioS+I4y5Sp2oMo+8g442wp4GoC2ojKpX/W5LJEQcfE3zW
         fp+MCZ4jOu0M3YLsVVpMWqTkv8BpEDhUkq4oOlk4dpWXbsX+U6AMRjQg2/bvHLJfH7nG
         uv92PMdBh5XQVsyqFhbUN4pUPql9iTancya47t9akY9SUucx/yCATPLkC9hvoNmHetcN
         WUHxBU34PA6LqwE6T5v61DEU0CqDuE1WRYgKrIM0MqeUzetLjGjLrNALCn16ebwXfwrM
         Xchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ipzuo+HQ11391SYa3h/EWapjP3MjJlhfg4aV9wFpeFU=;
        b=k2go9P9jAzp6uDIYayqQc23bOtp5rEbDU0NNXwdWVJqlinqU6vb9h066Rfk/jaSEe9
         1fHcbM2s1AL7rMg+cvY/5OWNJy9EYkhYXhupvS1z8ykXLBNkLrefPj0esYAy08gYUhMP
         QEldz0/EX3rUxG0wxMsKbNm88kYWdnUgRFRnYHLLkfrof1mOc3iFlWk09XwD0kkgton4
         U3WWLTmvDW0UOhRrYICIc/RPFdd85q+2CbaW6AbbVScy7r6E/dLB1GD7DdgZE8STlUnc
         euToTXIIdENV4k0jtSJJbB5GjHS9Wu0CdRgccFS7JReMRwXZpL1acqkCjxdxm9hsW5y5
         0yDA==
X-Gm-Message-State: AOAM531q8NIPyrk7LkkIqX07rIAgEoU6QzgunbShNmGEzIONxPa4aBnh
        nugvRbBYJlh+EBUi0nuerPrlbA==
X-Google-Smtp-Source: ABdhPJw7TRYfLEcTS7i+LwRZ8WalnQMd4VKzKP026t75kh3SzVtx7ptw+ROhxSDR7gi6zGUlOpvc7Q==
X-Received: by 2002:a05:6512:1084:: with SMTP id j4mr3610787lfg.96.1595927994616;
        Tue, 28 Jul 2020 02:19:54 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id q22sm3643270lfc.33.2020.07.28.02.19.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 02:19:54 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com, praneeth@ti.com
Subject: [PATCH v4 3/5] irqchip/irq-pruss-intc: Add logic for handling reserved interrupts
Date:   Tue, 28 Jul 2020 11:18:36 +0200
Message-Id: <1595927918-19845-4-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
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
index 45b966a..cf9a59b 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -474,7 +474,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	struct pruss_intc *intc;
 	struct pruss_host_irq_data *host_data[MAX_NUM_HOST_IRQS] = { NULL };
 	int i, irq, ret;
-	u8 max_system_events;
+	u8 max_system_events, invalid_intr = 0;
 
 	data = of_device_get_match_data(dev);
 	if (!data)
@@ -496,6 +496,16 @@ static int pruss_intc_probe(struct platform_device *pdev)
 		return PTR_ERR(intc->base);
 	}
 
+	ret = of_property_read_u8(dev->of_node, "ti,irqs-reserved",
+				  &invalid_intr);
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
@@ -506,6 +516,9 @@ static int pruss_intc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
+		if (invalid_intr & BIT(i))
+			continue;
+
 		irq = platform_get_irq_byname(pdev, irq_names[i]);
 		if (irq <= 0) {
 			dev_err(dev, "platform_get_irq_byname failed for %s : %d\n",
@@ -533,8 +546,11 @@ static int pruss_intc_probe(struct platform_device *pdev)
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
 
@@ -548,8 +564,11 @@ static int pruss_intc_remove(struct platform_device *pdev)
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

