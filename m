Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D00E2D9246
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 15:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391741AbfJPNUI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 09:20:08 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48022 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388141AbfJPNUI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Oct 2019 09:20:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GDK2GC110727;
        Wed, 16 Oct 2019 08:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571232002;
        bh=pn1VJ6hcp1F1tZLG4xpI8lS3IUjFzRCxzxKnmp0Jaq0=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=KxCHByEfMBLsRmBAXWWcNQCupC/BZCNyKovmhaDakle728gy820EYYpkqCx+5Gxz+
         J6ADvghlRoDdaFgX1JeCBynrO9CXqIUI354FGvtcr/PNJYwGAzY8Jkb5P6vfvtSitX
         6K/r3+FOBiSWAevhohiFBj5UMuPEShDYjikPgM/k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GDK2Jl111013
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 08:20:02 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 08:20:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 08:20:01 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x9GDK1N8027346;
        Wed, 16 Oct 2019 08:20:01 -0500
Date:   Wed, 16 Oct 2019 08:22:39 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Rob Herring <robh@kernel.org>
CC:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 1/3] dt-bindings: media: ti-vpe: Document VPE driver
Message-ID: <20191016132239.ufptwl44ktmhvylo@ti.com>
References: <20191009175628.20570-1-bparrot@ti.com>
 <20191009175628.20570-2-bparrot@ti.com>
 <20191015222947.GA13388@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191015222947.GA13388@bogus>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rob Herring <robh@kernel.org> wrote on Tue [2019-Oct-15 17:29:47 -0500]:
> On Wed, Oct 09, 2019 at 12:56:26PM -0500, Benoit Parrot wrote:
> > Device Tree bindings for the Video Processing Engine (VPE) driver.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  .../devicetree/bindings/media/ti-vpe.txt      | 48 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/ti-vpe.txt
> 
> Please convert to DT schema format.

I can do that.
Before posting/merging a .yaml, are we supposed to be able to pass these?
# make dt_binding_check
# make dtbs_check

Because currently with 5.4-rc3 these fails.

Is there a way to run these "test command" target a specific .yaml and not
the whole set?

> 
> > 
> > diff --git a/Documentation/devicetree/bindings/media/ti-vpe.txt b/Documentation/devicetree/bindings/media/ti-vpe.txt
> > new file mode 100644
> > index 000000000000..b2942fa8c3ea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/ti-vpe.txt
> > @@ -0,0 +1,48 @@
> > +Texas Instruments DRA7x VIDEO PROCESSING ENGINE (VPE)
> > +------------------------------------------------------
> > +
> > +The Video Processing Engine (VPE) is a key component for image post
> > +processing applications. VPE consist of a single memory to memory
> > +path which can perform chroma up/down sampling, deinterlacing,
> > +scaling and color space conversion.
> > +
> > +Required properties:
> > +- compatible: must be "ti,vpe"
> 
> Needs to have SoC specific compatibles.

Yes, I'll fix that.

> 
> > +- reg:	physical base address and length of the registers set for the 4
> > +	memory regions required;
> > +- reg-names: name associated with the memory regions described is <reg>;
> 
> The names need to be documented.

Ok.

> 
> > +- interrupts: should contain IRQ line for VPE;
> > +
> > +Example:
> > +
> > +	target-module@1d0010 {                  /* 0x489d0000, ap 27 30.0 */
> > +		compatible = "ti,sysc-omap4", "ti,sysc";
> > +		reg = <0x1d0010 0x4>;
> > +		reg-names = "sysc";
> > +		ti,sysc-midle = <SYSC_IDLE_FORCE>,
> > +				<SYSC_IDLE_NO>,
> > +				<SYSC_IDLE_SMART>;
> > +		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> > +				<SYSC_IDLE_NO>,
> > +				<SYSC_IDLE_SMART>;
> > +		clocks = <&vpe_clkctrl DRA7_VPE_VPE_CLKCTRL 0>;
> > +		clock-names = "fck";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges = <0x0 0x1d0000 0x10000>;
> 
> All this is outside the scope of this binding.

OK I was not sure if the whole interconnect thing was needed in the example
or not.

> 
> > +
> > +		vpe: vpe@0 {
> > +			compatible = "ti,vpe";
> > +			reg = <0x0000 0x120>,
> > +			      <0x0700 0x80>,
> > +			      <0x5700 0x18>,
> > +			      <0xd000 0x400>;
> > +			reg-names = "vpe_top",
> > +				    "sc",
> > +				    "csc",
> > +				    "vpdma";
> > +			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> 
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> 
> Not documented, nor needed as there are no child nodes.

Yeah, I'll remove that.

> 
> > +		};
> > +	};
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8598f49fa2c8..63dcda51f8ae 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16299,6 +16299,7 @@ W:	http://linuxtv.org/
> >  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> >  S:	Maintained
> >  F:	drivers/media/platform/ti-vpe/
> > +F:	Documentation/devicetree/bindings/media/ti-vpe.txt

Now with the dt_schemas, I noticed that the maintainer's name is part of
the yaml file. Do we still need to add this to the MAINTAINERS file as
well?

Benoit


> >  
> >  TI WILINK WIRELESS DRIVERS
> >  L:	linux-wireless@vger.kernel.org
> > -- 
> > 2.17.1
> > 
