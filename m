Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4FB1F102B
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2019 08:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730105AbfKFHZi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Nov 2019 02:25:38 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59748 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbfKFHZh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Nov 2019 02:25:37 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA67PQbb101819;
        Wed, 6 Nov 2019 01:25:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573025126;
        bh=dJZ3sYUnQAot2lJVFPiVqyY58bNj17rDpH/tpnzKJI0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OwHcmlJRFBVGaXR1CTf+KNdoaK5uYZZ2QZbjb/ATdmLrOrNETwj8tkr2WZNfHoF3v
         RZ4dRD0G/vqLsuPcTRBRw48HVx0yfjfHA8id6hhOPT8PxwdcQt9VOXD0bsqCeqY1hJ
         S3/CbNHLPWu8tMzj/Q2t1icaPDOFXxlvv1mkoVOw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA67PQIB078357
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Nov 2019 01:25:26 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 01:25:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 01:25:24 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA67PJRS106020;
        Wed, 6 Nov 2019 01:25:22 -0600
Subject: Re: [PATCH 09/10] crypto: add timeout to crypto_wait_req
To:     Gilad Ben-Yossef <gilad@benyossef.com>
CC:     Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@google.com>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20191017122549.4634-1-t-kristo@ti.com>
 <20191017122549.4634-10-t-kristo@ti.com>
 <CAOtvUMeBXjDBhSVgMOW=hshEx_AkNPg-Zk2c2jCDzY8vyXWW5g@mail.gmail.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <076f0bc6-ad04-9543-db02-d7c7060db036@ti.com>
Date:   Wed, 6 Nov 2019 09:25:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOtvUMeBXjDBhSVgMOW=hshEx_AkNPg-Zk2c2jCDzY8vyXWW5g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/11/2019 08:39, Gilad Ben-Yossef wrote:
> Hi,
> 
> 
> On Thu, Oct 17, 2019 at 3:26 PM Tero Kristo <t-kristo@ti.com> wrote:
>>
>> Currently crypto_wait_req waits indefinitely for an async crypto request
>> to complete. This is bad as it can cause for example the crypto test
>> manager to hang without any notification as to why it has happened.
>> Instead of waiting indefinitely, add a 1 second timeout to the call,
>> and provide a warning print if a timeout happens.
> 
> While the incentive is clear and positive, this suggested solution
> creates problems of its own.
> In many (most?) cases where we are waiting here, we are waiting for a
> DMA operation to finish from hardware.
> Exiting while this pending DMA operation is not finished, even with a
> proper error return value, is dangerous because
> unless the calling code takes great care to not release the memory the
> DMA is being done from/to, this can have disastrous effects.
> 
> As Eric has already mentioned, one second might seem like a long time,
> but we don't really know if it is enough.
> 
> How about adding a second API (ig. crypto_wait_req_timeout) which
> supports a calee specified timeout where
> the calle knows how to correctly deal with timeout and port the
> relevant call sites to use this?

Yeah, that would work for me. I guess we could just swap the testmgr to 
use this timeout API, as it is quite clear it should timeout rather than 
wait indefinitely, and afaics, the data buffers it uses are limited 
size. It doesn't really matter for it whether the timeout is 1 second or 
10 seconds, as long as it eventually times out.

-Tero

> 
> Thanks!
> Gilad
> 
> 
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   include/linux/crypto.h | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/crypto.h b/include/linux/crypto.h
>> index 19ea3a371d7b..b8f0e5c3cc0c 100644
>> --- a/include/linux/crypto.h
>> +++ b/include/linux/crypto.h
>> @@ -682,8 +682,15 @@ static inline int crypto_wait_req(int err, struct crypto_wait *wait)
>>          switch (err) {
>>          case -EINPROGRESS:
>>          case -EBUSY:
>> -               wait_for_completion(&wait->completion);
>> +               err = wait_for_completion_timeout(&wait->completion,
>> +                                                 msecs_to_jiffies(1000));
>>                  reinit_completion(&wait->completion);
>> +               if (!err) {
>> +                       pr_err("%s: timeout for %p\n", __func__, wait);
>> +                       err = -ETIMEDOUT;
>> +                       break;
>> +               }
>> +
>>                  err = wait->err;
>>                  break;
>>          };
>> --
>> 2.17.1
>>
>> --
> 
> 
> 
> --
> Gilad Ben-Yossef
> Chief Coffee Drinker
> 
> values of β will give rise to dom!
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
