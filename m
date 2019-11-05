Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE11EFEBA
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 14:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389125AbfKENhC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 08:37:02 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41886 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388313AbfKENhC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Nov 2019 08:37:02 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5Dat7S037161;
        Tue, 5 Nov 2019 07:36:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572961015;
        bh=bmJI1YM54I+SbgNgZ7uMa4lwnT5Bv3GUxE1zgdBOA3A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ItmhsLOSozRphAIn+mc4OHHVCdcwaCMAaNNJxcJq/AbiNosDkWZnKaQrbPEwb5bbZ
         obIg6/HJmdHgsxHG9Cm8IyW7PHKHuBp7i4VEefZNjKFpQQgaK9O1Fd+sepWwb/gOtm
         K8mPGXLJEvw99DhF39kezBIv2rOvbb9njfJm927Q=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5DatEl023423
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 07:36:55 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 5 Nov
 2019 07:36:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 07:36:40 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5DarP1024137;
        Tue, 5 Nov 2019 07:36:53 -0600
Subject: Re: [PATCH 0/6] crypto: omap: fix extra tests with crypto manager
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     <davem@davemloft.net>, <linux-crypto@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
References: <20191105123759.25053-1-t-kristo@ti.com>
 <20191105132129.p2xykf53ni3lbf4t@gondor.apana.org.au>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <08b17d78-7d05-835d-e501-1dca3ce4a344@ti.com>
Date:   Tue, 5 Nov 2019 15:36:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105132129.p2xykf53ni3lbf4t@gondor.apana.org.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/11/2019 15:21, Herbert Xu wrote:
> On Tue, Nov 05, 2019 at 02:37:53PM +0200, Tero Kristo wrote:
>> Hi,
>>
>> This series applies on top of [1] and [2] to fix the remaining crypto
>> manager extra test failures.
>>
>> Tested with crypto manager self tests, tcrypto, and an ipsec test
>> with strongswan.
>>
>> -Tero
>>
>> [1] https://patchwork.kernel.org/cover/11195515/
>> [2] https://patchwork.kernel.org/cover/11213525/
> 
> Please merge all three patch series into one and repost.

Ok, will do that.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
