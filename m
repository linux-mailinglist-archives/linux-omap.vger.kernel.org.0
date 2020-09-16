Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2EF26CC92
	for <lists+linux-omap@lfdr.de>; Wed, 16 Sep 2020 22:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgIPUqB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Sep 2020 16:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbgIPRDY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Sep 2020 13:03:24 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA186C02C2A2
        for <linux-omap@vger.kernel.org>; Wed, 16 Sep 2020 09:37:09 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so6471158ljk.8
        for <linux-omap@vger.kernel.org>; Wed, 16 Sep 2020 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EkdGaMAWsiITjixL8vtqkk4znvOu3Q/xzFs2YIEcfEY=;
        b=dpvpqsnv1se+B+N0B3X73ZARW0xp0qYtrllJbwUMEaTaPYAhDr3QA1JvBn8NUzvi/Z
         s8/YO99GSsIQU66VS4Y21URWzrqFy3MCSfvxw+pZqn4rifzBbNx2BJgMeksakO170Z52
         JPksnTeACT5MlZRIedoBUIaPfuTTJMYrmuNm4nBCXCwlym2M+aUB2z4kYkJ0ouJaSY00
         70k7LERJHRRCJjPRwRId0KijyzilqRY9bkwG2n2Sba11nDKP2TEzW5F79CkYt4U8RCAV
         +RMne5o9ys2+dp6NFUda1mLsnvldt8KlUv+Tr51FA+G/lZn1INDC4VhR7AUJMAsKGndQ
         DMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EkdGaMAWsiITjixL8vtqkk4znvOu3Q/xzFs2YIEcfEY=;
        b=gmxSnU1t5otbL393ZB3g5DdP6P4M2jUX9qYxxzjCEvQ/wZyEbmmTo2u8JzZqRd7SoY
         a/pzEKvHa2cXzrpmDCXLkzjbQ2KLOd6qmIa0fOTm+yvhKsmXo5IT2yUBvnezsDZ+zLzg
         5XKe5kxozeT3h60/q+DARx4TfG3OF6DO5EJA19uFyqAPfYz0lzGQ4WpBUAMQLEsNJtPB
         /ijHaV2bAHAYgiF28J+jJ+5TUf1OW4ehB4IgZYfgpwfO8fUw+pxV3FTfstzPbfuDkeH1
         fMwToZhaHzN6qJ1RYHpqyxwseGIddb9wt+3anSS/+nRwpVeaPnwdARzDTU2RTKZy9WSV
         Pq5A==
X-Gm-Message-State: AOAM531SD1gzzt7edLRHotuHjJHRRHtLtXdbhDcUe18jr+vS594NzEMB
        jciCvBZ0x8HQ4mDmQZechZT6vg==
X-Google-Smtp-Source: ABdhPJweMbctsM8dhw1DMsPTH+UQrB1ETp35qvjl+dAbRFkt1qlxj5Z1ZMezb9PHcSl/mT5nBIGqww==
X-Received: by 2002:a2e:a587:: with SMTP id m7mr8896222ljp.133.1600274227566;
        Wed, 16 Sep 2020 09:37:07 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id o15sm4684400lfo.188.2020.09.16.09.37.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 09:37:07 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [PATCH v7 4/5] irqchip/irq-pruss-intc: Implement irq_{get,set}_irqchip_state ops
Date:   Wed, 16 Sep 2020 18:36:37 +0200
Message-Id: <1600274198-30470-2-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600274198-30470-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1600274198-30470-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: David Lechner <david@lechnology.com>

This implements the irq_get_irqchip_state and irq_set_irqchip_state
callbacks for the TI PRUSS INTC driver. The set callback can be used
by drivers to "kick" a PRU by injecting a PRU system event.

Co-developed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: David Lechner <david@lechnology.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
---
v6->v7:
- Add Co-developed-by tags.
v5->v6:
- Drop example from the commit log
v4->v5:
- No change.
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
index e7ba358..bfe529a 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -12,6 +12,7 @@
  * Copyright (C) 2019 David Lechner <david@lechnology.com>
  */
 
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -323,6 +324,43 @@ static void pruss_intc_irq_relres(struct irq_data *data)
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
 	.name			= "pruss-intc",
 	.irq_ack		= pruss_intc_irq_ack,
@@ -330,6 +368,8 @@ static struct irq_chip pruss_irqchip = {
 	.irq_unmask		= pruss_intc_irq_unmask,
 	.irq_request_resources	= pruss_intc_irq_reqres,
 	.irq_release_resources	= pruss_intc_irq_relres,
+	.irq_get_irqchip_state	= pruss_intc_irq_get_irqchip_state,
+	.irq_set_irqchip_state	= pruss_intc_irq_set_irqchip_state,
 };
 
 static int pruss_intc_validate_mapping(struct pruss_intc *intc, int event,
-- 
2.7.4

