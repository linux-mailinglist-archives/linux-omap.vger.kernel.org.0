Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC53FFD73D
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2019 08:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfKOHpF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Nov 2019 02:45:05 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49766 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfKOHpF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Nov 2019 02:45:05 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAF7iuit025070;
        Fri, 15 Nov 2019 01:44:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573803896;
        bh=Xs1on+SjeBN8n1kpYUhiw2Uk25z/evS/GUTsBoExlSw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tUToV5CjxEooDYWgx5o5oBFnIEDe4UJlnwTFpFZ0l+/yRxG2odQxCq9YH7MJ9VJJg
         DoXRburAUpfDPJ2Y7Wjd/JaBJwWBChj5YVpJkap0uoAyimlGvy4HFmtuc0XJrnsJyQ
         0h/Yuttu0iL9kYbhIl1/ZuO5WnVPUvQrcJ2ZPRKw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAF7iu4h094894
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Nov 2019 01:44:56 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 15
 Nov 2019 01:44:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 15 Nov 2019 01:44:54 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAF7iq2T021849;
        Fri, 15 Nov 2019 01:44:52 -0600
Subject: Re: [PATCHv2 09/22] crypto: add timeout to crypto_wait_req
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     <davem@davemloft.net>, <linux-crypto@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>
References: <20191105140111.20285-1-t-kristo@ti.com>
 <20191105140111.20285-10-t-kristo@ti.com>
 <20191115052918.htafn2sch3a6aizv@gondor.apana.org.au>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <28db6fc9-fa0d-0914-f0e9-9cba53ac16ad@ti.com>
Date:   Fri, 15 Nov 2019 09:44:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115052918.htafn2sch3a6aizv@gondor.apana.org.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 15/11/2019 07:29, Herbert Xu wrote:
> On Tue, Nov 05, 2019 at 04:00:58PM +0200, Tero Kristo wrote:
>> Currently crypto_wait_req waits indefinitely for an async crypto request
>> to complete. This is bad as it can cause for example the crypto test
>> manager to hang without any notification as to why it has happened.
>> Instead of waiting indefinitely, add a 1 second timeout to the call,
>> and provide a warning print if a timeout happens.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   include/linux/crypto.h | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> As we discussed before this patch is not acceptable because it
> would cause a use-after-free.

Yep, its fine to ditch this one as it was provided as just a nice to 
have initially anyway. Any comments for the rest of the series?

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
