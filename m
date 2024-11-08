Return-Path: <linux-omap+bounces-2620-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E8F9C1D8B
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 14:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57BC41C22E75
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 13:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4261E9066;
	Fri,  8 Nov 2024 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHqqt/MQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FF11E1C22;
	Fri,  8 Nov 2024 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070987; cv=none; b=CyIb3p89w2pxQM9C4nwBSfI+13OQ+LQ8g8v90z4DoLa0R+haBcYfh5aWww1G7g0IhS0J7UcyyizxhC4QangRf3jOKQPgNriK/PkpsmVPJOBk81pepRS+luGPzV+HkebC+KJBsYiBWB2yn+Rd5SCGKieBkc6FtjRYxZBKzEUAnzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070987; c=relaxed/simple;
	bh=ROX3g1ipCssQb15geT/67wX8/vpFIqm08jZHanMKPhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKcGhkxO72AS2aBNE8m/voCuN8zCrZ+k9Q95w2U42/zPk5kh1r6Y9fLg6RBcZjYCxaJLoe8jNaijnTST9VeDJDSmkJp3Sdd7/YzblrMosSWIlUjLQJovzWvNZI4FGpx/+PvDnZfnWn6kfCu2fkfBxUNQjEkKG/IMNHigzS5M/wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHqqt/MQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B101EC4CED2;
	Fri,  8 Nov 2024 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731070986;
	bh=ROX3g1ipCssQb15geT/67wX8/vpFIqm08jZHanMKPhw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vHqqt/MQNH011ZbaWc8I2QRVF5632OsfVloRBYI53uffwUX1nnQEYGV3gPSz4g1IU
	 VOeZI8I5aVl4K1Zg0UcQ7+mWEh7jOE07xCNQTatghE8Dx2lCN7rKZPopOuuSLfZQ7o
	 KQxHZhzGmKP2MT0ur/5Mh+ZWi7qaQRGnsIxXT4Sd/fLJjphOZsW/JUeqjqVJMxiTvd
	 RRYKkm1zmY8G/s36M59bbGh+42vVEbbE7LLB5BwGprC3prJ5bMtKhkcsTe87/skkvx
	 P6LmTxSxrobxbj+wn8kcP25pu3riBPUgIMwbmZk7dRSWJUv5joujO1+CIpSPJpj7gl
	 2TWec5uORuQsg==
Message-ID: <36b61684-fede-4422-bd54-0421e6a0fc23@kernel.org>
Date: Fri, 8 Nov 2024 15:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert mux.txt to json-schema
To: Andreas Kemnade <andreas@kemnade.info>, Rob Herring <robh@kernel.org>,
 Tero Kristo <kristo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
References: <20241104135549.38486-1-andreas@kemnade.info>
 <20241105135234.GA3100411-robh@kernel.org> <20241107075803.2cf33ab4@akair>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241107075803.2cf33ab4@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 07/11/2024 08:58, Andreas Kemnade wrote:
> Am Tue, 5 Nov 2024 07:52:34 -0600
> schrieb Rob Herring <robh@kernel.org>:
> 
>> On Mon, Nov 04, 2024 at 02:55:49PM +0100, Andreas Kemnade wrote:
>>> Convert the OMAP mux clock device tree binding to json-schema.
>>> Specify the creator of the original binding as a maintainer.
>>> Choose GPL-only license because original binding was also GPL.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> ---
>>>  .../bindings/clock/ti/composite.txt           |   2 +-
>>>  .../devicetree/bindings/clock/ti/mux.txt      |  78 -----------
>>>  .../bindings/clock/ti/ti,mux-clock.yaml       | 123 ++++++++++++++++++
>>>  3 files changed, 124 insertions(+), 79 deletions(-)
>>>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/mux.txt
>>>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/ti/composite.txt b/Documentation/devicetree/bindings/clock/ti/composite.txt
>>> index b02f22490dcb..238e6f7d74f8 100644
>>> --- a/Documentation/devicetree/bindings/clock/ti/composite.txt
>>> +++ b/Documentation/devicetree/bindings/clock/ti/composite.txt
>>> @@ -16,7 +16,7 @@ merged to this clock. The component clocks shall be of one of the
>>>  "ti,*composite*-clock" types.
>>>  
>>>  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>>> -[2] Documentation/devicetree/bindings/clock/ti/mux.txt
>>> +[2] Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
>>>  [3] Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
>>>  [4] Documentation/devicetree/bindings/clock/ti/gate.txt
>>>  
>>> diff --git a/Documentation/devicetree/bindings/clock/ti/mux.txt b/Documentation/devicetree/bindings/clock/ti/mux.txt
>>> deleted file mode 100644
>>> index cd56d3c1c09f..000000000000
>>> --- a/Documentation/devicetree/bindings/clock/ti/mux.txt
>>> +++ /dev/null
>>> @@ -1,78 +0,0 @@
>>> -Binding for TI mux clock.
>>> -
>>> -This binding uses the common clock binding[1].  It assumes a
>>> -register-mapped multiplexer with multiple input clock signals or
>>> -parents, one of which can be selected as output.  This clock does not
>>> -gate or adjust the parent rate via a divider or multiplier.
>>> -
>>> -By default the "clocks" property lists the parents in the same order
>>> -as they are programmed into the register.  E.g:
>>> -
>>> -	clocks = <&foo_clock>, <&bar_clock>, <&baz_clock>;
>>> -
>>> -results in programming the register as follows:
>>> -
>>> -register value		selected parent clock
>>> -0			foo_clock
>>> -1			bar_clock
>>> -2			baz_clock
>>> -
>>> -Some clock controller IPs do not allow a value of zero to be programmed
>>> -into the register, instead indexing begins at 1.  The optional property
>>> -"index-starts-at-one" modified the scheme as follows:
>>> -
>>> -register value		selected clock parent
>>> -1			foo_clock
>>> -2			bar_clock
>>> -3			baz_clock
>>> -
>>> -The binding must provide the register to control the mux. Optionally
>>> -the number of bits to shift the control field in the register can be
>>> -supplied. If the shift value is missing it is the same as supplying
>>> -a zero shift.
>>> -
>>> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>>> -
>>> -Required properties:
>>> -- compatible : shall be "ti,mux-clock" or "ti,composite-mux-clock".
>>> -- #clock-cells : from common clock binding; shall be set to 0.
>>> -- clocks : link phandles of parent clocks
>>> -- reg : register offset for register controlling adjustable mux
>>> -
>>> -Optional properties:
>>> -- clock-output-names : from common clock binding.
>>> -- ti,bit-shift : number of bits to shift the bit-mask, defaults to
>>> -  0 if not present
>>> -- ti,index-starts-at-one : valid input select programming starts at 1, not
>>> -  zero
>>> -- ti,set-rate-parent : clk_set_rate is propagated to parent clock,
>>> -  not supported by the composite-mux-clock subtype
>>> -- ti,latch-bit : latch the mux value to HW, only needed if the register
>>> -  access requires this. As an example, dra7x DPLL_GMAC H14 muxing
>>> -  implements such behavior.
>>> -
>>> -Examples:
>>> -
>>> -sys_clkin_ck: sys_clkin_ck@4a306110 {
>>> -	#clock-cells = <0>;
>>> -	compatible = "ti,mux-clock";
>>> -	clocks = <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_16800000_ck>, <&virt_19200000_ck>, <&virt_26000000_ck>, <&virt_27000000_ck>, <&virt_38400000_ck>;
>>> -	reg = <0x0110>;
>>> -	ti,index-starts-at-one;
>>> -};
>>> -
>>> -abe_dpll_bypass_clk_mux_ck: abe_dpll_bypass_clk_mux_ck@4a306108 {
>>> -	#clock-cells = <0>;
>>> -	compatible = "ti,mux-clock";
>>> -	clocks = <&sys_clkin_ck>, <&sys_32k_ck>;
>>> -	ti,bit-shift = <24>;
>>> -	reg = <0x0108>;
>>> -};
>>> -
>>> -mcbsp5_mux_fck: mcbsp5_mux_fck {
>>> -	#clock-cells = <0>;
>>> -	compatible = "ti,composite-mux-clock";
>>> -	clocks = <&core_96m_fck>, <&mcbsp_clks>;
>>> -	ti,bit-shift = <4>;
>>> -	reg = <0x02d8>;
>>> -};
>>> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
>>> new file mode 100644
>>> index 000000000000..b271ab86dde1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
>>> @@ -0,0 +1,123 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only  
>>
>> Surely TI as the only author of the original binding would agree to
>> dual-license this?
>>
> So there is a question mark. So you are waiting for some confirmation
> form TI?

TI code uses below license clause. So better to stick to that.

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)


-- 
cheers,
-roger

