Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D735B660C2
	for <lists+linux-omap@lfdr.de>; Thu, 11 Jul 2019 22:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbfGKUkZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Jul 2019 16:40:25 -0400
Received: from vern.gendns.com ([98.142.107.122]:36922 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728355AbfGKUkZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Jul 2019 16:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xvThRjH3X1TUzxAtTyWv1hFEkruW/blvpY6bT/bSK9Q=; b=ooWeI1qO4BAdXV3DI7FZd6Y60X
        5OT2yCa5stfUIYc8lfWRFqw3RbGl+nu/96D7q2kOUKvVTE3jtQzohMVzSYrbU1uOmuctOCiquEJym
        hvStBGW/uQBo3oCYoXA87WVp3mnU5ROITWqGMhnZxBLa3aI0tgfoKbIuncs+hZ8UhIfVVQPU9FKmb
        ZnRXszBoAwOsxS+d1BioxjB1/IdGczkE20RRxtpZ6zaH3gqeiG3VzuPpUlEX/6QTshmyncOlshWKq
        7HcxlXZBwlngRvM7lpqJQFqyW4AIUEpFfUayjmKzjY8VI/GXIxB1njiwKs6C5Y3iN7IX9PEz1wa+m
        LMVboQNA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:60730 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hlfra-004iz1-AV; Thu, 11 Jul 2019 16:40:22 -0400
Subject: Re: [PATCH 5/6] irqchip/irq-pruss-intc: Add API to trigger a PRU
 sysevent
To:     Suman Anna <s-anna@ti.com>, Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Cc:     Tony Lindgren <tony@atomide.com>, "Andrew F. Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190708035243.12170-1-s-anna@ti.com>
 <20190708035243.12170-6-s-anna@ti.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <49628f74-1081-894a-14a2-adc58b2051e8@lechnology.com>
Date:   Thu, 11 Jul 2019 15:40:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708035243.12170-6-s-anna@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/7/19 10:52 PM, Suman Anna wrote:
> From: "Andrew F. Davis" <afd@ti.com>
> 
> The PRUSS INTC can generate an interrupt to various processor
> subsystems on the SoC through a set of 64 possible PRU system
> events. These system events can be used by PRU client drivers
> or applications for event notifications/signalling between PRUs
> and MPU or other processors. A new API, pruss_intc_trigger() is
> provided to MPU-side PRU client drivers/applications to be able
> to trigger an event/interrupt using IRQ numbers provided by the
> PRUSS-INTC irqdomain chip.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>   drivers/irqchip/irq-pruss-intc.c | 31 +++++++++++++++++++++++++++++++
>   include/linux/pruss_intc.h       | 26 ++++++++++++++++++++++++++
>   2 files changed, 57 insertions(+)
>   create mode 100644 include/linux/pruss_intc.h
> 
> diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
> index 8118c2a2ac43..a0ad50b95cd5 100644
> --- a/drivers/irqchip/irq-pruss-intc.c
> +++ b/drivers/irqchip/irq-pruss-intc.c
> @@ -421,6 +421,37 @@ static void pruss_intc_irq_relres(struct irq_data *data)
>   	module_put(THIS_MODULE);
>   }
>   
> +/**
> + * pruss_intc_trigger() - trigger a PRU system event
> + * @irq: linux IRQ number associated with a PRU system event
> + *
> + * Trigger an interrupt by signaling a specific PRU system event.
> + * This can be used by PRUSS client users to raise/send an event to
> + * a PRU or any other core that is listening on the host interrupt
> + * mapped to that specific PRU system event. The @irq variable is the
> + * Linux IRQ number associated with a specific PRU system event that
> + * a client user/application uses. The interrupt mappings for this is
> + * provided by the PRUSS INTC irqchip instance.
> + *
> + * Returns 0 on success, or an error value upon failure.
> + */
> +int pruss_intc_trigger(unsigned int irq)
> +{
> +	struct irq_desc *desc;
> +
> +	if (irq <= 0)
> +		return -EINVAL;
> +
> +	desc = irq_to_desc(irq);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	pruss_intc_irq_retrigger(&desc->irq_data);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pruss_intc_trigger);

Although it is not quite as obvious, we can do the same thing with:

irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true);

So I don't think a new API is needed. We just need to implement the
irq_set_irqchip_state callback as in the following patch.

---
 From c5991a11a19858d74e2a184b76c3ef5823f09ef6 Mon Sep 17 00:00:00 2001
From: David Lechner <david@lechnology.com>
Date: Thu, 11 Jul 2019 15:33:29 -0500
Subject: [PATCH] irqchip/irq-pruss-intc: implement irq_{get,set}_irqchip_state

This implements the irq_get_irqchip_state and irq_set_irqchip_state
callbacks for the TI PRUSS INTC driver. The set callback can be used
by drivers to "kick" a PRU by enabling a PRU system event.

Example:

     irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true);

Signed-off-by: David Lechner <david@lechnology.com>
---
  drivers/irqchip/irq-pruss-intc.c | 41 ++++++++++++++++++++++++++++++--
  1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index dd14addfd0b4..129dfd52248b 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -7,6 +7,7 @@
   *	Suman Anna <s-anna@ti.com>
   */
  
+#include <linux/interrupt.h>
  #include <linux/irq.h>
  #include <linux/irqchip/chained_irq.h>
  #include <linux/irqdomain.h>
@@ -46,8 +47,7 @@
  #define PRU_INTC_HIEISR		0x0034
  #define PRU_INTC_HIDISR		0x0038
  #define PRU_INTC_GPIR		0x0080
-#define PRU_INTC_SRSR0		0x0200
-#define PRU_INTC_SRSR1		0x0204
+#define PRU_INTC_SRSR(x)	(0x0200 + (x) * 4)
  #define PRU_INTC_SECR0		0x0280
  #define PRU_INTC_SECR1		0x0284
  #define PRU_INTC_ESR0		0x0300
@@ -386,6 +386,41 @@ static void pruss_intc_irq_relres(struct irq_data *data)
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
+		return pruss_intc_check_write(intc, PRU_INTC_SISR, data->hwirq);
+
+	return pruss_intc_check_write(intc, PRU_INTC_SICR, data->hwirq);
+}
+
  static int
  pruss_intc_irq_domain_xlate(struct irq_domain *d, struct device_node *node,
  			    const u32 *intspec, unsigned int intsize,
@@ -583,6 +618,8 @@ static int pruss_intc_probe(struct platform_device *pdev)
  	irqchip->irq_retrigger = pruss_intc_irq_retrigger;
  	irqchip->irq_request_resources = pruss_intc_irq_reqres;
  	irqchip->irq_release_resources = pruss_intc_irq_relres;
+	irqchip->irq_get_irqchip_state = pruss_intc_irq_get_irqchip_state;
+	irqchip->irq_set_irqchip_state = pruss_intc_irq_set_irqchip_state;
  	irqchip->parent_device = dev;
  	irqchip->name = dev_name(dev);
  	intc->irqchip = irqchip;
-- 
2.17.1

