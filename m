Return-Path: <linux-omap+bounces-3032-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F10A05FA8
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 16:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A07A13A7D9B
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 15:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058A31FDE14;
	Wed,  8 Jan 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CQbgrhOq"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FD2B644;
	Wed,  8 Jan 2025 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348993; cv=none; b=JeedThJ/kXRElFIxYPOu+42G4coq8nLUJs0i5jQ8rLv6J1Va5jhWvBbvujM4GGS+AYh7husHpz7J7doPUsCNg0/61pGSwj7ygXc1sOlRTL6kqpu6apThJ0OSdLibStYyahZTeGFjer37/UX1TcS1/mmc20mXoWe5uO3iNlS0Wg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348993; c=relaxed/simple;
	bh=3VBoarm65yidT0S1jwd5sJD6YGFWm/9XqSCzQEg27VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AGwmCXLRehvj4OTlyTCJllMFulpmB+goLbevgaz3tzGbSchKs+/z/eIl+U06XuLj/KPEHwr8JvHn+pIcHxNwTdC5tTiB9itu6V+GUZB2mE/n3uvKvgBBLFykJlIGgWr+1pV7Mh47mLfWEbXNj+kArnpzrti71hSjT///B/9T7BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CQbgrhOq; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508F9cvb117690;
	Wed, 8 Jan 2025 09:09:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736348978;
	bh=EBFfvevMsK9ZA/ZNAz6Nk2cp2esfcvJVDFz4UaKdqR8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CQbgrhOqLSVYVmwXK/H/RzO1Xn7vpeei2DD1QvXiDmBYEQj17RxbgWA4cRAT8jCjW
	 2uU7EN76oAcgiOwctPkfCQ9e9nBOsxf/ZfOEXOhKAAt/kzGSthOuHEHn2yFkG3GY4V
	 CYN4TFrcD6NWkis0PCzLV8YXm/0AOJCdUK+tEDAo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508F9c2f056613
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:09:38 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:09:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:09:37 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508F9bXo041516;
	Wed, 8 Jan 2025 09:09:37 -0600
Message-ID: <1251db38-5009-4e93-9603-3ae02f276e5b@ti.com>
Date: Wed, 8 Jan 2025 09:09:37 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
To: Nishanth Menon <nm@ti.com>, Kevin Hilman <khilman@baylibre.com>
CC: <devicetree@vger.kernel.org>, Romain Naour <romain.naour@smile.fr>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>,
        Romain Naour <romain.naour@skf.com>, <s-vadapalli@ti.com>
References: <20241202143331.126800-1-romain.naour@smile.fr>
 <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
 <20250103212528.enq4ur5afxhwzh7n@outdoors> <7hr05eb5st.fsf@baylibre.com>
 <20250108131139.dygei6ejamh5zaij@segment>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250108131139.dygei6ejamh5zaij@segment>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 1/8/25 7:11 AM, Nishanth Menon wrote:
> On 14:46-20250107, Kevin Hilman wrote:
>> Nishanth Menon <nm@ti.com> writes:
>>
>>> On 15:07-20241205, Kevin Hilman wrote:
>>>>
>>>> On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
>>>>> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
>>>>> SoC are used to drive the reference clock to the PCIe Endpoint device via
>>>>> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
>>>>> obtain the regmap for the ACSPCIE_CTRL register within the System
>>>>> Controller device-tree node in order to enable the PAD IO Buffers.
>>>>>
>>>>> The Technical Reference Manual for J721e SoC with details of the
>>>>> ASCPCIE_CTRL registers is available at:
>>>>> https://www.ti.com/lit/zip/spruil1
>>>>>
>>>>> [...]
>>>>
>>>> Applied, thanks!
>>>>
>>>> [1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
>>>>        commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
>>>> [2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
>>>>        commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508
>>>>
>>>> Best regards,
>>>> -- 
>>>> Kevin Hilman <khilman@baylibre.com>
>>>>
>>> This will need a bit of fixup - See along the lines of the following.
>>> Additionally, we should be a bit careful about the dependency of dts
>>> mix up from two trees.
>>
>> sorry, these should be going through your tree in the first place.  They
>> are now dropped from my tree, please go ahead and take them along with
>> Andrews fixup.  Sorry for complicating things.
> 
> 
> Romain,
> 
> There is additional fixups needed, unfortunately as well: syscon yaml
> has two lists based on which dt-schema version you use.. your patch
> fixed one list, but missed the other as well. Could you integrate the
> fixes and resubmit, please?
> 
> 

Or since we already have 'ti,j784s4-acspcie-proxy-ctrl' for the same
reason, you could drop the first patch and re-use this compatible.

For the second patch, you'll still need to add in my suggested
changes and re-send.

Andrew

