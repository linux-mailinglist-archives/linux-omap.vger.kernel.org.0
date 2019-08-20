Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9E8968BF
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 20:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729409AbfHTSsj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 14:48:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42872 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbfHTSsj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 14:48:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KImVsf089762;
        Tue, 20 Aug 2019 13:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566326911;
        bh=0iAoRSni0dkEtLK/MQU115BeYkMGMV8Be+XLd0zwvjg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NBqHNFPxS9qqHi/0NJZzytXkc8R4wQAS9+Bw6E5ljeSDxGoY7pnr/1cypTRwJuGw5
         UhN1fBi1/E0p/bW5BfRF10+RdYuuMdFWtOHPpsTDjI2i8ax8uY4qxL3lI+QKBr/Z3f
         bTF7oAvfQ9ZoaTUOVnB/JAykJiRTS033eMEPzLfE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KImVnC036656
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 13:48:31 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 13:48:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 13:48:30 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KImVxE046981;
        Tue, 20 Aug 2019 13:48:31 -0500
Subject: Re: [PATCH 6/8] soc: ti: omap_prm: add data for am33xx
To:     Tero Kristo <t-kristo@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-7-git-send-email-t-kristo@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <ebb6e240-1252-5a4f-39a2-403ee699d8aa@ti.com>
Date:   Tue, 20 Aug 2019 13:48:31 -0500
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

Hi Tero,

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
> +	{ .rst = 3, .st = 5 },
> +	{ .rst = -1 },
> +};
> +
> +struct omap_prm_data am3_prm_data[] = {
> +	{ .name = "per", .base = 0x44e00c00, .pwstctrl = 0xc, .pwstst = 0x8, .flags = OMAP_PRM_NO_RSTST },
> +	{ .name = "wkup", .base = 0x44e00d00, .pwstctrl = 0x4, .pwstst = 0x8, .rstst = 0xc, .rstmap = am3_wkup_rst_map },
> +	{ .name = "mpu", .base = 0x44e00e00, .pwstst = 0x4 },

Has a rstst but no rstctrl, but your registration logic takes care of
this. Somewhat confusing, when you just look at the data. Should you
limit the check to only rstctrl and OMAP_PRM_NO_RSTST?

> +	{ .name = "device", .base = 0x44e00f00, .rstctl = 0x0, .rstst = 0x8 },

No pwrstctrl and pwrstst registers, so same comment as on OMAP4 data.

> +	{ .name = "rtc", .base = 0x44e01000, .pwstst = 0x4 },
> +	{ .name = "gfx", .base = 0x44e01100, .pwstst = 0x10, .rstctl = 0x4, .rstst = 0x14 },
> +	{ .name = "cefuse", .base = 0x44e01200, .pwstst = 0x4 },

I am not sure if it is better to explicitly list the registers at 0
offset rather than using the implied value of 0, since there are some
registers that do not exist on some PRM instances which are also not
defined.

regards
Suman

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

