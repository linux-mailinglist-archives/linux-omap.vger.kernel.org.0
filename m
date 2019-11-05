Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4D3EFECB
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 14:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389172AbfKENig (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 08:38:36 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41100 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387985AbfKENif (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 08:38:35 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5DcUBl065545;
        Tue, 5 Nov 2019 07:38:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572961110;
        bh=lA7bY50Xonv7BFsXz455gWjHJ9jGvocAFKgz9ZJTST8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sO2ZulkwunH5nLezG4qoh4pgPAB9jLXB1a94afwNuTbqe/7ekocFG83KKTu9TnSbn
         nvavd2GsRrs8mCCcuAzg/PnEgBOUKy+onX0sSL4ncKt/21wR8GyjCyoSKjT+L+o6Pe
         zzssNzvlSo5U5FR9KeKh0qVWiZfH1uIzxGTp4/is=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5DcUIw049847;
        Tue, 5 Nov 2019 07:38:30 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 07:38:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 5 Nov 2019 07:38:30 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5DcSmC027436;
        Tue, 5 Nov 2019 07:38:28 -0600
Subject: Re: [PATCH 0/6] crypto: additional fixes for omap-aes
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     Ard Biesheuvel <ardb@kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20191026145259.16040-1-ardb@kernel.org>
 <b8743ccb-2e3a-6d50-017c-48af6d3fa846@ti.com>
 <20191105132051.smkx32ix3465b5bq@gondor.apana.org.au>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <64dcbcfe-b4ef-9055-e573-c5de9ffc34b1@ti.com>
Date:   Tue, 5 Nov 2019 15:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105132051.smkx32ix3465b5bq@gondor.apana.org.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/11/2019 15:20, Herbert Xu wrote:
> On Tue, Nov 05, 2019 at 02:19:54PM +0200, Tero Kristo wrote:
>> On 26/10/2019 17:52, Ard Biesheuvel wrote:
>>> This series applies onto Tero's series [0], and addresses a number of
>>> additional issues that exist in the omap-aes driver that aren't being
>>> addresses by Tero's fixes.
>>>
>>> Note that the resulting code is still not 100% correct: an issue remains
>>> where inputs into GCM consisting solely of assocdata are not being processed
>>> correctly, e.g.,
>>>
>>> alg: aead: gcm-aes-omap encryption test failed (wrong result) on test vector
>>>     "random: alen=38 plen=0 authsize=16 klen=32",
>>>      cfg="random: inplace may_sleep use_digest src_divs=[100.0%@+19] iv_offset=31"
>>>
>>> I have no idea how to fix this, so I'll leave this to people that know this
>>> hardware and have access to the Sitara TRM.
>>>
>>> Note that I also spotted some issues in the SHAM driver, i.e.,
>>>
>>> alg: ahash: omap-sha1 test failed (wrong result) on test vector
>>>     "random: psize=7928 ksize=0", cfg="random: inplace use_final
>>>         src_divs=[5.64%@+13, 59.70%@+18, <flush>31.53%@+4072,
>>>         <flush,nosimd>3.13%@alignmask+263]"
>>> alg: ahash: omap-hmac-sha256 test failed (wrong result) on test vector
>>>     "random: psize=960 ksize=37", cfg="random: inplace use_final
>>>         src_divs=[32.54%@+2449, 17.18%@+4, <flush>50.28%@+1] iv_offset=31"
>>>
>>> All of these failures are triggered by CONFIG_CRYPTO_MANAGER_EXTRA_TESTS,
>>> so they will not show up when using the standard set of test vectors.
>>>
>>> [0] https://lore.kernel.org/linux-crypto/20191017122549.4634-1-t-kristo@ti.com/
>>>
>>> Cc: linux-omap@vger.kernel.org
>>> Cc: Tero Kristo <t-kristo@ti.com>
>>
>> For the whole series:
>>
>> Reviewed-by: Tero Kristo <t-kristo@ti.com>
>> Tested-by: Tero Kristo <t-kristo@ti.com>
> 
> Actually I've lost track of both of your patch series.  Please
> repost both in the correct order for merging.

Yeah, I was kinda expecting this. :)

Will repost all as single series.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
