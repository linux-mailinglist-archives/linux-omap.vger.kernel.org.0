Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C808A2CCA23
	for <lists+linux-omap@lfdr.de>; Wed,  2 Dec 2020 23:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgLBW63 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Dec 2020 17:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728720AbgLBW63 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Dec 2020 17:58:29 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC96C0617A7
        for <linux-omap@vger.kernel.org>; Wed,  2 Dec 2020 14:57:43 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id q3so200931pgr.3
        for <linux-omap@vger.kernel.org>; Wed, 02 Dec 2020 14:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=03lS8/08O5qiVV+EqkA7gUAQiAmtt/Wfs1wnMODaFZw=;
        b=jqhG/EcDjjJCJ40jqiKC0VUlHsSd4NOJO0pMry3r2FSb+AefCmUuC1tL69KD8Sj4pe
         CgJP7Mv3pLJzPwVOMOB3BD+WozEYl5U5mIuBbFMBqoS4sEv+KUyoMLxUX22/mr8fcJqY
         1va4I6M5TDsaCMmzzOOoQGts3bL5v5SzQVEeLAV81lkTChWyF15bpKdLHqMoqKDM3Y4I
         wCJrJf9bRBbXv8KixmPt3uKjQ3QxJRGztvkG1lOr4kvk9D+O8n44NkJG2tVwGH5LO4La
         44HD7eDCjDw4ZHvxroLBaPxA5S+icBBFvgM3k+j8/H+q8ZhSOOFPdXCPAozDxHSQ7ehI
         iNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=03lS8/08O5qiVV+EqkA7gUAQiAmtt/Wfs1wnMODaFZw=;
        b=lH/nIACn+NZin9imzebbveW66cq20JlDeuLHEHl7MhQTa/8Wd9b2+3L8MXBwAhjctN
         /ZhsU+h4Kf8XMpZ12t6ac9KAziFH7TClY3EznIokkMhhjpgfvAIyt2KpK+FojjyHmbYM
         mzaSkAAA2RGWV/q2ZuQyuO0in5FN3GEFOBfrYWK6DfV13P8TuHpYWimIKuoUFmC3qmpw
         o6F/KBkv55Z6gkoqTHHBtgLCz5d20aPm49G7Apyt0FRWJtcjqzRKmekpLksEizo/5BIA
         T93jxZ+Kejt2bKs11Rz9fAiIcn9lzcRvrsGE0eRAADZ2QipLJjaHC+9Qw02JujcqBsLr
         HiIg==
X-Gm-Message-State: AOAM532nPu5wlx0gnvBTsMMMZ7Mkybk64yNfo75nyohs5yWcRWTbpgMX
        N8Ot2DooE2h0Fcv2cuwwZ0Dw509izOvyybv/
X-Google-Smtp-Source: ABdhPJzR8oCq0QTTdiwYD94q1MTbzPatfXYaHcPzK3dAn6lOvXXM66unvxqnycNNFOL5YnKgQ3C0ww==
X-Received: by 2002:a63:2026:: with SMTP id g38mr481525pgg.30.1606949862625;
        Wed, 02 Dec 2020 14:57:42 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 25sm136571pfp.45.2020.12.02.14.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 14:57:42 -0800 (PST)
Date:   Wed, 2 Dec 2020 15:57:39 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: Re: [PATCH v2 3/6] remoteproc/pru: Add support for PRU specific
 interrupt configuration
Message-ID: <20201202225739.GF1282360@xps15>
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
 <20201119140850.12268-4-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119140850.12268-4-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Nov 19, 2020 at 03:08:47PM +0100, Grzegorz Jaszczyk wrote:
> The firmware blob can contain optional ELF sections: .resource_table
> section and .pru_irq_map one. The second one contains the PRUSS
> interrupt mapping description, which needs to be setup before powering
> on the PRU core. To avoid RAM wastage this ELF section is not mapped to
> any ELF segment (by the firmware linker) and therefore is not loaded to
> PRU memory.
> 
> The PRU interrupt configuration is handled within the PRUSS INTC irqchip
> driver and leverages the system events to interrupt channels and host
> interrupts mapping configuration. Relevant irq routing information is
> passed through a special .pru_irq_map ELF section (for interrupts routed
> to and used by PRU cores) or via the PRU application's device tree node
> (for interrupts routed to and used by the main CPU). The mappings are
> currently programmed during the booting/shutdown of the PRU.
> 
> The interrupt configuration passed through .pru_irq_map ELF section is
> optional. It varies on specific firmware functionality and therefore
> have to be unwinded during PRU stop and performed again during
> PRU start.
> 
> Co-developed-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
> v1->v2:
> Address Suman comments:
> - Rework pru_rproc_find_interrupt_map() style: get rid of generic ELF
>   helpers macros usage and stick with elf32_* related structs instead
>   (in order to be consistent with pru_rproc_load_elf_segments() style).
> - Improve comments and dev_err msgs in pru_rproc_find_interrupt_map().
> - Use u8 instead of ssize_t for evt_count.
> ---
>  drivers/remoteproc/pru_rproc.c | 180 +++++++++++++++++++++++++++++++++
>  drivers/remoteproc/pru_rproc.h |  46 +++++++++
>  2 files changed, 226 insertions(+)
>  create mode 100644 drivers/remoteproc/pru_rproc.h
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index b686f19f9b1a..c68c3d6bfddd 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -11,13 +11,16 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/irqdomain.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_irq.h>
>  #include <linux/pruss_driver.h>
>  #include <linux/remoteproc.h>
>  
>  #include "remoteproc_internal.h"
>  #include "remoteproc_elf_helpers.h"
> +#include "pru_rproc.h"
>  
>  /* PRU_ICSS_PRU_CTRL registers */
>  #define PRU_CTRL_CTRL		0x0000
> @@ -42,6 +45,8 @@
>  #define PRU_SDRAM_DA	0x2000	/* Secondary Data RAM */
>  #define PRU_SHRDRAM_DA	0x10000 /* Shared Data RAM */
>  
> +#define MAX_PRU_SYS_EVENTS 160
> +
>  /**
>   * enum pru_iomem - PRU core memory/register range identifiers
>   *
> @@ -65,6 +70,10 @@ enum pru_iomem {
>   * @rproc: remoteproc pointer for this PRU core
>   * @mem_regions: data for each of the PRU memory regions
>   * @fw_name: name of firmware image used during loading
> + * @mapped_irq: virtual interrupt numbers of created fw specific mapping
> + * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
> + * @pru_interrupt_map_sz: pru_interrupt_map size
> + * @evt_count: number of mapped events
>   */
>  struct pru_rproc {
>  	int id;
> @@ -73,6 +82,10 @@ struct pru_rproc {
>  	struct rproc *rproc;
>  	struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
>  	const char *fw_name;
> +	int *mapped_irq;
> +	struct pru_irq_rsc *pru_interrupt_map;
> +	size_t pru_interrupt_map_sz;
> +	u8 evt_count;
>  };
>  
>  static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
> @@ -86,15 +99,107 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
>  	writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
>  }
>  

> +static void pru_dispose_irq_mapping(struct pru_rproc *pru)
> +{
> +	while (pru->evt_count--) {
> +		if (pru->mapped_irq[pru->evt_count] > 0)
> +			irq_dispose_mapping(pru->mapped_irq[pru->evt_count]);
> +	}
> +
> +	kfree(pru->mapped_irq);
> +}
> +
> +/*
> + * Parse the custom PRU interrupt map resource and configure the INTC
> + * appropriately.
> + */
> +static int pru_handle_intrmap(struct rproc *rproc)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct pru_rproc *pru = rproc->priv;
> +	struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
> +	struct irq_fwspec fwspec;
> +	struct device_node *irq_parent;
> +	int i, ret = 0;
> +
> +	/* not having pru_interrupt_map is not an error */
> +	if (!rsc)
> +		return 0;
> +
> +	/* currently supporting only type 0 */
> +	if (rsc->type != 0) {
> +		dev_err(dev, "unsupported rsc type: %d\n", rsc->type);
> +		return -EINVAL;
> +	}
> +
> +	if (rsc->num_evts < 0 || rsc->num_evts > MAX_PRU_SYS_EVENTS)
> +		return -EINVAL;
> +

pru_irq_rsc::num_evts is a 'u8' and can't be negative.

> +	if (sizeof(*rsc) + rsc->num_evts * sizeof(struct pruss_int_map) !=
> +	    pru->pru_interrupt_map_sz)
> +		return -EINVAL;
> +
> +	pru->evt_count = rsc->num_evts;
> +	pru->mapped_irq = kcalloc(pru->evt_count, sizeof(int), GFP_KERNEL);
> +	if (!pru->mapped_irq)
> +		return -ENOMEM;
> +
> +	/*
> +	 * parse and fill in system event to interrupt channel and
> +	 * channel-to-host mapping
> +	 */
> +	irq_parent = of_irq_find_parent(pru->dev->of_node);
> +	if (!irq_parent) {
> +		kfree(pru->mapped_irq);
> +		return -ENODEV;
> +	}
> +
> +	fwspec.fwnode = of_node_to_fwnode(irq_parent);
> +	fwspec.param_count = 3;
> +	for (i = 0; i < pru->evt_count; i++) {
> +		fwspec.param[0] = rsc->pru_intc_map[i].event;
> +		fwspec.param[1] = rsc->pru_intc_map[i].chnl;
> +		fwspec.param[2] = rsc->pru_intc_map[i].host;
> +
> +		dev_dbg(dev, "mapping%d: event %d, chnl %d, host %d\n",
> +		       i, fwspec.param[0], fwspec.param[1], fwspec.param[2]);
> +
> +		pru->mapped_irq[i] = irq_create_fwspec_mapping(&fwspec);
> +		if (pru->mapped_irq[i] < 0) {

Function irq_create_fwspec_mapping() returns an unsigned int - theoretically the
above check could return a false positive.  I suggest to make
pru_proc::mapped_irq a '*unsigned int" and revise the error condition.

> +			dev_err(dev, "failed to get virq\n");
> +			ret = pru->mapped_irq[i];
> +			goto map_fail;
> +		}
> +	}
> +
> +	return ret;
> +
> +map_fail:
> +	pru_dispose_irq_mapping(pru);
> +
> +	return ret;
> +}
> +
>  static int pru_rproc_start(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	struct pru_rproc *pru = rproc->priv;
>  	u32 val;
> +	int ret;
>  
>  	dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
>  		pru->id, (rproc->bootaddr >> 2));
>  
> +	ret = pru_handle_intrmap(rproc);
> +	/*
> +	 * reset references to pru interrupt map - they will stop being valid
> +	 * after rproc_start returns
> +	 */

Why is that?  As far as I understand the interrupt map points inside the
firmware image, which won't go away until @rproc is disposed of or users change
it via sysfs.  And the latter can't happen when the remote processor is active.
Can't this go to pru_dispose_irq_mapping()?

More comments to come tomorrow.

Thanks,
Mathieu

> +	pru->pru_interrupt_map = NULL;
> +	pru->pru_interrupt_map_sz = 0;
> +	if (ret)
> +		return ret;
> +
>  	val = CTRL_CTRL_EN | ((rproc->bootaddr >> 2) << 16);
>  	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
>  
> @@ -113,6 +218,10 @@ static int pru_rproc_stop(struct rproc *rproc)
>  	val &= ~CTRL_CTRL_EN;
>  	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
>  
> +	/* dispose irq mapping - new firmware can provide new mapping */
> +	if (pru->mapped_irq)
> +		pru_dispose_irq_mapping(pru);
> +
>  	return 0;
>  }
>  
> @@ -275,12 +384,70 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static const void *
> +pru_rproc_find_interrupt_map(struct device *dev, const struct firmware *fw)
> +{
> +	struct elf32_shdr *shdr, *name_table_shdr;
> +	const char *name_table;
> +	const u8 *elf_data = fw->data;
> +	struct elf32_hdr *ehdr = (struct elf32_hdr *)elf_data;
> +	u16 shnum = ehdr->e_shnum;
> +	u16 shstrndx = ehdr->e_shstrndx;
> +	int i;
> +
> +	/* first, get the section header */
> +	shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
> +	/* compute name table section header entry in shdr array */
> +	name_table_shdr = shdr + shstrndx;
> +	/* finally, compute the name table section address in elf */
> +	name_table = elf_data + name_table_shdr->sh_offset;
> +
> +	for (i = 0; i < shnum; i++, shdr++) {
> +		u32 size = shdr->sh_size;
> +		u32 offset = shdr->sh_offset;
> +		u32 name = shdr->sh_name;
> +
> +		if (strcmp(name_table + name, ".pru_irq_map"))
> +			continue;
> +
> +		/* make sure we have the entire irq map */
> +		if (offset + size > fw->size || offset + size < size) {
> +			dev_err(dev, ".pru_irq_map section truncated\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		/* make sure irq map has at least the header */
> +		if (sizeof(struct pru_irq_rsc) > size) {
> +			dev_err(dev, "header-less .pru_irq_map section\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		return shdr;
> +	}
> +
> +	dev_dbg(dev, "no .pru_irq_map section found for this fw\n");
> +
> +	return NULL;
> +}
> +
>  /*
>   * Use a custom parse_fw callback function for dealing with PRU firmware
>   * specific sections.
> + *
> + * The firmware blob can contain optional ELF sections: .resource_table section
> + * and .pru_irq_map one. The second one contains the PRUSS interrupt mapping
> + * description, which needs to be setup before powering on the PRU core. To
> + * avoid RAM wastage this ELF section is not mapped to any ELF segment (by the
> + * firmware linker) and therefore is not loaded to PRU memory.
>   */
>  static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
> +	struct device *dev = &rproc->dev;
> +	struct pru_rproc *pru = rproc->priv;
> +	const u8 *elf_data = fw->data;
> +	const void *shdr;
> +	u8 class = fw_elf_get_class(fw);
> +	u64 sh_offset;
>  	int ret;
>  
>  	/* load optional rsc table */
> @@ -290,6 +457,19 @@ static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	else if (ret)
>  		return ret;
>  
> +	/* find .pru_interrupt_map section, not having it is not an error */
> +	shdr = pru_rproc_find_interrupt_map(dev, fw);
> +	if (IS_ERR(shdr))
> +		return PTR_ERR(shdr);
> +
> +	if (!shdr)
> +		return 0;
> +
> +	/* preserve pointer to PRU interrupt map together with it size */
> +	sh_offset = elf_shdr_get_sh_offset(class, shdr);
> +	pru->pru_interrupt_map = (struct pru_irq_rsc *)(elf_data + sh_offset);
> +	pru->pru_interrupt_map_sz = elf_shdr_get_sh_size(class, shdr);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/remoteproc/pru_rproc.h b/drivers/remoteproc/pru_rproc.h
> new file mode 100644
> index 000000000000..8ee9c3171610
> --- /dev/null
> +++ b/drivers/remoteproc/pru_rproc.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +/*
> + * PRUSS Remote Processor specific types
> + *
> + * Copyright (C) 2014-2020 Texas Instruments Incorporated - https://www.ti.com/
> + *	Suman Anna <s-anna@ti.com>
> + */
> +
> +#ifndef _PRU_RPROC_H_
> +#define _PRU_RPROC_H_
> +
> +/**
> + * struct pruss_int_map - PRU system events _to_ channel and host mapping
> + * @event: number of the system event
> + * @chnl: channel number assigned to a given @event
> + * @host: host number assigned to a given @chnl
> + *
> + * PRU system events are mapped to channels, and these channels are mapped
> + * to host interrupts. Events can be mapped to channels in a one-to-one or
> + * many-to-one ratio (multiple events per channel), and channels can be
> + * mapped to host interrupts in a one-to-one or many-to-one ratio (multiple
> + * channels per interrupt).
> + */
> +struct pruss_int_map {
> +	u8 event;
> +	u8 chnl;
> +	u8 host;
> +};
> +
> +/**
> + * struct pru_irq_rsc - PRU firmware section header for IRQ data
> + * @type: resource type
> + * @num_evts: number of described events
> + * @pru_intc_map: PRU interrupt routing description
> + *
> + * The PRU firmware blob can contain optional .pru_irq_map ELF section, which
> + * provides the PRUSS interrupt mapping description. The pru_irq_rsc struct
> + * describes resource entry format.
> + */
> +struct pru_irq_rsc {
> +	u8 type;
> +	u8 num_evts;
> +	struct pruss_int_map pru_intc_map[];
> +} __packed;
> +
> +#endif	/* _PRU_RPROC_H_ */
> -- 
> 2.29.0
> 
