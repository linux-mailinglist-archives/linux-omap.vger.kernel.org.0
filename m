Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC7A26CC05
	for <lists+linux-omap@lfdr.de>; Wed, 16 Sep 2020 22:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgIPUiB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Sep 2020 16:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgIPRJW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Sep 2020 13:09:22 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D72C02C28D
        for <linux-omap@vger.kernel.org>; Wed, 16 Sep 2020 09:37:04 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b12so7655523lfp.9
        for <linux-omap@vger.kernel.org>; Wed, 16 Sep 2020 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=jMYu4kXE2sjgBZ9G0n0UMw/4sfdmoPqRtdExz+XAFWs=;
        b=iA8Gq/YnrRpNj705xinp0UvGfAmmUb+FvDWYzbCZILwOStSmi7k7yRicuZ+OFi/Jey
         EYzGUzcOj1of4kQDN1doygwRCKgkrt1JJyrVwb4lNKemp+17ZddMKiRSlm7auBl/dzOm
         NFt7vL8nLyuqg85P0OYs8MyEIJ6apy0XF1E7TB6XuJ9YJTwoE8Ri2FYgXCFIW7DwX/kJ
         MpLNtn1Ms8hNKP/k0kLPjRsS4wWv6sP5m+Et+WGAUh82IJYa43b6pdiC4UlQ//N7Iq70
         q0TYiP/+HhXSaaEB1OC6rYWlZ6/WdxdjGMKczjYg8I9zdCjETU5ljUoluDcDZfpzaxR/
         7hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jMYu4kXE2sjgBZ9G0n0UMw/4sfdmoPqRtdExz+XAFWs=;
        b=PpOz+csYzgfe7GpEHD4IanaRHJpWBpEps7+1lu8+YimsdZgQD6ghMPHJO1EkYLsdBS
         y9UOAPeSAgjkJmle2c+SOZ6+N9BtmgojfEvZlZnPexs0TU9g4DeOfpQJPmI5Od4Ah6fL
         WGOQZAiq5P+68Wypwlxg4m1dPR4YAdXa1C6dzPSaASlU0YmMRuXNaqK5Wny8vtDT+P/0
         nFKZwwFLcgpbQ5XiYXwRb/yyhonsUWAIGleDUz6Yv/2aEiPiWvcl7ip62MUyqgSTkoES
         CzGZzjhymZyDovhBGiT+UNYi/Wub7KhYEiXQewwDcdWPuGm/v0rbX/wNvvv6wyteMIh4
         9hCg==
X-Gm-Message-State: AOAM5317ec0PLr+Fz6up7K9tqL0oA1r/wRhexiBoa7Wik/WXMJjLzxIP
        i2O3VdV3c7vHcgV2nEtYld7J2w==
X-Google-Smtp-Source: ABdhPJwcCdpfObZXqTGqBWbqGkCbuZ41n1X/oiZxN1Zv/wkx2VjUjFa3aUlmgB8PN1u9TCcFhIXNIw==
X-Received: by 2002:ac2:494f:: with SMTP id o15mr2729070lfi.355.1600274222391;
        Wed, 16 Sep 2020 09:37:02 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id o15sm4684400lfo.188.2020.09.16.09.37.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 09:37:01 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [PATCH v7 3/5] irqchip/irq-pruss-intc: Add logic for handling reserved interrupts
Date:   Wed, 16 Sep 2020 18:36:36 +0200
Message-Id: <1600274198-30470-1-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
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
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v6->v7:
- Add Co-developed-by tag.
v5->v6:
- No change.
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
index c8bdef4..e7ba358 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -484,7 +484,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
 	struct pruss_intc *intc;
 	struct pruss_host_irq_data *host_data;
 	int i, irq, ret;
-	u8 max_system_events;
+	u8 max_system_events, irqs_reserved = 0;
 
 	data = of_device_get_match_data(dev);
 	if (!data)
@@ -504,6 +504,16 @@ static int pruss_intc_probe(struct platform_device *pdev)
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
@@ -514,6 +524,9 @@ static int pruss_intc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
+		if (irqs_reserved & BIT(i))
+			continue;
+
 		irq = platform_get_irq_byname(pdev, irq_names[i]);
 		if (irq <= 0) {
 			ret = (irq == 0) ? -EINVAL : irq;
@@ -538,8 +551,11 @@ static int pruss_intc_probe(struct platform_device *pdev)
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
 
@@ -553,8 +569,11 @@ static int pruss_intc_remove(struct platform_device *pdev)
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

