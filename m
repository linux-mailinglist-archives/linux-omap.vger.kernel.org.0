Return-Path: <linux-omap+bounces-4200-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4302B22241
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 11:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 415841688CD
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 08:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826E32E7172;
	Tue, 12 Aug 2025 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwDjLlNm"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008B32E6138;
	Tue, 12 Aug 2025 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754989127; cv=none; b=gGXWoFUGy7UY7d0cJaiUbqiKjzSffw+FRrbg8J2Aaii9EZN2GxJg0zFT5MY9JmmKCOUrykZRZ051js83mZxs2pntDpuVM2jHZbluCTSMqagfAMGhJ58YVS1aSdcOAXUPLFTFM4rnUVOdFIxEV1qR52QvlY1E6pSrpYhmVBZzmNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754989127; c=relaxed/simple;
	bh=Jz3zWQc4zQWbozG7bpplB5qBv8LJG+ZXy/MF5G7tI98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTqkFWpGaDit2Y/08XBatkrvwGfYDrdLCH40+BGMLblDIAlaOT2STlmlNCMD1mrcXFuu7nf00t3/AOZq59FIndgquxbgYoBWW9T2Te6Wc0t/GV/wEewpBCpYZDRUZm816kt19vcztiFrSnmM5p82GC+WVjqBpuSKdl8NxkM2Ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwDjLlNm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09663C4CEF0;
	Tue, 12 Aug 2025 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754989126;
	bh=Jz3zWQc4zQWbozG7bpplB5qBv8LJG+ZXy/MF5G7tI98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mwDjLlNmqdE0G3fwVwgRK8xQfZsigeYX9zIQqAZaEj+KVYndZPwaxWzZ6WSdosmpB
	 CfnD9oRH9GVkUf1DnPYIdarDxapq9Zg+MeA0F3BxjZke4QVC4u1BDuVrBijpeB1qNl
	 sHC/qezAGKyq8bM5Nic5x81f0HLjwTgm6T/8Yh6Ly5cuz/kHkFmHJ9ctytjLFLiXu5
	 WSRcu4PR6TGcK+gHILhvfH9uSXpJAa96kNjXQg0yZbJmcojFqQKjgEsOsz1oVoqkeP
	 qxRV48bxPPZihIaF/3DyMau6RiDAyBiMLMyyKj15mlUcDyOImuiq7pHRbSxw4171LY
	 RxhreUKl+k1BQ==
Message-ID: <ca1f08c9-244d-482b-b719-c7997913f56e@kernel.org>
Date: Tue, 12 Aug 2025 10:58:30 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 00/72] media: i2c: Reduce cargo-cult
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250812085112.GH30054@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2025 10:51, Laurent Pinchart wrote:
> Hi Bjorn,
> 
> On Mon, Aug 11, 2025 at 06:27:01PM -0500, Bjorn Andersson wrote:
>> On Thu, 10 Jul 2025 20:46:56 +0300, Laurent Pinchart wrote:
>>> This patch series build on top of Mehdi's introduction of the
>>> devm_v4l2_sensor_clk_get() helper (see [1]) to drastically reduce
>>> cargo-cult in camera sensor drivers.
>>>
>>> A large number of camera sensor drivers directly use the
>>> "clock-frequency" property to retrieve the effective or desired external
>>> clock rate. This is standard behaviour on ACPI platforms that don't
>>> implement MIPI DisCo for Imaging, but usage of the property has leaked
>>> to OF-based platforms, due to a combination of historical reasons (using
>>> "clock-frequency" was initially considered right until before the
>>> introduction of "assigned-clock-rates") and plain cargo-cult.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [12/72] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
>>         commit: 5433560caa5e7e677a8d4310bbec08312be765b4
> 
> I'm afraid that's too soon. This will introduce a breakage without a
> corresponding change to the camera sensor driver.
> 
> I will post a v2 with the patches reordered. We could merge the V4L2
> side in a rc1-based stable branch and merge than in the arm-soc tree as


You cannot ("cannot" as not following the process) merge drivers into
DTS branch.


> well, but I think we can also delay the .dts changes to the next kernel


All users of DTS will be anyway affected and commit msg should address that.

> version. Do you have a preference ?



Best regards,
Krzysztof

