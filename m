Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40CD52CF33D
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 18:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgLDRlB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 12:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730880AbgLDRlA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 12:41:00 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF43C061A51
        for <linux-omap@vger.kernel.org>; Fri,  4 Dec 2020 09:40:20 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q10so4226794pfn.0
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 09:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p66dAZ6SLWm01mjV5Tw/VD4DvpdLjI/e51OKNApulLg=;
        b=WQt67mUdCQgXxlaaA5KFkwfSWC2pY1vFqWFxlUwvodxyeZHKtSfH3KHMDCl8DPomBT
         8I2KomVzUwq5gPJ+WDysp5kvoxNeS6fljSXRimijcefAh8KhcSGZ0qm9rvQc5Y431qz3
         BFHLIvDQAnwCS2hpNMQzXksjzYCipKvdVQ7EVs6UeCBpa8MXcOxVyA2juZnm66an4XLS
         hc2npqg04vwqIje2/jAAyJ5buMoPIXcSqvG8bbCpxFa6SwCi86fOS4UW6YGt7BNlYgWO
         beCbqwYgJg8kj0l1S/2/e1UTTUtet20ilp3d6cL5JO0u/lBlunVCXzLEuZwOAH5IWiJa
         Tpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p66dAZ6SLWm01mjV5Tw/VD4DvpdLjI/e51OKNApulLg=;
        b=ZHuc36QvYSyDt/cspSFuPdvKCFusBI1s7UrxEVLIE4wkBiD7Ac7G6SJpYWn+cmnwIk
         QLRphLZ3vCNan1gKuS7SaeR2maC5VHEDn0RxP49sgRJvppbC2KSVHl10SzE5iA/qMMkX
         CZ4RUp8Eym9WushNk7ByKitnTOQD1WFIQcxeuthN1s0X4ejiuhgmPuD0Ef84xDiq2UVq
         VF3Y8LS1LfJcTKxPXX28UVrEUtQS/iWPEyjae+cG0giwomL5LRiSc4KHPydb43usyKxF
         JGdihwPJAxhteuNwAb0QtWxajiNq8q5kqPe+rg0fQSVDdpPo/lEd+k5OsP6djXJykVYJ
         OhQg==
X-Gm-Message-State: AOAM5324bggo72nH4a++oW+x9gohy3klISoQz09IJtUPN0BlkM67Cnzr
        Z9YAf6qr8n1PArws2zl/38wKew==
X-Google-Smtp-Source: ABdhPJwMLaP/LaAcqZQfgOXXqbNn/tj/kn2bvHxVw6phMHfZBeOjxSQ0vU04mvAjY4W0TSe6pFq7Rw==
X-Received: by 2002:a63:6683:: with SMTP id a125mr8283405pgc.272.1607103619504;
        Fri, 04 Dec 2020 09:40:19 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id s70sm3311160pfc.97.2020.12.04.09.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 09:40:18 -0800 (PST)
Date:   Fri, 4 Dec 2020 10:40:16 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Anna, Suman" <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v2 3/6] remoteproc/pru: Add support for PRU specific
 interrupt configuration
Message-ID: <20201204174016.GD1392978@xps15>
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
 <20201119140850.12268-4-grzegorz.jaszczyk@linaro.org>
 <20201202225739.GF1282360@xps15>
 <CAMxfBF6az3RGRq00qzbLzPidgG3fu9sXrLzDCDURCUtMoMMfNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMxfBF6az3RGRq00qzbLzPidgG3fu9sXrLzDCDURCUtMoMMfNA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Dec 04, 2020 at 03:11:55PM +0100, Grzegorz Jaszczyk wrote:
> Hi Mathieu,
> 
> On Wed, 2 Dec 2020 at 23:57, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > On Thu, Nov 19, 2020 at 03:08:47PM +0100, Grzegorz Jaszczyk wrote:
> > > The firmware blob can contain optional ELF sections: .resource_table
> > > section and .pru_irq_map one. The second one contains the PRUSS
> > > interrupt mapping description, which needs to be setup before powering
> > > on the PRU core. To avoid RAM wastage this ELF section is not mapped to
> > > any ELF segment (by the firmware linker) and therefore is not loaded to
> > > PRU memory.
> > >
> > > The PRU interrupt configuration is handled within the PRUSS INTC irqchip
> > > driver and leverages the system events to interrupt channels and host
> > > interrupts mapping configuration. Relevant irq routing information is
> > > passed through a special .pru_irq_map ELF section (for interrupts routed
> > > to and used by PRU cores) or via the PRU application's device tree node
> > > (for interrupts routed to and used by the main CPU). The mappings are
> > > currently programmed during the booting/shutdown of the PRU.
> > >
> > > The interrupt configuration passed through .pru_irq_map ELF section is
> > > optional. It varies on specific firmware functionality and therefore
> > > have to be unwinded during PRU stop and performed again during
> > > PRU start.
> > >
> > > Co-developed-by: Suman Anna <s-anna@ti.com>
> > > Signed-off-by: Suman Anna <s-anna@ti.com>
> > > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > > ---
> > > v1->v2:
> > > Address Suman comments:
> > > - Rework pru_rproc_find_interrupt_map() style: get rid of generic ELF
> > >   helpers macros usage and stick with elf32_* related structs instead
> > >   (in order to be consistent with pru_rproc_load_elf_segments() style).
> > > - Improve comments and dev_err msgs in pru_rproc_find_interrupt_map().
> > > - Use u8 instead of ssize_t for evt_count.
> > > ---
> > >  drivers/remoteproc/pru_rproc.c | 180 +++++++++++++++++++++++++++++++++
> > >  drivers/remoteproc/pru_rproc.h |  46 +++++++++
> > >  2 files changed, 226 insertions(+)
> > >  create mode 100644 drivers/remoteproc/pru_rproc.h
> > >
> > > diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> > > index b686f19f9b1a..c68c3d6bfddd 100644
> > > --- a/drivers/remoteproc/pru_rproc.c
> > > +++ b/drivers/remoteproc/pru_rproc.c
> > > @@ -11,13 +11,16 @@
> > >   */
> > >
> > >  #include <linux/bitops.h>
> > > +#include <linux/irqdomain.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_device.h>
> > > +#include <linux/of_irq.h>
> > >  #include <linux/pruss_driver.h>
> > >  #include <linux/remoteproc.h>
> > >
> > >  #include "remoteproc_internal.h"
> > >  #include "remoteproc_elf_helpers.h"
> > > +#include "pru_rproc.h"
> > >
> > >  /* PRU_ICSS_PRU_CTRL registers */
> > >  #define PRU_CTRL_CTRL                0x0000
> > > @@ -42,6 +45,8 @@
> > >  #define PRU_SDRAM_DA 0x2000  /* Secondary Data RAM */
> > >  #define PRU_SHRDRAM_DA       0x10000 /* Shared Data RAM */
> > >
> > > +#define MAX_PRU_SYS_EVENTS 160
> > > +
> > >  /**
> > >   * enum pru_iomem - PRU core memory/register range identifiers
> > >   *
> > > @@ -65,6 +70,10 @@ enum pru_iomem {
> > >   * @rproc: remoteproc pointer for this PRU core
> > >   * @mem_regions: data for each of the PRU memory regions
> > >   * @fw_name: name of firmware image used during loading
> > > + * @mapped_irq: virtual interrupt numbers of created fw specific mapping
> > > + * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
> > > + * @pru_interrupt_map_sz: pru_interrupt_map size
> > > + * @evt_count: number of mapped events
> > >   */
> > >  struct pru_rproc {
> > >       int id;
> > > @@ -73,6 +82,10 @@ struct pru_rproc {
> > >       struct rproc *rproc;
> > >       struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
> > >       const char *fw_name;
> > > +     int *mapped_irq;
> > > +     struct pru_irq_rsc *pru_interrupt_map;
> > > +     size_t pru_interrupt_map_sz;
> > > +     u8 evt_count;
> > >  };
> > >
> > >  static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
> > > @@ -86,15 +99,107 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
> > >       writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
> > >  }
> > >
> >
> > > +static void pru_dispose_irq_mapping(struct pru_rproc *pru)
> > > +{
> > > +     while (pru->evt_count--) {
> > > +             if (pru->mapped_irq[pru->evt_count] > 0)
> > > +                     irq_dispose_mapping(pru->mapped_irq[pru->evt_count]);
> > > +     }
> > > +
> > > +     kfree(pru->mapped_irq);
> > > +}
> > > +
> > > +/*
> > > + * Parse the custom PRU interrupt map resource and configure the INTC
> > > + * appropriately.
> > > + */
> > > +static int pru_handle_intrmap(struct rproc *rproc)
> > > +{
> > > +     struct device *dev = rproc->dev.parent;
> > > +     struct pru_rproc *pru = rproc->priv;
> > > +     struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
> > > +     struct irq_fwspec fwspec;
> > > +     struct device_node *irq_parent;
> > > +     int i, ret = 0;
> > > +
> > > +     /* not having pru_interrupt_map is not an error */
> > > +     if (!rsc)
> > > +             return 0;
> > > +
> > > +     /* currently supporting only type 0 */
> > > +     if (rsc->type != 0) {
> > > +             dev_err(dev, "unsupported rsc type: %d\n", rsc->type);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     if (rsc->num_evts < 0 || rsc->num_evts > MAX_PRU_SYS_EVENTS)
> > > +             return -EINVAL;
> > > +
> >
> > pru_irq_rsc::num_evts is a 'u8' and can't be negative.
> 
> Sure - I will remove the 'rsc->num_evts < 0 ' check.
> 
> >
> > > +     if (sizeof(*rsc) + rsc->num_evts * sizeof(struct pruss_int_map) !=
> > > +         pru->pru_interrupt_map_sz)
> > > +             return -EINVAL;
> > > +
> > > +     pru->evt_count = rsc->num_evts;
> > > +     pru->mapped_irq = kcalloc(pru->evt_count, sizeof(int), GFP_KERNEL);
> > > +     if (!pru->mapped_irq)
> > > +             return -ENOMEM;
> > > +
> > > +     /*
> > > +      * parse and fill in system event to interrupt channel and
> > > +      * channel-to-host mapping
> > > +      */
> > > +     irq_parent = of_irq_find_parent(pru->dev->of_node);
> > > +     if (!irq_parent) {
> > > +             kfree(pru->mapped_irq);
> > > +             return -ENODEV;
> > > +     }
> > > +
> > > +     fwspec.fwnode = of_node_to_fwnode(irq_parent);
> > > +     fwspec.param_count = 3;
> > > +     for (i = 0; i < pru->evt_count; i++) {
> > > +             fwspec.param[0] = rsc->pru_intc_map[i].event;
> > > +             fwspec.param[1] = rsc->pru_intc_map[i].chnl;
> > > +             fwspec.param[2] = rsc->pru_intc_map[i].host;
> > > +
> > > +             dev_dbg(dev, "mapping%d: event %d, chnl %d, host %d\n",
> > > +                    i, fwspec.param[0], fwspec.param[1], fwspec.param[2]);
> > > +
> > > +             pru->mapped_irq[i] = irq_create_fwspec_mapping(&fwspec);
> > > +             if (pru->mapped_irq[i] < 0) {
> >
> > Function irq_create_fwspec_mapping() returns an unsigned int - theoretically the
> > above check could return a false positive.  I suggest to make
> > pru_proc::mapped_irq a '*unsigned int" and revise the error condition.
> 
> You are right - I will do as suggested.
> 
> >
> > > +                     dev_err(dev, "failed to get virq\n");
> > > +                     ret = pru->mapped_irq[i];
> > > +                     goto map_fail;
> > > +             }
> > > +     }
> > > +
> > > +     return ret;
> > > +
> > > +map_fail:
> > > +     pru_dispose_irq_mapping(pru);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > >  static int pru_rproc_start(struct rproc *rproc)
> > >  {
> > >       struct device *dev = &rproc->dev;
> > >       struct pru_rproc *pru = rproc->priv;
> > >       u32 val;
> > > +     int ret;
> > >
> > >       dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
> > >               pru->id, (rproc->bootaddr >> 2));
> > >
> > > +     ret = pru_handle_intrmap(rproc);
> > > +     /*
> > > +      * reset references to pru interrupt map - they will stop being valid
> > > +      * after rproc_start returns
> > > +      */
> >
> > Why is that?  As far as I understand the interrupt map points inside the
> > firmware image, which won't go away until @rproc is disposed of or users change
> > it via sysfs.  And the latter can't happen when the remote processor is active.
> > Can't this go to pru_dispose_irq_mapping()?
> 
> Those references are pointing to the fw segments which are released
> right after rproc_start() due to release_firmware() call. I think that
> resetting them before pru_rproc_start() returns is proper. If you
> don't mind I prefer to keep this part as is.

You correct - I had rproc::cached_table in mind but that one is kmemdup()'ed.

> 
> Thank you,
> Grzegorz
> 
> >
> > More comments to come tomorrow.
> >
> > Thanks,
> > Mathieu
> >
> > > +     pru->pru_interrupt_map = NULL;
> > > +     pru->pru_interrupt_map_sz = 0;
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       val = CTRL_CTRL_EN | ((rproc->bootaddr >> 2) << 16);
> > >       pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
> > >
> > > @@ -113,6 +218,10 @@ static int pru_rproc_stop(struct rproc *rproc)
> > >       val &= ~CTRL_CTRL_EN;
> > >       pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
> > >
> > > +     /* dispose irq mapping - new firmware can provide new mapping */
> > > +     if (pru->mapped_irq)
> > > +             pru_dispose_irq_mapping(pru);
> > > +
> > >       return 0;
> > >  }
> > >
> > > @@ -275,12 +384,70 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
> > >       return ret;
> > >  }
> > >
> > > +static const void *
> > > +pru_rproc_find_interrupt_map(struct device *dev, const struct firmware *fw)
> > > +{
> > > +     struct elf32_shdr *shdr, *name_table_shdr;
> > > +     const char *name_table;
> > > +     const u8 *elf_data = fw->data;
> > > +     struct elf32_hdr *ehdr = (struct elf32_hdr *)elf_data;
> > > +     u16 shnum = ehdr->e_shnum;
> > > +     u16 shstrndx = ehdr->e_shstrndx;
> > > +     int i;
> > > +
> > > +     /* first, get the section header */
> > > +     shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
> > > +     /* compute name table section header entry in shdr array */
> > > +     name_table_shdr = shdr + shstrndx;
> > > +     /* finally, compute the name table section address in elf */
> > > +     name_table = elf_data + name_table_shdr->sh_offset;
> > > +
> > > +     for (i = 0; i < shnum; i++, shdr++) {
> > > +             u32 size = shdr->sh_size;
> > > +             u32 offset = shdr->sh_offset;
> > > +             u32 name = shdr->sh_name;
> > > +
> > > +             if (strcmp(name_table + name, ".pru_irq_map"))
> > > +                     continue;
> > > +
> > > +             /* make sure we have the entire irq map */
> > > +             if (offset + size > fw->size || offset + size < size) {
> > > +                     dev_err(dev, ".pru_irq_map section truncated\n");
> > > +                     return ERR_PTR(-EINVAL);
> > > +             }
> > > +
> > > +             /* make sure irq map has at least the header */
> > > +             if (sizeof(struct pru_irq_rsc) > size) {
> > > +                     dev_err(dev, "header-less .pru_irq_map section\n");
> > > +                     return ERR_PTR(-EINVAL);
> > > +             }
> > > +
> > > +             return shdr;
> > > +     }
> > > +
> > > +     dev_dbg(dev, "no .pru_irq_map section found for this fw\n");
> > > +
> > > +     return NULL;
> > > +}
> > > +
> > >  /*
> > >   * Use a custom parse_fw callback function for dealing with PRU firmware
> > >   * specific sections.
> > > + *
> > > + * The firmware blob can contain optional ELF sections: .resource_table section
> > > + * and .pru_irq_map one. The second one contains the PRUSS interrupt mapping
> > > + * description, which needs to be setup before powering on the PRU core. To
> > > + * avoid RAM wastage this ELF section is not mapped to any ELF segment (by the
> > > + * firmware linker) and therefore is not loaded to PRU memory.
> > >   */
> > >  static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > >  {
> > > +     struct device *dev = &rproc->dev;
> > > +     struct pru_rproc *pru = rproc->priv;
> > > +     const u8 *elf_data = fw->data;
> > > +     const void *shdr;
> > > +     u8 class = fw_elf_get_class(fw);
> > > +     u64 sh_offset;
> > >       int ret;
> > >
> > >       /* load optional rsc table */
> > > @@ -290,6 +457,19 @@ static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> > >       else if (ret)
> > >               return ret;
> > >
> > > +     /* find .pru_interrupt_map section, not having it is not an error */
> > > +     shdr = pru_rproc_find_interrupt_map(dev, fw);
> > > +     if (IS_ERR(shdr))
> > > +             return PTR_ERR(shdr);
> > > +
> > > +     if (!shdr)
> > > +             return 0;
> > > +
> > > +     /* preserve pointer to PRU interrupt map together with it size */
> > > +     sh_offset = elf_shdr_get_sh_offset(class, shdr);
> > > +     pru->pru_interrupt_map = (struct pru_irq_rsc *)(elf_data + sh_offset);
> > > +     pru->pru_interrupt_map_sz = elf_shdr_get_sh_size(class, shdr);
> > > +
> > >       return 0;
> > >  }
> > >
> > > diff --git a/drivers/remoteproc/pru_rproc.h b/drivers/remoteproc/pru_rproc.h
> > > new file mode 100644
> > > index 000000000000..8ee9c3171610
> > > --- /dev/null
> > > +++ b/drivers/remoteproc/pru_rproc.h
> > > @@ -0,0 +1,46 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> > > +/*
> > > + * PRUSS Remote Processor specific types
> > > + *
> > > + * Copyright (C) 2014-2020 Texas Instruments Incorporated - https://www.ti.com/
> > > + *   Suman Anna <s-anna@ti.com>
> > > + */
> > > +
> > > +#ifndef _PRU_RPROC_H_
> > > +#define _PRU_RPROC_H_
> > > +
> > > +/**
> > > + * struct pruss_int_map - PRU system events _to_ channel and host mapping
> > > + * @event: number of the system event
> > > + * @chnl: channel number assigned to a given @event
> > > + * @host: host number assigned to a given @chnl
> > > + *
> > > + * PRU system events are mapped to channels, and these channels are mapped
> > > + * to host interrupts. Events can be mapped to channels in a one-to-one or
> > > + * many-to-one ratio (multiple events per channel), and channels can be
> > > + * mapped to host interrupts in a one-to-one or many-to-one ratio (multiple
> > > + * channels per interrupt).
> > > + */
> > > +struct pruss_int_map {
> > > +     u8 event;
> > > +     u8 chnl;
> > > +     u8 host;
> > > +};
> > > +
> > > +/**
> > > + * struct pru_irq_rsc - PRU firmware section header for IRQ data
> > > + * @type: resource type
> > > + * @num_evts: number of described events
> > > + * @pru_intc_map: PRU interrupt routing description
> > > + *
> > > + * The PRU firmware blob can contain optional .pru_irq_map ELF section, which
> > > + * provides the PRUSS interrupt mapping description. The pru_irq_rsc struct
> > > + * describes resource entry format.
> > > + */
> > > +struct pru_irq_rsc {
> > > +     u8 type;
> > > +     u8 num_evts;
> > > +     struct pruss_int_map pru_intc_map[];
> > > +} __packed;
> > > +
> > > +#endif       /* _PRU_RPROC_H_ */
> > > --
> > > 2.29.0
> > >
