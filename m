Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493D5393CFD
	for <lists+linux-omap@lfdr.de>; Fri, 28 May 2021 08:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235513AbhE1GN0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 May 2021 02:13:26 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40334 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235714AbhE1GNX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 May 2021 02:13:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14S6BfaD098715;
        Fri, 28 May 2021 01:11:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622182301;
        bh=ZPNt70vGnHpxcw1dROUYgn0d1ja4wBQquthubECy0dY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=G/LfpDB3ltUyIYYInJyNPNIWH/HgiM/sp/vKaOkGq4ObByVu7g9ZTDPoudru29jXG
         FVzQqZihcG2d8sFGfkZ9mXoSJ36McCw+vB00hB1wajUp22xhH4TODAEmrofwUac1NR
         UW1e9Zw/2Ert/AbsnKFIFA9qHyNkUslu/mduAvm4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14S6BfET037027
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 May 2021 01:11:41 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 01:11:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 28 May 2021 01:11:40 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14S6Bb8E120489;
        Fri, 28 May 2021 01:11:38 -0500
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
To:     Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Jiri Slaby <jirislaby@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <linux-serial@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210511151955.28071-1-vigneshr@ti.com>
 <YJ008MjjewRUTn9Z@kroah.com> <YLCCJzkkB4N7LTQS@atomide.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
Date:   Fri, 28 May 2021 11:41:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YLCCJzkkB4N7LTQS@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 5/28/21 11:09 AM, Tony Lindgren wrote:
> Hi Greg, Vignesh & Jan,
> 
> * Greg Kroah-Hartman <gregkh@linuxfoundation.org> [210513 14:17]:
>> On Tue, May 11, 2021 at 08:49:55PM +0530, Vignesh Raghavendra wrote:
>>> It is possible that RX TIMEOUT is signalled after RX FIFO has been
>>> drained, in which case a dummy read of RX FIFO is required to clear RX
>>> TIMEOUT condition. Otherwise, RX TIMEOUT condition is not cleared
>>> leading to an interrupt storm
>>>
>>> Cc: stable@vger.kernel.org
>>
>> How far back does this need to go?  What commit id does this fix?  What
>> caused this to just show up now vs. previously?

Sorry, I missed this reply. Issue was reported on AM65x SoC with custom
test case from Jan Kiszka that stressed UART with rapid baudrate changes
from 9600 to 4M along with data transfer.

Based on the condition that led to interrupt storm, I inferred it to
affect all SoCs with 8250 OMAP UARTs. But that seems thats not the best
idea as seen from OMAP3 regression.

Greg,

Could you please drop the patch? Very sorry for the inconvenience..

> 
> I just noticed this causes the following regression in Linux next when
> pressing a key on uart console after boot at least on omap3. This seems
> to happen on serial_port_in(port, UART_RX) in the quirk handling.
> 
> Vignesh, it seems this quirk needs some soc specific flag added to
> it maybe? Or maybe UART_OMAP_RX_LVL register is not available for
> all the SoCs?
> 

Yes indeed :(

> I think it's best to drop this patch until the issues are resolved,
> also there are some open comments above that might be answered by
> limiting this quirk to a specific range of SoCs :)
> 

Oops, I did test patch AM33xx assuming its equivalent to OMAP3, but UART
IP is quite different. I will respin the patch making sure, workaround
applies only to AM65x and K3 SoCs.

Regards
Vignesh
