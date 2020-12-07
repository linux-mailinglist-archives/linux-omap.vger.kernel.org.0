Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F5A2D17AB
	for <lists+linux-omap@lfdr.de>; Mon,  7 Dec 2020 18:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgLGRiP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Dec 2020 12:38:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgLGRiO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Dec 2020 12:38:14 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD38C061749
        for <linux-omap@vger.kernel.org>; Mon,  7 Dec 2020 09:37:34 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id lb18so6119pjb.5
        for <linux-omap@vger.kernel.org>; Mon, 07 Dec 2020 09:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7Ebpt5cfMiTKbuZ5nIn9zCZ7+Zci76UBuARvG/gB8ZE=;
        b=gcVSZG47wTiQMICsr7SJ11C5o1aFkVs/laLQb9timmk9vS95ha7ICe8nQORu06hcif
         WNU33sxdItnJTGIhKmbmB7tRSOisiAjMPDs+3eaaOHRmfWT4DkKZHNR+0h4meWWyEPWk
         FaxelRg3z8APUQcn3AcjPEes/1K2GxtyeZpoQ9GYqi6YPyVH7ea5NjEwb8qYXdnS2VYN
         0EO9oUNmsXsRMlxz4Q5cFpgpVi8zc21kNP1xQb4fkSrB2J8K2Jty2UYLRBgvE+n6ig0g
         ITUXEwYTSY/YCbBjn4/tg6HPO2tao+4S2VYskjpt9iP+90rGn+hWb22BJHFwhfmJI8fI
         0WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7Ebpt5cfMiTKbuZ5nIn9zCZ7+Zci76UBuARvG/gB8ZE=;
        b=N0OKz0+Mu387soKRhF8F4c9iY8Y8IDCSIK1/nFCfu+/gfepym1JODL/RVVghByXaCl
         yBHygGjOADFLMAz+y3+dBtdyz7u1WZwRjfdO8KI24VUndYVEOLtbdx6Y2Iwp0EG/ZOmR
         o+901tORityfN27zARUJ0M4aUzEWGwTD2yUijMz+2VUUmcwJ+D+hyW7nl/vRh9DBwiPc
         rUsrtT7CE3pZgXI8iU8u4oEucjwJ6giOwIhkz0GBcp/HPGv3sd60K5gC+KJ7hs5YaA5q
         uSXE7Fqc9Vf2LcjnwhKoBMAgHhcUCQpXGzvOsakqxxtZXgatD+S0Sk57Rg0wY5xXyf+2
         WmcA==
X-Gm-Message-State: AOAM530PbyC10+yujZvnf8Y1Z9FUei+VURYt1512Jf2/hzwwsP1JUiNS
        u6mvdC2pfCBACJpjDrCMrogfrg==
X-Google-Smtp-Source: ABdhPJxkttzghd82KPAVm3omAXItDw4FUmg0cNs4oz1Thv7OBqw2tkozDr/U+GFRWeA9Y/nfHxgQ1g==
X-Received: by 2002:a17:90b:943:: with SMTP id dw3mr16948945pjb.97.1607362654047;
        Mon, 07 Dec 2020 09:37:34 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c2sm14814740pfa.59.2020.12.07.09.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 09:37:33 -0800 (PST)
Date:   Mon, 7 Dec 2020 10:37:31 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: Re: [PATCH v3 3/6] remoteproc: pru: Add support for PRU specific
 interrupt configuration
Message-ID: <20201207173731.GA1509079@xps15>
References: <20201204201807.14716-1-grzegorz.jaszczyk@linaro.org>
 <20201204201807.14716-4-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204201807.14716-4-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Dec 04, 2020 at 09:18:04PM +0100, Grzegorz Jaszczyk wrote:
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
> v2-v3:
> Address Mathieu comments:
> - Because irq_create_fwspec_mapping() returns an unsigned int, convert
>   mapped_irq type to 'unsigned int *'. Due to this change update
>   relevant error path.
> - Since the num_evts is u8 value and can't be negative drop
>   'rsc->num_evts < 0' check.
> 
> Fix checkpatch --strict warning:
>  CHECK: Alignment should match open parenthesis
>  #163: FILE: drivers/remoteproc/pru_rproc.c:165:
>  +		dev_dbg(dev, "mapping%d: event %d, chnl %d, host %d\n",
>  +		       i, fwspec.param[0], fwspec.param[1], fwspec.param[2]);
> 
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
> index d33392bbd8af..4ef59d15d888 100644
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
> +	unsigned int *mapped_irq;
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
> +	if (rsc->num_evts > MAX_PRU_SYS_EVENTS)
> +		return -EINVAL;
> +
> +	if (sizeof(*rsc) + rsc->num_evts * sizeof(struct pruss_int_map) !=
> +	    pru->pru_interrupt_map_sz)
> +		return -EINVAL;
> +
> +	pru->evt_count = rsc->num_evts;
> +	pru->mapped_irq = kcalloc(pru->evt_count, sizeof(int), GFP_KERNEL);

sizeof(unsigned int)

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
> +			i, fwspec.param[0], fwspec.param[1], fwspec.param[2]);
> +
> +		pru->mapped_irq[i] = irq_create_fwspec_mapping(&fwspec);
> +		if (!pru->mapped_irq[i]) {
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
> @@ -273,12 +382,70 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
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
> @@ -288,6 +455,19 @@ static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
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
