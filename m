Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A896E08AA
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388872AbfJVQVz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:21:55 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60160 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388850AbfJVQVz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 12:21:55 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9MGLnv5056454;
        Tue, 22 Oct 2019 11:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571761309;
        bh=DD73lBbCr3Pa+uKFhQsH89wix/dQZe17+r9X7rL61Nk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=PTE3mUKBxTYrv8vEN29J+VjZgu2ZqG19zMlWGuGWF7kyWTV8K7qApbeAUziO998ND
         v6HID/tjLT5YDNXXgG1N/o5okKxjg0XAGmprFJU3+ugztHixkZvMwZ4Y5/kBQjljJh
         jyyJNaTKhd1WLJAgnq6fJrr0dyyjkTRS+DYbs+UQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9MGLn94063952
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Oct 2019 11:21:49 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 22
 Oct 2019 11:21:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 22 Oct 2019 11:21:39 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x9MGLYN0005740;
        Tue, 22 Oct 2019 11:21:34 -0500
Date:   Tue, 22 Oct 2019 11:21:34 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 1/3] ARM: dts: am43xx: add support for clkout1 clock
Message-ID: <20191022162134.fpawonjdjvd5kxza@ti.com>
References: <20191016184954.14048-1-bparrot@ti.com>
 <20191016184954.14048-2-bparrot@ti.com>
 <20191022154816.GO5610@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191022154816.GO5610@atomide.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 08:48:16 -0700]:
> * Benoit Parrot <bparrot@ti.com> [191016 18:47]:
> > --- a/arch/arm/boot/dts/am43xx-clocks.dtsi
> > +++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
> > @@ -704,6 +704,60 @@
> >  		ti,bit-shift = <8>;
> >  		reg = <0x2a48>;
> >  	};
> > +
> > +	clkout1_osc_div_ck: clkout1_osc_div_ck {
> > +		#clock-cells = <0>;
> > +		compatible = "ti,divider-clock";
> > +		clocks = <&sys_clkin_ck>;
> > +		ti,bit-shift = <20>;
> > +		ti,max-div = <4>;
> > +		reg = <0x4100>;
> > +	};
> 
> Here too please describe why the clock names are not generic.

Tero originally had this patch in the kernel so this is somewhat of a
revert. Since these "clock" were removed. If the name syntax is no longer
valid for some reason, then I will need a little more informations to
proceed.

Tero, can you assist here?

Benoit

> 
> Regards,
> 
> Tony
