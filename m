Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8021D28EA
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 09:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgENHj4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 03:39:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52980 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgENHjz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 May 2020 03:39:55 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04E7doce052134;
        Thu, 14 May 2020 02:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589441990;
        bh=ryFOyIaFBEK0w40rlL9mZPW1Hpsa6/doKlcHGdfFZrs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HVU1KG3W920JxGoNxgLnFb89UftFKP1YpSOoq/+zqDnGYUng0P6/+PW9os/HNSUaO
         1nDUcHkWGvtH0CgWdd3PNvXAiRNQ3E8skYLfrzT5Tb9B/bE5w7HlGqjHe3Lx8GXbD5
         lGiENlxoqnZqMnQfeSQ24jM2R2wnYRU1uwJQjTSM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04E7doZS005715
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 May 2020 02:39:50 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 May 2020 02:39:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 May 2020 02:39:49 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04E7dhPm014653;
        Thu, 14 May 2020 02:39:46 -0500
Subject: Re: [PATCH 1/6] dt-bindings: omap: Update PRM binding for genpd
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
References: <20200512203852.29499-1-tony@atomide.com>
 <20200512203852.29499-2-tony@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <352b8c4d-1233-e208-63ce-c116632546a9@ti.com>
Date:   Thu, 14 May 2020 10:39:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200512203852.29499-2-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/05/2020 23:38, Tony Lindgren wrote:
> The PRM (Power and Reset Module) has registers to enable and disable
> power domains, so let's update the binding for that.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   Documentation/devicetree/bindings/arm/omap/prm-inst.txt | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> --- a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> @@ -18,12 +18,16 @@ Required properties:
>   		(base address and length)
>   
>   Optional properties:
> +- #power-domain-cells:	Should be 0 if the PRM instance is a power domain.
>   - #reset-cells:	Should be 1 if the PRM instance in question supports resets.
> +- clocks: Functional and interface clocks managed by the power domain
> +- clock-names: Names for the clocks using "fck" and "ick" naming

Whats the purpose of the clocks for PRM? It looks like you are using 
this with ABE domain on omap4/omap5, but why is this needed?

-Tero

>   
>   Example:
>   
>   prm_dsp2: prm@1b00 {
>   	compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
>   	reg = <0x1b00 0x40>;
> +	#power-domain-cells = <0>;
>   	#reset-cells = <1>;
>   };
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
