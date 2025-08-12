Return-Path: <linux-omap+bounces-4203-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A018B2249B
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 12:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB882620711
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDA12EBB94;
	Tue, 12 Aug 2025 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUwSbtti"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620702E2F01;
	Tue, 12 Aug 2025 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754994523; cv=none; b=pgb0sLXGRJTPUltpI2SImPpRHT/yS5HmPi9jRegWZYoq9Gk1rlCXC0Y/jRegfrGjV8T1j9Uaa6Y/PgTCM8HSrviPRB8e9mtaOz0wvcv4igllD4zm9ggqMbx5/ZVmMK00q4rKsu8/jH0TW8Q9likCHrWZaHt75kWoUe/XpliKeZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754994523; c=relaxed/simple;
	bh=UYfIb3p1Vm82p1tWRc07r1qQJo2LPLgYKqInhDrFQE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=islXq80clqgpWJgwBvv9IGrvpkjPUJVzeuqPD7AiIf26j5wXNJ6Ku47a3N9V3had2c9O0Qd4dtOAg5cB5fk263NrABd34HmBioq2w6I2rt6RhIqSGoa6UE9OoJFFaTil1rGYqJwcEbPqHEFdRi5YcT9HewEIKKkY0sFh6oJGPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUwSbtti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49EFC4CEF0;
	Tue, 12 Aug 2025 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754994522;
	bh=UYfIb3p1Vm82p1tWRc07r1qQJo2LPLgYKqInhDrFQE8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mUwSbttileiBGGJeo2548tdI7H8pyN6AOfdEUL0FdRHYDi/LiZCNLUVY43qzFXI23
	 cwg6571ZqRM589Jyq68QXneM3m38I8rlPnqQN3ZcfFB7ctLjJcCOJEUU0b8h68gCGi
	 A9uOSr/h6XwG0Ef2I5gx5y/I5O/w7PiChU7qQKt6mymOi4WjOFS4l7cPkzascgI5kG
	 EV2aOObMn39Eb2eeTlKspyfwGBsqGPMjyGxCkBNkGxQeIefEM1JTdeK7v99J6yPy8W
	 Syxflka5G70e7kTUs81PfLJbS28NkRzk+VEz7v+YSWRblSIMYkUxms0dPniz0ZhQSu
	 zfsp04ak+NHJg==
Message-ID: <e91ed87c-7e2c-4c43-b405-ce3470697a2a@kernel.org>
Date: Tue, 12 Aug 2025 12:28:28 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 00/72] media: i2c: Reduce cargo-cult
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Arec Kao <arec.kao@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>, Fabio Estevam
 <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Hao Yao <hao.yao@intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jason Chen <jason.z.chen@intel.com>,
 Jimmy Su <jimmy.su@intel.com>, Jingjing Xiong <jingjing.xiong@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Leon Luo <leonl@leopardimaging.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Majewski <mattwmajewski@gmail.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Ricardo Ribalda <ribalda@chromium.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shunqian Zheng <zhengsq@rock-chips.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tarang Raval <tarang.raval@siliconsignals.io>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Todor Tomov <todor.too@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tony Lindgren <tony@atomide.com>, Zhi Mao <zhi.mao@mediatek.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <175495482477.157244.17354544707184168458.b4-ty@kernel.org>
 <20250812085112.GH30054@pendragon.ideasonboard.com>
 <ca1f08c9-244d-482b-b719-c7997913f56e@kernel.org>
 <20250812093915.GI30054@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250812093915.GI30054@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2025 11:39, Laurent Pinchart wrote:
>>>>
>>>> [12/72] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
>>>>         commit: 5433560caa5e7e677a8d4310bbec08312be765b4
>>>
>>> I'm afraid that's too soon. This will introduce a breakage without a
>>> corresponding change to the camera sensor driver.
>>>
>>> I will post a v2 with the patches reordered. We could merge the V4L2
>>> side in a rc1-based stable branch and merge than in the arm-soc tree as
>>
>> You cannot ("cannot" as not following the process) merge drivers into
>> DTS branch.
> 
> Ah, I wasn't aware of that. DTS trees don't allow merging stable
> branches shared with other subsystems ? Does it mean that a DTS change

Not with driver subsystems. Why? Because it breaks encapsulation of
hardware description being entirely independent of given Linux driver
implementation.

BTW, it is already documented in maintainer-soc in ABI stability (I will
fix "devicetree" ambiguity to DTS) and driver branch dependencies.

> that depends on a driver change always need to be delayed by one kernel
> version ?

This is one solution, although as I mentioned later it still affects all
other users of DTS, so it has its own drawbacks.

Other solution is to keep both properties for more than one cycle.


> 
>>> well, but I think we can also delay the .dts changes to the next kernel
>>
>> All users of DTS will be anyway affected and commit msg should address that.
> 
> Which commit message, the one for the driver changes or the one for the
> DTS changes ? I plan in the next version to indicate that the DT changes
> depend on the driver changes.


DTS changes, so the soc maintainers can judge whether they care about
other DTS users or they do not.


Best regards,
Krzysztof

