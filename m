Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C1F257BC7
	for <lists+linux-omap@lfdr.de>; Mon, 31 Aug 2020 17:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgHaPK3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 Aug 2020 11:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728193AbgHaPJ7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 Aug 2020 11:09:59 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA34C0611E9
        for <linux-omap@vger.kernel.org>; Mon, 31 Aug 2020 08:09:55 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so4102986ljg.9
        for <linux-omap@vger.kernel.org>; Mon, 31 Aug 2020 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Oe4tacp/96y2oKOUNNpzoTA6Aq+PNNKI08nVOHEYABg=;
        b=fiqC6LLJSVenAjqZKrRWwcs2FxmsYmyCRHEtBDP+OxMbOsnvwhWbknefzIALIKNf/O
         Qe6iiwViNEHh5qVuIpgmiGnaf0cwEtUaAjsiJ1opIeLHvFrdwVZEL8H3MvhUGNp9XNcb
         GKqjTmUrxPK3rPT9WyZ1Q076COuDlA0ykp8+TwiXVEnC9hdkObAsbMZGviVVUddQc1/T
         iQifgD8IMnQ2+NIeOcQRshq1ZxzIogqHl+3JIBUm1307AMw8iXrDaxvgak6gzNJkTNTw
         56d3ZTBlWUwDNIqAaZz4FuIchWjdLQeO0NlKqpkDxUC8YXzCHeqHi6oEDcC2VHm/kBdI
         wERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Oe4tacp/96y2oKOUNNpzoTA6Aq+PNNKI08nVOHEYABg=;
        b=NPqcVmlNQQEtuYPDtparhGbvWHmsYVNyul8rmj32X4XoIWX9OEFF9KnO+CNtmW4BrN
         xnDgwMPdCvToU/EyxRneP7eicAjkVjcLqb2FcOdWub4tYAi2op7JfvrMkIxQVIJtSJ3z
         AXuNtNWzSNJQaoa+UvQKY4G5dkrAF05TgxaBZZQ9eKUanOMLhKgDTrygvNNNUwdA/6O9
         f18fXcFddkjMiN85cwDwsOkWTgigBOiiagNaQpw72bCvFlxz8y8bqWVPfTaSUJ8NIWMU
         6gC2z+dT7C1n2N1ScejYpi5o69QIJwEazyi0VE/xLhS+fOA6DCfoQkoSL4DmoodktSb8
         ZuMA==
X-Gm-Message-State: AOAM533OoTHlzt9IfLkt983CcpFCJ9oxHV4PWzuiJKZYJEUz9PpQq7yX
        CHyIxxyVTFfSj1Ub0BrCO29RYQ==
X-Google-Smtp-Source: ABdhPJzehq3pw6VOdyjpjeq4GYkB3PrJFk17PerXnTtMTcKpLGzPJMMzwDXBAdaLV5NuxAxm9BJX5g==
X-Received: by 2002:a05:651c:110d:: with SMTP id d13mr861751ljo.206.1598886594106;
        Mon, 31 Aug 2020 08:09:54 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id w6sm2034388lfn.73.2020.08.31.08.09.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 08:09:53 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [RESEND PATCH v5 4/5] irqchip/irq-pruss-intc: Implement irq_{get,set}_irqchip_state ops
Date:   Mon, 31 Aug 2020 17:09:17 +0200
Message-Id: <1598886558-16546-5-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
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
index 1a72591..15f0407 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -9,6 +9,7 @@
  * Copyright (C) 2019 David Lechner <david@lechnology.com>
  */
 
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -319,6 +320,43 @@ static void pruss_intc_irq_relres(struct irq_data *data)
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
@@ -326,6 +364,8 @@ static struct irq_chip pruss_irqchip = {
 	.irq_unmask = pruss_intc_irq_unmask,
 	.irq_request_resources = pruss_intc_irq_reqres,
 	.irq_release_resources = pruss_intc_irq_relres,
+	.irq_get_irqchip_state = pruss_intc_irq_get_irqchip_state,
+	.irq_set_irqchip_state = pruss_intc_irq_set_irqchip_state,
 };
 
 static int pruss_intc_validate_mapping(struct pruss_intc *intc, int event,
-- 
2.7.4

