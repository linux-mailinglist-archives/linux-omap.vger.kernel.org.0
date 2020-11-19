Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A726B2B9349
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727700AbgKSNKS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbgKSNKS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Nov 2020 08:10:18 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32E3C0613CF
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 05:10:16 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id 7so4254041qtp.1
        for <linux-omap@vger.kernel.org>; Thu, 19 Nov 2020 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zIfUjW+aiBjmdX+tAUjwYQ92NbJPj9lCHZuwkcM8Nkg=;
        b=xAFB8AUmc5Tj6IGxBYzeEcQQm9BpKWwt31skGR6lZBqLH0uXhkfqWEfVWILyg3hzWm
         D67SShsYQSUYRO62MT9yHS7TOSEJjA9LG7wmDYnGcNPbYlK4gwS7QydEeA9tp2TFQVKW
         U9uo/ecI6qWjq/hu6qF23mDm0SO52xwz5xeisfeYS0FnWrKcO/yu40UMCTE5Z7A5OKoj
         bhF99kvMKxIur8Od/wK8m93CZqnPkau+MHz2OsLv1+IPkM1gLfATIPDRog9gxPUgeV0b
         trDSiiuJL0Sc4QzBzqqlT3+8oasgwP9xrOj6XWci7iymIPWiABVwG/RAbXbwSVQTFazJ
         fK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zIfUjW+aiBjmdX+tAUjwYQ92NbJPj9lCHZuwkcM8Nkg=;
        b=B/37ClhizIe0CuI/sAQsNacGUbwDw8QVNOyCc5UBMZDmEH1OXUZaWqqBivjByDp7wn
         Cy58deMuHEzMrVZvouy0GIbejht9uFFZJFyGnHDJGyBfhZAKxEpskEVGOgeY7B6J1wiH
         HsUbXw7/YrCJz9QjnDqmZP5iOKY0Nlh9HC+3Y51OtKHIuoLR9NdlnRirAQdHfBE/+S88
         G6p/ktieyBm6O0I/qlV91m0+vJkuyIPcavXdDPK863TAPLIY1GJfmaQ60uRUvE6FijZR
         cEM7zaJECTMxoJolm77MHWr69SpLuLFvgNMyS+d/8ZI5XDPgDyqUM81nur0eC/THiFAE
         BIyw==
X-Gm-Message-State: AOAM531919xr494iQ4kmSzzmW2xgV23CPP2dqN7SauSkFgtJ+pBczUoe
        aLoQoMdWGxYjfgRNCgcL5x6oWALlz/4tnovqQkR0Pg==
X-Google-Smtp-Source: ABdhPJwSYUcsSwolzI8rzaoxCuKLO4/2H4yip/wvOaPYuDhkLJtTlRWGJvHPEGhboRgzOqxAPZGzt7wNOI0ruoKEWOE=
X-Received: by 2002:ac8:5a8c:: with SMTP id c12mr9651445qtc.97.1605791415741;
 Thu, 19 Nov 2020 05:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
 <20201114084613.13503-4-grzegorz.jaszczyk@linaro.org> <5e92947a-febf-90d0-b40e-499fe2144737@ti.com>
 <CAMxfBF5xMyb4LZ6Ei9xS49yXfHWJjKppWo7NNHqc5CfHYAiZTg@mail.gmail.com> <ada369ed-0c1b-46e1-68bb-b37d04cf90fd@ti.com>
In-Reply-To: <ada369ed-0c1b-46e1-68bb-b37d04cf90fd@ti.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Thu, 19 Nov 2020 14:10:04 +0100
Message-ID: <CAMxfBF4-wrsx0XHzHsvSfTyTR09r_8-O7GUL31MPVQAgEBrfAQ@mail.gmail.com>
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

On Thu, 19 Nov 2020 at 00:04, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Greg,
>
> On 11/18/20 9:27 AM, Grzegorz Jaszczyk wrote:
> > Hi Suman,
> >
> > On Tue, 17 Nov 2020 at 21:40, Suman Anna <s-anna@ti.com> wrote:
> >>
> >> Hi Greg,
> >>
> >> On 11/14/20 2:46 AM, Grzegorz Jaszczyk wrote:
> >>> The firmware blob can contain optional ELF sections: .resource_table
> >>> section and .pru_irq_map one. The second one contains the PRUSS
> >>> interrupt mapping description, which needs to be setup before powering
> >>> on the PRU core. To avoid RAM wastage this ELF section is not mapped to
> >>> any ELF segment (by the firmware linker) and therefore is not loaded to
> >>> PRU memory.
> >>>
> >>> The PRU interrupt configuration is handled within the PRUSS INTC irqchip
> >>> driver and leverages the system events to interrupt channels and host
> >>> interrupts mapping configuration. Relevant irq routing information is
> >>> passed through a special .pru_irq_map ELF section (for interrupts routed
> >>> to and used by PRU cores) or via the PRU application's device tree node
> >>> (for interrupts routed to and used by the main CPU). The mappings are
> >>> currently programmed during the booting/shutdown of the PRU.
> >>>
> >>> The interrupt configuration passed through .pru_irq_map ELF section is
> >>> optional. It varies on specific firmware functionality and therefore
> >>> have to be unwinded during PRU stop and performed again during
> >>> PRU start.
> >>>
> >>> Co-developed-by: Suman Anna <s-anna@ti.com>
> >>> Signed-off-by: Suman Anna <s-anna@ti.com>
> >>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> >>> ---
> >>>  drivers/remoteproc/pru_rproc.c | 191 ++++++++++++++++++++++++++++++++-
> >>>  drivers/remoteproc/pru_rproc.h |  46 ++++++++
> >>>  2 files changed, 236 insertions(+), 1 deletion(-)
> >>>  create mode 100644 drivers/remoteproc/pru_rproc.h
> >>>
> >>> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> >>> index c94c8e965c21..825e9c7e081b 100644
> >>> --- a/drivers/remoteproc/pru_rproc.c
> >>> +++ b/drivers/remoteproc/pru_rproc.c
> >>> @@ -11,13 +11,16 @@
> >>>   */
> >>>
> >>>  #include <linux/bitops.h>
> >>> +#include <linux/irqdomain.h>
> >>>  #include <linux/module.h>
> >>>  #include <linux/of_device.h>
> >>> +#include <linux/of_irq.h>
> >>>  #include <linux/pruss_driver.h>
> >>>  #include <linux/remoteproc.h>
> >>>
> >>>  #include "remoteproc_internal.h"
> >>>  #include "remoteproc_elf_helpers.h"
> >>> +#include "pru_rproc.h"
> >>>
> >>>  /* PRU_ICSS_PRU_CTRL registers */
> >>>  #define PRU_CTRL_CTRL                0x0000
> >>> @@ -41,6 +44,8 @@
> >>>  #define PRU_SDRAM_DA 0x2000  /* Secondary Data RAM */
> >>>  #define PRU_SHRDRAM_DA       0x10000 /* Shared Data RAM */
> >>>
> >>> +#define MAX_PRU_SYS_EVENTS 160
> >>> +
> >>>  /**
> >>>   * enum pru_iomem - PRU core memory/register range identifiers
> >>>   *
> >>> @@ -64,6 +69,10 @@ enum pru_iomem {
> >>>   * @rproc: remoteproc pointer for this PRU core
> >>>   * @mem_regions: data for each of the PRU memory regions
> >>>   * @fw_name: name of firmware image used during loading
> >>> + * @mapped_irq: virtual interrupt numbers of created fw specific mapping
> >>> + * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
> >>> + * @pru_interrupt_map_sz: pru_interrupt_map size
> >>> + * @evt_count: number of mapped events
> >>>   */
> >>>  struct pru_rproc {
> >>>       int id;
> >>> @@ -72,6 +81,10 @@ struct pru_rproc {
> >>>       struct rproc *rproc;
> >>>       struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
> >>>       const char *fw_name;
> >>> +     int *mapped_irq;
> >>> +     struct pru_irq_rsc *pru_interrupt_map;
> >>> +     size_t pru_interrupt_map_sz;
> >>> +     ssize_t evt_count;
> >>
> >> Do you really need this to be ssize_t type?
> >
> > You are right, it is not needed. I will use size_t type instead and
> > modify relevant while loop.
>
> Hmm, size_t is ok, but perhaps the same type you used struct pru_irq_rsc is better.

Ok.

>
> >
> >>
> >>>  };
> >>>
> >>>  static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
> >>> @@ -85,15 +98,107 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
> >>>       writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
> >>>  }
> >>>
> >>> +static void pru_dispose_irq_mapping(struct pru_rproc *pru)
> >>> +{
> >>> +     while (--pru->evt_count >= 0) {
> >>> +             if (pru->mapped_irq[pru->evt_count] > 0)
> >>> +                     irq_dispose_mapping(pru->mapped_irq[pru->evt_count]);
> >>> +     }
> >>> +
> >>> +     kfree(pru->mapped_irq);
> >>> +}
> >>> +
> >>> +/*
> >>> + * Parse the custom PRU interrupt map resource and configure the INTC
> >>> + * appropriately.
> >>> + */
> >>> +static int pru_handle_intrmap(struct rproc *rproc)
> >>> +{
> >>> +     struct device *dev = rproc->dev.parent;
> >>> +     struct pru_rproc *pru = rproc->priv;
> >>> +     struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
> >>> +     struct irq_fwspec fwspec;
> >>> +     struct device_node *irq_parent;
> >>> +     int i, ret = 0;
> >>> +
> >>> +     /* not having pru_interrupt_map is not an error */
> >>> +     if (!rsc)
> >>> +             return 0;
> >>> +
> >>> +     /* currently supporting only type 0 */
> >>> +     if (rsc->type != 0) {
> >>> +             dev_err(dev, "unsupported rsc type: %d\n", rsc->type);
> >>> +             return -EINVAL;
> >>> +     }
> >>> +
> >>> +     if (rsc->num_evts < 0 || rsc->num_evts > MAX_PRU_SYS_EVENTS)
> >>> +             return -EINVAL;
> >>> +
> >>> +     if (sizeof(*rsc) + rsc->num_evts * sizeof(struct pruss_int_map) !=
> >>> +         pru->pru_interrupt_map_sz)
> >>> +             return -EINVAL;
> >>> +
> >>> +     pru->evt_count = rsc->num_evts;
> >>> +     pru->mapped_irq = kcalloc(pru->evt_count, sizeof(int), GFP_KERNEL);
> >>> +     if (!pru->mapped_irq)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     /*
> >>> +      * parse and fill in system event to interrupt channel and
> >>> +      * channel-to-host mapping
> >>> +      */
> >>> +     irq_parent = of_irq_find_parent(pru->dev->of_node);
> >>> +     if (!irq_parent) {
> >>> +             kfree(pru->mapped_irq);
> >>> +             return -ENODEV;
> >>> +     }
> >>> +
> >>> +     fwspec.fwnode = of_node_to_fwnode(irq_parent);
> >>> +     fwspec.param_count = 3;
> >>> +     for (i = 0; i < pru->evt_count; i++) {
> >>> +             fwspec.param[0] = rsc->pru_intc_map[i].event;
> >>> +             fwspec.param[1] = rsc->pru_intc_map[i].chnl;
> >>> +             fwspec.param[2] = rsc->pru_intc_map[i].host;
> >>> +
> >>> +             dev_dbg(dev, "mapping%d: event %d, chnl %d, host %d\n",
> >>> +                    i, fwspec.param[0], fwspec.param[1], fwspec.param[2]);
> >>> +
> >>> +             pru->mapped_irq[i] = irq_create_fwspec_mapping(&fwspec);
> >>> +             if (pru->mapped_irq[i] < 0) {
> >>> +                     dev_err(dev, "failed to get virq\n");
> >>> +                     ret = pru->mapped_irq[i];
> >>> +                     goto map_fail;
> >>> +             }
> >>> +     }
> >>> +
> >>> +     return ret;
> >>> +
> >>> +map_fail:
> >>> +     pru_dispose_irq_mapping(pru);
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>>  static int pru_rproc_start(struct rproc *rproc)
> >>>  {
> >>>       struct device *dev = &rproc->dev;
> >>>       struct pru_rproc *pru = rproc->priv;
> >>>       u32 val;
> >>> +     int ret;
> >>>
> >>>       dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
> >>>               pru->id, (rproc->bootaddr >> 2));
> >>>
> >>> +     ret = pru_handle_intrmap(rproc);
> >>> +     /*
> >>> +      * reset references to pru interrupt map - they will stop being valid
> >>> +      * after rproc_start returns
> >>> +      */
> >>> +     pru->pru_interrupt_map = NULL;
> >>> +     pru->pru_interrupt_map_sz = 0;
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>>       val = CTRL_CTRL_EN | ((rproc->bootaddr >> 2) << 16);
> >>>       pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
> >>>
> >>> @@ -112,6 +217,10 @@ static int pru_rproc_stop(struct rproc *rproc)
> >>>       val &= ~CTRL_CTRL_EN;
> >>>       pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
> >>>
> >>> +     /* dispose irq mapping - new firmware can provide new mapping */
> >>> +     if (pru->mapped_irq)
> >>> +             pru_dispose_irq_mapping(pru);
> >>> +
> >>>       return 0;
> >>>  }
> >>>
> >>> @@ -274,16 +383,96 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
> >>>       return ret;
> >>>  }
> >>>
> >>> +static const void *
> >>> +pru_rproc_find_interrupt_map(struct device *dev, const struct firmware *fw)
> >>> +{
> >>> +     const void *shdr, *name_table_shdr;
> >>> +     const char *name_table;
> >>> +     const u8 *elf_data = (void *)fw->data;
> >>> +     u8 class = fw_elf_get_class(fw);
> >>> +     size_t fw_size = fw->size;
> >>> +     const void *ehdr = elf_data;
> >>> +     u16 shnum = elf_hdr_get_e_shnum(class, ehdr);
> >>> +     u32 elf_shdr_get_size = elf_size_of_shdr(class);
> >>> +     u16 shstrndx = elf_hdr_get_e_shstrndx(class, ehdr);
> >>> +     int i;
> >>> +
> >>> +     /* first, get the section header according to the elf class */
> >>> +     shdr = elf_data + elf_hdr_get_e_shoff(class, ehdr);
> >>> +     /* compute name table section header entry in shdr array */
> >>> +     name_table_shdr = shdr + (shstrndx * elf_shdr_get_size);
> >>> +     /* finally, compute the name table section address in elf */
> >>> +     name_table = elf_data + elf_shdr_get_sh_offset(class, name_table_shdr);
> >>
> >> I see you used the style influenced by the remoteproc_elf_loader code. PRUs are
> >> all 32-bit, so we need not use this strictly. I am ok with this style, but
> >> prefer consistent usage style between this function and
> >> pru_rproc_load_elf_segments().
> >
> > Ok. I will get rid of generic elf helpers macros usage and will stick
> > with elf32_* related structs instead. This will make it similar to
> > pru_rproc_load_elf_segments() in terms of style.
>
> Yeah, ok with me.
>
> >
> >>
> >>> +
> >>> +     for (i = 0; i < shnum; i++, shdr += elf_shdr_get_size) {
> >>> +             u64 size = elf_shdr_get_sh_size(class, shdr);
> >>> +             u64 offset = elf_shdr_get_sh_offset(class, shdr);
> >>> +             u32 name = elf_shdr_get_sh_name(class, shdr);
> >>> +
> >>> +             if (strcmp(name_table + name, ".pru_irq_map"))
> >>> +                     continue;
> >>> +
> >>> +             /* make sure we have the entire table */
> >>> +             if (offset + size > fw_size || offset + size < size) {
> >>> +                     dev_err(dev, "interrupt map sec truncated\n");
> >>
> >> sec can confuse developers, suggest rephrasing this trace, something like
> >> ".pru_irq_map section truncated"
> >
> > Ok. I will also update the comment to: "make sure we have the entire irq map"
>
> Please don't use "we" in debug traces, and just the summary of the error trace.

I think you've misunderstood my answer: I agreed with your suggestion
to rephrase this trace to ".pru_irq_map section truncated" but
additionally I wanted to say that I will also update the comment (not
the dev_err trace) which is located two lines above.

>
> >
> >>
> >>> +                     return ERR_PTR(-EINVAL);
> >>> +             }
> >>> +
> >>> +             /* make sure table has at least the header */
> >>> +             if (sizeof(struct pru_irq_rsc) > size) {
> >>> +                     dev_err(dev, "header-less interrupt map sec\n");
> >>
> >> same comment as above
> >
> > Sure, I will use "header-less .pru_irq_map section\n" and update the
> > comment above to: "make sure irq map has at least the header"
>
> similar to above

The same as above :)

>
> >
> >>
> >>> +                     return ERR_PTR(-EINVAL);
> >>> +             }
> >>> +
> >>> +             return shdr;
> >>> +     }
> >>> +
> >>> +     dev_dbg(dev, "no .pru_irq_map section found for this fw\n");
> >>> +
> >>> +     return NULL;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Usa a custom parse_fw callback function for dealing with standard
> >>> + * resource table and a PRU-specific custom ELF section.
> >>> + *
> >>> + * The firmware blob can contain optional ELF sections: .resource_table section
> >>> + * and .pru_irq_map one. The second one contains the PRUSS interrupt mapping
> >>> + * description, which needs to be setup before powering on the PRU core. To
> >>> + * avoid RAM wastage this ELF section is not mapped to any ELF segment (by the
> >>> + * firmware linker) and therefore is not loaded to PRU memory.
> >>
> >> Some of this description can move to Patch 2 as well.
> >
> > I thought about it before posting but IMO this function without
> > .pru_irq_map handling is kind of self explaining. Especially when
> > taking into account comment and deb_dbg message from the function body
> > of previous patch. Nevertheless I can add:
> > /*
> >  * Usa a custom parse_fw callback function for dealing with optional resource
> >  * table.
> >  */
>
> Or you can keep the first two lines generic, "... dealing with PRU firmware
> specific sections", and only add the details in the second paragraph in this
> patch. The commit in code above resource table + these two links should suffice
> for patch 2.

Ok.

Thank you,
Grzegorz
