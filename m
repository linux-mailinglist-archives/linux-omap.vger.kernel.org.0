Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8FDD310BB5
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 14:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBENUU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 08:20:20 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35906 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhBENRC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Feb 2021 08:17:02 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115DF1YD096948;
        Fri, 5 Feb 2021 07:15:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612530901;
        bh=GNcw8k0dfEBZTgTsrzpXl0t8YB0oVkDzbvtyH9eAguo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IEs0yOnlyyl2U+m6WIhvmROtIwG8KhWEO8xAwWVurmJkzYqpq1qfcMnzH/1jrJyQd
         KDWohB2AGJELzkZCGVvzwYwp7MXBJB356lcREHp6mgVfm+dbf/PYoNRnfTZzDtjFLF
         ptgrrbrbzMosZaggeQSkeV/xcBa+4JJxuoWINSxM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115DF1Ur116294
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 5 Feb 2021 07:15:01 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 07:15:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 07:15:00 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115DExLL123408;
        Fri, 5 Feb 2021 07:14:59 -0600
Subject: Re: [PATCH 2/2] ARM: omap2plus_defconfig: Update for dropped options.
To:     Tony Lindgren <tony@atomide.com>, Ivan Jelincic <parazyd@dyne.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210203113426.18964-1-parazyd@dyne.org>
 <20210203113426.18964-2-parazyd@dyne.org> <YBuankYwwMsG4MN9@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <4b32f566-92ad-3c49-0453-b44df23f1384@ti.com>
Date:   Fri, 5 Feb 2021 15:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YBuankYwwMsG4MN9@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 04/02/2021 08:56, Tony Lindgren wrote:
> * Ivan Jelincic <parazyd@dyne.org> [210203 13:35]:
>> Update omap2plus_defconfig for options that have been dropped:
>>
>> - SIMPLE_PM_BUS no longer selected.
> 
> Oh right, we now need to always select it. Will queue this for
> fixes after the merge window. The other one I'll be queueing
> for v5.13 as the merge window is about to open and I'll only
> queue fixes for the next few weeks :)

"- MICREL_PHY no longer selected."

I do not agree with above as MICREL_PHY is selected by KS8851, but on many boards there is no
explicit dependency from KS8851, but MICREL PHYs are in use.
So, I'd prefer to have it enabled explicitly in omap2plus_defconfig.

And not sure what exactly "no longer selected" means.

-- 
Best regards,
grygorii
