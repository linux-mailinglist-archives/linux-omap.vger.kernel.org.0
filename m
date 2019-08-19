Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9069B95182
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 01:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbfHSXL0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 19:11:26 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60182 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728204AbfHSXL0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 19:11:26 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JNBKPG129944;
        Mon, 19 Aug 2019 18:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566256280;
        bh=aEu1YJ/im14vMDcoR35ULybLI6ifJc+u4jwJdC8b3oo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xa00bfjM4kweQHSTa8I73JF4zr4mxdzcrecfnk/NKZWJ3Na2Qqn0X7aKiXKm3GShE
         XROXphgSEp1L1IzJAAz6GDvZR/5sM9zIXjtyvgw9bGj4bcaUulLY9yr5Lib4K7mqh1
         zT+fISIy3k6fn0TAcb1CL6lTszrFYR9argN6diLs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JNBK4q123363
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 18:11:20 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 18:11:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 18:11:20 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JNBJCY094993;
        Mon, 19 Aug 2019 18:11:19 -0500
Subject: Re: [PATCH 6/8] soc: ti: omap_prm: add data for am33xx
To:     Tero Kristo <t-kristo@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-7-git-send-email-t-kristo@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <ca424fbf-feb4-3fad-2e95-4f8ae38547dc@ti.com>
Date:   Mon, 19 Aug 2019 18:11:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1565164139-21886-7-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/7/19 2:48 AM, Tero Kristo wrote:
> Add PRM instance data for AM33xx SoC. Includes some basic register
> definitions and reset data for now.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/soc/ti/omap_prm.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> index 9b8d5945..fadfc7f 100644
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -73,8 +73,25 @@ struct omap_prm_data omap4_prm_data[] = {
>  	{ },
>  };
>  
> +struct omap_rst_map am3_wkup_rst_map[] = {

static const here and below.

regards
Suman

> +	{ .rst = 3, .st = 5 },
> +	{ .rst = -1 },
> +};
> +
> +struct omap_prm_data am3_prm_data[] = {
> +	{ .name = "per", .base = 0x44e00c00, .pwstctrl = 0xc, .pwstst = 0x8, .flags = OMAP_PRM_NO_RSTST },
> +	{ .name = "wkup", .base = 0x44e00d00, .pwstctrl = 0x4, .pwstst = 0x8, .rstst = 0xc, .rstmap = am3_wkup_rst_map },
> +	{ .name = "mpu", .base = 0x44e00e00, .pwstst = 0x4 },
> +	{ .name = "device", .base = 0x44e00f00, .rstctl = 0x0, .rstst = 0x8 },
> +	{ .name = "rtc", .base = 0x44e01000, .pwstst = 0x4 },
> +	{ .name = "gfx", .base = 0x44e01100, .pwstst = 0x10, .rstctl = 0x4, .rstst = 0x14 },
> +	{ .name = "cefuse", .base = 0x44e01200, .pwstst = 0x4 },
> +	{ },
> +};
> +
>  static const struct of_device_id omap_prm_id_table[] = {
>  	{ .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
> +	{ .compatible = "ti,am3-prm-inst", .data = am3_prm_data },
>  	{ },
>  };
>  
> 

