Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA50AA596
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2019 16:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732082AbfIEORW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 10:17:22 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58040 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfIEORW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Sep 2019 10:17:22 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x85EHF6q066539;
        Thu, 5 Sep 2019 09:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567693035;
        bh=ub+LpZSR2SqSnDTZYERv7a6nXgZCl/QfTXbE8sjKO10=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jkRJNor/c//NIjSOu2F8t0GecbA3rmd/dTZM1I1uP2YjUNdtSlFyQGTDRm9uataKz
         xfiha8TFkN8MrbcAr3s8LDQvlhyGJtIzrD+azaihHuMhi4HkdJAb/qCRntw9a9Pq7y
         RiNzAl0LUP90NvcSOwe8j9ck78Ybh+3+QPEydLsA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x85EHF1r089155;
        Thu, 5 Sep 2019 09:17:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 5 Sep
 2019 09:17:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 5 Sep 2019 09:17:13 -0500
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x85EH9Sc113593;
        Thu, 5 Sep 2019 09:17:10 -0500
Subject: Re: [PATCH] bus: ti-sysc: Fix clock handling for no-idle quirks
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20190905140337.19373-1-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <49ce192d-697b-48e2-2b18-47acb370739b@ti.com>
Date:   Thu, 5 Sep 2019 17:17:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905140337.19373-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 05/09/2019 17:03, Tony Lindgren wrote:
> NFSroot can fail on dra7 when cpsw is probed using ti-sysc interconnect
> target module driver as reported by Keerthy.
> 
> Device clocks and the interconnect target module may or may not be
> enabled by the bootloader on init, but we currently assume the clocks
> and module are on from the bootloader for "ti,no-idle" and
> "ti,no-idle-on-init" quirks as reported by Grygorii Strashko.
> 
> Let's fix the issue by always enabling clocks init, and
> never disable them for "ti,no-idle" quirk. For "ti,no-idle-on-init"
> quirk, we must decrement the usage count later on to allow PM
> runtime to idle the module if requested.
> 
> Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during init to read revision")
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Reported-by: Keerthy <j-keerthy@ti.com>
> Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/bus/ti-sysc.c | 48 +++++++++++++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 11 deletions(-)
> 

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Thank you, Tony.

-- 
Best regards,
grygorii
