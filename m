Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5CE16F9E6
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 09:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgBZInB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 03:43:01 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58810 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgBZInA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Feb 2020 03:43:00 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01Q8gwVW092872;
        Wed, 26 Feb 2020 02:42:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582706578;
        bh=fbCYjN5xQhrCGo+fxGqzm3lDzWo/n0qXKgvniwZl8JU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=E/4gv4fdmC2c1rMJduSHT8cUhu8huepnhandJQh4AMhcUv/BZe76TNVfw25RG3GDM
         PXy/znwbYcN7Te7yGh20fuiwJVtp2W36KlMD14lLdAYmBliH5UkcNW7jA8ZGcUdsQO
         REc6L0rz3hG8Rb55L6kcqRD+tV3w8HJHam5Ao5/4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01Q8gwUQ003311;
        Wed, 26 Feb 2020 02:42:58 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 02:42:57 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 02:42:57 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01Q8gt8r058762;
        Wed, 26 Feb 2020 02:42:56 -0600
Subject: Re: [PATCH 01/12] dt-bindings: bus: ti-sysc: Add support for PRUSS
 SYSC type
To:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20200225204649.28220-1-s-anna@ti.com>
 <20200225204649.28220-2-s-anna@ti.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <96ec493b-3615-e84d-ba30-cabbf750c874@ti.com>
Date:   Wed, 26 Feb 2020 10:42:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225204649.28220-2-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Suman,

On 25/02/2020 22:46, Suman Anna wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> The PRUSS module has a SYSCFG which is unique. The SYSCFG
> has two additional unique fields called STANDBY_INIT and
> SUB_MWAIT in addition to regular IDLE_MODE and STANDBY_MODE
> fields. Add the bindings for this new sysc type.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>   Documentation/devicetree/bindings/bus/ti-sysc.txt | 1 +
>   include/dt-bindings/bus/ti-sysc.h                 | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt b/Documentation/devicetree/bindings/bus/ti-sysc.txt
> index 233eb8294204..c984143d08d2 100644
> --- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
> +++ b/Documentation/devicetree/bindings/bus/ti-sysc.txt
> @@ -38,6 +38,7 @@ Required standard properties:
>   		"ti,sysc-dra7-mcasp"
>   		"ti,sysc-usb-host-fs"
>   		"ti,sysc-dra7-mcan"
> +		"ti,sysc-pruss"
>   
>   - reg		shall have register areas implemented for the interconnect
>   		target module in question such as revision, sysc and syss
> diff --git a/include/dt-bindings/bus/ti-sysc.h b/include/dt-bindings/bus/ti-sysc.h

Did you intentionally leave this here? It should be part of 2nd patch?

> index babd08a1d226..76b07826ed05 100644
> --- a/include/dt-bindings/bus/ti-sysc.h
> +++ b/include/dt-bindings/bus/ti-sysc.h
> @@ -18,6 +18,10 @@
>   
>   #define SYSC_DRA7_MCAN_ENAWAKEUP	(1 << 4)
>   
> +/* PRUSS sysc found on AM33xx/AM43xx/AM57xx */
> +#define SYSC_PRUSS_SUB_MWAIT		(1 << 5)
> +#define SYSC_PRUSS_STANDBY_INIT		(1 << 4)
> +
>   /* SYSCONFIG STANDBYMODE/MIDLEMODE/SIDLEMODE supported by hardware */
>   #define SYSC_IDLE_FORCE			0
>   #define SYSC_IDLE_NO			1
> 

-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
