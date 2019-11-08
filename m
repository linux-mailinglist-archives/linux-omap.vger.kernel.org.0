Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8492F51D1
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 18:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbfKHQ7o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 11:59:44 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53160 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfKHQ7n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Nov 2019 11:59:43 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8GxU25130556;
        Fri, 8 Nov 2019 10:59:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573232370;
        bh=1xUXTJidoS5zS0H9fZF60DudiW5gkFrHGsRnq4l/Zzo=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=rYrCnBYAyJOlR3fxp9rU1t+7JRETaxBoNSZkqRysPcnilAbQ32+NfZMiLyPNGMizM
         k/ID3Uo/7diNAX15r83I38SETLqVMCiKHzpaANfYrXm+kMDHcZBHFF8GfuoTqF3qr/
         4/9Jlt/DzRI9BQjCgEbvdG6ostxSWOcGVKWeetFk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA8GxUWi115506
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Nov 2019 10:59:30 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 8 Nov
 2019 10:59:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 8 Nov 2019 10:59:29 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id xA8GxTCs028528;
        Fri, 8 Nov 2019 10:59:29 -0600
Date:   Fri, 8 Nov 2019 11:02:31 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 3/5] ARM: dts: dra7: add vpe clkctrl node
Message-ID: <20191108170231.ubwfu2nvcwjfabas@ti.com>
References: <20191104203841.3628-1-bparrot@ti.com>
 <20191104203841.3628-4-bparrot@ti.com>
 <20191108165554.GF5610@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191108165554.GF5610@atomide.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony Lindgren <tony@atomide.com> wrote on Fri [2019-Nov-08 08:55:54 -0800]:
> Hi,
> 
> * Benoit Parrot <bparrot@ti.com> [191104 20:39]:
> > Add clkctrl nodes for VPE module.
> 
> Can you please add a comment describing that we currently need to
> use custom node names here instead of the standard naming?

Tony, what do you mean "custom node name" here?
I followed the exact same syntax that was already there... confused..

Benoit

> 
> I can queue this and other dts change once I have an immutable clock
> changes branch from Tero.
> 
> Or if Tero wants to also pick up the clock node dtsi patch I can ack it,
> up to Tero.
> 
> Regards,
> 
> Tony
> 
> 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  arch/arm/boot/dts/dra7xx-clocks.dtsi | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
> > index 93e1eb83bed9..d1c2406ec71c 100644
> > --- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
> > +++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
> > @@ -1591,10 +1591,10 @@
> >  
> >  	rtc_cm: rtc-cm@700 {
> >  		compatible = "ti,omap4-cm";
> > -		reg = <0x700 0x100>;
> > +		reg = <0x700 0x60>;
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> > -		ranges = <0 0x700 0x100>;
> > +		ranges = <0 0x700 0x60>;
> >  
> >  		rtc_clkctrl: rtc-clkctrl@20 {
> >  			compatible = "ti,clkctrl";
> > @@ -1603,6 +1603,20 @@
> >  		};
> >  	};
> >  
> > +	vpe_cm: vpe-cm@760 {
> > +		compatible = "ti,omap4-cm";
> > +		reg = <0x760 0xc>;
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges = <0 0x760 0xc>;
> > +
> > +		vpe_clkctrl: vpe-clkctrl@0 {
> > +			compatible = "ti,clkctrl";
> > +			reg = <0x0 0xc>;
> > +			#clock-cells = <2>;
> > +		};
> > +	};
> > +
> >  };
> >  
> >  &cm_core {
> > -- 
> > 2.17.1
> > 
