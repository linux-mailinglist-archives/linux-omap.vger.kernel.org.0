Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941A027111F
	for <lists+linux-omap@lfdr.de>; Sun, 20 Sep 2020 00:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgISW3Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Sep 2020 18:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgISW3Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Sep 2020 18:29:25 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB79C0613CE;
        Sat, 19 Sep 2020 15:29:25 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so8015935ljd.1;
        Sat, 19 Sep 2020 15:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NKi+wjC6dWzf+Z7xGQjWsEc0rij7x/ja/YI7q4yBabs=;
        b=kHIQOZ0CB9+LA4FOUvowUp2lKrrUOWcfne+NEfcfXJk0OTupohDxTLR43rdPYnpU5U
         GicCbI0EvyF77t+uvfFgtPParoW7MY/QP0EkmSsc2ro8g3fNiPcAMdMmRDU9CpFLDQVD
         o5gGX+mk1OtmrvatXkrMovoRWzxpYSg+jfHCjZsjENQNSzY6KylvlDdh1BRYn/Aa4Czn
         W2itJWQNQynupCSvO/KbveyopSz6z7xXAn+2LJEjL9Gg2X0HY1P/+AfLFYXXdtIxXOKn
         msgL17woaTsPj05OK1vNY+w48J+/Uphiyvq6mEPxYaIuguoZ1m1m1EKqjBV7lxcwGW+k
         ciTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NKi+wjC6dWzf+Z7xGQjWsEc0rij7x/ja/YI7q4yBabs=;
        b=TZt1JEAdJTr9sKwGjL97UM5Huh8cFkOLXGHE5NmQNHafWwMtsqbuRGaiLX8noclHKd
         67iZhk0W1xZp08LreWmTXtdqoUpcH3T/z6Rh09bawRJ3IsZxplBzMKz5G9FRAm0fczg/
         HnhqTFZqR2C7nM7NYscQbDKS+3z2IAAxk9V20yPri0ljpJm8BpTfIeg7IMHxxi+2oGrA
         5p8lGJwm5wW/P9AxXNkOEgTf8P1OY9buge6KPdjVFd3vjth5U7owCu4rvXxHl6im6D/D
         R5Sl1AUNzj8KND5tM4TLuNULJtlTtMdC20topRZYLIYmYpkcveNly1uJXyKqjoWsVzD0
         qHzw==
X-Gm-Message-State: AOAM532Hc5RkXS/jkwo6oMI4enli8lv2PFaLVFb9hSVQbx4N514HLNJU
        icOTi9MOoMMLettzGl+31VU=
X-Google-Smtp-Source: ABdhPJyKClnDWdlUib5KUXzdnN+24azy9IRGBZhTe+irm0IOao3KfXeA08PP2jHuylJgT4MIk5ApWg==
X-Received: by 2002:a2e:7806:: with SMTP id t6mr14590542ljc.48.1600554563573;
        Sat, 19 Sep 2020 15:29:23 -0700 (PDT)
Received: from z50.localnet (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id o128sm1435563lfa.126.2020.09.19.15.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 15:29:22 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Christoph Hellwig <hch@lst.de>, Tony Lindgren <tony@atomide.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM/omap1: switch to use dma_direct_set_offset for lbus DMA offsets
Date:   Sun, 20 Sep 2020 00:29:20 +0200
Message-ID: <2184547.ElGaqSPkdT@z50>
In-Reply-To: <20200918054933.GK7101@atomide.com>
References: <20200917173229.3311382-1-hch@lst.de> <20200917173229.3311382-2-hch@lst.de> <20200918054933.GK7101@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Friday, September 18, 2020 7:49:33 A.M. CEST Tony Lindgren wrote:
> * Christoph Hellwig <hch@lst.de> [200917 17:37]:
> > Switch the omap1510 platform ohci device to use dma_direct_set_offset
> > to set the DMA offset instead of using direct hooks into the DMA
> > mapping code and remove the now unused hooks.
> 
> Looks nice to me :) I still can't test this probably for few more weeks
> though but hopefully Aaro or Janusz (Added to Cc) can test it.

Works for me on Amstrad Delta (tested with a USB ethernet adapter).

Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Thanks,
Janusz

> 
> Regards,
> 
> Tony
> 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/arm/include/asm/dma-direct.h         | 18 -------------
> >  arch/arm/mach-omap1/include/mach/memory.h | 31 -----------------------
> >  arch/arm/mach-omap1/usb.c                 | 22 ++++++++++++++++
> >  3 files changed, 22 insertions(+), 49 deletions(-)
> > 
> > diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
> > index 436544aeb83405..77fcb7ee5ec907 100644
> > --- a/arch/arm/include/asm/dma-direct.h
> > +++ b/arch/arm/include/asm/dma-direct.h
> > @@ -9,7 +9,6 @@
> >   * functions used internally by the DMA-mapping API to provide DMA
> >   * addresses. They must not be used by drivers.
> >   */
> > -#ifndef __arch_pfn_to_dma
> >  static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
> >  {
> >  	if (dev && dev->dma_range_map)
> > @@ -34,23 +33,6 @@ static inline dma_addr_t virt_to_dma(struct device *dev, void *addr)
> >  	return (dma_addr_t)__virt_to_bus((unsigned long)(addr));
> >  }
> >  
> > -#else
> > -static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
> > -{
> > -	return __arch_pfn_to_dma(dev, pfn);
> > -}
> > -
> > -static inline unsigned long dma_to_pfn(struct device *dev, dma_addr_t addr)
> > -{
> > -	return __arch_dma_to_pfn(dev, addr);
> > -}
> > -
> > -static inline dma_addr_t virt_to_dma(struct device *dev, void *addr)
> > -{
> > -	return __arch_virt_to_dma(dev, addr);
> > -}
> > -#endif
> > -
> >  static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
> >  {
> >  	unsigned int offset = paddr & ~PAGE_MASK;
> > diff --git a/arch/arm/mach-omap1/include/mach/memory.h b/arch/arm/mach-omap1/include/mach/memory.h
> > index 1142560e0078f5..36bc0000cb6ab8 100644
> > --- a/arch/arm/mach-omap1/include/mach/memory.h
> > +++ b/arch/arm/mach-omap1/include/mach/memory.h
> > @@ -14,42 +14,11 @@
> >   * OMAP-1510 bus address is translated into a Local Bus address if the
> >   * OMAP bus type is lbus. We do the address translation based on the
> >   * device overriding the defaults used in the dma-mapping API.
> > - * Note that the is_lbus_device() test is not very efficient on 1510
> > - * because of the strncmp().
> >   */
> > -#if defined(CONFIG_ARCH_OMAP15XX) && !defined(__ASSEMBLER__)
> >  
> >  /*
> >   * OMAP-1510 Local Bus address offset
> >   */
> >  #define OMAP1510_LB_OFFSET	UL(0x30000000)
> >  
> > -#define virt_to_lbus(x)		((x) - PAGE_OFFSET + OMAP1510_LB_OFFSET)
> > -#define lbus_to_virt(x)		((x) - OMAP1510_LB_OFFSET + PAGE_OFFSET)
> > -#define is_lbus_device(dev)	(cpu_is_omap15xx() && dev && (strncmp(dev_name(dev), "ohci", 4) == 0))
> > -
> > -#define __arch_pfn_to_dma(dev, pfn)	\
> > -	({ dma_addr_t __dma = __pfn_to_phys(pfn); \
> > -	   if (is_lbus_device(dev)) \
> > -		__dma = __dma - PHYS_OFFSET + OMAP1510_LB_OFFSET; \
> > -	   __dma; })
> > -
> > -#define __arch_dma_to_pfn(dev, addr)	\
> > -	({ dma_addr_t __dma = addr;				\
> > -	   if (is_lbus_device(dev))				\
> > -		__dma += PHYS_OFFSET - OMAP1510_LB_OFFSET;	\
> > -	   __phys_to_pfn(__dma);				\
> > -	})
> > -
> > -#define __arch_dma_to_virt(dev, addr)	({ (void *) (is_lbus_device(dev) ? \
> > -						lbus_to_virt(addr) : \
> > -						__phys_to_virt(addr)); })
> > -
> > -#define __arch_virt_to_dma(dev, addr)	({ unsigned long __addr = (unsigned long)(addr); \
> > -					   (dma_addr_t) (is_lbus_device(dev) ? \
> > -						virt_to_lbus(__addr) : \
> > -						__virt_to_phys(__addr)); })
> > -
> > -#endif	/* CONFIG_ARCH_OMAP15XX */
> > -
> >  #endif
> > diff --git a/arch/arm/mach-omap1/usb.c b/arch/arm/mach-omap1/usb.c
> > index d8e9bbda8f7bdd..ba8566204ea9f4 100644
> > --- a/arch/arm/mach-omap1/usb.c
> > +++ b/arch/arm/mach-omap1/usb.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/init.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/io.h>
> >  
> >  #include <asm/irq.h>
> > @@ -542,6 +543,25 @@ static u32 __init omap1_usb2_init(unsigned nwires, unsigned alt_pingroup)
> >  /* ULPD_APLL_CTRL */
> >  #define APLL_NDPLL_SWITCH	(1 << 0)
> >  
> > +static int omap_1510_usb_ohci_notifier(struct notifier_block *nb,
> > +		unsigned long event, void *data)
> > +{
> > +	struct device *dev = data;
> > +
> > +	if (event != BUS_NOTIFY_ADD_DEVICE)
> > +		return NOTIFY_DONE;
> > +
> > +	if (strncmp(dev_name(dev), "ohci", 4) == 0 &&
> > +	    dma_direct_set_offset(dev, PHYS_OFFSET, OMAP1510_LB_OFFSET,
> > +			(u64)-1))
> > +		WARN_ONCE(1, "failed to set DMA offset\n");
> > +	return NOTIFY_OK;
> > +}
> > +
> > +static struct notifier_block omap_1510_usb_ohci_nb = {
> > +	.notifier_call		= omap_1510_usb_ohci_notifier,
> > +};
> > +
> >  static void __init omap_1510_usb_init(struct omap_usb_config *config)
> >  {
> >  	unsigned int val;
> > @@ -600,6 +620,8 @@ static void __init omap_1510_usb_init(struct omap_usb_config *config)
> >  	if (config->register_host) {
> >  		int status;
> >  
> > +		bus_register_notifier(&platform_bus_type,
> > +				      &omap_1510_usb_ohci_nb);
> >  		ohci_device.dev.platform_data = config;
> >  		status = platform_device_register(&ohci_device);
> >  		if (status)
> 




