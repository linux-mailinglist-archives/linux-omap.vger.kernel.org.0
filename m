Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E621B2B8070
	for <lists+linux-omap@lfdr.de>; Wed, 18 Nov 2020 16:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgKRP2K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Nov 2020 10:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgKRP2K (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Nov 2020 10:28:10 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA311C061A48
        for <linux-omap@vger.kernel.org>; Wed, 18 Nov 2020 07:28:09 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id y197so2110775qkb.7
        for <linux-omap@vger.kernel.org>; Wed, 18 Nov 2020 07:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=75Y47JsvqRmTM7dgzX1pgDP9xquXoohEkASJB9kUszQ=;
        b=qj7lPsf2OOL5x/lE49wbEfmkHNJDAoGzc0oNTOG9o/+o6r33VashAiLDzRoCUDmMHe
         lr9PTaEQaMb1M8ntION1itRv9K75T8+Scn6aLZrQLOZLxts/sWRgvXzl2R0ZCnv7jWNK
         1KwmHJiM+a6MuAu6yGcm2B096Nl727eG1MhftPBIltYMNjCiGc1BcdxoZH25DgG3K9DC
         05JAmhTx+mKVS8o1h7FLXdn+xPqxZGlx8Lsu+jr/Turowd5ewOYJu8agW1kFCe3aC7zx
         B/DFrbQ3qvpyTXcv6Jz65ROu9YWLMpag1tzt/Hcnv0p8vIuqTSpdf5QPi0siPI7GZ2sJ
         qwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=75Y47JsvqRmTM7dgzX1pgDP9xquXoohEkASJB9kUszQ=;
        b=DzvPp0ydvu2MpGMKkIRoe2flOFe8a/fgphx3zYZyp/Mljjr5f+aW0qdBxvk5XYMVLY
         948wy6qa1o+PhMq3f778slp4LVZagjGjJ9svC7iixfj1q8BXwb86nYurDJv1BKYrS7zT
         GNTooNhD5xzien3A2f35SX2Mh87ZLbw6hfoH3kcwNhtDRVhvQddJ4G0e3E/FihzQ4HEa
         7PNfVXDA9PA3ASPjjN98zi+1H3OiVPKtniuExqxOTS3EtGmDYWGP1Ulu7vsA/ohQxcud
         of+mg+Was2tS/ozZxGXbex11Te1SOEuPslCDSuhCSUpVp4unCMByYDMuumjvPFYFDlHy
         hFFg==
X-Gm-Message-State: AOAM5318C66VlwkzVrFCAnQ+pikvLTrXKbz+OeUv0IIBVGQNSkEft8bb
        XCxtScX5/b0RAm9Bfd9MbWbUZ0V0RwtTGotAIrEdZQ==
X-Google-Smtp-Source: ABdhPJzdIwlS2iR0qCAfG0Rd/5ywZuSGYSnnvIB7SrhjdZuSa7DjLIrTEkszXl9TOEhTjeeZGBAtiPE7CCDf2AQjMis=
X-Received: by 2002:a37:d08:: with SMTP id 8mr5073103qkn.306.1605713288810;
 Wed, 18 Nov 2020 07:28:08 -0800 (PST)
MIME-Version: 1.0
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
 <20201114084613.13503-4-grzegorz.jaszczyk@linaro.org> <5e92947a-febf-90d0-b40e-499fe2144737@ti.com>
In-Reply-To: <5e92947a-febf-90d0-b40e-499fe2144737@ti.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Wed, 18 Nov 2020 16:27:57 +0100
Message-ID: <CAMxfBF5xMyb4LZ6Ei9xS49yXfHWJjKppWo7NNHqc5CfHYAiZTg@mail.gmail.com>
Subject: Re: [PATCH 3/6] remoteproc/pru: Add support for PRU specific
 interrupt configuration
To:     Suman Anna <s-anna@ti.com>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Suman,

On Tue, 17 Nov 2020 at 21:40, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Greg,
>
> On 11/14/20 2:46 AM, Grzegorz Jaszczyk wrote:
> > The firmware blob can contain optional ELF sections: .resource_table
> > section and .pru_irq_map one. The second one contains the PRUSS
> > interrupt mapping description, which needs to be setup before powering
> > on the PRU core. To avoid RAM wastage this ELF section is not mapped to
> > any ELF segment (by the firmware linker) and therefore is not loaded to
> > PRU memory.
> >
> > The PRU interrupt configuration is handled within the PRUSS INTC irqchip
> > driver and leverages the system events to interrupt channels and host
> > interrupts mapping configuration. Relevant irq routing information is
> > passed through a special .pru_irq_map ELF section (for interrupts routed
> > to and used by PRU cores) or via the PRU application's device tree node
> > (for interrupts routed to and used by the main CPU). The mappings are
> > currently programmed during the booting/shutdown of the PRU.
> >
> > The interrupt configuration passed through .pru_irq_map ELF section is
> > optional. It varies on specific firmware functionality and therefore
> > have to be unwinded during PRU stop and performed again during
> > PRU start.
> >
> > Co-developed-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> >  drivers/remoteproc/pru_rproc.c | 191 ++++++++++++++++++++++++++++++++-
> >  drivers/remoteproc/pru_rproc.h |  46 ++++++++
> >  2 files changed, 236 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/remoteproc/pru_rproc.h
> >
> > diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> > index c94c8e965c21..825e9c7e081b 100644
> > --- a/drivers/remoteproc/pru_rproc.c
> > +++ b/drivers/remoteproc/pru_rproc.c
> > @@ -11,13 +11,16 @@
> >   */
> >
> >  #include <linux/bitops.h>
> > +#include <linux/irqdomain.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> >  #include <linux/pruss_driver.h>
> >  #include <linux/remoteproc.h>
> >
> >  #include "remoteproc_internal.h"
> >  #include "remoteproc_elf_helpers.h"
> > +#include "pru_rproc.h"
> >
> >  /* PRU_ICSS_PRU_CTRL registers */
> >  #define PRU_CTRL_CTRL                0x0000
> > @@ -41,6 +44,8 @@
> >  #define PRU_SDRAM_DA 0x2000  /* Secondary Data RAM */
> >  #define PRU_SHRDRAM_DA       0x10000 /* Shared Data RAM */
> >
> > +#define MAX_PRU_SYS_EVENTS 160
> > +
> >  /**
> >   * enum pru_iomem - PRU core memory/register range identifiers
> >   *
> > @@ -64,6 +69,10 @@ enum pru_iomem {
> >   * @rproc: remoteproc pointer for this PRU core
> >   * @mem_regions: data for each of the PRU memory regions
> >   * @fw_name: name of firmware image used during loading
> > + * @mapped_irq: virtual interrupt numbers of created fw specific mapping
> > + * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
> > + * @pru_interrupt_map_sz: pru_interrupt_map size
> > + * @evt_count: number of mapped events
> >   */
> >  struct pru_rproc {
> >       int id;
> > @@ -72,6 +81,10 @@ struct pru_rproc {
> >       struct rproc *rproc;
> >       struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
> >       const char *fw_name;
> > +     int *mapped_irq;
> > +     struct pru_irq_rsc *pru_interrupt_map;
> > +     size_t pru_interrupt_map_sz;
> > +     ssize_t evt_count;
>
> Do you really need this to be ssize_t type?

You are right, it is not needed. I will use size_t type instead and
modify relevant while loop.

>
> >  };
> >
> >  static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
> > @@ -85,15 +98,107 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
> >       writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
> >  }
> >
> > +static void pru_dispose_irq_mapping(struct pru_rproc *pru)
> > +{
> > +     while (--pru->evt_count >= 0) {
> > +             if (pru->mapped_irq[pru->evt_count] > 0)
> > +                     irq_dispose_mapping(pru->mapped_irq[pru->evt_count]);
> > +     }
> > +
> > +     kfree(pru->mapped_irq);
> > +}
> > +
> > +/*
> > + * Parse the custom PRU interrupt map resource and configure the INTC
> > + * appropriately.
> > + */
> > +static int pru_handle_intrmap(struct rproc *rproc)
> > +{
> > +     struct device *dev = rproc->dev.parent;
> > +     struct pru_rproc *pru = rproc->priv;
> > +     struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
> > +     struct irq_fwspec fwspec;
> > +     struct device_node *irq_parent;
> > +     int i, ret = 0;
> > +
> > +     /* not having pru_interrupt_map is not an error */
> > +     if (!rsc)
> > +             return 0;
> > +
> > +     /* currently supporting only type 0 */
> > +     if (rsc->type != 0) {
> > +             dev_err(dev, "unsupported rsc type: %d\n", rsc->type);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (rsc->num_evts < 0 || rsc->num_evts > MAX_PRU_SYS_EVENTS)
> > +             return -EINVAL;
> > +
> > +     if (sizeof(*rsc) + rsc->num_evts * sizeof(struct pruss_int_map) !=
> > +         pru->pru_interrupt_map_sz)
> > +             return -EINVAL;
> > +
> > +     pru->evt_count = rsc->num_evts;
> > +     pru->mapped_irq = kcalloc(pru->evt_count, sizeof(int), GFP_KERNEL);
> > +     if (!pru->mapped_irq)
> > +             return -ENOMEM;
> > +
> > +     /*
> > +      * parse and fill in system event to interrupt channel and
> > +      * channel-to-host mapping
> > +      */
> > +     irq_parent = of_irq_find_parent(pru->dev->of_node);
> > +     if (!irq_parent) {
> > +             kfree(pru->mapped_irq);
> > +             return -ENODEV;
> > +     }
> > +
> > +     fwspec.fwnode = of_node_to_fwnode(irq_parent);
> > +     fwspec.param_count = 3;
> > +     for (i = 0; i < pru->evt_count; i++) {
> > +             fwspec.param[0] = rsc->pru_intc_map[i].event;
> > +             fwspec.param[1] = rsc->pru_intc_map[i].chnl;
> > +             fwspec.param[2] = rsc->pru_intc_map[i].host;
> > +
> > +             dev_dbg(dev, "mapping%d: event %d, chnl %d, host %d\n",
> > +                    i, fwspec.param[0], fwspec.param[1], fwspec.param[2]);
> > +
> > +             pru->mapped_irq[i] = irq_create_fwspec_mapping(&fwspec);
> > +             if (pru->mapped_irq[i] < 0) {
> > +                     dev_err(dev, "failed to get virq\n");
> > +                     ret = pru->mapped_irq[i];
> > +                     goto map_fail;
> > +             }
> > +     }
> > +
> > +     return ret;
> > +
> > +map_fail:
> > +     pru_dispose_irq_mapping(pru);
> > +
> > +     return ret;
> > +}
> > +
> >  static int pru_rproc_start(struct rproc *rproc)
> >  {
> >       struct device *dev = &rproc->dev;
> >       struct pru_rproc *pru = rproc->priv;
> >       u32 val;
> > +     int ret;
> >
> >       dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
> >               pru->id, (rproc->bootaddr >> 2));
> >
> > +     ret = pru_handle_intrmap(rproc);
> > +     /*
> > +      * reset references to pru interrupt map - they will stop being valid
> > +      * after rproc_start returns
> > +      */
> > +     pru->pru_interrupt_map = NULL;
> > +     pru->pru_interrupt_map_sz = 0;
> > +     if (ret)
> > +             return ret;
> > +
> >       val = CTRL_CTRL_EN | ((rproc->bootaddr >> 2) << 16);
> >       pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
> >
> > @@ -112,6 +217,10 @@ static int pru_rproc_stop(struct rproc *rproc)
> >       val &= ~CTRL_CTRL_EN;
> >       pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
> >
> > +     /* dispose irq mapping - new firmware can provide new mapping */
> > +     if (pru->mapped_irq)
> > +             pru_dispose_irq_mapping(pru);
> > +
> >       return 0;
> >  }
> >
> > @@ -274,16 +383,96 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
> >       return ret;
> >  }
> >
> > +static const void *
> > +pru_rproc_find_interrupt_map(struct device *dev, const struct firmware *fw)
> > +{
> > +     const void *shdr, *name_table_shdr;
> > +     const char *name_table;
> > +     const u8 *elf_data = (void *)fw->data;
> > +     u8 class = fw_elf_get_class(fw);
> > +     size_t fw_size = fw->size;
> > +     const void *ehdr = elf_data;
> > +     u16 shnum = elf_hdr_get_e_shnum(class, ehdr);
> > +     u32 elf_shdr_get_size = elf_size_of_shdr(class);
> > +     u16 shstrndx = elf_hdr_get_e_shstrndx(class, ehdr);
> > +     int i;
> > +
> > +     /* first, get the section header according to the elf class */
> > +     shdr = elf_data + elf_hdr_get_e_shoff(class, ehdr);
> > +     /* compute name table section header entry in shdr array */
> > +     name_table_shdr = shdr + (shstrndx * elf_shdr_get_size);
> > +     /* finally, compute the name table section address in elf */
> > +     name_table = elf_data + elf_shdr_get_sh_offset(class, name_table_shdr);
>
> I see you used the style influenced by the remoteproc_elf_loader code. PRUs are
> all 32-bit, so we need not use this strictly. I am ok with this style, but
> prefer consistent usage style between this function and
> pru_rproc_load_elf_segments().

Ok. I will get rid of generic elf helpers macros usage and will stick
with elf32_* related structs instead. This will make it similar to
pru_rproc_load_elf_segments() in terms of style.

>
> > +
> > +     for (i = 0; i < shnum; i++, shdr += elf_shdr_get_size) {
> > +             u64 size = elf_shdr_get_sh_size(class, shdr);
> > +             u64 offset = elf_shdr_get_sh_offset(class, shdr);
> > +             u32 name = elf_shdr_get_sh_name(class, shdr);
> > +
> > +             if (strcmp(name_table + name, ".pru_irq_map"))
> > +                     continue;
> > +
> > +             /* make sure we have the entire table */
> > +             if (offset + size > fw_size || offset + size < size) {
> > +                     dev_err(dev, "interrupt map sec truncated\n");
>
> sec can confuse developers, suggest rephrasing this trace, something like
> ".pru_irq_map section truncated"

Ok. I will also update the comment to: "make sure we have the entire irq map"

>
> > +                     return ERR_PTR(-EINVAL);
> > +             }
> > +
> > +             /* make sure table has at least the header */
> > +             if (sizeof(struct pru_irq_rsc) > size) {
> > +                     dev_err(dev, "header-less interrupt map sec\n");
>
> same comment as above

Sure, I will use "header-less .pru_irq_map section\n" and update the
comment above to: "make sure irq map has at least the header"

>
> > +                     return ERR_PTR(-EINVAL);
> > +             }
> > +
> > +             return shdr;
> > +     }
> > +
> > +     dev_dbg(dev, "no .pru_irq_map section found for this fw\n");
> > +
> > +     return NULL;
> > +}
> > +
> > +/*
> > + * Usa a custom parse_fw callback function for dealing with standard
> > + * resource table and a PRU-specific custom ELF section.
> > + *
> > + * The firmware blob can contain optional ELF sections: .resource_table section
> > + * and .pru_irq_map one. The second one contains the PRUSS interrupt mapping
> > + * description, which needs to be setup before powering on the PRU core. To
> > + * avoid RAM wastage this ELF section is not mapped to any ELF segment (by the
> > + * firmware linker) and therefore is not loaded to PRU memory.
>
> Some of this description can move to Patch 2 as well.

I thought about it before posting but IMO this function without
.pru_irq_map handling is kind of self explaining. Especially when
taking into account comment and deb_dbg message from the function body
of previous patch. Nevertheless I can add:
/*
 * Usa a custom parse_fw callback function for dealing with optional resource
 * table.
 */

to patch #2 and then overwrite it in patch #3, but not sure if it is
the best option.

>
> > + */
> >  static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >  {
> > +     struct device *dev = &rproc->dev;
> > +     struct pru_rproc *pru = rproc->priv;
> > +     const u8 *elf_data = fw->data;
> > +     const void *shdr;
> > +     u8 class = fw_elf_get_class(fw);
> > +     u64 sh_offset;
> >       int ret;
> >
> >       /* load optional rsc table */
> >       ret = rproc_elf_load_rsc_table(rproc, fw);
> >       if (ret == -EINVAL)
> >               dev_dbg(&rproc->dev, "no resource table found for this fw\n");
> > +     else if (ret)
> > +             return ret;
>
> This hunk should be part of Patch 2.

You are right.

>
> >
> > -     return ret;
> > +     /* find .pru_interrupt_map section, not having it is not an error */
> > +     shdr = pru_rproc_find_interrupt_map(dev, fw);
> > +     if (IS_ERR(shdr))
> > +             return PTR_ERR(shdr);
> > +
> > +     if (!shdr)
> > +             return 0;
> > +
> > +     /* preserve pointer to PRU interrupt map together with it size */
> > +     sh_offset = elf_shdr_get_sh_offset(class, shdr);
> > +     pru->pru_interrupt_map = (struct pru_irq_rsc *)(elf_data + sh_offset);
> > +     pru->pru_interrupt_map_sz = elf_shdr_get_sh_size(class, shdr);
> > +
> > +     return 0;
>
> And this one as well.

Correct,

Thank you for your review,
Grzegorz
