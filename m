Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A922FABCB
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 09:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfKMIIz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 03:08:55 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42292 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfKMIIz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Nov 2019 03:08:55 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD88r9A046927;
        Wed, 13 Nov 2019 02:08:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573632533;
        bh=6rDwGXwTQN32EHn7rFYe5HgX16STJmuiP0QLoRWW/Sc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ckxLb/2fdYNLuGkeU7RnDFu8C4sJFlBDdDLGyNk0oobaVWEzUltKGEviqXoEyG5Qa
         B0Q7bqs7dGbyOo64JEv4z7+Ha5e2MBmsnobNjdXc2BUKzSKu6j6+LKPFNCMmmjDRck
         VD5n6hMRGkYsIYNcEoSKGudAiZPDnlhBk76uAuac=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAD88rVI054401
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 02:08:53 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 02:08:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 02:08:29 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD88ibY060428;
        Wed, 13 Nov 2019 02:08:45 -0600
Subject: Re: [PATCH 08/17] remoteproc/omap: Add support for DRA7xx remote
 processors
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-9-t-kristo@ti.com> <20191111233707.GJ3108315@builder>
 <0d26759a-8a48-e573-cbf6-721c6e5367c1@ti.com> <20191112181343.GJ3797@yoga>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <77354704-70cd-fd07-5ea6-4572dfad0c52@ti.com>
Date:   Wed, 13 Nov 2019 10:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112181343.GJ3797@yoga>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/11/2019 20:13, Bjorn Andersson wrote:
> On Tue 12 Nov 00:37 PST 2019, Tero Kristo wrote:
> 
>> On 12/11/2019 01:37, Bjorn Andersson wrote:
>>> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
> [..]
>>>> +	for (; data && data->device_name; data++) {
>>>> +		if (!strcmp(dev_name(&pdev->dev), data->device_name))
>>>
>>> I don't fancy the reliance on node names in devicetree, is this well
>>> defined in the binding?
>>
>> I don't think it is.... So, would it be better to just replace the
>> compatible strings for dra7 remoteprocs to be like ti,dra7-dsp1 /
>> ti,dra7-dsp2 etc.? I think that would clean up the code also quite a bit.
>>
> 
> While it would solve "my" problem I'm not entirely sure about it being
> a proper way to flag that they should have different default firmware.
> 
> One way would be to simply rely on a "firmware-name" property read from
> DeviceTree (this was previously objected to, but we have that for
> several bindings now).

Ok, that should work, and would make things easily customizable also.

-Tero

> 
> Regards,
> Bjorn
> 
>>>
>>>> +			return data->fw_name;
>>>> +	}
>>>> +
>>>> +	return ERR_PTR(-ENOENT);
>>>>    }
>>>>    static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>>> @@ -334,7 +384,8 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>>>    	int ret;
>>>>    	if (!of_device_is_compatible(np, "ti,omap4-dsp") &&
>>>> -	    !of_device_is_compatible(np, "ti,omap5-dsp"))
>>>> +	    !of_device_is_compatible(np, "ti,omap5-dsp") &&
>>>> +	    !of_device_is_compatible(np, "ti,dra7-dsp"))
>>>>    		return 0;
>>>>    	oproc->boot_data = devm_kzalloc(&pdev->dev, sizeof(*oproc->boot_data),
>>>> @@ -360,18 +411,27 @@ static int omap_rproc_get_boot_data(struct platform_device *pdev,
>>>>    		return -EINVAL;
>>>>    	}
>>>> +	if (of_device_is_compatible(np, "ti,dra7-dsp"))
>>>> +		oproc->boot_data->boot_reg_shift = 10;
>>>
>>> Put this in omap_rproc_dev_data.
>>
>> Yeah.
>>
>>>
>>>> +
>>>>    	return 0;
>>>>    }
>>>>    static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>>>>    					       struct rproc *rproc)
>>>>    {
>>>> -	static const char * const mem_names[] = {"l2ram"};
>>>> +	static const char * const ipu_mem_names[] = {"l2ram"};
>>>> +	static const char * const dra7_dsp_mem_names[] = {"l2ram", "l1pram",
>>>> +								"l1dram"};
>>>>    	struct device_node *np = pdev->dev.of_node;
>>>>    	struct omap_rproc *oproc = rproc->priv;
>>>>    	struct device *dev = &pdev->dev;
>>>> +	const char * const *mem_names;
>>>>    	struct resource *res;
>>>>    	int num_mems;
>>>> +	const __be32 *addrp;
>>>> +	u32 l4_offset = 0;
>>>> +	u64 size;
>>>>    	int i;
>>>>    	/* OMAP4 and OMAP5 DSPs do not have support for flat SRAM */
>>>> @@ -379,7 +439,15 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>>>>    	    of_device_is_compatible(np, "ti,omap5-dsp"))
>>>>    		return 0;
>>>> -	num_mems = ARRAY_SIZE(mem_names);
>>>> +	/* DRA7 DSPs have two additional SRAMs at L1 level */
>>>> +	if (of_device_is_compatible(np, "ti,dra7-dsp")) {
>>>> +		mem_names = dra7_dsp_mem_names;
>>>> +		num_mems = ARRAY_SIZE(dra7_dsp_mem_names);
>>>> +	} else {
>>>> +		mem_names = ipu_mem_names;
>>>> +		num_mems = ARRAY_SIZE(ipu_mem_names);
>>>> +	}
>>>> +
>>>>    	oproc->mem = devm_kcalloc(dev, num_mems, sizeof(*oproc->mem),
>>>>    				  GFP_KERNEL);
>>>>    	if (!oproc->mem)
>>>> @@ -395,7 +463,26 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>>>>    			return PTR_ERR(oproc->mem[i].cpu_addr);
>>>>    		}
>>>>    		oproc->mem[i].bus_addr = res->start;
>>>> -		oproc->mem[i].dev_addr = OMAP_RPROC_IPU_L2RAM_DEV_ADDR;
>>>> +
>>>> +		/*
>>>> +		 * The DSPs have the internal memories starting at a fixed
>>>> +		 * offset of 0x800000 from address 0, and this corresponds to
>>>> +		 * L2RAM. The L3 address view has the L2RAM bus address as the
>>>> +		 * starting address for the IP, so the L2RAM memory region needs
>>>> +		 * to be processed first, and the device addresses for each
>>>> +		 * memory region can be computed using the relative offset
>>>> +		 * from this base address.
>>>> +		 */
>>>> +		if (of_device_is_compatible(np, "ti,dra7-dsp") &&
>>>
>>> Please don't use a ternary operator repeatedly, it makes the code hard
>>> to follow.
>>
>> Yeah this parts looks somewhat messy, let me try to fix that.
>>
>> -Tero
>>
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> +		    !strcmp(mem_names[i], "l2ram")) {
>>>> +			addrp = of_get_address(dev->of_node, i, &size, NULL);
>>>> +			l4_offset = of_translate_address(dev->of_node, addrp);
>>>> +		}
>>>> +		oproc->mem[i].dev_addr =
>>>> +			of_device_is_compatible(np, "ti,dra7-dsp") ?
>>>> +				res->start - l4_offset +
>>>> +				OMAP_RPROC_DSP_LOCAL_MEM_OFFSET :
>>>> +				OMAP_RPROC_IPU_L2RAM_DEV_ADDR;
>>>>    		oproc->mem[i].size = resource_size(res);
>>>>    		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
>>>> -- 
>>>> 2.17.1
>>>>
>>>> --
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
