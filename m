Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 066A9F4308
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 10:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbfKHJXI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 04:23:08 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52986 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbfKHJXI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Nov 2019 04:23:08 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA89MrOZ028622;
        Fri, 8 Nov 2019 03:22:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573204973;
        bh=zb4tt7HNgghJpj7aEIDr1k6z/Q2WE2sfSo6030XK974=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=S2emD8s85c4YNwGFBERxXeJ+Dji/fOBWQDiySJ0RwDIY4dpaVqIWrxRdpV1k0G+6Y
         k4rTTqmFd9ete1kHlAEDUlZeCI1zk57JHTlZ+QrmOUqgFhaPjo9etiLg8dYnP0sbKp
         PqUdjYzjCg2zPfXMzzUMZ2S+E7YUmsbeZQqnD4Tk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA89MrXS031001;
        Fri, 8 Nov 2019 03:22:53 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 8 Nov
 2019 03:22:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 8 Nov 2019 03:22:52 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA89MnJ5010398;
        Fri, 8 Nov 2019 03:22:49 -0600
Subject: Re: [PATCH 09/10] crypto: add timeout to crypto_wait_req
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     Gilad Ben-Yossef <gilad@benyossef.com>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20191017122549.4634-1-t-kristo@ti.com>
 <20191017122549.4634-10-t-kristo@ti.com>
 <CAOtvUMeBXjDBhSVgMOW=hshEx_AkNPg-Zk2c2jCDzY8vyXWW5g@mail.gmail.com>
 <076f0bc6-ad04-9543-db02-d7c7060db036@ti.com>
 <CAOtvUMc7pbtPAPUbEmz_MTHmB9LboQVdgG-t9tHCr=biEbFuUQ@mail.gmail.com>
 <20191108022759.GB1140@sol.localdomain>
 <d55c0182-5fb0-2ef9-f056-54b396fb0026@ti.com>
 <20191108091608.i5fxt2vu2nwrybgn@gondor.apana.org.au>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <2ab94492-21e4-fbe0-41eb-e12b02511d7c@ti.com>
Date:   Fri, 8 Nov 2019 11:22:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108091608.i5fxt2vu2nwrybgn@gondor.apana.org.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/11/2019 11:16, Herbert Xu wrote:
> On Fri, Nov 08, 2019 at 09:40:57AM +0200, Tero Kristo wrote:
>>
>> The problem is not detecting a hung task, the problem is determining what
>> caused the hang. Personally I don't care if the system dies if a crypto
>> accelerator self test has failed, as long as I get reported about the exact
>> nature of the failure. The failures are expected to happen only in
>> development phase of a crypto driver.
>>
>> With the timeout patch in place, I get reported what exact crypto test case
>> failed and I can focus my debug efforts on that one.
> 
> If that's all you need then how about just making the wait killable?

Yeah, that would be an alternative.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
