Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B82A5E0884
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387575AbfJVQQ6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:16:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53142 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389282AbfJVQQ5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 12:16:57 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9MGGpDl103911;
        Tue, 22 Oct 2019 11:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571761011;
        bh=ICCv8x/fB/e3A/ZhgbM39pFZPIKBgN0qG0G65NygcQY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=rugrgoB+b0rTerHlQCBE6GHpLIggA26viOjAVxHIx/+zuOwGMzqcf2SS3bV6rE+6P
         vYZCU2TA3s+e4tVyrlJCmkAhsiNy9gtd4R7NUZ2EhuyxRk8He11vY7MutKLt16CAx+
         HMqQ+kmWp8h/la+bnSHzsVdR/6cNnE6A924fq8W0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9MGGoKp052099
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Oct 2019 11:16:51 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 22
 Oct 2019 11:16:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 22 Oct 2019 11:16:50 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x9MGGKt9053166;
        Tue, 22 Oct 2019 11:16:20 -0500
Date:   Tue, 22 Oct 2019 11:16:20 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 5/9] arm: dts: dra72-evm-common: Add entries for the CSI2
 cameras
Message-ID: <20191022161620.pnxrmbhucyvh6swr@ti.com>
References: <20191018154849.3127-1-bparrot@ti.com>
 <20191018154849.3127-6-bparrot@ti.com>
 <20191022154446.GN5610@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191022154446.GN5610@atomide.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 08:44:46 -0700]:
> * Benoit Parrot <bparrot@ti.com> [191018 15:46]:
> > Add device nodes for CSI2 camera board OV5640.
> > Add the CAL port nodes with the necessary linkage to the ov5640 nodes.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  arch/arm/boot/dts/dra72-evm-common.dtsi | 35 +++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
> > index 8641a3d7d8ad..e4c01a67f6de 100644
> > --- a/arch/arm/boot/dts/dra72-evm-common.dtsi
> > +++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
> > @@ -187,6 +187,12 @@
> >  		gpio = <&gpio5 8 GPIO_ACTIVE_HIGH>;
> >  		enable-active-high;
> >  	};
> > +
> > +	clk_ov5640_fixed: clk_ov5640_fixed {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +	};
> >  };
> 
> The clock node name should be generic and not use
> undescores. If there is a hidden dependency to the
> clock node name here, it should be mentioned in the
> patch for the non-standard use.

Not sure what you mean by generic, here.
This is just to provide a "clock" node which gives the "value" of the fixed
oscillator frequency so driver can get to it, the actual name does not
matter.

Benoit

> 
> Regards,
> 
> Tony
