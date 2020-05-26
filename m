Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A541E22C6
	for <lists+linux-omap@lfdr.de>; Tue, 26 May 2020 15:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbgEZNLq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 09:11:46 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47634 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgEZNLq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 May 2020 09:11:46 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QDBeKi005982;
        Tue, 26 May 2020 08:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590498700;
        bh=JqOubeKK6wSULSZQlLqXbBsppFmdTk0e4/K1dkdXo6s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eoYtn5NYNWXWqZAHfiHfDGNOzipMHE1VIwVzQIKTLe/n46EcPKNCshakA9ujECIHX
         vx7drYQ6myfzA0n7My3AoCLhUYQ04K6wgmlSoI67rSC8G+rk5jno2AovkJE7XiJBED
         tLZx2CCdkqm1ui3AjE0KU3ENHXfPLubruQUqcPTU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QDBeBj078347;
        Tue, 26 May 2020 08:11:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 08:11:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 08:11:39 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QDBaXE034511;
        Tue, 26 May 2020 08:11:38 -0500
Subject: Re: [PATCHv2 3/7] crypto: omap-crypto: fix userspace copied buffer
 access
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     <davem@davemloft.net>, <linux-crypto@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, Tejun Heo <tj@kernel.org>
References: <20200511111913.26541-1-t-kristo@ti.com>
 <20200511111913.26541-4-t-kristo@ti.com>
 <20200522131247.GA27255@gondor.apana.org.au>
 <24092385-1348-f55d-a637-6fb2b3129f4e@ti.com>
 <20200526123552.GA10897@gondor.apana.org.au>
 <7fece128-ea82-06cb-23d3-d49c9f10c4a0@ti.com>
 <20200526130743.GA13801@gondor.apana.org.au>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <77c2be7c-061c-1d54-c65e-e27b18b66bbb@ti.com>
Date:   Tue, 26 May 2020 16:11:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200526130743.GA13801@gondor.apana.org.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 26/05/2020 16:07, Herbert Xu wrote:
> On Tue, May 26, 2020 at 03:57:10PM +0300, Tero Kristo wrote:
>>
>> Btw, any word on the TI sa2ul series I posted a while back? I see it has
>> been marked as deferred in patchwork but I am not quite sure what that
>> means... deferred until what? I have also been thinking of creating a
>> drivers/crypto/ti subdir at some point, as there are quite a few files for
>> TI accelerators already.
> 
> IIRC it was missing an ack from Rob Herring, unless you want me to
> only apply the bits under drivers/crypto?

Right, its missing ack from Rob still so need to wait for that. Was 
wondering if you had any comments on the actual patches themselves.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
