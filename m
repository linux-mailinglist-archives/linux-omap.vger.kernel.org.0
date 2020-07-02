Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F379E212B6F
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 19:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgGBRoc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 13:44:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726754AbgGBRoc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jul 2020 13:44:32 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 855D22084C;
        Thu,  2 Jul 2020 17:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593711871;
        bh=jvU81eMf9nFGcLoqw6ryzx8Tg8Jkc1RCkdQ6/wLR6e0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ch3hykzfMgu1Qo8zt4VSYuTyusuv1Lqco8D+TwHw9WyRPNntv3XRMHGrgYHe7LgO1
         h173wZqkhm+wT8g/yJ+sa7y5wZTDvbsJfStZVxSbP03BEvY2w3baybXDXQJtvEHPI8
         5z2C0OxIRiAW6fH0Klx1fRsUZYaRU7lglUYFLdeQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jr3GA-008V3N-21; Thu, 02 Jul 2020 18:44:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 02 Jul 2020 18:44:30 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        david@lechnology.com, wmills@ti.com
Subject: Re: [PATCHv3 3/6] irqchip/irq-pruss-intc: Add support for shared and
 invalid interrupts
In-Reply-To: <1593699479-1445-4-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-4-git-send-email-grzegorz.jaszczyk@linaro.org>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <2a6b0391f1395eb0aa15ffee6769184e@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: grzegorz.jaszczyk@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, david@lechnology.com, wmills@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-07-02 15:17, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The PRUSS INTC has a fixed number of output interrupt lines that are
> connected to a number of processors or other PRUSS instances or other
> devices (like DMA) on the SoC. The output interrupt lines 2 through 9
> are usually connected to the main Arm host processor and are referred
> to as host interrupts 0 through 7 from ARM/MPU perspective.
> 
> All of these 8 host interrupts are not always exclusively connected
> to the Arm interrupt controller. Some SoCs have some interrupt lines
> not connected to the Arm interrupt controller at all, while a few 
> others
> have the interrupt lines connected to multiple processors in which they
> need to be partitioned as per SoC integration needs. For example, 
> AM437x
> and 66AK2G SoCs have 2 PRUSS instances each and have the host interrupt 
> 5
> connected to the other PRUSS, while AM335x has host interrupt 0 shared
> between MPU and TSC_ADC and host interrupts 6 & 7 shared between MPU 
> and
> a DMA controller.
> 
> Add support to the PRUSS INTC driver to allow both these shared and
> invalid interrupts by not returning a failure if any of these 
> interrupts
> are skipped from the corresponding INTC DT node.

That's not exactly "adding support", is it? It really is "ignore these
interrupts because they are useless from the main CPU's perspective",
right?

> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
> v2->v3:
> - Extra checks for (intc->irqs[i]) in error/remove path was moved from
>   "irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS
>   interrupts" to this patch
> v1->v2:
> - https://patchwork.kernel.org/patch/11069757/
> ---
>  drivers/irqchip/irq-pruss-intc.c | 73 
> +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 68 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-pruss-intc.c 
> b/drivers/irqchip/irq-pruss-intc.c
> index fb3dda3..49c936f 100644
> --- a/drivers/irqchip/irq-pruss-intc.c
> +++ b/drivers/irqchip/irq-pruss-intc.c
> @@ -65,11 +65,15 @@
>   * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
>   * @base: base virtual address of INTC register space
>   * @domain: irq domain for this interrupt controller
> + * @shared_intr: bit-map denoting if the MPU host interrupt is shared

nit: bitmap

> + * @invalid_intr: bit-map denoting if host interrupt is not connected 
> to MPU
>   */
>  struct pruss_intc {
>  	unsigned int irqs[MAX_NUM_HOST_IRQS];
>  	void __iomem *base;
>  	struct irq_domain *domain;
> +	u16 shared_intr;
> +	u16 invalid_intr;

Please represent bitmaps as an unsigned long.

>  };
> 
>  static inline u32 pruss_intc_read_reg(struct pruss_intc *intc,
> unsigned int reg)
> @@ -222,7 +226,8 @@ static int pruss_intc_probe(struct platform_device 
> *pdev)
>  		"host_intr4", "host_intr5", "host_intr6", "host_intr7", };
>  	struct device *dev = &pdev->dev;
>  	struct pruss_intc *intc;
> -	int i, irq;
> +	int i, irq, count;
> +	u8 temp_intr[MAX_NUM_HOST_IRQS] = { 0 };
> 
>  	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
>  	if (!intc)
> @@ -235,6 +240,52 @@ static int pruss_intc_probe(struct platform_device 
> *pdev)
>  		return PTR_ERR(intc->base);
>  	}
> 
> +	count = of_property_read_variable_u8_array(dev->of_node,
> +						   "ti,irqs-reserved",
> +						   temp_intr, 0,
> +						   MAX_NUM_HOST_IRQS);
> +	/*
> +	 * The irqs-reserved is used only for some SoC's therefore not having
> +	 * this property is still valid
> +	 */
> +	if (count == -EINVAL)
> +		count = 0;
> +	if (count < 0)
> +		return count;
> +
> +	for (i = 0; i < count; i++) {
> +		if (temp_intr[i] >= MAX_NUM_HOST_IRQS) {
> +			dev_warn(dev, "ignoring invalid reserved irq %d\n",
> +				 temp_intr[i]);
> +			continue;
> +		}
> +
> +		intc->invalid_intr |= BIT(temp_intr[i]);
> +	}
> +
> +	count = of_property_read_variable_u8_array(dev->of_node,
> +						   "ti,irqs-shared",
> +						   temp_intr, 0,
> +						   MAX_NUM_HOST_IRQS);
> +	/*
> +	 * The irqs-shared is used only for some SoC's therefore not having
> +	 * this property is still valid
> +	 */
> +	if (count == -EINVAL)
> +		count = 0;
> +	if (count < 0)
> +		return count;
> +
> +	for (i = 0; i < count; i++) {
> +		if (temp_intr[i] >= MAX_NUM_HOST_IRQS) {
> +			dev_warn(dev, "ignoring invalid shared irq %d\n",
> +				 temp_intr[i]);
> +			continue;
> +		}
> +
> +		intc->shared_intr |= BIT(temp_intr[i]);
> +	}
> +

You probably want to move this in a separate function, since you 
populate a
common structure.

>  	pruss_intc_init(intc);
> 
>  	/* always 64 events */
> @@ -244,8 +295,14 @@ static int pruss_intc_probe(struct platform_device 
> *pdev)
>  		return -ENOMEM;
> 
>  	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
> +		if (intc->invalid_intr & BIT(i))
> +			continue;
> +
>  		irq = platform_get_irq_byname(pdev, irq_names[i]);
>  		if (irq <= 0) {
> +			if (intc->shared_intr & BIT(i))
> +				continue;

I don't really understand why you are treating these "shared" interrupts
differently from the invalid ones. In all cases, they shouldn't be used.

> +
>  			dev_err(dev, "platform_get_irq_byname failed for %s : %d\n",
>  				irq_names[i], irq);
>  			goto fail_irq;
> @@ -259,8 +316,11 @@ static int pruss_intc_probe(struct platform_device 
> *pdev)
>  	return 0;
> 
>  fail_irq:
> -	while (--i >= 0)
> -		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
> +	while (--i >= 0) {
> +		if (intc->irqs[i])
> +			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
> +							 NULL);
> +	}
> 
>  	irq_domain_remove(intc->domain);
> 
> @@ -273,8 +333,11 @@ static int pruss_intc_remove(struct 
> platform_device *pdev)
>  	unsigned int hwirq;
>  	int i;
> 
> -	for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
> -		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
> +	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
> +		if (intc->irqs[i])
> +			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
> +							 NULL);
> +	}
> 
>  	for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
>  		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
