Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030EB3C6CB5
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jul 2021 10:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbhGMI5X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Jul 2021 04:57:23 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43876 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234599AbhGMI5X (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Jul 2021 04:57:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16D8sMRh020569;
        Tue, 13 Jul 2021 03:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1626166462;
        bh=VdegMj0ebwhk+tdoHioq3OJiHwcoi55JYHegIa/B9Ao=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BSzKhFmzc3zBjcRF5UvE/hgTvawI4K0ES2gKNcRkMPVTGZVjcv/jIAODFe3sC4HJZ
         UBcDi2if8Bvu1GNPePFMwvUWR23pz++c9IZEQEaFJUU4VOKMI2+LN5BJ1YsEUiZTEa
         Ernnn9JCaB7Cgs6ZyU0Hczwm6cACj94SoiPASV88=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16D8sMC9018419
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 13 Jul 2021 03:54:22 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 03:54:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 03:54:22 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16D8sJWf050564;
        Tue, 13 Jul 2021 03:54:19 -0500
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
To:     <linux-serial@vger.kernel.org>
CC:     Jan Kiszka <jan.kiszka@siemens.com>,
        Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210511151955.28071-1-vigneshr@ti.com>
 <YJ008MjjewRUTn9Z@kroah.com> <YLCCJzkkB4N7LTQS@atomide.com>
 <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
 <0ad948ac-f669-3d6d-5eca-4ca48d47d6a3@siemens.com>
 <56c5d73f-741c-2643-1c79-6dc13ebb05c7@ti.com>
 <YOylnHudkwcHHEeZ@surfacebook.localdomain>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <0ae7e313-1ed7-f1be-e8a7-edd1286277a5@ti.com>
Date:   Tue, 13 Jul 2021 14:24:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOylnHudkwcHHEeZ@surfacebook.localdomain>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 7/13/21 1:57 AM, andy@surfacebook.localdomain wrote:
> Tue, Jun 22, 2021 at 11:53:38AM +0530, Vignesh Raghavendra kirjoitti:
>> On 6/22/21 11:45 AM, Jan Kiszka wrote:
>>>>> Vignesh, it seems this quirk needs some soc specific flag added to
>>>>> it maybe? Or maybe UART_OMAP_RX_LVL register is not available for
>>>>> all the SoCs?
>>>>>
>>>> Yes indeed :(
>>>>
>>>>> I think it's best to drop this patch until the issues are resolved,
>>>>> also there are some open comments above that might be answered by
>>>>> limiting this quirk to a specific range of SoCs :)
>>>>>
>>>> Oops, I did test patch AM33xx assuming its equivalent to OMAP3, but UART
>>>> IP is quite different. I will respin the patch making sure, workaround
>>>> applies only to AM65x and K3 SoCs.
>>>>
>>>> Regards
>>>> Vignesh
>>>>
>>> What's the status here for AM65x? The issue remains present on that
>>> platform, and I was hoping to see a quick follow up that limit the fix
>>> to that target.
>>
>> Sorry for the delay, I am trying to find which other TI SoCs are
>> affected by this issue. But that exercise will need a bit more time.
>> Will send a fix to address K3 SoCs like AM65x today/tomo.
> 
> This all reminds me the very similar issue one found on Intel integrated
> (Synopsys DesignWare based) UARTs:
> 

Hmm, yes, seems like common problem with some 8250 UARTs although not
all TI SoCs show this behavior even though they all claim 8250 compatible.

> https://lore.kernel.org/linux-serial/20170206233000.3021-1-dianders@chromium.org/

I am not sure if reading UART_LSR is a good idea in the above patch.
Some flags in LSR register are cleared on read (at least that's the case
for UARTs on TI SoCs) and thus can result in loss of error/FIFO status
information.

> https://lore.kernel.org/linux-serial/1440015124-28393-1-git-send-email-california.l.sullivan@intel.com/
> 

Looks like this never made it.

Given the quirks associated with 8250 UARTs, workarounds would need to
be tied to specific variants, so I don't know if its possible to
implement the fix in 8250 core IRQ handler.

PS: v2 of $patch is already merged.

Regards
Vignesh
