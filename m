Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E22CB126845
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2019 18:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfLSRhe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 12:37:34 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:35890 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfLSRhe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 12:37:34 -0500
Received: by mail-io1-f67.google.com with SMTP id r13so6614915ioa.3
        for <linux-omap@vger.kernel.org>; Thu, 19 Dec 2019 09:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sg873tJVHtFPa20xblyEhnNy6fpV6di2m2e7kXO2hB0=;
        b=i+J7LrtZ4Hc3bvTQtAdT0Ze4Va6ZYgOu/VG0rXMPbSlzpdP3AbgpSnIXIPd8U8VEWq
         EAHGjQKY6RDbzkVvsNY0xaS6ZAUnVy2R9PDOKcVr5qOoQUC2HHZnXKEKFpXlfTnxDip+
         4bJ+cpvtTFhPOi5ryzBW45QwRaiCRqYgA31XoElEXqpvm1h+nebY/gAO1vmKvIpCoszk
         ovJku0WsCvchQBWTCHgffKE2RgyHhaBJCRzD7QITeNWkdc4WqYXKjHpbBur0u1U2QnTw
         Rt81uGh2afa9+cexTX2nYLdaeHDStek+AKBvSE8cXLx/qwBawoEuEO+5hSE52N2mK/fA
         mlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sg873tJVHtFPa20xblyEhnNy6fpV6di2m2e7kXO2hB0=;
        b=KnpDf/Aj+NTxvMyxUdKyBsYEQoMoYkpMlHYo0LJtbECaCeoKQkL39RBxo3FxYjPN5Y
         yhIz9VAVlzfNJvhpGZ7FouDoqf1d09veGpSyHGdmX4MUVSubkLmva+rcCPw6aHFIBdxs
         qtH5ZxSYh3aCDW8ZFcaLPz/H3UyxphlKruHza0m2soxZtBuc2IpL0oKI/GPqAcG5Ql6C
         ECN3yogFHnyfBw7IhYWO1Qu7R6Hp5/xdJRN5MoePmVXlxOvre0w+We3/hfMvSUp1Wht5
         ybET6ahBOCWaimDBFtmavyhMk5CmYOFxEkrNr2rh7w+6FjVvpylUbFlnZiFK01JqzHav
         JzCA==
X-Gm-Message-State: APjAAAXtFI99A4WHae3hYQQrpdwoujKmRwQkuLPWQ5o+wn9VJsNx2e/O
        OQFdgk3dPixA8+eibZkwYVs+/t+T9vvDF9MNeVwZuA==
X-Google-Smtp-Source: APXvYqxvGM1kJx7DEGJubUnHvjRECgDEM11cJs+c9bMYWzIMEL8U10zqwOuQDQ/QTnDmz2Zeir7t5IcWG8JUZ4/N7t0=
X-Received: by 2002:a6b:8f11:: with SMTP id r17mr6831161iod.50.1576777053504;
 Thu, 19 Dec 2019 09:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20191213125537.11509-1-t-kristo@ti.com> <20191213125537.11509-5-t-kristo@ti.com>
 <20191218002257.GB16271@xps15> <021d0654-5e78-85cd-4737-c1eccc8c07ce@ti.com>
In-Reply-To: <021d0654-5e78-85cd-4737-c1eccc8c07ce@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 19 Dec 2019 10:37:22 -0700
Message-ID: <CANLsYkxqA4jm3igF9hfppzPGx4fyvmc+5LTY8uMCYNvZBCJoSQ@mail.gmail.com>
Subject: Re: [PATCHv3 04/15] remoteproc/omap: Add support to parse internal
 memories from DT
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 19 Dec 2019 at 05:31, Tero Kristo <t-kristo@ti.com> wrote:
>
> On 18/12/2019 02:22, Mathieu Poirier wrote:
> > On Fri, Dec 13, 2019 at 02:55:26PM +0200, Tero Kristo wrote:
> >> From: Suman Anna <s-anna@ti.com>
> >>
> >> The OMAP remoteproc driver has been enhanced to parse and store
> >> the kernel mappings for different internal RAM memories that may
> >> be present within each remote processor IP subsystem. Different
> >> devices have varying memories present on current SoCs. The current
> >> support handles the L2RAM for all IPU devices on OMAP4+ SoCs. The
> >> DSPs on OMAP4/OMAP5 only have Unicaches and do not have any L1 or
> >> L2 RAM memories.
> >>
> >> IPUs are expected to have the L2RAM at a fixed device address of
> >> 0x20000000, based on the current limitations on Attribute MMU
> >> configurations.
> >>
> >> NOTE:
> >> The current logic doesn't handle the parsing of memories for DRA7
> >> remoteproc devices, and will be added alongside the DRA7 support.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> [t-kristo: converted to parse mem names / device addresses from pdata]
> >> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >> ---
> >>   drivers/remoteproc/omap_remoteproc.c | 86 ++++++++++++++++++++++++++++
> >>   1 file changed, 86 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> >> index d80f5d7b5931..844703507a74 100644
> >> --- a/drivers/remoteproc/omap_remoteproc.c
> >> +++ b/drivers/remoteproc/omap_remoteproc.c
> >> @@ -39,11 +39,27 @@ struct omap_rproc_boot_data {
> >>      unsigned int boot_reg;
> >>   };
> >>
> >> +/*
> >> + * struct omap_rproc_mem - internal memory structure
> >> + * @cpu_addr: MPU virtual address of the memory region
> >> + * @bus_addr: bus address used to access the memory region
> >> + * @dev_addr: device address of the memory region from DSP view
> >> + * @size: size of the memory region
> >> + */
> >> +struct omap_rproc_mem {
> >> +    void __iomem *cpu_addr;
> >> +    phys_addr_t bus_addr;
> >> +    u32 dev_addr;
> >> +    size_t size;
> >> +};
> >> +
> >>   /**
> >>    * struct omap_rproc - omap remote processor state
> >>    * @mbox: mailbox channel handle
> >>    * @client: mailbox client to request the mailbox channel
> >>    * @boot_data: boot data structure for setting processor boot address
> >> + * @mem: internal memory regions data
> >> + * @num_mems: number of internal memory regions
> >>    * @rproc: rproc handle
> >>    * @reset: reset handle
> >>    */
> >> @@ -51,6 +67,8 @@ struct omap_rproc {
> >>      struct mbox_chan *mbox;
> >>      struct mbox_client client;
> >>      struct omap_rproc_boot_data *boot_data;
> >> +    struct omap_rproc_mem *mem;
> >> +    int num_mems;
> >>      struct rproc *rproc;
> >>      struct reset_control *reset;
> >>   };
> >> @@ -59,10 +77,14 @@ struct omap_rproc {
> >>    * struct omap_rproc_dev_data - device data for the omap remote processor
> >>    * @device_name: device name of the remote processor
> >>    * @has_bootreg: true if this remote processor has boot register
> >> + * @mem_names: memory names for this remote processor
> >> + * @dev_addrs: device addresses corresponding to the memory names
> >>    */
> >>   struct omap_rproc_dev_data {
> >>      const char *device_name;
> >>      bool has_bootreg;
> >> +    const char * const *mem_names;
> >> +    const u32 *dev_addrs;
> >
> > Bunching these two in a new structure like omap_rproc_mem_data would clean
> > things up.  That way the two arrays in the next hunk get merged and there can't
> > be a difference in sizes, somthing that will sturdy the main loop in
> > omap_rproc_of_get_internal_memories() below.
>
> Will fix this.
>
> >
> >>   };
> >>
> >>   /**
> >> @@ -216,6 +238,14 @@ static const struct rproc_ops omap_rproc_ops = {
> >>      .kick           = omap_rproc_kick,
> >>   };
> >>
> >> +static const char * const ipu_mem_names[] = {
> >> +    "l2ram", NULL
> >> +};
> >> +
> >> +static const u32 ipu_dev_addrs[] = {
> >> +    0x20000000,
> >> +};
> >> +
> >>   static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
> >>      .device_name    = "dsp",
> >>      .has_bootreg    = true,
> >> @@ -223,6 +253,8 @@ static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
> >>
> >>   static const struct omap_rproc_dev_data omap4_ipu_dev_data = {
> >>      .device_name    = "ipu",
> >> +    .mem_names      = ipu_mem_names,
> >> +    .dev_addrs      = ipu_dev_addrs,
> >>   };
> >>
> >>   static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
> >> @@ -232,6 +264,8 @@ static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
> >>
> >>   static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
> >>      .device_name    = "ipu",
> >> +    .mem_names      = ipu_mem_names,
> >> +    .dev_addrs      = ipu_dev_addrs,
> >>   };
> >>
> >>   static const struct of_device_id omap_rproc_of_match[] = {
> >> @@ -311,6 +345,54 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
> >>      return 0;
> >>   }
> >>
> >> +static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
> >> +                                           struct rproc *rproc)
> >> +{
> >> +    struct omap_rproc *oproc = rproc->priv;
> >> +    struct device *dev = &pdev->dev;
> >> +    const struct omap_rproc_dev_data *data;
> >> +    struct resource *res;
> >> +    int num_mems;
> >> +    int i;
> >> +
> >> +    data = of_device_get_match_data(&pdev->dev);
> >> +    if (!data)
> >> +            return -ENODEV;
> >> +
> >> +    if (!data->mem_names)
> >> +            return 0;
> >> +
> >> +    for (num_mems = 0; data->mem_names[num_mems]; num_mems++)
> >> +            ;
> >
> > Instead of doing this function of_property_count_elems_of_size() can be used on
> > the "reg" property.
>
> Hmm right, but the problem is then we don't know if someone left out one
> of the memories in DT. We want to check the presence for all defined in
> the platform data.
>

In my opinion (and to go along what I advocated in a comment on
another patch) everything should be dictated from the DT.  If an area
of reserved memory is missing in the DT then the infrastructure should
recognise it and refuse to move forward with initialisation.

Thanks
Mathieu

> >
> > In the loop below a check should be done to see if data->mem_data[i] (see above
> > comment) is valid before calling platform_get_resource_byname().  If not then
> > an error can be returned.
>
> Will add a check to it.
>
> -Tero
>
> >
> > I'm running out of time for today - I will continue reviewing the other patches
> > tomorrow.
> >
> >> +
> >> +    oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
> >> +                              GFP_KERNEL);
> >> +    if (!oproc->mem)
> >> +            return -ENOMEM;
> >> +
> >> +    for (i = 0; i < num_mems; i++) {
> >> +            res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> >> +                                               data->mem_names[i]);
> >> +            oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
> >> +            if (IS_ERR(oproc->mem[i].cpu_addr)) {
> >> +                    dev_err(dev, "failed to parse and map %s memory\n",
> >> +                            data->mem_names[i]);
> >> +                    return PTR_ERR(oproc->mem[i].cpu_addr);
> >> +            }
> >> +            oproc->mem[i].bus_addr = res->start;
> >> +            oproc->mem[i].dev_addr = data->dev_addrs[i];
> >> +            oproc->mem[i].size = resource_size(res);
> >> +
> >> +            dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
> >> +                    data->mem_names[i], &oproc->mem[i].bus_addr,
> >> +                    oproc->mem[i].size, oproc->mem[i].cpu_addr,
> >> +                    oproc->mem[i].dev_addr);
> >> +    }
> >> +    oproc->num_mems = num_mems;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   static int omap_rproc_probe(struct platform_device *pdev)
> >>   {
> >>      struct device_node *np = pdev->dev.of_node;
> >> @@ -350,6 +432,10 @@ static int omap_rproc_probe(struct platform_device *pdev)
> >>      /* All existing OMAP IPU and DSP processors have an MMU */
> >>      rproc->has_iommu = true;
> >>
> >> +    ret = omap_rproc_of_get_internal_memories(pdev, rproc);
> >> +    if (ret)
> >> +            goto free_rproc;
> >> +
> >>      ret = omap_rproc_get_boot_data(pdev, rproc);
> >>      if (ret)
> >>              goto free_rproc;
> >> --
> >> 2.17.1
> >>
> >> --
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
