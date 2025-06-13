Return-Path: <linux-omap+bounces-3876-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACFAD9388
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 19:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96EB01E4C62
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 17:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E92221F34;
	Fri, 13 Jun 2025 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y3W/JpxV"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3222822172C;
	Fri, 13 Jun 2025 17:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749834691; cv=none; b=ebL4SPpiRKrXZow5AVtjZtr9TUYGpDLitWBtHjIUyxnA2J0JFicIe0xu7cSJcyGO6F0tEj87QP6KtOT5IVmyUgOOpNgdVqVvELIDxwleig6cSYEQBiz59RTgHxGpo5flHqU3D4YHpVUv37Iqh1pC6eg8FIfJk08r0NipkusotJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749834691; c=relaxed/simple;
	bh=AiswGbK3djk2IUV13ftX1mKgDhSEBB5EEtxgQVhWtec=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZFSyF28pTY/9CpY1W7SuKfKcV3sf3lKF5dFwO1xe23LF+KEauMnxF+juldGeSNtKYco5Fk4SrjTb9RD/PMVv+RyPcTBDy4bwj0j0Ioa3sbROgpSow3WRsllIpgqhRJvd4iPJx9wgbGhpUZv0MIY7Auyr/gTWxRhEgMcFRup2TfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y3W/JpxV; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55DHAnCP3183815;
	Fri, 13 Jun 2025 12:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749834649;
	bh=tIfdzcVsJS+Y1xlZNSjmnndTMnBgOYe6g0smELzJkrE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y3W/JpxVwNVQbD3bTSuqcNoWS2DUs1sx94Iq2aqEy4TDX1+edD6Gn5xLVlmu+bMLZ
	 Hdg5BR6bstG2Vcd1BvuJnxPF6Sbin5e0q38zTbnTh40leylgPCcj/ovbVd2of2s0sF
	 ceHivc9iWxLQ7q0+sBQ5ejLR4gkyJzXLvJSbcMEc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55DHAnHH2745269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 13 Jun 2025 12:10:49 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 13
 Jun 2025 12:10:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 13 Jun 2025 12:10:48 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55DHAmgB4049360;
	Fri, 13 Jun 2025 12:10:48 -0500
Message-ID: <db82d506-3d10-4f6d-a100-d29e3685ba46@ti.com>
Date: Fri, 13 Jun 2025 12:10:47 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
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
	<linux@armlinux.org.uk>,
        Paul Barker <paul.barker@sancloud.com>,
        Marc Murphy
	<marc.murphy@sancloud.com>
CC: Jason Kridner <jkridner@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
 <20250613-bbg-v3-1-514cdc768448@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250613-bbg-v3-1-514cdc768448@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 6/13/25 10:49 AM, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation for AM33xx-based boards. Update vendor prefix from
> "ti" to "beagle" for BeagleBone to match actual hardware vendors.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v3:
> - Change vendor prefix from ti to beagle
> - Remove BeagleBone board variant description.
> 
> Change in v2:
> - New patch
> ---
>   Documentation/devicetree/bindings/arm/ti/omap.yaml | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> index 3603edd7361d..45fa1c61cafd 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -104,12 +104,32 @@ properties:
>         - description: TI AM33 based platform
>           items:
>             - enum:
> +              - beagle,am335x-bone
> +              - beagle,am335x-bone-black
> +              - beagle,am335x-bone-black-wireless
> +              - beagle,am335x-bone-blue
> +              - beagle,am335x-pocketbeagle
> +              - bosch,am335x-guardian
>                 - compulab,cm-t335
> +              - grinn,am335x-chiliboard
> +              - grinn,am335x-chilisom
> +              - gumstix,am335x-pepper
> +              - isee,am335x-base0033
> +              - moxa,uc-2101
>                 - moxa,uc-8100-me-t
> +              - myir,myc-am335x
> +              - myir,myd-am335x
>                 - novatech,am335x-lxm
> -              - ti,am335x-bone
> +              - oct,osd3358-sm-refdesign
> +              - sancloud,am335x-boneenhanced
> +              - seeed,am335x-bone-green
> +              - seeed,am335x-bone-green-wireless
> +              - tcl,am335x-sl50
>                 - ti,am335x-evm
> +              - ti,am335x-evmsk
> +              - ti,am335x-shc

SHC looks like a Bosch board.

Otherwise this looks much nicer now,

Reviewed-by: Andrew Davis <afd@ti.com>

>                 - ti,am3359-icev2
> +              - vscom,onrisc
>             - const: ti,am33xx
>   
>         - description: Compulab board variants based on TI AM33
> 

