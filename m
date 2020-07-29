Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA492324DD
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jul 2020 20:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgG2Sst (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jul 2020 14:48:49 -0400
Received: from vern.gendns.com ([98.142.107.122]:34900 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbgG2Sss (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Jul 2020 14:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Rh4+f4yuq/e7FtK2/wT/sGMAB05nb7iicjjSHxqWAgI=; b=0lRICiKkfrwEJ4hCMkOoG0hSCs
        LSlE65op0UoG8Wr6nDkbzBkEet3HZn7eIOGD9rSSZOHLxtg9s9RRdposwMWn9g9EhZLALsmxNfjjG
        gN3iVrmIjqqaMcoK3z12Z9H985i4BhIyVgyTyKrCyLBvIBGXG+L3LQgcsOj17YpAWuffVhrZ8+fN8
        dAB9KrvyUp3SCJQP/LAO5E2DsXNP2PR8TyI+Uzn094HD+P/hb0ly4oV0NoCQmQBfwmAyXv8lbXr+k
        IOumosSzijy0HrUTUBgXZiZbvpQRAf96URhK9rZiu0R3pG6SKa2fraks6DEgbOra7YhT4oOg/7QKO
        ipow0rtA==;
Received: from [2600:1700:4830:165f::19e] (port=42956)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1k0r89-0002kH-Co; Wed, 29 Jul 2020 14:48:45 -0400
Subject: Re: [PATCH v4 3/5] irqchip/irq-pruss-intc: Add logic for handling
 reserved interrupts
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wmills@ti.com, praneeth@ti.com
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-4-git-send-email-grzegorz.jaszczyk@linaro.org>
From:   David Lechner <david@lechnology.com>
Message-ID: <c2695e63-dd4f-9eb9-afbc-fa52d7e88a86@lechnology.com>
Date:   Wed, 29 Jul 2020 13:48:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595927918-19845-4-git-send-email-grzegorz.jaszczyk@linaro.org>
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

On 7/28/20 4:18 AM, Grzegorz Jaszczyk wrote:
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
> not connected to the Arm interrupt controller at all, while a few others
> have the interrupt lines connected to multiple processors in which they
> need to be partitioned as per SoC integration needs. For example, AM437x
> and 66AK2G SoCs have 2 PRUSS instances each and have the host interrupt 5
> connected to the other PRUSS, while AM335x has host interrupt 0 shared
> between MPU and TSC_ADC and host interrupts 6 & 7 shared between MPU and
> a DMA controller.
> 
> Add logic to the PRUSS INTC driver to ignore both these shared and
> invalid interrupts.

If a person wanted to use DMA with a PRU what will handle the mapping
of a PRU event to host interrupt 6 or 7 if they are being ignored here?

> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
> v3->v4:
> - Due to changes in DT bindings which converts irqs-reserved
>    property from uint8-array to bitmask requested by Rob introduce
>    relevant changes in the driver.
> - Merge the irqs-reserved and irqs-shared to one property since they
>    can be handled by one logic (relevant change was introduced to DT
>    binding).
> - Update commit message.
> v2->v3:
> - Extra checks for (intc->irqs[i]) in error/remove path was moved from
>    "irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS
>    interrupts" to this patch
> v1->v2:
> - https://patchwork.kernel.org/patch/11069757/
> ---
>   drivers/irqchip/irq-pruss-intc.c | 29 ++++++++++++++++++++++++-----
>   1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
> index 45b966a..cf9a59b 100644
> --- a/drivers/irqchip/irq-pruss-intc.c
> +++ b/drivers/irqchip/irq-pruss-intc.c
> @@ -474,7 +474,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
>   	struct pruss_intc *intc;
>   	struct pruss_host_irq_data *host_data[MAX_NUM_HOST_IRQS] = { NULL };
>   	int i, irq, ret;
> -	u8 max_system_events;
> +	u8 max_system_events, invalid_intr = 0;
>   
>   	data = of_device_get_match_data(dev);
>   	if (!data)
> @@ -496,6 +496,16 @@ static int pruss_intc_probe(struct platform_device *pdev)
>   		return PTR_ERR(intc->base);
>   	}
>   
> +	ret = of_property_read_u8(dev->of_node, "ti,irqs-reserved",
> +				  &invalid_intr);

Why not make the variable name match the property name?

> +
> +	/*
> +	 * The irqs-reserved is used only for some SoC's therefore not having
> +	 * this property is still valid
> +	 */
> +	if (ret < 0 && ret != -EINVAL)
> +		return ret;
> +
>   	pruss_intc_init(intc);
>   
>   	mutex_init(&intc->lock);
> @@ -506,6 +516,9 @@ static int pruss_intc_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
> +		if (invalid_intr & BIT(i))
> +			continue;
> +
>   		irq = platform_get_irq_byname(pdev, irq_names[i]);
>   		if (irq <= 0) {
>   			dev_err(dev, "platform_get_irq_byname failed for %s : %d\n",
> @@ -533,8 +546,11 @@ static int pruss_intc_probe(struct platform_device *pdev)
>   	return 0;
>   
>   fail_irq:
> -	while (--i >= 0)
> -		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
> +	while (--i >= 0) {
> +		if (intc->irqs[i])
> +			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
> +							 NULL);
> +	}
>   
>   	irq_domain_remove(intc->domain);
>   
> @@ -548,8 +564,11 @@ static int pruss_intc_remove(struct platform_device *pdev)
>   	unsigned int hwirq;
>   	int i;
>   
> -	for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
> -		irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
> +	for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
> +		if (intc->irqs[i])
> +			irq_set_chained_handler_and_data(intc->irqs[i], NULL,
> +							 NULL);
> +	}
>   
>   	for (hwirq = 0; hwirq < max_system_events; hwirq++)
>   		irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
> 

