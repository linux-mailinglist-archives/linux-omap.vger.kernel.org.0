Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B6995189
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 01:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbfHSXMI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 19:12:08 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49064 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728204AbfHSXMH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 19:12:07 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JNC1uY034022;
        Mon, 19 Aug 2019 18:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566256322;
        bh=zqOUhY0D+EOmc/ozhlkz0NcYx3GXT6+amWIjnozE780=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mPL4PmlPLBLsfac6Zxy5WDV714ujbdl8UPjT03vbeU1IRN2ZXCuqmWpbvSVhaNMOH
         xpBAQdpupBLsajv4W3uzaZGNffz3ozxuzDbeUPAuDPHNrUyqA+0qyoWTugeHWGgiJo
         7GFUpMBof6pBU469BUmxdlLWBPqKUn4tZjLzj0qc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JNC1MK050183
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 18:12:01 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 18:12:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 18:12:01 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JNC17U022786;
        Mon, 19 Aug 2019 18:12:01 -0500
Subject: Re: [PATCH 7/8] soc: ti: omap-prm: add dra7 PRM data
To:     Tero Kristo <t-kristo@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-8-git-send-email-t-kristo@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <bfb01fcb-7b84-c5cf-8986-19f7e61623ad@ti.com>
Date:   Mon, 19 Aug 2019 18:12:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1565164139-21886-8-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/7/19 2:48 AM, Tero Kristo wrote:
> Add PRM data for dra7 family of SoCs.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/soc/ti/omap_prm.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> index fadfc7f..05b7749 100644
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -73,6 +73,31 @@ struct omap_prm_data omap4_prm_data[] = {
>  	{ },
>  };
>  
> +static struct omap_prm_data dra7_prm_data[] = {

Same comment as on other data, static const.

regards
Suman

> +	{ .name = "mpu", .base = 0x4ae06300, .pwstst = 0x4 },
> +	{ .name = "dsp1", .base = 0x4ae06400, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
> +	{ .name = "ipu", .base = 0x4ae06500, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14, .clkdm_name = "ipu1" },
> +	{ .name = "coreaon", .base = 0x4ae06628, .pwstst = 0x4 },
> +	{ .name = "core", .base = 0x4ae06700, .pwstst = 0x4, .rstctl = 0x210, .rstst = 0x214, .clkdm_name = "ipu2" },
> +	{ .name = "iva", .base = 0x4ae06f00, .pwstst = 0x4 },
> +	{ .name = "cam", .base = 0x4ae07000, .pwstst = 0x4 },
> +	{ .name = "dss", .base = 0x4ae07100, .pwstst = 0x4 },
> +	{ .name = "gpu", .base = 0x4ae07200, .pwstst = 0x4 },
> +	{ .name = "l3init", .base = 0x4ae07300, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
> +	{ .name = "l4per", .base = 0x4ae07400, .pwstst = 0x4 },
> +	{ .name = "custefuse", .base = 0x4ae07600, .pwstst = 0x4 },
> +	{ .name = "wkupaon", .base = 0x4ae07724, .pwstst = 0x4 },
> +	{ .name = "emu", .base = 0x4ae07900, .pwstst = 0x4 },
> +	{ .name = "dsp2", .base = 0x4ae07b00, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
> +	{ .name = "eve1", .base = 0x4ae07b40, .pwstst = 0x4 },
> +	{ .name = "eve2", .base = 0x4ae07b80, .pwstst = 0x4 },
> +	{ .name = "eve3", .base = 0x4ae07bc0, .pwstst = 0x4 },
> +	{ .name = "eve4", .base = 0x4ae07c00, .pwstst = 0x4 },
> +	{ .name = "rtc", .base = 0x4ae07c60, .pwstst = 0x4 },
> +	{ .name = "vpe", .base = 0x4ae07c80, .pwstst = 0x4 },
> +	{ },
> +};
> +
>  struct omap_rst_map am3_wkup_rst_map[] = {
>  	{ .rst = 3, .st = 5 },
>  	{ .rst = -1 },
> @@ -91,6 +116,7 @@ struct omap_prm_data am3_prm_data[] = {
>  
>  static const struct of_device_id omap_prm_id_table[] = {
>  	{ .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
> +	{ .compatible = "ti,dra7-prm-inst", .data = dra7_prm_data },
>  	{ .compatible = "ti,am3-prm-inst", .data = am3_prm_data },
>  	{ },
>  };
> 

