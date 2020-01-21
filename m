Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D145143798
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 08:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbgAUHcI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 02:32:08 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:32796 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgAUHcI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 02:32:08 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00L7W5sU052878;
        Tue, 21 Jan 2020 01:32:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579591925;
        bh=UH7vEp8e3RHqeOGM3MMo9Rhle7S9dmR82oGqsfwiB0o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZwkhhEm5NUW9Evg+nJwUk4uCn4VaU8V76dMifqYbw9ulUcOcUS470CFjZebhsWleu
         EEYM5TQT1CyMtVdtzoFMnop6OtIEMpIXTqMVjccnyrGgc9b6waUwiWni44QaE9x66o
         D3AwhpcErDrbVd/nmeSZuqUZZ1t79LFOIv6FPdkg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L7W5RN000759;
        Tue, 21 Jan 2020 01:32:05 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 01:32:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 01:32:04 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L7W2EC053962;
        Tue, 21 Jan 2020 01:32:02 -0600
Subject: Re: [PATCH] dt-bindings: clock: Move ti-dra7-atl.h to
 dt-bindigs/clock
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>, <mturquette@baylibre.com>,
        <robh+dt@kernel.org>
CC:     <sboyd@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <20191114101817.20831-1-peter.ujfalusi@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <bbb7386a-4f5d-6574-c971-0812f0272450@ti.com>
Date:   Tue, 21 Jan 2020 09:32:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191114101817.20831-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 14/11/2019 12:18, Peter Ujfalusi wrote:
> Most of the clock related dt-binding header files are located in
> dt-bindings/clock folder. It would be good to keep all the similar
> header files at a single location.
> 
> Suggested-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Queued up towards 5.6, thanks.

-Tero

> ---
>   Documentation/devicetree/bindings/clock/ti/dra7-atl.txt | 4 ++--
>   arch/arm/boot/dts/dra7-evm-common.dtsi                  | 2 +-
>   arch/arm/boot/dts/dra72-evm-common.dtsi                 | 2 +-
>   include/dt-bindings/{clk => clock}/ti-dra7-atl.h        | 0
>   4 files changed, 4 insertions(+), 4 deletions(-)
>   rename include/dt-bindings/{clk => clock}/ti-dra7-atl.h (100%)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
> index 10f7047755f3..21c002d28b9b 100644
> --- a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
> +++ b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
> @@ -43,7 +43,7 @@ Configuration of ATL instances:
>   	- aws : Audio word select signal selection
>   };
>   
> -For valid word select signals, see the dt-bindings/clk/ti-dra7-atl.h include
> +For valid word select signals, see the dt-bindings/clock/ti-dra7-atl.h include
>   file.
>   
>   Examples:
> @@ -83,7 +83,7 @@ atl: atl@4843c000 {
>   	clock-names = "fck";
>   };
>   
> -#include <dt-bindings/clk/ti-dra7-atl.h>
> +#include <dt-bindings/clock/ti-dra7-atl.h>
>   
>   &atl {
>   
> diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
> index 82eeba8faef1..23244b5a9942 100644
> --- a/arch/arm/boot/dts/dra7-evm-common.dtsi
> +++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
> @@ -4,7 +4,7 @@
>    */
>   
>   #include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/clk/ti-dra7-atl.h>
> +#include <dt-bindings/clock/ti-dra7-atl.h>
>   #include <dt-bindings/input/input.h>
>   
>   / {
> diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
> index 8641a3d7d8ad..9eabfd1502da 100644
> --- a/arch/arm/boot/dts/dra72-evm-common.dtsi
> +++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
> @@ -6,7 +6,7 @@
>   
>   #include "dra72x.dtsi"
>   #include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/clk/ti-dra7-atl.h>
> +#include <dt-bindings/clock/ti-dra7-atl.h>
>   
>   / {
>   	compatible = "ti,dra72-evm", "ti,dra722", "ti,dra72", "ti,dra7";
> diff --git a/include/dt-bindings/clk/ti-dra7-atl.h b/include/dt-bindings/clock/ti-dra7-atl.h
> similarity index 100%
> rename from include/dt-bindings/clk/ti-dra7-atl.h
> rename to include/dt-bindings/clock/ti-dra7-atl.h
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
