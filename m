Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95F1917AB05
	for <lists+linux-omap@lfdr.de>; Thu,  5 Mar 2020 17:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgCEQ4o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Mar 2020 11:56:44 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33587 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgCEQ4o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Mar 2020 11:56:44 -0500
Received: by mail-pj1-f65.google.com with SMTP id o21so2468902pjs.0
        for <linux-omap@vger.kernel.org>; Thu, 05 Mar 2020 08:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wOM663e6tPW5QDzsdb/4PQaIBOB4nIZgcTdiLJSmYxE=;
        b=B8lYWiNyTh+0U4oEPOM2iojW/8UltRk3FuN/aA6unZG5Tshk8sOrt03FvNCABAmAyo
         bLMlJDJmtbkdVX6jO5Qjh0cKrhi7/vQdtuJ9wYdYLuCqR07EoC1bhZOoFfEFWYBnd3P6
         kE1nANxcF4JOxF3OVrUCx0bObqHsvv3h1Nd68dzltdb6uwRMRlB6f6K0MpyO9JlBM7z3
         coyWjCHkpSAgMx/u1YJ4UEvS4mGgOHiKS6aAEc/L8n+3Rfu0l7vYcGM0OmMmuJdtpn04
         Fyrf2Wy9y8UzegexuoPVyFTBR+wbf9jK7/c5OZA6mSD8FGy0u7OQQGmiDKqPpAq7eGlP
         EjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wOM663e6tPW5QDzsdb/4PQaIBOB4nIZgcTdiLJSmYxE=;
        b=hF7gx23vPHhTwLb5kSSn5vekGg4/VxewGncxF6sSBNvw6Hvb4/AmAaVHOVSVcjZv33
         2s38fSBUwZNLs57In6gaPurHA65z+pp0w7b63f1D7yrNmJ7qG4ab20CrvfjWkVe5GKlE
         2NR40A0NjOxvXxkznEJQnVQYru0mkA0RYsLERFwSgV7SXeCMmSjgvbMKA4VfZqMjdNcF
         VLV5OFaANuj3qyLL9OtbCOUTVOV7XGtCW2LNd3cO2UbsjQ1x9yqNOM6/QelZP0tasZCC
         gk5zUOJLIjDxFAKjn2bjiYZjTAJNB2avLa97PnC/k62QNuPbYJav5UWR3YXQIfvnoiMN
         clpA==
X-Gm-Message-State: ANhLgQ1zqa8apQ7LGuPIfs43FHSac+JJff4Y59WxMqqH0DcA8zXULQka
        1Zt9NZiCVGmYh6/L3MjBxxkDLQ==
X-Google-Smtp-Source: ADFU+vveWr5LkPLK1D0uDeoOeWaDU1uM69WRyQKC6hFxZYC7SDsRbs57fCAlkrqBO3m+j5xy8jQSXA==
X-Received: by 2002:a17:90a:fc88:: with SMTP id ci8mr9770803pjb.193.1583427401607;
        Thu, 05 Mar 2020 08:56:41 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id l62sm19029891pgd.82.2020.03.05.08.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 08:56:41 -0800 (PST)
Date:   Thu, 5 Mar 2020 09:56:39 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 04/15] remoteproc/omap: Add support to parse internal
 memories from DT
Message-ID: <20200305165639.GA13914@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-5-t-kristo@ti.com>
 <20200304173207.GC8197@xps15>
 <12cfb0db-f86e-3cd8-5010-d96daa91c184@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12cfb0db-f86e-3cd8-5010-d96daa91c184@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Mar 04, 2020 at 09:08:07PM +0200, Tero Kristo wrote:
> On 04/03/2020 19:32, Mathieu Poirier wrote:
> > On Fri, Feb 21, 2020 at 12:19:25PM +0200, Tero Kristo wrote:
> > > From: Suman Anna <s-anna@ti.com>
> > > 
> > > The OMAP remoteproc driver has been enhanced to parse and store
> > > the kernel mappings for different internal RAM memories that may
> > > be present within each remote processor IP subsystem. Different
> > > devices have varying memories present on current SoCs. The current
> > > support handles the L2RAM for all IPU devices on OMAP4+ SoCs. The
> > > DSPs on OMAP4/OMAP5 only have Unicaches and do not have any L1 or
> > > L2 RAM memories.
> > > 
> > > IPUs are expected to have the L2RAM at a fixed device address of
> > > 0x20000000, based on the current limitations on Attribute MMU
> > > configurations.
> > > 
> > > NOTE:
> > > The current logic doesn't handle the parsing of memories for DRA7
> > > remoteproc devices, and will be added alongside the DRA7 support.
> > > 
> > > Signed-off-by: Suman Anna <s-anna@ti.com>
> > > [t-kristo: converted to parse mem names / device addresses from pdata]
> > > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > > ---
> > >   drivers/remoteproc/omap_remoteproc.c | 89 ++++++++++++++++++++++++++++
> > >   1 file changed, 89 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> > > index 64b559caadff..4f92b069f5d0 100644
> > > --- a/drivers/remoteproc/omap_remoteproc.c
> > > +++ b/drivers/remoteproc/omap_remoteproc.c
> > > @@ -39,11 +39,27 @@ struct omap_rproc_boot_data {
> > >   	unsigned int boot_reg;
> > >   };
> > > +/**
> > > + * struct omap_rproc_mem - internal memory structure
> > > + * @cpu_addr: MPU virtual address of the memory region
> > > + * @bus_addr: bus address used to access the memory region
> > > + * @dev_addr: device address of the memory region from DSP view
> > > + * @size: size of the memory region
> > > + */
> > > +struct omap_rproc_mem {
> > > +	void __iomem *cpu_addr;
> > > +	phys_addr_t bus_addr;
> > > +	u32 dev_addr;
> > > +	size_t size;
> > > +};
> > > +
> > >   /**
> > >    * struct omap_rproc - omap remote processor state
> > >    * @mbox: mailbox channel handle
> > >    * @client: mailbox client to request the mailbox channel
> > >    * @boot_data: boot data structure for setting processor boot address
> > > + * @mem: internal memory regions data
> > > + * @num_mems: number of internal memory regions
> > >    * @rproc: rproc handle
> > >    * @reset: reset handle
> > >    */
> > > @@ -51,16 +67,30 @@ struct omap_rproc {
> > >   	struct mbox_chan *mbox;
> > >   	struct mbox_client client;
> > >   	struct omap_rproc_boot_data *boot_data;
> > > +	struct omap_rproc_mem *mem;
> > > +	int num_mems;
> > >   	struct rproc *rproc;
> > >   	struct reset_control *reset;
> > >   };
> > > +/**
> > > + * struct omap_rproc_mem_data - memory definitions for an omap remote processor
> > > + * @name: name for this memory entry
> > > + * @dev_addr: device address for the memory entry
> > > + */
> > > +struct omap_rproc_mem_data {
> > > +	const char *name;
> > > +	const u32 dev_addr;
> > > +};
> > > +
> > >   /**
> > >    * struct omap_rproc_dev_data - device data for the omap remote processor
> > >    * @device_name: device name of the remote processor
> > > + * @mems: memory definitions for this remote processor
> > >    */
> > >   struct omap_rproc_dev_data {
> > >   	const char *device_name;
> > > +	const struct omap_rproc_mem_data *mems;
> > >   };
> > >   /**
> > > @@ -223,12 +253,18 @@ static const struct rproc_ops omap_rproc_ops = {
> > >   	.kick		= omap_rproc_kick,
> > >   };
> > > +static const struct omap_rproc_mem_data ipu_mems[] = {
> > > +	{ .name = "l2ram", .dev_addr = 0x20000000 },
> > > +	{ },
> > > +};
> > > +
> > >   static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
> > >   	.device_name	= "dsp",
> > >   };
> > >   static const struct omap_rproc_dev_data omap4_ipu_dev_data = {
> > >   	.device_name	= "ipu",
> > > +	.mems		= ipu_mems,
> > >   };
> > >   static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
> > > @@ -237,6 +273,7 @@ static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
> > >   static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
> > >   	.device_name	= "ipu",
> > > +	.mems		= ipu_mems,
> > >   };
> > >   static const struct of_device_id omap_rproc_of_match[] = {
> > > @@ -311,6 +348,54 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
> > >   	return 0;
> > >   }
> > > +static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
> > > +					       struct rproc *rproc)
> > > +{
> > > +	struct omap_rproc *oproc = rproc->priv;
> > > +	struct device *dev = &pdev->dev;
> > > +	const struct omap_rproc_dev_data *data;
> > > +	struct resource *res;
> > > +	int num_mems;
> > > +	int i;
> > > +
> > > +	data = of_device_get_match_data(&pdev->dev);
> > > +	if (!data)
> > > +		return -ENODEV;
> > > +
> > > +	if (!data->mems)
> > > +		return 0;
> > > +
> > > +	for (num_mems = 0; data->mems[num_mems].name; num_mems++)
> > > +		;
> > 
> > Please use of_property_count_elems_of_size() as it was done in omap_hwmod.c [1]
> 
> There is reason why it was not done like that here. We want to make sure all
> the memories required for the remoteproc are in place, missing any one of
> them is a fatal error as you see in the code few lines below (my comment.)
> 
> > 
> > [1]. https://elixir.bootlin.com/linux/v5.6-rc4/source/arch/arm/mach-omap2/omap_hwmod.c#L717
> > 
> > With the above:
> > 
> > Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> > 
> > > +
> > > +	oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
> > > +				  GFP_KERNEL);
> > > +	if (!oproc->mem)
> > > +		return -ENOMEM;
> > > +
> > > +	for (i = 0; i < num_mems; i++) {
> > > +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > +						   data->mems[i].name);
> > > +		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
> > > +		if (IS_ERR(oproc->mem[i].cpu_addr)) {
> > > +			dev_err(dev, "failed to parse and map %s memory\n",
> > > +				data->mems[i].name);
> > > +			return PTR_ERR(oproc->mem[i].cpu_addr);
> > > +		}
> 
> We check here that all the memories required are defined for the remoteproc.
> If we use of_property_count_elems_of_size, we only get the number of
> memories defined in DT.

To make sure all memories are accounted for use data->mem[] in the loop:


        num_mems = of_property_count_elems_of_size();
        oproc->mem = devm_kcalloc();

        for (i = 0; data->mem[i]; i++) {
                res = platform_get_resource_byname(pdev, IORESOURCES_MEM,
                                                   data->mems[i].name);
                oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
                ...
                ...
        }  

> 
> -Tero
> 
> > > +		oproc->mem[i].bus_addr = res->start;
> > > +		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
> > > +		oproc->mem[i].size = resource_size(res);
> > > +
> > > +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
> > > +			data->mems[i].name, &oproc->mem[i].bus_addr,
> > > +			oproc->mem[i].size, oproc->mem[i].cpu_addr,
> > > +			oproc->mem[i].dev_addr);
> > > +	}
> > > +	oproc->num_mems = num_mems;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static int omap_rproc_probe(struct platform_device *pdev)
> > >   {
> > >   	struct device_node *np = pdev->dev.of_node;
> > > @@ -350,6 +435,10 @@ static int omap_rproc_probe(struct platform_device *pdev)
> > >   	/* All existing OMAP IPU and DSP processors have an MMU */
> > >   	rproc->has_iommu = true;
> > > +	ret = omap_rproc_of_get_internal_memories(pdev, rproc);
> > > +	if (ret)
> > > +		goto free_rproc;
> > > +
> > >   	ret = omap_rproc_get_boot_data(pdev, rproc);
> > >   	if (ret)
> > >   		goto free_rproc;
> > > -- 
> > > 2.17.1
> > > 
> > > --
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
