Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5881E21D1
	for <lists+linux-omap@lfdr.de>; Tue, 26 May 2020 14:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbgEZM16 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 08:27:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41572 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgEZM15 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 May 2020 08:27:57 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QCRkag123725;
        Tue, 26 May 2020 07:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590496066;
        bh=fW4dh2RlDLtgqAe1LMh/aOIhCZSLWJb/46PvuFUCsOU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dG6/9sBzee8Qvx2us5nsIDzM8Bi2JHCw/+EF8HoWm+T2bSlzEIpZjAIFZY5LQxULl
         jPkETCCEdNotNdeYA1I4kZdVNITJr/rmcGH5fAF+ucRTQWFd/Zoey1b2BolmdxDows
         VtJvip4t9MyvsT5poABHgqPIHHAFhxOJlavlOG5E=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04QCRkFk047965
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 May 2020 07:27:46 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 07:27:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 07:27:46 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QCRcHW085540;
        Tue, 26 May 2020 07:27:45 -0500
Subject: Re: [PATCHv2 3/7] crypto: omap-crypto: fix userspace copied buffer
 access
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     <davem@davemloft.net>, <linux-crypto@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Tejun Heo <tj@kernel.org>
References: <20200511111913.26541-1-t-kristo@ti.com>
 <20200511111913.26541-4-t-kristo@ti.com>
 <20200522131247.GA27255@gondor.apana.org.au>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <24092385-1348-f55d-a637-6fb2b3129f4e@ti.com>
Date:   Tue, 26 May 2020 15:27:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200522131247.GA27255@gondor.apana.org.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 22/05/2020 16:12, Herbert Xu wrote:
> On Mon, May 11, 2020 at 02:19:09PM +0300, Tero Kristo wrote:
>> In case buffers are copied from userspace, directly accessing the page
>> will most likely fail because it hasn't been mapped into the kernel
>> memory space. Fix the issue by forcing a kmap / kunmap within the
>> cleanup functionality.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/crypto/omap-crypto.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/crypto/omap-crypto.c b/drivers/crypto/omap-crypto.c
>> index cc88b7362bc2..31bdb1d76d11 100644
>> --- a/drivers/crypto/omap-crypto.c
>> +++ b/drivers/crypto/omap-crypto.c
>> @@ -178,11 +178,16 @@ static void omap_crypto_copy_data(struct scatterlist *src,
>>   		amt = min(src->length - srco, dst->length - dsto);
>>   		amt = min(len, amt);
>>   
>> -		srcb = sg_virt(src) + srco;
>> -		dstb = sg_virt(dst) + dsto;
>> +		srcb = kmap_atomic(sg_page(src)) + srco + src->offset;
>> +		dstb = kmap_atomic(sg_page(dst)) + dsto + dst->offset;
>>   
>>   		memcpy(dstb, srcb, amt);
>>   
>> +		flush_dcache_page(sg_page(dst));
> 
> You need to check !PageSlab as it's illegal to call it on a kernel
> page.  Also you should be using flush_kernel_dcache_page.  scatterwalk
> uses flush_dcache_page only because when it was created the other
> function didn't exist.

Ok will fix that.

> Would it be possible to use the sg_miter interface to do the copy?
> In fact your function could possibly be added to lib/scatterlist.c
> as it seems to be quite generic.

I think it would make sense to use that, however as I am just fixing an 
existing bug here, would it be ok if I just fix your above comment and 
post v3? I can convert this later to sg_miter and take a shot at moving 
this to lib/scatterlist.c as that seems slightly bigger effort and I 
would not want to block this whole series because of that...

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
