Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D014F232555
	for <lists+linux-omap@lfdr.de>; Wed, 29 Jul 2020 21:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgG2TXz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Jul 2020 15:23:55 -0400
Received: from vern.gendns.com ([98.142.107.122]:38176 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbgG2TXz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Jul 2020 15:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0o/y1SIy7ILQ+d1Hddyg7+WeJ6w7kZFirmzZMjS9xnE=; b=fFQxYYOK8esCW6uqky04/R2qKJ
        VdfcPUM/nxTpy9+xe9yRBUWWoNVsPJIRS6tx8FpWtDTPb/9UG2wKSs0eYYahnHTZBLfHZUD82hvI1
        2T24urK9MgJf/0o9u9WI/Xec8NJ0aTb3mucTnXOg8f/SGHcyEvpH5/THstv+KL4/3G99++G4+opI4
        I9dHc8iT5IwrWW38hvigF9yyX9lJAY/+0lZjxpf3Xf504of3YZvqbGFqoQgfS6N32mhpmOGkciRxl
        8I8vS9SJWoH9XInYPoISljCXOVGjqn9VbfdMeHVN3yZbulaN1Ct1AIYngZJy5egMW88L0rCAOFXuA
        ECKlukpA==;
Received: from [2600:1700:4830:165f::19e] (port=43672)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1k0rg7-0003Ti-7B; Wed, 29 Jul 2020 15:23:51 -0400
Subject: Re: [PATCH v4 4/5] irqchip/irq-pruss-intc: Implement
 irq_{get,set}_irqchip_state ops
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wmills@ti.com, praneeth@ti.com
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-5-git-send-email-grzegorz.jaszczyk@linaro.org>
From:   David Lechner <david@lechnology.com>
Message-ID: <f65c6b32-7754-9880-1912-3b0b30a3d6d4@lechnology.com>
Date:   Wed, 29 Jul 2020 14:23:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595927918-19845-5-git-send-email-grzegorz.jaszczyk@linaro.org>
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
> From: David Lechner <david@lechnology.com>
> 
> This implements the irq_get_irqchip_state and irq_set_irqchip_state
> callbacks for the TI PRUSS INTC driver. The set callback can be used
> by drivers to "kick" a PRU by injecting a PRU system event.
> 
> Example:

We could improve this example by showing a device tree node of a
firmware-defined device implemented in the PRU:

	/* Software-defined UART in PRU */
	pru_uart: serial@XXXX {
		compatible = "ti,pru-uart";
		...
		interrupt-parent = <&pruss_intc>;
		/* PRU system event 31, channel 0, host event 0 */
		interrupts = <31 0 0>, ...;
		interrupt-names = "kick", ...;
		...
	},

Then driver would request the IRQ during probe:

	data->kick_irq = of_irq_get_byname(dev, "kick");
	if (data->kick_irq < 0)
		...
	

And later the driver would use the IRQ to kick the PRU:

	irq_set_irqchip_state(data->kick_irq, IRQCHIP_STATE_PENDING, true);


>       irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true);
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Reviewed-by: Lee Jones <lee.jones@linaro.org>
> ---
