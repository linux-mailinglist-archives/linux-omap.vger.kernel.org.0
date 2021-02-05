Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E84B310BBD
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 14:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhBENX5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 08:23:57 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39948 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhBENUa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Feb 2021 08:20:30 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115DIZJb082333;
        Fri, 5 Feb 2021 07:18:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612531115;
        bh=MSI8Tfmy6cMRCwFK52Cq1JoCb65H8futlZ6Zq21zzRY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RAlm4Xx3ODLCDdkJkDun1ZGcpLSyR4PtGrih27CnyJx7sK1YhfzPdyA8RZ7rstMNr
         j04f8yzXTuHR/VNXqnQT67bUMSLCGepz39HQBadjqgdONM6MA10nWlFOzLM+TUsAG2
         VszrWyHqG6PYD5miP8I8BrwpuGhYiOHqcgTwRTa8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115DIZg4123613
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 5 Feb 2021 07:18:35 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 07:18:35 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 07:18:35 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115DIWFn001579;
        Fri, 5 Feb 2021 07:18:34 -0600
Subject: Re: [PATCH 1/2] ARM: omap2plus_defconfig: Enable Netfilter components
 as modules.
To:     Ivan Jelincic <parazyd@dyne.org>, <linux-omap@vger.kernel.org>
CC:     Tony Lindgren <tony@atomide.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210203113426.18964-1-parazyd@dyne.org>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <72a4133f-db13-db12-0949-017054bc8265@ti.com>
Date:   Fri, 5 Feb 2021 15:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203113426.18964-1-parazyd@dyne.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony, Ivan

On 03/02/2021 13:34, Ivan Jelincic wrote:
> Enable the majority of the Netfilter components as loadable modules
> in the omap2plus_defconfig file.
> 
> Signed-off-by: Ivan Jelincic <parazyd@dyne.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: parazyd <parazyd@dyne.org>
> ---
>   arch/arm/configs/omap2plus_defconfig | 149 +++++++++++++++++++++++++++
>   1 file changed, 149 insertions(+)
> 
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> index f250bf1cc022..9847502d2c97 100644
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -87,6 +87,155 @@ CONFIG_IP_PNP_DHCP=y
>   CONFIG_IP_PNP_BOOTP=y
>   CONFIG_IP_PNP_RARP=y
>   CONFIG_NETFILTER=y
> +CONFIG_NF_CONNTRACK=m
> +CONFIG_NF_LOG_NETDEV=m
> +CONFIG_NF_CONNTRACK_ZONES=y
> +CONFIG_NF_CONNTRACK_EVENTS=y
> +CONFIG_NF_CONNTRACK_TIMEOUT=y
> +CONFIG_NF_CONNTRACK_TIMESTAMP=y
> +CONFIG_NF_CT_NETLINK=m

[..]

Do we really want to enable all these not TI specific configs?
The main purpose of omap2plus_defconfig is to enable TI specific HW and HW features and
config options required to tests/demonstrate these features - like support for some networking
HW offloads.


-- 
Best regards,
grygorii
