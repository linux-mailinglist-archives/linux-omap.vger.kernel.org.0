Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2939588AC3
	for <lists+linux-omap@lfdr.de>; Sat, 10 Aug 2019 12:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbfHJK20 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 10 Aug 2019 06:28:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57488 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbfHJK20 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 10 Aug 2019 06:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=KlWmJ/XZlWJnVQ3DuZFsqlb7tqR57nj8nY1TzMTzeEM=; b=nPLGPNawWzHcQsB51+cwTAmSS
        7bkh38dfmYxojbWyaH8qidZdKJ2NKuXJILM2kRfEirMXVr0JP0rLj2ZzVgPdHhelWnYSiBme1DFs4
        GnH29JnYdE5I2r/VPybHKjnjCe0r21JY/OW1dQG8CykvZSksrvPFfQdKDgKONZNHYtM1/UtZX9q88
        dinPcPx0X30dwBipYzIoaLt1azYQLIkeK5Tkr/n2BTv7e7qUo7EgLuY2XEKn7OIN0EFsHT7QIL0U+
        6wd19ZnlbbpFvqCSn/394XFEEnYfLFVGaCiqrvy3RBBXsjQ6wj10O7nOqNmGtyWbU7OiR5fhUo3qx
        gEyVVMZBg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hwObc-0008Cz-I6; Sat, 10 Aug 2019 10:28:12 +0000
Date:   Sat, 10 Aug 2019 03:28:12 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-usb@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/22] ARM: omap1: move omap15xx local bus handling to
 usb.c
Message-ID: <20190810102812.GA25939@infradead.org>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808212234.2213262-4-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808212234.2213262-4-arnd@arndb.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thanks for doing this!  The odd platforms have always been very
confusing.

> diff --git a/arch/arm/mach-omap1/include/mach/omap1510.h b/arch/arm/mach-omap1/include/mach/omap1510.h
> index 3d235244bf5c..7af9c0c7c5ab 100644
> --- a/arch/arm/mach-omap1/include/mach/omap1510.h
> +++ b/arch/arm/mach-omap1/include/mach/omap1510.h
> @@ -159,4 +159,3 @@
>  #define OMAP1510_INT_FPGA23		(OMAP_FPGA_IRQ_BASE + 23)
>  
>  #endif /*  __ASM_ARCH_OMAP15XX_H */
> -

Spurious whitespace change?

> diff --git a/arch/arm/mach-omap1/usb.c b/arch/arm/mach-omap1/usb.c
> index d8e9bbda8f7b..740c876ae46b 100644
> --- a/arch/arm/mach-omap1/usb.c
> +++ b/arch/arm/mach-omap1/usb.c
> @@ -10,6 +10,7 @@
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
> +#include <linux/delay.h>
>  
>  #include <asm/irq.h>
>  
> @@ -127,6 +128,7 @@ omap_otg_init(struct omap_usb_config *config)
>  
>  		syscon &= ~HST_IDLE_EN;
>  		ohci_device->dev.platform_data = config;
> +
>  		status = platform_device_register(ohci_device);

Same here.

> +#define OMAP1510_LB_OFFSET	   UL(0x30000000)
> +#define OMAP1510_LB_DMA_PFN_OFFSET ((OMAP1510_LB_OFFSET - PAGE_OFFSET) >> PAGE_SHIFT)

Overly long line.

> +/*
> + * OMAP-1510 specific Local Bus clock on/off
> + */
> +static int omap_1510_local_bus_power(int on)
> +{
> +	if (on) {
> +		omap_writel((1 << 1) | (1 << 0), OMAP1510_LB_MMU_CTL);
> +		udelay(200);
> +	} else {
> +		omap_writel(0, OMAP1510_LB_MMU_CTL);
> +	}
> +
> +	return 0;
> +}

The caller never checks the const return value, and on is always true as
well.  In fact it seems like omap_1510_local_bus_power and
omap_1510_local_bus_init could probably just be merged into the caller.

> +
> +/*
> + * OMAP-1510 specific Local Bus initialization
> + * NOTE: This assumes 32MB memory size in OMAP1510LB_MEMSIZE.
> + *       See also arch/mach-omap/memory.h for __virt_to_dma() and
> + *       __dma_to_virt() which need to match with the physical
> + *       Local Bus address below.

I think that NOTE is out of date, as __virt_to_dma and __dma_to_virt
don't exist anymore.

> +static int omap_1510_local_bus_init(void)
> +{
> +	unsigned int tlb;
> +	unsigned long lbaddr, physaddr;
> +
> +	omap_writel((omap_readl(OMAP1510_LB_CLOCK_DIV) & 0xfffffff8) | 0x4,
> +	       OMAP1510_LB_CLOCK_DIV);
> +
> +	/* Configure the Local Bus MMU table */
> +	for (tlb = 0; tlb < OMAP1510_LB_MEMSIZE; tlb++) {
> +		lbaddr = tlb * 0x00100000 + OMAP1510_LB_OFFSET;
> +		physaddr = tlb * 0x00100000 + PHYS_OFFSET;
> +		omap_writel((lbaddr & 0x0fffffff) >> 22, OMAP1510_LB_MMU_CAM_H);
> +		omap_writel(((lbaddr & 0x003ffc00) >> 6) | 0xc,
> +		       OMAP1510_LB_MMU_CAM_L);
> +		omap_writel(physaddr >> 16, OMAP1510_LB_MMU_RAM_H);
> +		omap_writel((physaddr & 0x0000fc00) | 0x300, OMAP1510_LB_MMU_RAM_L);

Another > 80 chars line.

> +		omap_writel(tlb << 4, OMAP1510_LB_MMU_LCK);
> +		omap_writel(0x1, OMAP1510_LB_MMU_LD_TLB);
> +	}
> +
> +	/* Enable the walking table */
> +	omap_writel(omap_readl(OMAP1510_LB_MMU_CTL) | (1 << 3), OMAP1510_LB_MMU_CTL);

One more.

> +	udelay(200);
> +
> +	return 0;

The return value is ignored.
