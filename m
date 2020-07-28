Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30290230664
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 11:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgG1JUB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 05:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgG1JUA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jul 2020 05:20:00 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EFCC061794
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 02:19:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id j22so4714623lfm.2
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4zsWyblv4WYqOLRqFANl/g337TI8guVn11cXGgyt8Y0=;
        b=UqckbfU0UoUqAEx3PUc0VVyr7US4m3M4LDoKEHI42J+xeM4TM4pTOwXt8KPCpiGRe8
         eP6trKsNWEcrx3Kc8ZpHtDWYIy8eBNJhtmrOlEx+YsOi85o4NHE/WjxNvrNaVKBcvxuM
         R1E7Rxd2QmEP+mDEyrVwDwow8yQTMkS/54MGBaLAri006UgG2ISyTAzXBEd7zxHVCcmA
         EP7WL4h1pLr5786+Vt93AzyHtAGl422GpdMu5ZjRxI2Qe2eRwwS8SV9TNNBcpkvoH8Sv
         KXr1qHGKmIozzcYJbbXfgd0RHpvysV1Vo7Iwc+6F/ay3A3/bU5ageHf0Qsdzr5mSaVmK
         gEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4zsWyblv4WYqOLRqFANl/g337TI8guVn11cXGgyt8Y0=;
        b=XGkuKvGDG6FwLqhPqcEnuGdCOQ4bcQd0hPht1RttaaUz4BGsSKvw+cTVFsK5YT17UC
         c04rdQQ6RVIsOZ7VCWO32a2fURI6EfYlTwEx6BPZrqjaXPlyfdIpdCN+oZWPuFeLMuS4
         x29APtuqdavBpHMOZp2LlMYdU14bu4AtExQsGpW3/Q2TuONe/JKCiJ4hsNJMbbjMkGfO
         3kCI78jr4Vam+t8DfUJRIVPCFx1dqE9fZgYYeVoZS/5loZ3gIs5J/4PPe7uoic6lChl+
         JCFx2F1uIFd9Bn0FPfc/4k7fZPnmU1+jooGkcptpxb/rNS16ICkV7Na5hYfhg4kODjwQ
         NvxQ==
X-Gm-Message-State: AOAM532SezMI2fRXs7aDT20OyGde9MuvyMeBhNaOn+BHkOArV9SkTOic
        dyfzQVyvSUiDQG+witHAG5imRg==
X-Google-Smtp-Source: ABdhPJxRJWE+gM9SiYoY7IFMYw8V87jNUKTEVCIhStBNKuL376Wh3ooXVpFqkBhf2mcG3Y2uIQ9+IA==
X-Received: by 2002:a19:ae0a:: with SMTP id f10mr13963168lfc.100.1595927998173;
        Tue, 28 Jul 2020 02:19:58 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id q22sm3643270lfc.33.2020.07.28.02.19.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 02:19:57 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com, praneeth@ti.com
Subject: [PATCH v4 4/5] irqchip/irq-pruss-intc: Implement irq_{get,set}_irqchip_state ops
Date:   Tue, 28 Jul 2020 11:18:37 +0200
Message-Id: <1595927918-19845-5-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: David Lechner <david@lechnology.com>

This implements the irq_get_irqchip_state and irq_set_irqchip_state
callbacks for the TI PRUSS INTC driver. The set callback can be used
by drivers to "kick" a PRU by injecting a PRU system event.

Example:
     irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true);

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
---
v3->v4:
- Update commit message
v2->v3:
- Get rid of unnecessary pruss_intc_check_write() and use
  pruss_intc_write_reg directly.
v1->v2:
- https://patchwork.kernel.org/patch/11069769/
---
 drivers/irqchip/irq-pruss-intc.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index cf9a59b..c13ba14 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -7,6 +7,7 @@
  *	Suman Anna <s-anna@ti.com>
  */
 
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -316,6 +317,43 @@ static void pruss_intc_irq_relres(struct irq_data *data)
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
@@ -323,6 +361,8 @@ static struct irq_chip pruss_irqchip = {
 	.irq_unmask = pruss_intc_irq_unmask,
 	.irq_request_resources = pruss_intc_irq_reqres,
 	.irq_release_resources = pruss_intc_irq_relres,
+	.irq_get_irqchip_state = pruss_intc_irq_get_irqchip_state,
+	.irq_set_irqchip_state = pruss_intc_irq_set_irqchip_state,
 };
 
 static int pruss_intc_validate_mapping(struct pruss_intc *intc, int event,
-- 
2.7.4

