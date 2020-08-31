Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66876257DD0
	for <lists+linux-omap@lfdr.de>; Mon, 31 Aug 2020 17:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgHaPm2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 Aug 2020 11:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbgHaPm1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 Aug 2020 11:42:27 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF67C061573;
        Mon, 31 Aug 2020 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=MjfUFzwYb44sfP5Q/MJh1TOymBNNC7Uzgf6sVas956Y=; b=doxag4xClcvaxeUFekXYl+nAUv
        62jL/j+/Ho67pCLaHwviIJeLhNZ0Th7E6EStM5DbQ5arQRynbAJ1D7LP9gYCPpcTtCmig176hvJbB
        pmVBEtqX0dfSku/WzGNhJDDGlSLqWbnaQpSB0FmdW4U0fFmhCQXMF+OHKBEAjWzIbTHAbjXW/1Wv3
        UvMK4+deJyY3ng9Qda3V9rNVgRPnH+nnMYsyxB+2bsMEcZrcYb5DK8nm5cZUImz0fQ4g03qu5pjMH
        KwIeW1RgpqYz+fVTFEeCB3kmhN2jcMCjtaVe5n+U0ZxaVFj5/JnODzsWtwYrctS0NNUmUpODGjJAm
        rs+8bFsg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kClwp-0003DR-M0; Mon, 31 Aug 2020 15:42:20 +0000
Subject: Re: [RESEND PATCH v5 2/5] irqchip/irq-pruss-intc: Add a PRUSS irqchip
 driver for PRUSS interrupts
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        david@lechnology.com, praneeth@ti.com,
        "Andrew F . Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>
References: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1598886558-16546-3-git-send-email-grzegorz.jaszczyk@linaro.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b1dc6334-2f71-6142-561d-2966ed43f907@infradead.org>
Date:   Mon, 31 Aug 2020 08:42:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598886558-16546-3-git-send-email-grzegorz.jaszczyk@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/31/20 8:09 AM, Grzegorz Jaszczyk wrote:
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index bb70b71..a112a76 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -493,6 +493,16 @@ config TI_SCI_INTA_IRQCHIP
>  	  If you wish to use interrupt aggregator irq resources managed by the
>  	  TI System Controller, say Y here. Otherwise, say N.
>  
> +config TI_PRUSS_INTC
> +	tristate "TI PRU-ICSS Interrupt Controller"
> +	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE
> +	select IRQ_DOMAIN
> +	help
> +	   This enables support for the PRU-ICSS Local Interrupt Controller
> +	   present within a PRU-ICSS subsystem present on various TI SoCs.
> +	   The PRUSS INTC enables various interrupts to be routed to multiple
> +	   different processors within the SoC.
> +

Hi,
If you make any changes around here, please fix the help text indentation above
to use one tab + 2 spaces (not 3 spaces) as documented in
Documentation/process/coding-style.rst.

>  config RISCV_INTC
>  	bool "RISC-V Local Interrupt Controller"
>  	depends on RISCV

thanks.
-- 
~Randy

