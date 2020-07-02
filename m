Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE796212BAB
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 19:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgGBRy3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 13:54:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:51054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727895AbgGBRy3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jul 2020 13:54:29 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B76720737;
        Thu,  2 Jul 2020 17:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593712468;
        bh=CweWMMu7PLdPE/4i4jZuP/tEfhtGXtOLafsmlGCzXGg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qbp6HwkcvfR1IULQwGE0aykzqd8vd3GG1GIp0bvJwDxiIepIbjRXXHCL6jxh4xzbD
         ix2myEkw1+3AVtdXp0TMGhKs1Cyf4mDfZw7iWiqWlI4vghVLUEl5ggySHqa9TLr3Zj
         E52sdBu8L/DeEg2MycTiE/hmvIzeRpVnWJs3iO8s=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jr3Pm-008VCD-KD; Thu, 02 Jul 2020 18:54:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 02 Jul 2020 18:54:26 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, s-anna@ti.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        david@lechnology.com, wmills@ti.com
Subject: Re: [PATCHv3 4/6] irqchip/irq-pruss-intc: Implement
 irq_{get,set}_irqchip_state ops
In-Reply-To: <1593699479-1445-5-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-5-git-send-email-grzegorz.jaszczyk@linaro.org>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <658e3a8d3374eca91387932a9a246add@kernel.org>
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
> From: David Lechner <david@lechnology.com>
> 
> This implements the irq_get_irqchip_state and irq_set_irqchip_state
> callbacks for the TI PRUSS INTC driver. The set callback can be used
> by drivers to "kick" a PRU by enabling a PRU system event.

"enabling"? That'd be unmasking an interrupt, which isn't what this
does. "injecting", maybe?

> 
> Example:
>      irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true);

Nice example.

What this example does explain is how you are actually going to kick
a PRU via this interface. For that to happen, you'd have to have on
the Linux side an interrupt that is actually routed to a PRU.
And from what I have understood of the previous patches, this can't
be the case. What didi I miss?

> 
> Signed-off-by: David Lechner <david@lechnology.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Reviewed-by: Lee Jones <lee.jones@linaro.org>
> ---
> v2->v3:
> - Get rid of unnecessary pruss_intc_check_write() and use
>   pruss_intc_write_reg directly.
> v1->v2:
> - https://patchwork.kernel.org/patch/11069769/
> ---
>  drivers/irqchip/irq-pruss-intc.c | 43 
> ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-pruss-intc.c 
> b/drivers/irqchip/irq-pruss-intc.c
> index 49c936f..19b3d38 100644
> --- a/drivers/irqchip/irq-pruss-intc.c
> +++ b/drivers/irqchip/irq-pruss-intc.c
> @@ -7,6 +7,7 @@
>   *	Suman Anna <s-anna@ti.com>
>   */
> 
> +#include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
> @@ -39,8 +40,7 @@
>  #define PRU_INTC_HIEISR		0x0034
>  #define PRU_INTC_HIDISR		0x0038
>  #define PRU_INTC_GPIR		0x0080
> -#define PRU_INTC_SRSR0		0x0200
> -#define PRU_INTC_SRSR1		0x0204
> +#define PRU_INTC_SRSR(x)	(0x0200 + (x) * 4)
>  #define PRU_INTC_SECR0		0x0280
>  #define PRU_INTC_SECR1		0x0284
>  #define PRU_INTC_ESR0		0x0300
> @@ -145,6 +145,43 @@ static void pruss_intc_irq_relres(struct irq_data 
> *data)
>  	module_put(THIS_MODULE);
>  }
> 
> +static int pruss_intc_irq_get_irqchip_state(struct irq_data *data,
> +					    enum irqchip_irq_state which,
> +					    bool *state)
> +{
> +	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
> +	u32 reg, mask, srsr;
> +
> +	if (which != IRQCHIP_STATE_PENDING)
> +		return -EINVAL;
> +
> +	reg = PRU_INTC_SRSR(data->hwirq / 32);

I assume the register file scales as more interrupts are added in the
subsequent patch?

> +	mask = BIT(data->hwirq % 32);
> +
> +	srsr = pruss_intc_read_reg(intc, reg);
> +
> +	*state = !!(srsr & mask);
> +
> +	return 0;
> +}
> +
> +static int pruss_intc_irq_set_irqchip_state(struct irq_data *data,
> +					    enum irqchip_irq_state which,
> +					    bool state)
> +{
> +	struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
> +
> +	if (which != IRQCHIP_STATE_PENDING)
> +		return -EINVAL;
> +
> +	if (state)
> +		pruss_intc_write_reg(intc, PRU_INTC_SISR, data->hwirq);
> +	else
> +		pruss_intc_write_reg(intc, PRU_INTC_SICR, data->hwirq);
> +
> +	return 0;
> +}
> +
>  static struct irq_chip pruss_irqchip = {
>  	.name = "pruss-intc",
>  	.irq_ack = pruss_intc_irq_ack,
> @@ -152,6 +189,8 @@ static struct irq_chip pruss_irqchip = {
>  	.irq_unmask = pruss_intc_irq_unmask,
>  	.irq_request_resources = pruss_intc_irq_reqres,
>  	.irq_release_resources = pruss_intc_irq_relres,
> +	.irq_get_irqchip_state = pruss_intc_irq_get_irqchip_state,
> +	.irq_set_irqchip_state = pruss_intc_irq_set_irqchip_state,
>  };
> 
>  static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned 
> int virq,

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
