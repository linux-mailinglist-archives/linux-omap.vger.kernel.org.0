Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254EF1396C4
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2020 17:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgAMQud (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jan 2020 11:50:33 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45354 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgAMQud (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Jan 2020 11:50:33 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DGoSjN038467;
        Mon, 13 Jan 2020 10:50:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578934228;
        bh=XK6+NRwFhrVriY+slNkZ6meisOxrLFFEaA/1jaSkTlU=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=a8Qpy0NXBTmG5OseZxRsDIfrLlcAdLoh4eTBP2GKa31gW5oXPoAJ4G/CYHdPX0Bpi
         5Fwi2xOpqOaoNuaQXLkkLLnQ75HH5iOo+wsuPdyUUY4Y2kYyOILEpnM9oPpD5np5wB
         gXmAQQXomVXp+aXU1qHua1gPTJVl2Kg14pH9H1oo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DGoSa9123735
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jan 2020 10:50:28 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 10:50:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 10:50:28 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 00DGoS1g130674;
        Mon, 13 Jan 2020 10:50:28 -0600
Date:   Mon, 13 Jan 2020 10:54:14 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v3 0/3] ARM: dts: am43x-vpfe/ov2659.patch
Message-ID: <20200113165413.i6nbi2i7xyue4fti@ti.com>
References: <20191211140720.10539-1-bparrot@ti.com>
 <20191212174123.GF35479@atomide.com>
 <c4ae58dc-3c81-f493-a665-6926baa0f04c@ti.com>
 <20191213152938.GK35479@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191213152938.GK35479@atomide.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony Lindgren <tony@atomide.com> wrote on Fri [2019-Dec-13 07:29:38 -0800]:
> * Tero Kristo <t-kristo@ti.com> [191213 07:43]:
> > On 12/12/2019 19:41, Tony Lindgren wrote:
> > > * Benoit Parrot <bparrot@ti.com> [191211 06:04]:
> > > > This patch series adds the missing camera endpoint (ov2659) as well as
> > > > the required source clocks nodes for the sensor.
> > > > 
> > > > On the am437x-sk-evm the camera sensor is sourced from clkout1 but that
> > > > clock nodes/tree was removed as it was unsed at the time, we are
> > > > re-adding the needed clock nodes here.
> > > 
> > > Tero, it seems I can already pick this series?
> > 
> > I believe it is ready if you approve the clkout1 clock patch.
> 
> OK yeah looks fine.
> 
> > > Or ou want to queue the changes to am43xx-clocks.dtsi along with all
> > > your other clock patches?
> > 
> > Well, I have actually never queued any omap2+ dts patches myself, and I
> > don't think there would be too many of those coming for next merge either.
> 
> OK will queue this series then. For the other ones from Benoit
> looks like we need an immutable clock branch before I can apply
> anything.

Tony, Tero,

Are these merged anyware now?
I still don't see any of these on linux-next?

And by "these" I mean this one and both
 ARM: dts: dra7: add vpe nodes
 ARM: dts: dra7: add cal nodes

Regards,
Benoit

> 
> Regards,
> 
> Tony
