Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69FDBB152C
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 22:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbfILUJs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 16:09:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45368 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbfILUJr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 16:09:47 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CK9PoF109697;
        Thu, 12 Sep 2019 15:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568318965;
        bh=16OqD2YMbnKdC6QRUB/lstU38e2Kzn/xLVzjMK9d4Fk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=A01AIhVgDkqOT4Mu/kRkM4untpi8TLC/eI7KZniejEmoiN5TrobB0F/cE81XdVCpc
         MhH/nqk+5kxCLQxhdIz6unn/IcpMyrTIMv3d8OUx9JOC6A2a81HGUrra8EpNbqKZ/u
         Rlu/aICwUh8uMNE/WE673u+LFj83m2LbKI1uKrdY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CK9P7e027699
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 15:09:25 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 15:09:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 15:09:25 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CK9MQv004968;
        Thu, 12 Sep 2019 15:09:23 -0500
Subject: Re: [PATCHv5 10/10] ARM: OMAP2+: pdata-quirks: add PRM data for reset
 support
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>,
        <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <s-anna@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20190912113916.20093-1-t-kristo@ti.com>
 <20190912113916.20093-11-t-kristo@ti.com>
 <20190912170953.GT52127@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <4103d986-20fa-0dce-df6b-b0955ceabd74@ti.com>
Date:   Thu, 12 Sep 2019 23:09:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912170953.GT52127@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/09/2019 20:09, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [190912 11:40]:
>> @@ -565,6 +566,12 @@ void omap_pcs_legacy_init(int irq, void (*rearm)(void))
>>   	pcs_pdata.rearm = rearm;
>>   }
>>   
>> +static struct ti_prm_platform_data ti_prm_pdata = {
>> +	.clkdm_deny_idle = clkdm_deny_idle,
>> +	.clkdm_allow_idle = clkdm_allow_idle,
>> +	.clkdm_lookup = clkdm_lookup,
>> +};
>> +
>>   /*
>>    * GPIOs for TWL are initialized by the I2C bus and need custom
>>    * handing until DSS has device tree bindings.
>> @@ -664,6 +671,11 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
>>   	/* Common auxdata */
>>   	OF_DEV_AUXDATA("ti,sysc", 0, NULL, &ti_sysc_pdata),
>>   	OF_DEV_AUXDATA("pinctrl-single", 0, NULL, &pcs_pdata),
>> +	OF_DEV_AUXDATA("ti,omap4-prm-inst", 0, NULL, &ti_prm_pdata),
>> +	OF_DEV_AUXDATA("ti,omap5-prm-inst", 0, NULL, &ti_prm_pdata),
>> +	OF_DEV_AUXDATA("ti,dra7-prm-inst", 0, NULL, &ti_prm_pdata),
>> +	OF_DEV_AUXDATA("ti,am3-prm-inst", 0, NULL, &ti_prm_pdata),
>> +	OF_DEV_AUXDATA("ti,am4-prm-inst", 0, NULL, &ti_prm_pdata),
>>   	{ /* sentinel */ },
>>   };
> 
> Hmm I think I already commented on this.. Just one entry please:
> 
> 	OF_DEV_AUXDATA("ti,omap-prm-inst", 0, NULL, &ti_prm_pdata),
> 
> As the auxdata is the same for all of them. Note that all the
> dts files need to have also the generic compatible
> "ti,omap-prm-inst" after the SoC specific one.

Ok that should be fine, sorry for missing it out. I can update this in 
the next rev, just need to update the dt binding also.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
