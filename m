Return-Path: <linux-omap+bounces-3086-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C2A098A5
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 18:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C50CF188F07F
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 17:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5C0213E66;
	Fri, 10 Jan 2025 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6cAy4m7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6E02144AC;
	Fri, 10 Jan 2025 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530532; cv=none; b=f8VSdI8I4UdCv4Z5GD46uIzS4s5NM/FtRuE0SYHnAPM9M4EHG0UbDdJ724RfV6OZ14DAxj3w8v+XLsyZrUFa1p97iLbvTLXJdVV8YmpBEkxaRlb7w+dy5eJeaBYoag18I1EETbPKLmkI+GgNubZkZ0tsht8563DI5S9To097CCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530532; c=relaxed/simple;
	bh=5KZvj0UJW7q8uEo+QUesHwTgLnEO03HmGRUGeRMyG9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMZQsgCdPh3CiPo5B4fgNzU6H8jdOhCt0kLsXmktixh9jG239j3+yiC74UwR306/J4znkFw3pnvgjexLeZWlGmSxNHRd5L/uDEvRJiLmBQL2asXBE9hYhD78Xm2b9ZCzeET/BuHeQMM3QELlO+jcd/vHck9+Lalrb+hF2yIv/S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6cAy4m7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF36CC4CED6;
	Fri, 10 Jan 2025 17:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736530532;
	bh=5KZvj0UJW7q8uEo+QUesHwTgLnEO03HmGRUGeRMyG9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6cAy4m7SRrKAMozBVgurC2+n8aTsRrKOBvoQ5NLYDdDlrY9cdKkI5fgC7/S8DAVT
	 rxbDnkw+r+Q8B+ta9wVNFD1w6kCXYyEpDox2porATxo/MLopH5aerCTCkca5IekCMd
	 DW9q147yCTUYucmR/Ot3GuBZ82XVGzJ8ywViymVOSTCn6ykR9/7XMcc9KLiHKWfGk4
	 GtqsOj3msFi7UF3o4Kp7GGEeU6Jsm96kuHoxBG+VlMXkgjnjmLaztqp+bLw8rQltb8
	 tNuLX5qCNFVJQ/tmmhVsUBojKgLPF7CWGLnRZD/U/zVCqh/sxSZamn1QWaHxQ1ISLQ
	 c71EwuPgpOksA==
Date: Fri, 10 Jan 2025 11:35:31 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Romain Naour <romain.naour@smile.fr>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org, kristo@kernel.org,
	vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <20250110173531.GA3025883-robh@kernel.org>
References: <20250110100331.1642242-1-romain.naour@smile.fr>
 <20250110153520.GA2904744-robh@kernel.org>
 <3e8ccd7d-0bc1-4ccb-8446-c9d10efbc969@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e8ccd7d-0bc1-4ccb-8446-c9d10efbc969@ti.com>

On Fri, Jan 10, 2025 at 10:17:15AM -0600, Andrew Davis wrote:
> On 1/10/25 9:35 AM, Rob Herring wrote:
> > On Fri, Jan 10, 2025 at 11:03:30AM +0100, Romain Naour wrote:
> > > From: Romain Naour <romain.naour@skf.com>
> > > 
> > > The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> > > SoC are used to drive the reference clock to the PCIe Endpoint device via
> > > the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> > > obtain the regmap for the ACSPCIE_CTRL register within the System
> > > Controller device-tree node in order to enable the PAD IO Buffers.
> > > 
> > > Using the ti,j721e-acspcie-proxy-ctrl compatible imply to use "Proxy1"
> > > address (1A090h) instead of "Proxy0" (18090h) to access
> > > CTRLMMR_ACSPCIE0_CTRL register:
> > > 
> > >    CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)
> > > 
> > > "Proxy0" is used as the default access path that can be locked with the
> > > help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1" registers.
> > > 
> > > The Technical Reference Manual for J721e SoC with details of the
> > > ASCPCIE_CTRL registers is available at:
> > > https://www.ti.com/lit/zip/spruil1
> > > 
> > > Signed-off-by: Romain Naour <romain.naour@skf.com>
> > > ---
> > > v5:
> > >    - Add missing change to the J721e system controller binding
> > >      to avoid DT check warning when the new acspcie0_proxy_ctrl (syscon)
> > >      will be added to J721e system controller node (Andrew Davis).
> > > 
> > >    https://lore.kernel.org/linux-devicetree/90f47fae-a493-471d-8fe6-e7df741161be@ti.com/
> > > 
> > >    - Explain why "Proxy1" address (1A090h) should be used while using
> > >      ti,j721e-acspcie-proxy-ctrl compatible (Siddharth Vadapalli).
> > > 
> > >    https://lore.kernel.org/linux-devicetree/begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl/
> > > 
> > > v4: Add missing change in the second list (From Andrew Davis) [1]
> > >    Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
> > >    [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
> > >    [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/
> > > 
> > > v3: new commit
> > > ---
> > >   Documentation/devicetree/bindings/mfd/syscon.yaml           | 2 ++
> > >   .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
> > >   2 files changed, 8 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > > index 0e68c69e7bc9..1f3e67f432e7 100644
> > > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > > @@ -115,6 +115,7 @@ select:
> > >             - ti,am625-dss-oldi-io-ctrl
> > >             - ti,am62p-cpsw-mac-efuse
> > >             - ti,am654-dss-oldi-io-ctrl
> > > +          - ti,j721e-acspcie-proxy-ctrl
> > >             - ti,j784s4-acspcie-proxy-ctrl
> > >             - ti,j784s4-pcie-ctrl
> > >             - ti,keystone-pllctrl
> > > @@ -213,6 +214,7 @@ properties:
> > >             - ti,am625-dss-oldi-io-ctrl
> > >             - ti,am62p-cpsw-mac-efuse
> > >             - ti,am654-dss-oldi-io-ctrl
> > 
> > > +          - ti,j721e-acspcie-proxy-ctrl
> > >             - ti,j784s4-acspcie-proxy-ctrl
> > 
> > How do these 2 compare? Are they compatible?
> > 
> 
> Yes, they are 100% identical and compatible, but we were told
> to make a new string anyway.. [0]
> 
> [0] https://lore.kernel.org/all/1bfdf1f1-7542-4149-a85d-2ac4b659b26b@kernel.org/

Then you should have:

"ti,j721e-acspcie-proxy-ctrl", "ti,j784s4-acspcie-proxy-ctrl", "syscon"

> 
> 
> > >             - ti,j784s4-pcie-ctrl
> > >             - ti,keystone-pllctrl
> > > diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> > > index 378e9cc5fac2..16929218d611 100644
> > > --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> > > @@ -68,6 +68,12 @@ patternProperties:
> > >       description:
> > >         The node corresponding to SoC chip identification.
> > > +  "^syscon@[0-9a-f]+$":
> > > +    type: object
> > > +    $ref: /schemas/mfd/syscon.yaml#
> > > +    description:
> > > +      This is the ASPCIe control region.
> > 
> > So this is a syscon child of a syscon. The primary reason for 'syscon'
> > compatible is to create a regmap. Why can't you use the parent's syscon?
> > 
> 
> The parent node will not be a syscon soon. We made this whole bus a "syscon"
> so we could just poke any register we wanted which was a hacky solution we
> want to fix. The parent will be converted into a normal "simple-bus".

Sigh... And that can be done without ABI breakage?

> Most of the IP in this region can be described using normal DT devices,
> but there are still just a couple registers like this where we need a raw
> syscon (or we could make a proper device driver for these registers, but
> that might be excessive, instead seems easy enough to just poke them
> directly from the PCIe driver).

Given it was already a syscon, keeping that is fine.

Rob

