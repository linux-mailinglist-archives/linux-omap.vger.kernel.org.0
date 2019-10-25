Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 491B4E4A85
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2019 13:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502326AbfJYLzh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Oct 2019 07:55:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44090 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502070AbfJYLzh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Oct 2019 07:55:37 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9PBtQ3S019460;
        Fri, 25 Oct 2019 06:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572004526;
        bh=w7PcGbf6994Hli+aicUlkHLcbVXuDCTYiznCHP3HRMc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wW7QIsiiYyfcVdcC/Xrfdxbc6XJ/+/kbxq7Nz7Xuf4TlM6OdNnGUYCOup8gzDPUiv
         JAJo+Lg6AvcjqOsnYD9HK/2PNCy3esMhbaVIZh1G4NImJi/5c9aiYyzJ6MFvQOzN+Y
         IinV3AwsYp+CZOY4BHrgvLMstejXfFHe1DxSObu0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9PBtQ2j063147;
        Fri, 25 Oct 2019 06:55:26 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 25
 Oct 2019 06:55:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 25 Oct 2019 06:55:15 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9PBtNol086649;
        Fri, 25 Oct 2019 06:55:24 -0500
Subject: Re: [PATCH 00/10] crypto: omap fixes towards 5.5
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
CC:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20191017122549.4634-1-t-kristo@ti.com>
 <CAKv+Gu_HNOTSvWRTzLMeECaM8qCi5w806ht_e68e5vgcU9aQvQ@mail.gmail.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <8f97d690-a88a-55cb-eb67-206e01873d94@ti.com>
Date:   Fri, 25 Oct 2019 14:55:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_HNOTSvWRTzLMeECaM8qCi5w806ht_e68e5vgcU9aQvQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/10/2019 14:33, Ard Biesheuvel wrote:
> On Thu, 17 Oct 2019 at 14:26, Tero Kristo <t-kristo@ti.com> wrote:
>>
>> Hi,
>>
>> This series fixes a number of bugs with omap crypto implementation.
>> These have become evident with the changes to the cryptomanager, where
>> it adds some new test cases and modifies some existing, namely the split
>> update tests. Also, while fixing the cryptomanager induced bugs, some
>> other surfaced with tcrypt/IPSec tests, so fixed them aswell.
>>
>> Patch #9 is against crypto core modifying the crypto_wait_req
>> common API to have a timeout for it also, currently it waits forever
>> and it is kind of difficult to see what test fails with crypto manager.
>> This is not really needed for anything, but it is kind of nice to have
>> (makes debugging easier.)
>>
>> This series has been tested on top of 5.4-rc2, with following setups,
>> on AM57xx-beagle-x15 board:
>>
>> - crypto manager self tests
>> - tcrypt performance test
>> - ipsec test with strongswan
>>
>> This series depends on the skcipher API switch patch from Ard Biesheuvel
>> [1].
>>
> 
> Hi Tero,
> 
> On my BeagleBone White, I am hitting the following issues after
> applying these patches:
> 
> [    7.493903] alg: skcipher: ecb-aes-omap encryption unexpectedly
> succeeded on test vector "random: len=531 klen=32";
> expected_error=-22, cfg="random: inplace may_sleep use_finup
> src_divs=[44.72%@+4028, <flush>14.70%@alignmask+3, 19.45%@+4070,
> 21.13%@+2728]"
> [    7.651103] alg: skcipher: cbc-aes-omap encryption unexpectedly
> succeeded on test vector "random: len=1118 klen=32";
> expected_error=-22, cfg="random: may_sleep use_final
> src_divs=[<reimport>41.87%@+31, <flush>58.13%@+2510]"
> 
> These are simply a result of the ECB and CBC implementations not
> returning -EINVAL when the input is not a multiple of the block size.
> 
> [    7.845527] alg: skcipher: blocksize for ctr-aes-omap (16) doesn't
> match generic impl (1)
> 
> This means cra_blocksize is not set to 1 as it should. If your driver
> uses the skcipher walk API, it should set the walksize to
> AES_BLOCK_SIZE to ensure that the input is handled correctly. If you
> don't, then you can disregard that part.
> 
> [    8.306491] alg: aead: gcm-aes-omap setauthsize unexpectedly
> succeeded on test vector "random: alen=3 plen=31 authsize=6 klen=9";
> expected_error=-22
> 
> Another missing sanity check. GCM only permits certain authsizes.
> 
> [    9.074703] omap_crypto_copy_sgs: Couldn't allocate pages for
> unaligned cases.
> 
> This is not a bug, but I'm not sure if the below is related or not.
> 
> I'll preserve the binaries, in case you need me to objdump anything.

What are these tests you are executing? For me, the testmgr self test 
suite is passing just fine. Any extra tests you have enabled somehow?

I am also running full test on different board though (am57xx), I 
haven't been explicitly running anything on am335x.

-Tero


--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
