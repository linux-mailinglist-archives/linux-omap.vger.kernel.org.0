Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F21F8A47
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 09:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbfKLIPD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 03:15:03 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39052 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfKLIPC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 03:15:02 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAC8Ex0u109278;
        Tue, 12 Nov 2019 02:14:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573546499;
        bh=FsOVqKbljcnHgICqOdzhzNiPBNYuXWN1KLg4XT+reEw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ns3BeRqfXxRdfzQxIyW4OpvuhbMUih8f6ETFb5E/SgjUVsF8srHMpSXB7130gke+L
         sULnflqQnWMubCRffB5PAmoIHVvfmPBbkEDf6dgwyjkB6vS+QQVqrdZeKqoopCPm36
         I44hTbQUIGY6rrIMd//ekELAqENL2XpS+40N+tyc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAC8ExHv013948
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 02:14:59 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 02:14:41 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 02:14:41 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAC8EuMt030332;
        Tue, 12 Nov 2019 02:14:56 -0600
Subject: Re: [PATCH 03/17] remoteproc/omap: Add device tree support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <ohad@wizery.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
 <20191028124238.19224-4-t-kristo@ti.com> <20191111231650.GE3108315@builder>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <0698f722-c56f-005a-cd9f-51199d73bd12@ti.com>
Date:   Tue, 12 Nov 2019 10:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111231650.GE3108315@builder>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/11/2019 01:16, Bjorn Andersson wrote:
> On Mon 28 Oct 05:42 PDT 2019, Tero Kristo wrote:
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> [..]
>> +static int omap_rproc_get_boot_data(struct platform_device *pdev,
>> +				    struct rproc *rproc)
>> +{
>> +	struct device_node *np = pdev->dev.of_node;
>> +	struct omap_rproc *oproc = rproc->priv;
>> +	int ret;
>> +
>> +	if (!of_device_is_compatible(np, "ti,omap4-dsp") &&
>> +	    !of_device_is_compatible(np, "ti,omap5-dsp"))
>> +		return 0;
> 
> I think it would be cleaner if you added a "has_bootreg" bool to your
> omap_rproc_dev_data, do of_device_get_match_data() in omap_rproc_probe()
> and pass that here.

Hmm you are right. There seem to be couple of other similar checks 
around the code, let me try to address those as well.

> 
>> +
>> +	oproc->boot_data = devm_kzalloc(&pdev->dev, sizeof(*oproc->boot_data),
>> +					GFP_KERNEL);
>> +	if (!oproc->boot_data)
>> +		return -ENOMEM;
>> +
>> +	if (!of_property_read_bool(np, "syscon-bootreg")) {
>> +		dev_err(&pdev->dev, "syscon-bootreg property is missing\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	oproc->boot_data->syscon =
>> +			syscon_regmap_lookup_by_phandle(np, "syscon-bootreg");
> 
> You updated the dt binding document, but this needs to be updated as
> well.

Yeah, was waiting for comments before updating the actual code.

-Tero

> 
> Regards,
> Bjorn
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
