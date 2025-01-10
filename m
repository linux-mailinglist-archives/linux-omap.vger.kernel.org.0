Return-Path: <linux-omap+bounces-3085-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE3A09701
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 17:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5E0E3A729A
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 16:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A06C212D93;
	Fri, 10 Jan 2025 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oHoYBwwn"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4C2211A19;
	Fri, 10 Jan 2025 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525856; cv=none; b=UhoFAizMPBpvLMfaw3WRBJnoj2bzL+bLkqzFH9WM3ob4TpLxBSJOCQwgVjyCLR3jkPKA6BlUsPNRDrCKc5OrYLaFCIHiRp3EwzL0EUid6gIecV2EtXpTAyUGlB05EAbwIBt+PdilPgi0Ou+GiKh18Q6kdcKvQitaF+hg0tdefIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525856; c=relaxed/simple;
	bh=wU5SknKKyOGnSrAjK/6f9gs2k8rKPEvOwlp3G7PoBx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=io9ObOpay8lg/37omEFd6MhAePKjl8FvEpYeXJk+9kftuJK3pJKgVm1HoNcwyMnOqYl5D3INMtQt7vpIWA5u//kjhLStPtUiFj4acMwGNLb0GrhalKIyf1w98FBIAJGwayp7ByXvnWi1g61Spy6FmR0897IHeQYsNUGKwHSduZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oHoYBwwn; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AGHGQw3055825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 10:17:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736525836;
	bh=RaXi+ecgSSp1HIuZ3ScfXsKcWQ94D1iS9HFarlPsZgY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oHoYBwwn7+fnWjH219KsE3So7FuRFq65a/ukgSYht03meHj8+iw7M0269kx7fTpMw
	 DTWl45/OBRvOKMCTNc89xA8YNt+9DEPNz9kL8eVbty1LYYBjJzI8R56044mvNA2doF
	 zgRnQ0fK0qcYk6FBc5D/JHnTIhupdUpcXr12lnAU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AGHGr8022319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 10:17:16 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 10:17:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 10:17:16 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AGHFlr096961;
	Fri, 10 Jan 2025 10:17:15 -0600
Message-ID: <3e8ccd7d-0bc1-4ccb-8446-c9d10efbc969@ti.com>
Date: Fri, 10 Jan 2025 10:17:15 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
To: Rob Herring <robh@kernel.org>, Romain Naour <romain.naour@smile.fr>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <kristo@kernel.org>, <vigneshr@ti.com>,
        <nm@ti.com>, Romain Naour
	<romain.naour@skf.com>
References: <20250110100331.1642242-1-romain.naour@smile.fr>
 <20250110153520.GA2904744-robh@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250110153520.GA2904744-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 1/10/25 9:35 AM, Rob Herring wrote:
> On Fri, Jan 10, 2025 at 11:03:30AM +0100, Romain Naour wrote:
>> From: Romain Naour <romain.naour@skf.com>
>>
>> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
>> SoC are used to drive the reference clock to the PCIe Endpoint device via
>> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
>> obtain the regmap for the ACSPCIE_CTRL register within the System
>> Controller device-tree node in order to enable the PAD IO Buffers.
>>
>> Using the ti,j721e-acspcie-proxy-ctrl compatible imply to use "Proxy1"
>> address (1A090h) instead of "Proxy0" (18090h) to access
>> CTRLMMR_ACSPCIE0_CTRL register:
>>
>>    CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)
>>
>> "Proxy0" is used as the default access path that can be locked with the
>> help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1" registers.
>>
>> The Technical Reference Manual for J721e SoC with details of the
>> ASCPCIE_CTRL registers is available at:
>> https://www.ti.com/lit/zip/spruil1
>>
>> Signed-off-by: Romain Naour <romain.naour@skf.com>
>> ---
>> v5:
>>    - Add missing change to the J721e system controller binding
>>      to avoid DT check warning when the new acspcie0_proxy_ctrl (syscon)
>>      will be added to J721e system controller node (Andrew Davis).
>>
>>    https://lore.kernel.org/linux-devicetree/90f47fae-a493-471d-8fe6-e7df741161be@ti.com/
>>
>>    - Explain why "Proxy1" address (1A090h) should be used while using
>>      ti,j721e-acspcie-proxy-ctrl compatible (Siddharth Vadapalli).
>>
>>    https://lore.kernel.org/linux-devicetree/begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl/
>>
>> v4: Add missing change in the second list (From Andrew Davis) [1]
>>    Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
>>    [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
>>    [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/
>>
>> v3: new commit
>> ---
>>   Documentation/devicetree/bindings/mfd/syscon.yaml           | 2 ++
>>   .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
>> index 0e68c69e7bc9..1f3e67f432e7 100644
>> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
>> @@ -115,6 +115,7 @@ select:
>>             - ti,am625-dss-oldi-io-ctrl
>>             - ti,am62p-cpsw-mac-efuse
>>             - ti,am654-dss-oldi-io-ctrl
>> +          - ti,j721e-acspcie-proxy-ctrl
>>             - ti,j784s4-acspcie-proxy-ctrl
>>             - ti,j784s4-pcie-ctrl
>>             - ti,keystone-pllctrl
>> @@ -213,6 +214,7 @@ properties:
>>             - ti,am625-dss-oldi-io-ctrl
>>             - ti,am62p-cpsw-mac-efuse
>>             - ti,am654-dss-oldi-io-ctrl
> 
>> +          - ti,j721e-acspcie-proxy-ctrl
>>             - ti,j784s4-acspcie-proxy-ctrl
> 
> How do these 2 compare? Are they compatible?
> 

Yes, they are 100% identical and compatible, but we were told
to make a new string anyway.. [0]

[0] https://lore.kernel.org/all/1bfdf1f1-7542-4149-a85d-2ac4b659b26b@kernel.org/


>>             - ti,j784s4-pcie-ctrl
>>             - ti,keystone-pllctrl
>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> index 378e9cc5fac2..16929218d611 100644
>> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> @@ -68,6 +68,12 @@ patternProperties:
>>       description:
>>         The node corresponding to SoC chip identification.
>>   
>> +  "^syscon@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/mfd/syscon.yaml#
>> +    description:
>> +      This is the ASPCIe control region.
> 
> So this is a syscon child of a syscon. The primary reason for 'syscon'
> compatible is to create a regmap. Why can't you use the parent's syscon?
> 

The parent node will not be a syscon soon. We made this whole bus a "syscon"
so we could just poke any register we wanted which was a hacky solution we
want to fix. The parent will be converted into a normal "simple-bus".

Most of the IP in this region can be described using normal DT devices,
but there are still just a couple registers like this where we need a raw
syscon (or we could make a proper device driver for these registers, but
that might be excessive, instead seems easy enough to just poke them
directly from the PCIe driver).

Andrew

> Rob

