Return-Path: <linux-omap+bounces-2751-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E449E074B
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 16:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31EC6BA6E7D
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 15:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48738209671;
	Mon,  2 Dec 2024 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNlH33vp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4E8207A32;
	Mon,  2 Dec 2024 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152199; cv=none; b=W2JCIDaZMLKmRMcEj5bm9yRtpbWR1vU9seqhT+3K6gccOWGu3WBnfzB50uBOLksLsNo3XcMXQg9nNU8kcusB7tYlNSD/QBgHOp8veIrKF10YkXfAB9Z1yBRJd5GUGEgci1hEzTMqyD1SYzz3KIRroxIkB5uHHoMQ1nWlGa7fNcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152199; c=relaxed/simple;
	bh=A3Lo9lFCeqF/GPYFe1Yj2juaBqvLzmCWQzlTAPTwBss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skknOg5U5ewFRKjzTqXa+ygpI0u+pX7/1qBldWGjMEKtkedLTaXg2bfFAA9LuXChtJKbBzojTJdp3yTrWYgiSH1Gx+4SRB4XOHj7lY51ZKgq3W0lnEuny+DqRs7aE5F9RpH6+uWqi26onG3F+JwzcO7Oh7s4TYj2hbNU39zrnIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNlH33vp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC11C4CED2;
	Mon,  2 Dec 2024 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733152198;
	bh=A3Lo9lFCeqF/GPYFe1Yj2juaBqvLzmCWQzlTAPTwBss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MNlH33vpyXvutISj4rwQxl2mp3YpKB7QTLGmp7sGfh2us5dZK/yoHL5kidtgMXE+V
	 ZtOHwCPySAW2C5GdRaGXY09g4vrZVo+gnOaG9f9HMmEskgqb9B6pVPE6szOwjTH/3/
	 JZcIA8mpAp6kbna+pvfiuk2iYT0VBD7K+Ygp/dLXahw8ex1kZ5SKi3JjPz7WUjJJ3a
	 OFB4AQ0PrYUCZu2mJ27d+liaqUxPLYwL5BXvytUjmTlKb8H+f77XyOEbigqTYWnjLs
	 q3zLYaHIAkyoZhDWLVFznS1XeQOZCOWScSvg4Ezd7GhqVrdvK/JNtD0PZCsBz3+ZtB
	 ps9Hw+aLbDwuA==
Message-ID: <f332947a-d7b5-4f68-84d8-3ecce118c24c@kernel.org>
Date: Mon, 2 Dec 2024 16:09:51 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE
 output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Romain Naour <romain.naour@smile.fr>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org,
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
References: <20241202101140.48778-1-romain.naour@smile.fr>
 <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
 <k7udgqugqseweckb7hjniz3aops4kn35ttju2ju7f2pcbmndrg@dau5nr4leish>
 <abeb632b-9efc-48e5-a28a-a9d7c02e0a6e@kernel.org>
 <cndc3fopwhwkotfikul2jtzfczpdpwlrs5uhuqq76ck36ndtfs@gvxavxt5tgd5>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <cndc3fopwhwkotfikul2jtzfczpdpwlrs5uhuqq76ck36ndtfs@gvxavxt5tgd5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2024 15:53, Siddharth Vadapalli wrote:
> On Mon, Dec 02, 2024 at 12:07:17PM +0100, Krzysztof Kozlowski wrote:
> 
> Hello Krzysztof,
> 
>> On 02/12/2024 11:58, Siddharth Vadapalli wrote:
>>> On Mon, Dec 02, 2024 at 11:14:46AM +0100, Krzysztof Kozlowski wrote:
>>>
>>> Hello Krzysztof,
>>>
>>>> On 02/12/2024 11:11, Romain Naour wrote:
>>>>> From: Romain Naour <romain.naour@skf.com>
>>>>>
>>>>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
>>>>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
>>>>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
>>>>> provide refclk through PCIe_REFCLK pins.
>>>>>
>>>>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
>>>>> module's PAD IO Buffers.
>>>>>
>>>>> Reuse the compatible "ti,j784s4-acspcie-proxy-ctrl" since the ACSPCIE
>>>>> buffer and its functionality is the same across all K3 SoCs.
>>>>>
>>>>> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>>> Signed-off-by: Romain Naour <romain.naour@skf.com>
>>>>> ---
>>>>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
>>>>> applied on vendor kernel for BeagleBone AI-64:
>>>>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
>>>>>
>>>>> v2:
>>>>>  - use generic style comments
>>>>>  - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
>>>>>  - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
>>>>>    ACSPCIE buffer and its functionality is the same across all K3 SoCs.
>>>>>    (Siddharth Vadapalli)
>>>>>
>>>>>    "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
>>>>>    J721E and all other K3 SoCs.
>>>>
>>>> No, it shouldn't and you got comment on this. You always need specific
>>>> compatible, see writing bindings doc.
>>>
>>> Could you please clarify in which cases reusing the compatible is
>>> permissible? The list of compatibles at:
>>
>> Never? You always need specific compatible. Did you read the writing
>> bindings document?
> 
> I went through the bindings document again at:
> https://www.kernel.org/doc/Documentation/devicetree/bindings/writing-bindings.rst
> It mentions:
> - DON'T use 'syscon' alone without a specific compatible string. A 'syscon'
>   hardware block should have a compatible string unique enough to infer the
>   register layout of the entire block (at a minimum).
> 
> The ACSCPCIE Block as well as its integration across all of TI's K3 SoCs
> is the same i.e. same Hardware/IP. The register bits corresponding to


And first rule for compatible property? DT bindings maintainers keep
repeating it over and over - specific means soc as front compatible.

> the feature to be enabled/disabled via the ACSPCIE block are the same as
> well i.e. "register layout can be inferred". The same goes for the
> compatibles listed below in my previous reply i.e. they aren't bugs.
> Same IP and integration across SoCs and hence reused in the sense of
> Hardware and not Software. I hope this clarifies the rationale for the
> "reuse".


You mix re-use with fallback. These are almost never the same blocks,
which you imply here.

Best regards,
Krzysztof

