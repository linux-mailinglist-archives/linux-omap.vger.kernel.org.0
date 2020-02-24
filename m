Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E47216A81B
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 15:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727515AbgBXOPZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 09:15:25 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53484 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727489AbgBXOPZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 09:15:25 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01OEFNq1097309;
        Mon, 24 Feb 2020 08:15:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582553723;
        bh=ichIEIUq04C6mrjG/Wgqy3ZY1uj0LzsxVmdbEqXNaxA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=gSbmxsj0XbjIcynO7WKdmhAb9jaiM0I3JxaLKE0cuO3n6K71W11AxdEnyxiCtYu7t
         ufAam7z24UGfsHf/T4v4LZBjAA4BT9Fz9NEmOi2lSrvznkNqEpcXfQJUKnrl4R1Bst
         0L/dGNiM5iDF6MjlnaDArBHFK2rT0GYOH3xFZfoM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OEFNEU085157;
        Mon, 24 Feb 2020 08:15:23 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 08:15:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 08:15:23 -0600
Received: from [10.250.77.18] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OEFMAN036321;
        Mon, 24 Feb 2020 08:15:22 -0600
Subject: Re: [PATCHv7 04/15] remoteproc/omap: Add support to parse internal
 memories from DT
To:     Tero Kristo <t-kristo@ti.com>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <s-anna@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-omap@vger.kernel.org>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-5-t-kristo@ti.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <7de4914a-a5c6-b108-af10-45283aabddc7@ti.com>
Date:   Mon, 24 Feb 2020 09:15:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221101936.16833-5-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/21/20 5:19 AM, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The OMAP remoteproc driver has been enhanced to parse and store
> the kernel mappings for different internal RAM memories that may
> be present within each remote processor IP subsystem. Different
> devices have varying memories present on current SoCs. The current
> support handles the L2RAM for all IPU devices on OMAP4+ SoCs. The
> DSPs on OMAP4/OMAP5 only have Unicaches and do not have any L1 or
> L2 RAM memories.
> 
> IPUs are expected to have the L2RAM at a fixed device address of
> 0x20000000, based on the current limitations on Attribute MMU
> configurations.
> 
> NOTE:
> The current logic doesn't handle the parsing of memories for DRA7
> remoteproc devices, and will be added alongside the DRA7 support.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> [t-kristo: converted to parse mem names / device addresses from pdata]
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 89 ++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 64b559caadff..4f92b069f5d0 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -39,11 +39,27 @@ struct omap_rproc_boot_data {
>  	unsigned int boot_reg;
>  };
>  
> +/**
> + * struct omap_rproc_mem - internal memory structure
> + * @cpu_addr: MPU virtual address of the memory region
> + * @bus_addr: bus address used to access the memory region
> + * @dev_addr: device address of the memory region from DSP view
> + * @size: size of the memory region
> + */
> +struct omap_rproc_mem {
> +	void __iomem *cpu_addr;
> +	phys_addr_t bus_addr;
> +	u32 dev_addr;
> +	size_t size;
> +};
> +
>  /**
>   * struct omap_rproc - omap remote processor state
>   * @mbox: mailbox channel handle
>   * @client: mailbox client to request the mailbox channel
>   * @boot_data: boot data structure for setting processor boot address
> + * @mem: internal memory regions data
> + * @num_mems: number of internal memory regions
>   * @rproc: rproc handle
>   * @reset: reset handle
>   */
> @@ -51,16 +67,30 @@ struct omap_rproc {
>  	struct mbox_chan *mbox;
>  	struct mbox_client client;
>  	struct omap_rproc_boot_data *boot_data;
> +	struct omap_rproc_mem *mem;
> +	int num_mems;
>  	struct rproc *rproc;
>  	struct reset_control *reset;
>  };
>  
> +/**
> + * struct omap_rproc_mem_data - memory definitions for an omap remote processor
> + * @name: name for this memory entry
> + * @dev_addr: device address for the memory entry
> + */
> +struct omap_rproc_mem_data {
> +	const char *name;
> +	const u32 dev_addr;
> +};
> +
>  /**
>   * struct omap_rproc_dev_data - device data for the omap remote processor
>   * @device_name: device name of the remote processor
> + * @mems: memory definitions for this remote processor
>   */
>  struct omap_rproc_dev_data {
>  	const char *device_name;
> +	const struct omap_rproc_mem_data *mems;
>  };
>  
>  /**
> @@ -223,12 +253,18 @@ static const struct rproc_ops omap_rproc_ops = {
>  	.kick		= omap_rproc_kick,
>  };
>  
> +static const struct omap_rproc_mem_data ipu_mems[] = {
> +	{ .name = "l2ram", .dev_addr = 0x20000000 },
> +	{ },
> +};
> +
>  static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
>  	.device_name	= "dsp",
>  };
>  
>  static const struct omap_rproc_dev_data omap4_ipu_dev_data = {
>  	.device_name	= "ipu",
> +	.mems		= ipu_mems,
>  };
>  
>  static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
> @@ -237,6 +273,7 @@ static const struct omap_rproc_dev_data omap5_dsp_dev_data = {
>  
>  static const struct omap_rproc_dev_data omap5_ipu_dev_data = {
>  	.device_name	= "ipu",
> +	.mems		= ipu_mems,
>  };
>  
>  static const struct of_device_id omap_rproc_of_match[] = {
> @@ -311,6 +348,54 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
> +					       struct rproc *rproc)
> +{
> +	struct omap_rproc *oproc = rproc->priv;


'rproc' is only used to get 'oproc', why not just pass in 'oproc'?


> +	struct device *dev = &pdev->dev;
> +	const struct omap_rproc_dev_data *data;
> +	struct resource *res;
> +	int num_mems;
> +	int i;
> +
> +	data = of_device_get_match_data(&pdev->dev);


just use 'dev'


> +	if (!data)
> +		return -ENODEV;
> +
> +	if (!data->mems)
> +		return 0;
> +
> +	for (num_mems = 0; data->mems[num_mems].name; num_mems++)
> +		;
> +
> +	oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
> +				  GFP_KERNEL);
> +	if (!oproc->mem)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_mems; i++) {
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						   data->mems[i].name);
> +		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(oproc->mem[i].cpu_addr)) {
> +			dev_err(dev, "failed to parse and map %s memory\n",
> +				data->mems[i].name);
> +			return PTR_ERR(oproc->mem[i].cpu_addr);
> +		}
> +		oproc->mem[i].bus_addr = res->start;
> +		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
> +		oproc->mem[i].size = resource_size(res);
> +
> +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
> +			data->mems[i].name, &oproc->mem[i].bus_addr,
> +			oproc->mem[i].size, oproc->mem[i].cpu_addr,


I'm not a fan of printing kernel virtual addresses, but not a blocker.


> +			oproc->mem[i].dev_addr);
> +	}
> +	oproc->num_mems = num_mems;
> +
> +	return 0;
> +}
> +
>  static int omap_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -350,6 +435,10 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	/* All existing OMAP IPU and DSP processors have an MMU */
>  	rproc->has_iommu = true;
>  
> +	ret = omap_rproc_of_get_internal_memories(pdev, rproc);


This only looks to be used for the da_to_va() in the next patch, could
these be combined?

As above not a big deal, so for this patch and the whole series:

Reviewed-by: Andrew F. Davis <afd@ti.com>


> +	if (ret)
> +		goto free_rproc;
> +
>  	ret = omap_rproc_get_boot_data(pdev, rproc);
>  	if (ret)
>  		goto free_rproc;
> 
