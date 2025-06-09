Return-Path: <linux-omap+bounces-3787-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E6AD2A94
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 01:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041F8188F670
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jun 2025 23:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C0822D9E8;
	Mon,  9 Jun 2025 23:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fHehs+Sx"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B45B22D7B8;
	Mon,  9 Jun 2025 23:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512091; cv=none; b=H4z7wWkcHc1lRvSogcud085Q749WlMzxKPNPOxeBmu3G4YCO6fEM7biccfqt3WFftemO1lSXDtZfFQDlf7kuIBuY1acgGtKn0YL23fL9BQuZzest5rL/EHlvS7DZpd9gMpMbYVKDmN5e7vVBQib1eer2CDK+qjUKJRaar5BG/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512091; c=relaxed/simple;
	bh=OrSNEEduqErCrGy+UeOy5/VQImOWsJpldnbt/BEUpV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LjwK3KnFowvpTLMzPwCtEm4ij80giz6lGnaGjGpidA1A7LLu7Sxh7dBEzkwtq3kIsvzLVhmlifMcOnws87HgksU5zRtqtttIsUldmhEKaReIagBA7afvwoG49g2JjwS0FOZ1XazHct1X2d6R26izxh8gfYZdZPbgdVBd94qrexs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fHehs+Sx; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559NYCBZ2124875;
	Mon, 9 Jun 2025 18:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749512052;
	bh=O1IKf9AorUgqBGeWu8urz3AAOvCJWkpQcDggQ0geEY0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fHehs+SxpcW4hK4rG1SoW0DZc31GQ3qdLPqhbFt1sd4K7q1tE0hoYA4XVjS727cgj
	 dCLZ0Ar7/59QXqPMJ3LHZx2DZfutJPGz0vyT+dKNCgm7XjZUG89UxViuvdOOsfdwBR
	 miMcVHtR6BiXvz7blC6OTQSvePjrX2G3AvJ6BY1Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559NYCDL4024898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 18:34:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 18:34:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 18:34:11 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559NYBZA1994249;
	Mon, 9 Jun 2025 18:34:11 -0500
Message-ID: <53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
Date: Mon, 9 Jun 2025 18:34:10 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
To: Kory Maincent <kory.maincent@bootlin.com>,
        Tony Lindgren
	<tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen
	<aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Roger Quadros <rogerq@kernel.org>,
        Russell King
	<linux@armlinux.org.uk>
CC: Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250609-bbg-v2-2-5278026b7498@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 6/9/25 10:43 AM, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation. Add description for Bone, BoneBlack and BoneGreen
> variants.
> 
> Add several compatible that were missing from the binding.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v2:
> - New patch
> ---
>   Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> index 3603edd7361d..c43fa4f4af81 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -104,12 +104,50 @@ properties:
>         - description: TI AM33 based platform
>           items:
>             - enum:
> +              - bosch,am335x-guardian
>                 - compulab,cm-t335
> +              - grinn,am335x-chilisom
> +              - gumstix,am335x-pepper
> +              - moxa,uc-2101
>                 - moxa,uc-8100-me-t
> +              - myir,myc-am335x
> +              - myir,myd-am335x
>                 - novatech,am335x-lxm
> +              - oct,osd3358-sm-refdesign
> +              - tcl,am335x-sl50
>                 - ti,am335x-bone
>                 - ti,am335x-evm
> +              - ti,am335x-evmsk
> +              - ti,am335x-pocketbeagle
> +              - ti,am335x-shc
>                 - ti,am3359-icev2
> +              - vscom,onrisc
> +          - const: ti,am33xx
> +
> +      - description: TI bone variants based on TI AM335

Do we really need these "bone variants" split out from the above
list of TI AM33 based boards? We don't do that for any of the other
boards, you get a SoC and a Board compatible, every classification
in-between is just unneeded.

Andrew

> +        items:
> +          - enum:
> +              - ti,am335x-bone-black
> +              - ti,am335x-bone-green
> +              - ti,am335x-pocketbeagle
> +          - const: ti,am335x-bone
> +          - const: ti,am33xx
> +
> +      - description: TI bone black variants based on TI AM335
> +        items:
> +          - enum:
> +              - sancloud,am335x-boneenhanced
> +              - ti,am335x-bone-black-wireless
> +          - const: ti,am335x-bone-black
> +          - const: ti,am335x-bone
> +          - const: ti,am33xx
> +
> +      - description: TI bone green variants based on TI AM335
> +        items:
> +          - enum:
> +              - ti,am335x-bone-green-wireless
> +          - const: ti,am335x-bone-green
> +          - const: ti,am335x-bone
>             - const: ti,am33xx
>   
>         - description: Compulab board variants based on TI AM33
> 

