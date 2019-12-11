Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F0811A601
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 09:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbfLKIk4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 03:40:56 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41084 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbfLKIk4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Dec 2019 03:40:56 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBB8en7o066228;
        Wed, 11 Dec 2019 02:40:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576053650;
        bh=pBoeGCHeaiFm8SNcIST3pL/LRed8VCmEAOuxI8nJaio=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wFgNfZwjvlgKjyReSccQvD22q7DGvtQVZOXspYBixZOHv2yZ7S+2VlgyFiAZSVn6i
         sK7B9z1LgDcMs1oDqw5sJakVPg/2dt8EnWpG0VFez++4A7BS+pXGzy8cCRcfnvB8WC
         U0yi2AEFaeZ5m1E/4r8uZNyqZjd1LtCi5JBlRsSo=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBB8entY055124
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 02:40:49 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 02:40:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 02:40:49 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBB8elIl084411;
        Wed, 11 Dec 2019 02:40:47 -0600
Subject: Re: [PATCHv2 00/22] crypto: omap-sham: fixes towards 5.5
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     <davem@davemloft.net>, <linux-crypto@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <ard.biesheuvel@kernel.org>
References: <20191105140111.20285-1-t-kristo@ti.com>
 <ed703784-a035-fda2-51f6-869daf3cacbd@ti.com>
 <20191211081201.xry3awnqtc7i6rhh@gondor.apana.org.au>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <be793ae9-ff5d-6d66-78cd-9c13cc0e11e4@ti.com>
Date:   Wed, 11 Dec 2019 10:40:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211081201.xry3awnqtc7i6rhh@gondor.apana.org.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/12/2019 10:12, Herbert Xu wrote:
> On Wed, Dec 11, 2019 at 10:06:41AM +0200, Tero Kristo wrote:
>>
>> Herbert, are you planning to pick these for 5.6? These apply cleanly on top
>> of 5.5-rc1.
> 
> Sorry, I had dropped them because I thought they depended on the
> crypto_wait_req patch.  I see now that there is no dependency.
> 
> I'll add them to this week's batch.

Ok thanks, just remember to drop patch #9 out of it.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
