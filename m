Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1511221260A
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 16:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbgGBOUL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 10:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729579AbgGBOUI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jul 2020 10:20:08 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B8A1C08C5DC
        for <linux-omap@vger.kernel.org>; Thu,  2 Jul 2020 07:20:08 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f8so20109337ljc.2
        for <linux-omap@vger.kernel.org>; Thu, 02 Jul 2020 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4HO8KIlLqlwP/f8Ruj28glCZZ5K9Sse59aSvMxbiXe4=;
        b=NVq8KjQj97pZ12DfuDX6ObhQONPpx/XLwguVE7MeHvMriwV3ZpTcy5F3yNAwmciTo3
         piNKbV7bXjATmWytRK9un5tZckGbMaIkUPi1Ty6/ovHoLgHd+TrSwF82jtVj0d7b+amR
         GQcYfyGAS6qpR3QiIhsE1NR0PD11MCyHhkJnn/nwWCiMbYwM6foJ6gFV9E3sIsUeOMmm
         i3OmQyS7TnPi/O3+1sGIy6kRdIBGXm79RoZhFmXV2b2Y5uuj0P5nfo9aX5Fkq6B6RD0M
         Z6zKn3L5yTSgEaLl85/tpdp3pqryd3JTPo/l/DqMik2PATKjrwduG4jEYdjxwfzvTZhy
         nKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4HO8KIlLqlwP/f8Ruj28glCZZ5K9Sse59aSvMxbiXe4=;
        b=aC+rlq5fZKmLq364Jb3Ta8vPqXrhGJYDFQs1ZdNFbm4aO/xR0pgjTcrJehohZ9vzCJ
         W38AClpF682GNr2yyr4zuGrJpGCK1h+uDo+PaihVpeyBTX8TXS+AoyFz0+X7xGU+Subj
         tg2d0nxw5G05VEFaIXFa6O0s0R90i5SrqVVQ/4TOx2XlbWu6y1D3sWVLxntLrhH8dYc9
         f5ZvcgwrEeOqMACrG3XOghkg1U/P0mXyETA45HrQ/vff/ONrL8rPabNIFFg4lCp2wHK5
         b6aJtPUGt5/AF5FJZ8Ctdn/zDUqbHyxJuV3xv5WXswNZDNsK8JJ/tLC77dA5OROgE7Mo
         V3lA==
X-Gm-Message-State: AOAM530+7siPStsJZMkTvGA+rDg6xHr+/JnCfyaBMBZaF8VTDfTD5aWH
        jbCAU0t4MGM2/l04xRCM8B9MeQ==
X-Google-Smtp-Source: ABdhPJwCbQ7EMAkIh/qFNxmOFJIGjCBdHQn4gObIvzsdg65Jtq765O6647O9rWB77/X6iNebJd1vXw==
X-Received: by 2002:a2e:91da:: with SMTP id u26mr10525805ljg.311.1593699606933;
        Thu, 02 Jul 2020 07:20:06 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id v10sm692581ljg.113.2020.07.02.07.20.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 07:20:06 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com
Subject: [PATCHv3 4/6] irqchip/irq-pruss-intc: Implement irq_{get,set}_irqchip_state ops
Date:   Thu,  2 Jul 2020 16:17:57 +0200
Message-Id: <1593699479-1445-5-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: David Lechner <david@lechnology.com>

This implements the irq_get_irqchip_state and irq_set_irqchip_state
callbacks for the TI PRUSS INTC driver. The set callback can be used
by drivers to "kick" a PRU by enabling a PRU system event.

Example:
     irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true);

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
---
v2->v3:
- Get rid of unnecessary pruss_intc_check_write() and use
  pruss_intc_write_reg directly.
v1->v2:
- https://patchwork.kernel.org/patch/11069769/
---
 drivers/irqchip/irq-pruss-intc.c | 43 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 49c936f..19b3d38 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -7,6 +7,7 @@
  *	Suman Anna <s-anna@ti.com>
  */
 
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -39,8 +40,7 @@
 #define PRU_INTC_HIEISR		0x0034
 #define PRU_INTC_HIDISR		0x0038
 #define PRU_INTC_GPIR		0x0080
-#define PRU_INTC_SRSR0		0x0200
-#define PRU_INTC_SRSR1		0x0204
+#define PRU_INTC_SRSR(x)	(0x0200 + (x) * 4)
 #define PRU_INTC_SECR0		0x0280
 #define PRU_INTC_SECR1		0x0284
 #define PRU_INTC_ESR0		0x0300
@@ -145,6 +145,43 @@ static void pruss_intc_irq_relres(struct irq_data *data)
 	module_put(THIS_MODULE);
 }
 
+static int pruss_intc_irq_get_irqchip_state(struct irq_data *data,
+					    enum irqchip_irq_state which,
+					    bool *state)
+{
+	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
+	u32 reg, mask, srsr;
+
+	if (which != IRQCHIP_STATE_PENDING)
+		return -EINVAL;
+
+	reg = PRU_INTC_SRSR(data->hwirq / 32);
+	mask = BIT(data->hwirq % 32);
+
+	srsr = pruss_intc_read_reg(intc, reg);
+
+	*state = !!(srsr & mask);
+
+	return 0;
+}
+
+static int pruss_intc_irq_set_irqchip_state(struct irq_data *data,
+					    enum irqchip_irq_state which,
+					    bool state)
+{
+	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
+
+	if (which != IRQCHIP_STATE_PENDING)
+		return -EINVAL;
+
+	if (state)
+		pruss_intc_write_reg(intc, PRU_INTC_SISR, data->hwirq);
+	else
+		pruss_intc_write_reg(intc, PRU_INTC_SICR, data->hwirq);
+
+	return 0;
+}
+
 static struct irq_chip pruss_irqchip = {
 	.name = "pruss-intc",
 	.irq_ack = pruss_intc_irq_ack,
@@ -152,6 +189,8 @@ static struct irq_chip pruss_irqchip = {
 	.irq_unmask = pruss_intc_irq_unmask,
 	.irq_request_resources = pruss_intc_irq_reqres,
 	.irq_release_resources = pruss_intc_irq_relres,
+	.irq_get_irqchip_state = pruss_intc_irq_get_irqchip_state,
+	.irq_set_irqchip_state = pruss_intc_irq_set_irqchip_state,
 };
 
 static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned int virq,
-- 
2.7.4

