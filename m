Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0796D24678A
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 15:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgHQNmj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 09:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728661AbgHQNlj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 09:41:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460E1C06134C
        for <linux-omap@vger.kernel.org>; Mon, 17 Aug 2020 06:41:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w25so17479520ljo.12
        for <linux-omap@vger.kernel.org>; Mon, 17 Aug 2020 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Oe4tacp/96y2oKOUNNpzoTA6Aq+PNNKI08nVOHEYABg=;
        b=FEt/nY+X/hsm906RgF6Fdze5arGgWN3YHF2GKPU9D1DtvaC6ZsUtuNxJ4I4TIoLhnD
         oGb1dgjjYJKHr4Y/pQKbEbEd9+rKWAFGryvnhZJ/djwJTmX32LQhtYY0q/hv/lqWWWr6
         plE17wGz9J/ALORcLUnMpnKkxj9LqhMyNhqBmf9ZcssnjwIhwJKRztOXuua5qMK3RPAQ
         2nrINQrPVjTcN8kdWVniIfV0Qi1r5KdxXPeqQgeyonA0d2nhWhse8SPyynJbkxf+7U8Y
         Ck/F0WHCdm1WPLCrdjU+g+s6iRpzovkyRvXK7+UpdziWcy+wHoIPTXzAuw+PQ5paOsqn
         jS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Oe4tacp/96y2oKOUNNpzoTA6Aq+PNNKI08nVOHEYABg=;
        b=P1A1sPzjTjYfQ9UjNGaSev58AbxnN4bOQylUeIlcF4Zd9YTopAk87Xvwe22osKDc63
         hXuaYGGcukpYsBGTm+oeq0Khh6S22dNGEGS6S8jplMiqqZgpmYUuc6trxWjpM0uja7YF
         NEm34uM0jUB+uEdB4AJMuCkY+yVs/HlsZC1btRTcgxrj54lc3klfSvFVIuaHWEyKmAnn
         IgwEJCfrSbO0VG3hOJbMGttzn7q9r/1tbgt4K+Kq9Tpa1FOVGplpBL0S+UFW0TevjBqv
         RlL7BDYsiZZW5lH8dDf3fb38bYqRgC5URhd7jDQphwXOjMMSPMBc/uACiSeAoKd5dOEm
         cYyQ==
X-Gm-Message-State: AOAM533hyhuy/fm6PgO6aKiv2Z+LNaGu2D2veWUWWsChrwAnp2qkVzWN
        d41myinBchOZlpu8POfzzEX2Ng==
X-Google-Smtp-Source: ABdhPJxqkSj3P2CKf96zF7I0D52GZMiFA8MAOzTaoTMYWs9Vbh1EaJBlV12xc7h1oMOynSV0zlzXeQ==
X-Received: by 2002:a2e:a586:: with SMTP id m6mr7944732ljp.458.1597671659321;
        Mon, 17 Aug 2020 06:40:59 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id g22sm3443791lja.29.2020.08.17.06.40.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 06:40:58 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [PATCH v5 4/5] irqchip/irq-pruss-intc: Implement irq_{get,set}_irqchip_state ops
Date:   Mon, 17 Aug 2020 15:40:12 +0200
Message-Id: <1597671613-20879-5-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597671613-20879-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1597671613-20879-1-git-send-email-grzegorz.jaszczyk@linaro.org>
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

