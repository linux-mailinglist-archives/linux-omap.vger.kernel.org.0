Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5633180212
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 16:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgCJPlV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 11:41:21 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46210 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgCJPlV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Mar 2020 11:41:21 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02AFf771071642;
        Tue, 10 Mar 2020 10:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583854867;
        bh=o8p5fgauZyRiTn5E7k0GtjXIgdIv7UAxDQEKWWWaJfY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ra5+SIXXQfeVOZm3RvbV5swiBlvbReP7NTLQX/D8K+VqcBi9liQGpquLYWf9iw29J
         4ETfAYOode0Lsr6LyYcndg4kc9ygQL/UoqToEg+Mm/9Os5MJgYsXqFy0d+m4uILvmf
         6RtL7KddBk0DvyXZIsBQQg04LHxSa2E8YXiCrum0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02AFf7mA050793
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Mar 2020 10:41:07 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Mar 2020 10:41:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 10 Mar 2020 10:41:06 -0500
Received: from [128.247.81.242] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02AFf6vb119386;
        Tue, 10 Mar 2020 10:41:06 -0500
Subject: Re: [PATCH] bus: ti-sysc: Fix quirk flags for lcdc on am335x
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     "Andrew F . Davis" <afd@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Jyri Sarha <jsarha@ti.com>
References: <20200309181912.28645-1-tony@atomide.com>
From:   Dave Gerlach <d-gerlach@ti.com>
Message-ID: <1196fb5a-ed41-51bb-67a4-dc9c7fe3ed36@ti.com>
Date:   Tue, 10 Mar 2020 10:45:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309181912.28645-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony,
On 3/9/20 1:19 PM, Tony Lindgren wrote:
> Commit adb72394e2ab ("ARM: OMAP2+: Drop legacy platform data for am3
> lcdc") dropped legacy platform data but we never added the quirks for
> SWSUP_SIDLE and SWSUP_MSTANDBY for lcdc for ti-sysc driver.
> 
> This breaks suspend/resume. Let's fix the issue by enabling the same
> quirks for ti-sysc driver as we had earlier with platform data.
> 
> Fixes: adb72394e2ab ("ARM: OMAP2+: Drop legacy platform data for am3 lcdc")
> Fixes: 23731eac9848 ("bus: ti-sysc: Detect devices on am335x when DEBUG is enabled")
> Reported-by: Keerthy <j-keerthy@ti.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Dave Gerlach <d-gerlach@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> This patch is against v5.6-rc series, it needs a merge conflict resolved
> for Linux next next is using -ENODEV instead of -1 for missing registers.


Tested with v5.6-rc5, can confirm that suspend looks OK now and is 
exited without "pm33xx pm33xx: PM: Could not transition all powerdomains 
to target state" message with this patch.

Tested-by: Dave Gerlach <d-gerlach@ti.com>

Regards,
Dave

> 
> ---
>   drivers/bus/ti-sysc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1266,6 +1266,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>   	SYSC_QUIRK("gpu", 0x50000000, 0x14, -1, -1, 0x00010201, 0xffffffff, 0),
>   	SYSC_QUIRK("gpu", 0x50000000, 0xfe00, 0xfe10, -1, 0x40000000 , 0xffffffff,
>   		   SYSC_MODULE_QUIRK_SGX),
> +	SYSC_QUIRK("lcdc", 0, 0, 0x54, -1, 0x4f201000, 0xffffffff,
> +		   SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
>   	SYSC_QUIRK("usb_otg_hs", 0, 0x400, 0x404, 0x408, 0x00000050,
>   		   0xffffffff, SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
>   	SYSC_QUIRK("usb_otg_hs", 0, 0, 0x10, -1, 0x4ea2080d, 0xffffffff,
> @@ -1294,7 +1296,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>   	SYSC_QUIRK("gpu", 0, 0xfe00, 0xfe10, -1, 0x40000000 , 0xffffffff, 0),
>   	SYSC_QUIRK("hsi", 0, 0, 0x10, 0x14, 0x50043101, 0xffffffff, 0),
>   	SYSC_QUIRK("iss", 0, 0, 0x10, -1, 0x40000101, 0xffffffff, 0),
> -	SYSC_QUIRK("lcdc", 0, 0, 0x54, -1, 0x4f201000, 0xffffffff, 0),
>   	SYSC_QUIRK("mcasp", 0, 0, 0x4, -1, 0x44306302, 0xffffffff, 0),
>   	SYSC_QUIRK("mcasp", 0, 0, 0x4, -1, 0x44307b02, 0xffffffff, 0),
>   	SYSC_QUIRK("mcbsp", 0, -1, 0x8c, -1, 0, 0, 0),
> 
