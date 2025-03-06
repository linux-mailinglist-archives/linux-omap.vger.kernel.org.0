Return-Path: <linux-omap+bounces-3337-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A2DA543A7
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 08:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 275C63AFCAD
	for <lists+linux-omap@lfdr.de>; Thu,  6 Mar 2025 07:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3721C862C;
	Thu,  6 Mar 2025 07:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4DO+slo"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04118DB04;
	Thu,  6 Mar 2025 07:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741246021; cv=none; b=keX41MS0WeG/lYUKNHuHMbIR5SvJv5Q22bpoPsZZgAniE2NYIUsd2wXi3dG+VxDu/Uqs8/o97stSk8f78JsxyWWY6tCFoPNS3mVQ0D5Pj1a9ji5Pk3C0S98d0wgIcO9zQmNwkC+IYPPDFgLLlC/7dKYYz87/pAhpHUaJw2LJs9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741246021; c=relaxed/simple;
	bh=jToAWs5nOMoiD88j7gOuCaUM6iDoTB9eRniJXCnaMWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPff26S6BGNBJIJNk1Jp3C6NgQsaOjCQW9kiHEzdafqi9OoGWcryrq+gajdGa292bPk3DumTYd08+MuumCSo8Piy7uHl3o3IKjIQHiGnpS/WjWN5QASDjBSa4yhDHtQ2Or0dpl2pl9QCJrAbx8wrcw/n6y8ObwN8rFWbiHYcQMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4DO+slo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3B9C4CEE0;
	Thu,  6 Mar 2025 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741246021;
	bh=jToAWs5nOMoiD88j7gOuCaUM6iDoTB9eRniJXCnaMWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4DO+slo/acGu+CnTSq/7OPARxDhPpKe5Le0wof01DFfBkCDOA8qw2O+XV9DRcEpu
	 SAEGveKDgkdVMSLdmyVggcbLMpyQLQiXZQhltFhNnPYspCwwvAY05gw1k1eQjHDbv0
	 ESJkscX7TQiUHl+fwwxBM4OtLkOV8CYZVY4w8CM/uLseh9KqjahruxAvKP1bGHhOAJ
	 uEfsqFHbwslfX7R9pM9xIVCAHNolSD0zYgQCHB+IJWjTWXZkNJPmrDW1uaPmTv1xI8
	 Ld/Zn51T19PYU0Pcq8yq07YeXb3eCYfoGdJG8dimNOnCJZrXW0n2CYswKX6xDBWn0z
	 cctTHUWstNowA==
Message-ID: <471cdd13-3250-46b1-b7a0-a4f236a47773@kernel.org>
Date: Thu, 6 Mar 2025 08:26:52 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add TI TPS65214 & TPS65215 PMIC MFD Driver Support
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, Lee Jones <lee@kernel.org>,
 broonie@kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, rogerq@kernel.org, lgirdwood@gmail.com,
 linux-omap@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 tony@atomide.com, andreas@kemnade.info, aaro.koskinen@iki.fi
References: <20250206173725.386720-1-s-ramamoorthy@ti.com>
 <173928615760.2233464.12306998726512431222.b4-ty@kernel.org>
 <7f33b5c7-b1a7-4db9-9e19-e30cbb0066ab@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <7f33b5c7-b1a7-4db9-9e19-e30cbb0066ab@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 22:09, Shree Ramamoorthy wrote:
> Hi Lee,
> 
> 
> On 2/11/25 9:02 AM, Lee Jones wrote:
>> On Thu, 06 Feb 2025 11:37:20 -0600, Shree Ramamoorthy wrote:
>>> TPS65214 and TPS65215 are Power Management Integrated Circuits (PMICs) that
>>> have significant register map overlap with TPS65219 and each other. The
>>> series introduces the 2 new PMICs and restructures the existing driver to
>>> support multiple devices.
>>>
>>> - TPS65214, TPS65215, and TPS65219 each have 3 Buck regulators
>>> - TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
>>> - TPS65214's LDO1 maps to TPS65219's LDO3.
>>> - A key difference between TPS65215 & TPS65214 are the LDO current and
>>>    voltage output ranges and the configurable options available.
>>> - TPS65215 has 2 LDOs, whereas TPS65219 has 4 LDOs.
>>> - TPS65215's LDO2 maps to TPS65219's LDO3.
>>> - TPS65215 has 1 GPO, whereas TPS65219 has 2 GPOs.
>>>
>>> [...]
>> Applied, thanks!
>>
>> [1/5] regulator: dt-bindings: Add TI TPS65215 PMIC bindings
>>        commit: 85e7aef57a9e057545017d55b02073e3c4756b2c
>> [2/5] regulator: dt-bindings: Add TI TPS65214 PMIC bindings
>>        commit: 34beb3c87cbb8747f521db5cf1b2a608833f3967
>> [3/5] mfd: tps65219: Remove regmap_read check
>>        commit: 5342c8a9e04fc05f485a3886605b803a5180bd64
>> [4/5] mfd: tps65219: Add support for TI TPS65215 PMIC
>>        commit: ebcbd21550853b16f307d7da8c846b862e138a98
>> [5/5] mfd: tps65219: Add support for TI TPS65214 PMIC
>>        commit: c9878d8d9ac2ecfadfa4fa3543730026c66ad843
>>
>> --
>> Lee Jones [李琼斯]
> 
> Would you be able to remove this series from your branch & replace it with this v6 [0],
> so Mark Brown will be able to apply the dependent regulator series [1]? Thank you!

You replied 3 weeks later. If something was applied not as it should,
you ought to reply IMMEDIATELY, not 3 weeks after.

The trees are mostly immutable after publishing.

Best regards,
Krzysztof

