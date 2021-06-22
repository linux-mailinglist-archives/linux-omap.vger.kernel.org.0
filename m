Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784A63AFD09
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jun 2021 08:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhFVG0I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Jun 2021 02:26:08 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56208 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhFVG0I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Jun 2021 02:26:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15M6Ngw2049717;
        Tue, 22 Jun 2021 01:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624343022;
        bh=16dyKQhx2LAbfWpFqCWteOP+DDKt943mCwSHZR5zwMw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=x+87vCL18em4bUsUjIxqnIjO2vclOGUTYxrxV+lVwk6BF8a6YX2qNUC1X/9waozE7
         JVC+t+d2VtzSFdFLUJwJDvebnAACbnFremHSWMbGjE87Ctd1NGhaKRb5lNc9k/JDjQ
         PGpI7425JTWoCtQ5D9jB7cNQjfH4PZ40lrCYNbYM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15M6NgQk039767
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Jun 2021 01:23:42 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 22
 Jun 2021 01:23:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 22 Jun 2021 01:23:41 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15M6NdKD077534;
        Tue, 22 Jun 2021 01:23:39 -0500
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Jiri Slaby <jirislaby@kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210511151955.28071-1-vigneshr@ti.com>
 <YJ008MjjewRUTn9Z@kroah.com> <YLCCJzkkB4N7LTQS@atomide.com>
 <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
 <0ad948ac-f669-3d6d-5eca-4ca48d47d6a3@siemens.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <56c5d73f-741c-2643-1c79-6dc13ebb05c7@ti.com>
Date:   Tue, 22 Jun 2021 11:53:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0ad948ac-f669-3d6d-5eca-4ca48d47d6a3@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 6/22/21 11:45 AM, Jan Kiszka wrote:
>>> Vignesh, it seems this quirk needs some soc specific flag added to
>>> it maybe? Or maybe UART_OMAP_RX_LVL register is not available for
>>> all the SoCs?
>>>
>> Yes indeed :(
>>
>>> I think it's best to drop this patch until the issues are resolved,
>>> also there are some open comments above that might be answered by
>>> limiting this quirk to a specific range of SoCs :)
>>>
>> Oops, I did test patch AM33xx assuming its equivalent to OMAP3, but UART
>> IP is quite different. I will respin the patch making sure, workaround
>> applies only to AM65x and K3 SoCs.
>>
>> Regards
>> Vignesh
>>
> What's the status here for AM65x? The issue remains present on that
> platform, and I was hoping to see a quick follow up that limit the fix
> to that target.
> 

Sorry for the delay, I am trying to find which other TI SoCs are
affected by this issue. But that exercise will need a bit more time.
Will send a fix to address K3 SoCs like AM65x today/tomo.
