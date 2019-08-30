Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9042A335E
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 11:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbfH3JHW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 05:07:22 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43630 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbfH3JHW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 05:07:22 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7U97BYH075140;
        Fri, 30 Aug 2019 04:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567156031;
        bh=pbbHjXFgEMUNVSFKH41QJG48HyK2dDKJg25+FIAOwgc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VECDpe6GWhf9qaBrfGZm7EvMrdsIKsfbQlJ0pCe8RqkCZefHYvJ4Z8XkEiAqC2n+d
         5WFPU85s3eJKKGNfTILEspun7nwAZgkDZacGhSO9BhrkeU/TiQE9toHGZaBbp9evml
         6jYyu092MIJN8hENWF20ma/bNvT/0FWf499VLuTg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7U97Bo8071724
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 04:07:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 04:07:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 04:07:11 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7U97879074497;
        Fri, 30 Aug 2019 04:07:09 -0500
Subject: Re: [PATCHv2 03/11] soc: ti: omap-prm: poll for reset complete during
 de-assert
To:     Philipp Zabel <p.zabel@pengutronix.de>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <20190828071941.32378-1-t-kristo@ti.com>
 <20190828071941.32378-4-t-kristo@ti.com>
 <1567084467.5345.9.camel@pengutronix.de>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <ceed701f-481c-4905-727e-ba3af2cf8ff2@ti.com>
Date:   Fri, 30 Aug 2019 12:07:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567084467.5345.9.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 29/08/2019 16:14, Philipp Zabel wrote:
> Hi Tero,
> 
> On Wed, 2019-08-28 at 10:19 +0300, Tero Kristo wrote:
>> Poll for reset completion status during de-assertion of reset, otherwise
>> the IP in question might be accessed before it has left reset properly.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/soc/ti/omap_prm.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
>> index fd5c431f8736..afeb70761b27 100644
>> --- a/drivers/soc/ti/omap_prm.c
>> +++ b/drivers/soc/ti/omap_prm.c
>> @@ -127,6 +127,7 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>>   	u32 v;
>>   	int st_bit;
>>   	bool has_rstst;
>> +	int timeout = 0;
>>   
>>   	if (!_is_valid_reset(reset, id))
>>   		return -EINVAL;
>> @@ -153,6 +154,25 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>>   	v &= ~(1 << id);
>>   	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>>   
>> +	if (!has_rstst)
>> +		return 0;
>> +
>> +	/* wait for the status to be set */
>> +	while (1) {
>> +		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
>> +		v &= 1 << st_bit;
>> +		if (v)
>> +			break;
>> +		timeout++;
>> +		if (timeout > OMAP_RESET_MAX_WAIT) {
>> +			pr_err("%s: timedout waiting for %s:%lu\n", __func__,
>> +			       dev_name(rcdev->dev), id);
>> +			return -EBUSY;
>> +		}
>> +
>> +		udelay(1);
>> +	}
> 
> This looks like you could use
> 
> 	readl_relaxed_poll_timeout(_atomic)

Yeah true, let me change that.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
