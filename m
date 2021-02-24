Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFD03238F5
	for <lists+linux-omap@lfdr.de>; Wed, 24 Feb 2021 09:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbhBXIsS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Feb 2021 03:48:18 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:45495 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbhBXIrW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Feb 2021 03:47:22 -0500
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net ([80.193.200.194] helo=[192.168.0.210])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lEpoa-0002NZ-1G; Wed, 24 Feb 2021 08:46:36 +0000
Subject: Re: [PATCH] memory: gpmc: fix out of bounds read and dereference on
 gpmc_cs[]
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210223193821.17232-1-colin.king@canonical.com>
 <20210224075552.GS2087@kadam>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <eba7420b-80e3-6f4d-7f19-06b068bc5977@canonical.com>
Date:   Wed, 24 Feb 2021 08:46:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224075552.GS2087@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24/02/2021 07:55, Dan Carpenter wrote:
> On Tue, Feb 23, 2021 at 07:38:21PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the array gpmc_cs is indexed by cs before it cs is range checked
>> and the pointer read from this out-of-index read is dereferenced. Fix this
>> by performing the range check on cs before the read and the following
>> pointer dereference.
>>
>> Addresses-Coverity: ("Negative array index read")
>> Fixes: 186401937927 ("memory: gpmc: Move omap gpmc code to live under drivers")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/memory/omap-gpmc.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
>> index cfa730cfd145..f80c2ea39ca4 100644
>> --- a/drivers/memory/omap-gpmc.c
>> +++ b/drivers/memory/omap-gpmc.c
>> @@ -1009,8 +1009,8 @@ EXPORT_SYMBOL(gpmc_cs_request);
>>  
>>  void gpmc_cs_free(int cs)
>>  {
>> -	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
>> -	struct resource *res = &gpmc->mem;
> > There is no actual dereferencing going on here, it just taking the
> addresses.  But the patch is also harmless and improves readability.

Plus compilers are getting smarter with static analysis so some day in
the future they will warn about this.


> 
> regards,
> dan carpenter
> 

