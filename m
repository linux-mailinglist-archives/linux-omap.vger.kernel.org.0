Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FCF26B923
	for <lists+linux-omap@lfdr.de>; Wed, 16 Sep 2020 02:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgIPA5t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Sep 2020 20:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgIOLMz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Sep 2020 07:12:55 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B99C06121C
        for <linux-omap@vger.kernel.org>; Tue, 15 Sep 2020 04:01:31 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y17so2608577lfa.8
        for <linux-omap@vger.kernel.org>; Tue, 15 Sep 2020 04:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0bFMdRSpPXTVw6FkASDzFuci7f9roVwhgsTsGiODYGg=;
        b=bu9PMoyxQXeCQJXQTnO4uU92zugPEP+32GJTwTJGhFmLd0RKGN8bQMrRnrKu/zSoeW
         GHnIGVzICEGX5Pcf0CeO2+Vx2PIVKlddZLpPH53MSxEf3QsDaWP9sxmMvToBFOJpJqXG
         R3YHAgG2fzOpyA+PLcgFr5shCpOAsw7ncEZGKNcuLmrZ8IswbWdlBJDRYLAPLj/OKHTR
         QGOISTSf5PVYJsjPvlHeeE7eNFI087vR7/7dGkIjI+4lO4+qRZYbVvDoH0baNiQRGZJH
         l0oBFry2v5TM9hZWyFzXSFUNlc2QdW8s/A2tMXdKHLu8VVG0wIUW078NKWlFvKuaIHs5
         PHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0bFMdRSpPXTVw6FkASDzFuci7f9roVwhgsTsGiODYGg=;
        b=RCHLp7xedDDeYNAHRHCeimS1Vrcd8zNMPYm13wKEFqZt+2UoYLrSP3Lw/db/sd2DbC
         ObN53wd8vSEId/bmQ4VViHxNyVRh2M3bLJb8tjkL9qgg47yBRsG0IGNzbxjKBtLDDiv3
         S2aLoyLCGIF3/stZsV0YPxof77EbgXHMuIFd6sHYjL0gSZn6milEMWsshf8uwc1BfAdI
         ez8mIQw28VsmswdTDqoE1kWjzp6gSxc9UTxHiFviL17RmWXAt06qZC1vztcMJFyyyh4k
         IvMkoFWl6RCXMUJVy+AwpUAdTk1yv4ImnKeBS2k8dyLCxVbKsTC8ljlcxNt4NuuIrpj+
         SFYw==
X-Gm-Message-State: AOAM532ltfOW9TgNaa3d5uPGbHoPjPD4jlKw1OmAtwljEbX1Z4itSh+9
        c6KppXStM3CWpuioTtVkwjqS6A==
X-Google-Smtp-Source: ABdhPJzp9MBZN/pyDF9GzMLHUJeD6RV5x2JiSkBUFmjYlSIsuOj7jjb30r36nAQxW4uhgqAt4m+WVg==
X-Received: by 2002:a19:d95:: with SMTP id 143mr5883867lfn.4.1600167684008;
        Tue, 15 Sep 2020 04:01:24 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id n3sm4588916ljj.59.2020.09.15.04.01.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 04:01:23 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        praneeth@ti.com
Subject: [PATCH v6 4/5] irqchip/irq-pruss-intc: Implement irq_{get,set}_irqchip_state ops
Date:   Tue, 15 Sep 2020 13:00:50 +0200
Message-Id: <1600167651-20851-5-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600167651-20851-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1600167651-20851-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: David Lechner <david@lechnology.com>

This implements the irq_get_irqchip_state and irq_set_irqchip_state
callbacks for the TI PRUSS INTC driver. The set callback can be used
by drivers to "kick" a PRU by injecting a PRU system event.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
---
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
index 396dc55..41c6271 100644
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

