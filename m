Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0BEE212BCB
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 20:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgGBSAh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 14:00:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49494 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbgGBSAh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jul 2020 14:00:37 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 062I0VdR040880;
        Thu, 2 Jul 2020 13:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593712831;
        bh=KVA7MrVhpmMXCpDVx4rR2az6AzBpgSyFeYfBTQT81zQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=FiUwjzZf7VIuXWa+kQW3jqt4+eDzaYkfulpF4BMmyEYoteqeH6CijEKebmVDzw/TA
         +sSImz4aAUR9puwd/3kIFyHJBZIHoa6ofjYMjbK4x7KRZwTRVho3Uzq0nhtVd1/01w
         bzNgUsrtDd7yp2YsSp8c5h68gFNCjSTVCnHGUMtw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 062I0VEw107430
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jul 2020 13:00:31 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 2 Jul
 2020 13:00:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 2 Jul 2020 13:00:30 -0500
Received: from [10.250.48.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 062I0Ujt078494;
        Thu, 2 Jul 2020 13:00:30 -0500
Subject: Re: [PATCH 1/2] bus: ti-sysc: Fix wakeirq sleeping function called
 from invalid context
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200702174929.26506-1-tony@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <434eff2e-bc7f-84ee-0980-769915cefffb@ti.com>
Date:   Thu, 2 Jul 2020 13:00:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200702174929.26506-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 7/2/20 12:49 PM, Tony Lindgren wrote:
> With CONFIG_DEBUG_ATOMIC_SLEEP enabled we can see the following with
> wakeirqs and serial console idled:

Which devices are these? I have one patch from Tero fixing similar 
errors in OMAP IOMMU driver. Will post that either today or tomorrow.

regards
Suman

> 
> BUG: sleeping function called from invalid context at drivers/bus/ti-sysc.c:242
> ...
> (sysc_wait_softreset) from [<c0606894>] (sysc_enable_module+0x48/0x274)
> (sysc_enable_module) from [<c0606c5c>] (sysc_runtime_resume+0x19c/0x1d8)
> (sysc_runtime_resume) from [<c0606cf0>] (sysc_child_runtime_resume+0x58/0x84)
> (sysc_child_runtime_resume) from [<c06eb7bc>] (__rpm_callback+0x30/0x12c)
> (__rpm_callback) from [<c06eb8d8>] (rpm_callback+0x20/0x80)
> (rpm_callback) from [<c06eb434>] (rpm_resume+0x638/0x7fc)
> (rpm_resume) from [<c06eb658>] (__pm_runtime_resume+0x60/0x9c)
> (__pm_runtime_resume) from [<c06edc08>] (handle_threaded_wake_irq+0x24/0x60)
> (handle_threaded_wake_irq) from [<c01befec>] (irq_thread_fn+0x1c/0x78)
> (irq_thread_fn) from [<c01bf30c>] (irq_thread+0x140/0x26c)
> 
> We have __pm_runtime_resume() call the sysc_runtime_resume() with spinlock
> held and interrupts disabled.
> 
> Fixes: d46f9fbec719 ("bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/bus/ti-sysc.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -236,15 +236,14 @@ static int sysc_wait_softreset(struct sysc *ddata)
>   		syss_done = ddata->cfg.syss_mask;
>   
>   	if (syss_offset >= 0) {
> -		error = readx_poll_timeout(sysc_read_sysstatus, ddata, rstval,
> -					   (rstval & ddata->cfg.syss_mask) ==
> -					   syss_done,
> -					   100, MAX_MODULE_SOFTRESET_WAIT);
> +		error = readx_poll_timeout_atomic(sysc_read_sysstatus, ddata,
> +				rstval, (rstval & ddata->cfg.syss_mask) ==
> +				syss_done, 100, MAX_MODULE_SOFTRESET_WAIT);
>   
>   	} else if (ddata->cfg.quirks & SYSC_QUIRK_RESET_STATUS) {
> -		error = readx_poll_timeout(sysc_read_sysconfig, ddata, rstval,
> -					   !(rstval & sysc_mask),
> -					   100, MAX_MODULE_SOFTRESET_WAIT);
> +		error = readx_poll_timeout_atomic(sysc_read_sysconfig, ddata,
> +				rstval, !(rstval & sysc_mask),
> +				100, MAX_MODULE_SOFTRESET_WAIT);
>   	}
>   
>   	return error;
> 

