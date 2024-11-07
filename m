Return-Path: <linux-omap+bounces-2602-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE49BFEB7
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 07:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB2A1F22C07
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 06:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9E7195985;
	Thu,  7 Nov 2024 06:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="IGxcMCrA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75DA192590;
	Thu,  7 Nov 2024 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730962690; cv=none; b=sOYxvrZTcrukZ+tKpuPBE8MMU0KNcJ6KLl6inFvPObEiXGu9bZB7SNfb7hKjQP2kAs+2YnElgxl/OMSdxH7OARIvGCSeefgi10WAGGI9nzZs9A4wiYmRNVRSwi2Na+/qUAESIvLy7jGlatm2iJfMrrocCWscdtx5pasEkxptwgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730962690; c=relaxed/simple;
	bh=keiYDqsfxuTmEyZ3nOD1/zbM2Gk/uctKZhrJHUkxTtU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0DMU0AYequ3wCjQvkCLPImBvEGzBxd0se0jx+FZtTxvQpNg9Ad7JcposV9NncnQkSN6+rRhB+zN6qRS63zaKLD5e6oI35dcqUH8zD6BgSLM98a7QyWWZu57DEIN6ivozKKFBtNz0scGVgkFU0O/AyHV4rxOEZhXcMKqAfLEmfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=IGxcMCrA; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ozu4lJq1INd+BvR07joZAIc5IzJSrpGXfnC3IH2pifE=; b=IGxcMCrAdxnFpoqyEPDcuhhVp5
	oNAn5D/YB9twq3WH6XLdnXXhgf66yYkizxuqvABEfnGZlXuCMz8N13vExIkmFur9oyUOKEBp3vbad
	WL7SLH2DTEUtdTEDbfrmrG82xDt6CMfUxCts/OToztcoS2oL6iqGYo1UJErVRimwXFERIrDxRnLE9
	3SqPQxVZZcEMyzFxXUxkKNFp7+yv3IdKAC2wSYR7U+uKYAv1zh/YLplMuKaF829mRSwH2W19sRA6g
	rIjdQLIJomvKP4jB2v99d9qaYx9eegQ7kE6/ciw/kIcO/pJIkLZ9+nLdeD8acosseDDZf9ZAF5wia
	9K7TEnFQ==;
Date: Thu, 7 Nov 2024 07:58:03 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>,
 rogerq@kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, Tony Lindgren
 <tony@atomide.com>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert mux.txt to json-schema
Message-ID: <20241107075803.2cf33ab4@akair>
In-Reply-To: <20241105135234.GA3100411-robh@kernel.org>
References: <20241104135549.38486-1-andreas@kemnade.info>
	<20241105135234.GA3100411-robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 5 Nov 2024 07:52:34 -0600
schrieb Rob Herring <robh@kernel.org>:

> On Mon, Nov 04, 2024 at 02:55:49PM +0100, Andreas Kemnade wrote:
> > Convert the OMAP mux clock device tree binding to json-schema.
> > Specify the creator of the original binding as a maintainer.
> > Choose GPL-only license because original binding was also GPL.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../bindings/clock/ti/composite.txt           |   2 +-
> >  .../devicetree/bindings/clock/ti/mux.txt      |  78 -----------
> >  .../bindings/clock/ti/ti,mux-clock.yaml       | 123 ++++++++++++++++++
> >  3 files changed, 124 insertions(+), 79 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/clock/ti/mux.txt
> >  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/ti/composite.txt b/Documentation/devicetree/bindings/clock/ti/composite.txt
> > index b02f22490dcb..238e6f7d74f8 100644
> > --- a/Documentation/devicetree/bindings/clock/ti/composite.txt
> > +++ b/Documentation/devicetree/bindings/clock/ti/composite.txt
> > @@ -16,7 +16,7 @@ merged to this clock. The component clocks shall be of one of the
> >  "ti,*composite*-clock" types.
> >  
> >  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > -[2] Documentation/devicetree/bindings/clock/ti/mux.txt
> > +[2] Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> >  [3] Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> >  [4] Documentation/devicetree/bindings/clock/ti/gate.txt
> >  
> > diff --git a/Documentation/devicetree/bindings/clock/ti/mux.txt b/Documentation/devicetree/bindings/clock/ti/mux.txt
> > deleted file mode 100644
> > index cd56d3c1c09f..000000000000
> > --- a/Documentation/devicetree/bindings/clock/ti/mux.txt
> > +++ /dev/null
> > @@ -1,78 +0,0 @@
> > -Binding for TI mux clock.
> > -
> > -This binding uses the common clock binding[1].  It assumes a
> > -register-mapped multiplexer with multiple input clock signals or
> > -parents, one of which can be selected as output.  This clock does not
> > -gate or adjust the parent rate via a divider or multiplier.
> > -
> > -By default the "clocks" property lists the parents in the same order
> > -as they are programmed into the register.  E.g:
> > -
> > -	clocks = <&foo_clock>, <&bar_clock>, <&baz_clock>;
> > -
> > -results in programming the register as follows:
> > -
> > -register value		selected parent clock
> > -0			foo_clock
> > -1			bar_clock
> > -2			baz_clock
> > -
> > -Some clock controller IPs do not allow a value of zero to be programmed
> > -into the register, instead indexing begins at 1.  The optional property
> > -"index-starts-at-one" modified the scheme as follows:
> > -
> > -register value		selected clock parent
> > -1			foo_clock
> > -2			bar_clock
> > -3			baz_clock
> > -
> > -The binding must provide the register to control the mux. Optionally
> > -the number of bits to shift the control field in the register can be
> > -supplied. If the shift value is missing it is the same as supplying
> > -a zero shift.
> > -
> > -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > -
> > -Required properties:
> > -- compatible : shall be "ti,mux-clock" or "ti,composite-mux-clock".
> > -- #clock-cells : from common clock binding; shall be set to 0.
> > -- clocks : link phandles of parent clocks
> > -- reg : register offset for register controlling adjustable mux
> > -
> > -Optional properties:
> > -- clock-output-names : from common clock binding.
> > -- ti,bit-shift : number of bits to shift the bit-mask, defaults to
> > -  0 if not present
> > -- ti,index-starts-at-one : valid input select programming starts at 1, not
> > -  zero
> > -- ti,set-rate-parent : clk_set_rate is propagated to parent clock,
> > -  not supported by the composite-mux-clock subtype
> > -- ti,latch-bit : latch the mux value to HW, only needed if the register
> > -  access requires this. As an example, dra7x DPLL_GMAC H14 muxing
> > -  implements such behavior.
> > -
> > -Examples:
> > -
> > -sys_clkin_ck: sys_clkin_ck@4a306110 {
> > -	#clock-cells = <0>;
> > -	compatible = "ti,mux-clock";
> > -	clocks = <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_16800000_ck>, <&virt_19200000_ck>, <&virt_26000000_ck>, <&virt_27000000_ck>, <&virt_38400000_ck>;
> > -	reg = <0x0110>;
> > -	ti,index-starts-at-one;
> > -};
> > -
> > -abe_dpll_bypass_clk_mux_ck: abe_dpll_bypass_clk_mux_ck@4a306108 {
> > -	#clock-cells = <0>;
> > -	compatible = "ti,mux-clock";
> > -	clocks = <&sys_clkin_ck>, <&sys_32k_ck>;
> > -	ti,bit-shift = <24>;
> > -	reg = <0x0108>;
> > -};
> > -
> > -mcbsp5_mux_fck: mcbsp5_mux_fck {
> > -	#clock-cells = <0>;
> > -	compatible = "ti,composite-mux-clock";
> > -	clocks = <&core_96m_fck>, <&mcbsp_clks>;
> > -	ti,bit-shift = <4>;
> > -	reg = <0x02d8>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> > new file mode 100644
> > index 000000000000..b271ab86dde1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/ti/ti,mux-clock.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: GPL-2.0-only  
> 
> Surely TI as the only author of the original binding would agree to
> dual-license this?
> 
So there is a question mark. So you are waiting for some confirmation
form TI?

Regards,
Andreas

