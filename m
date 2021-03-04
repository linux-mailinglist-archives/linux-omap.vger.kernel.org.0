Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CE732DB7E
	for <lists+linux-omap@lfdr.de>; Thu,  4 Mar 2021 21:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbhCDU51 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Mar 2021 15:57:27 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42618 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbhCDU5N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Mar 2021 15:57:13 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 124Ku0we019009;
        Thu, 4 Mar 2021 14:56:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1614891360;
        bh=KQoevqNLdq6Vcqe7xjay1VRDOuM0RiWmMq8okhEq7ic=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fgb3unhSTrmmj9vU82YIe5gyRn1s4ROHL06A7F8wBnz4lc81erEHp5foT8ybuC3HM
         zTAn1Irg0HB8YInd71KpwuDfCgiRycEoLyPOzjjKqF62oy5Y9czpZWJ37x9ornf3e/
         I4NENCXn1IFyO8RyKHSJxcsUndxnixe9400ykAAg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 124Ku0Dm009620
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Mar 2021 14:56:00 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 4 Mar
 2021 14:55:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 4 Mar 2021 14:55:59 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 124KtvkN009698;
        Thu, 4 Mar 2021 14:55:58 -0600
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-ti-dm: Remove extra
 of_node_put()
To:     Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     Keerthy <j-keerthy@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210304072135.52712-1-tony@atomide.com>
 <20210304072135.52712-3-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <4c23ce3e-3304-b10d-5054-f421822b5dc2@ti.com>
Date:   Thu, 4 Mar 2021 22:55:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304072135.52712-3-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 04/03/2021 09:21, Tony Lindgren wrote:
> We have of_translate_address() already do of_node_put() as needed.
> I probably looked at __of_translate_address() earlier by accident
> that of_translate_address() uses.

I do not see of_node_put() in of_translate_address() and
  __of_translate_address() is doing of_node_get(dev);
?

> 
> Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/clocksource/timer-ti-dm-systimer.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
> --- a/drivers/clocksource/timer-ti-dm-systimer.c
> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> @@ -265,7 +265,6 @@ static void __init dmtimer_systimer_assign_alwon(void)
>   				    pa == 0x48318000)
>   					continue;
>   
> -				of_node_put(np);
>   				break;
>   			}
>   		}
> @@ -300,7 +299,6 @@ static u32 __init dmtimer_systimer_find_first_available(void)
>   				continue;
>   			}
>   
> -			of_node_put(np);
>   			break;
>   		}
>   	}
> 

-- 
Best regards,
grygorii
