Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8818A71EDE
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 20:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731654AbfGWSQV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 14:16:21 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34924 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730565AbfGWSQV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Jul 2019 14:16:21 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6NIGGou059594;
        Tue, 23 Jul 2019 13:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563905776;
        bh=KQPkYhTuJfhyS8PfO8QYjfDY+4JKdUSmCoRj+O/+9ag=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NlcOtrYY77ZUl0NocV0eWonHVSyGHb/YHl1135OyC/OY7ULW9OY2TRkxn7liAEDOb
         07SxjV+Knmk8m6lvYfwWe6TP/UkCiZayuEz2XXJU+qU6q0iJttYTBeP76s6o5fv0/I
         XG76G/rJprda4Xn39B1JhY+vIXJ37jzYQdXZ0BAk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6NIGGa5062230
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Jul 2019 13:16:16 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 23
 Jul 2019 13:16:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 23 Jul 2019 13:16:15 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6NIGFZZ100648;
        Tue, 23 Jul 2019 13:16:15 -0500
Subject: Re: [PATCH 1/8] ARM: OMAP2+: Fix missing SYSC_HAS_RESET_STATUS for
 dra7 epwmss
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190723112811.44381-1-tony@atomide.com>
 <20190723112811.44381-2-tony@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <212f2172-8612-86b6-83d7-0c70baaaf046@ti.com>
Date:   Tue, 23 Jul 2019 13:16:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190723112811.44381-2-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/23/19 6:28 AM, Tony Lindgren wrote:
> TRM says PWMSS_SYSCONFIG bit for SOFTRESET changes to zero when
> reset is completed. Let's configure it as otherwise we get warnings
> on boot when we check the data against dts provided data. Eventually
> the legacy platform data will be just dropped, but let's fix the
> warning first.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>  arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
> --- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
> @@ -379,7 +379,8 @@ static struct omap_hwmod dra7xx_dcan2_hwmod = {
>  static struct omap_hwmod_class_sysconfig dra7xx_epwmss_sysc = {
>  	.rev_offs	= 0x0,
>  	.sysc_offs	= 0x4,
> -	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET,
> +	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
> +			  SYSC_HAS_RESET_STATUS,
>  	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
>  	.sysc_fields	= &omap_hwmod_sysc_type2,
>  };
> 

