Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA811732F7
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2020 09:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgB1Ido (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Feb 2020 03:33:44 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53866 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgB1Idn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 Feb 2020 03:33:43 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01S8XflV024121;
        Fri, 28 Feb 2020 02:33:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582878821;
        bh=vW+PepXRsxAK7WkwPUYIQq/S8m7kzQ/csZbigbHHHpQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=e6Ou04kMF7BtN+oobOFCQqXmtAVqXPwfnzwuvT/xCllDO0PkhZDli5M6AwHkld5C8
         aQJptsMj0LZYmvTQURGMjV5IRfz7FIdRiRK3VJvAeTndc92tAEZs5aUYEgrrITajv5
         tbY5MLCoPLcHV7rVB27WNgNW4HUuy3d1B2j9oDZw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01S8Xf2Q049033
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Feb 2020 02:33:41 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 02:33:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 02:33:41 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01S8XdkL108896;
        Fri, 28 Feb 2020 02:33:39 -0600
Subject: Re: [PATCH v2 4/5] ARM: dts: AM4372: Add the PRU-ICSS interconnect
 target-module node
To:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20200227222837.7329-1-s-anna@ti.com>
 <20200227222837.7329-5-s-anna@ti.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <f3ba0138-141c-0602-788c-8bf8f802f436@ti.com>
Date:   Fri, 28 Feb 2020 10:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227222837.7329-5-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 28/02/2020 00:28, Suman Anna wrote:
> The AM437x family of SoCs contains two dissimilar PRU-ICSS instances,
> but leverage a common reset line and SYSCFG from the larger PRU-ICSS1
> instance. This SYSC register has also very unique bit-fields. Both
> the IPs require the PRCM reset to be deasserted to be able to access
> any registers. Add a common PRUSS interconnect target-module with all
> the required properties.
> 
> The PRUSS devices themselves shall be added as child nodes to this
> interconnect node in the future. The PRU-ICSS instances are not
> supported on AM4372 SoC though in the AM437x family, so the target
> module node should be disabled in any derivative board files that
> use this SoC.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>

Reviewed-by: Roger Quadros <rogerq@ti.com>

> ---
> v2:
>   - Remove status=disabled
>   - Revise last para in patch description
> 
>   arch/arm/boot/dts/am4372.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
> index faa14dc0faff..9f39413b0d0e 100644
> --- a/arch/arm/boot/dts/am4372.dtsi
> +++ b/arch/arm/boot/dts/am4372.dtsi
> @@ -344,6 +344,28 @@
>   			};
>   		};
>   
> +		pruss_tm: target-module@54400000 {
> +			compatible = "ti,sysc-pruss", "ti,sysc";
> +			reg = <0x54426000 0x4>,
> +			      <0x54426004 0x4>;
> +			reg-names = "rev", "sysc";
> +			ti,sysc-mask = <(SYSC_PRUSS_STANDBY_INIT |
> +					 SYSC_PRUSS_SUB_MWAIT)>;
> +			ti,sysc-midle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			clocks = <&pruss_ocp_clkctrl AM4_PRUSS_OCP_PRUSS_CLKCTRL 0>;
> +			clock-names = "fck";
> +			resets = <&prm_per 1>;
> +			reset-names = "rstctrl";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x54400000 0x80000>;
> +		};
> +
>   		gpmc: gpmc@50000000 {
>   			compatible = "ti,am3352-gpmc";
>   			ti,hwmods = "gpmc";
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
