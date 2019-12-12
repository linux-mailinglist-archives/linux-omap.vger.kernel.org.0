Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35EBD11D407
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730162AbfLLRcI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:32:08 -0500
Received: from muru.com ([72.249.23.125]:46522 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730161AbfLLRcI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:32:08 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5378480C0;
        Thu, 12 Dec 2019 17:32:47 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:32:05 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap3: name mdio node properly
Message-ID: <20191212173205.GB35479@atomide.com>
References: <20191127153212.22209-1-grygorii.strashko@ti.com>
 <2c2f3c8f-4062-f3ce-e1ce-aa128565b901@ti.com>
 <86f18a06-2039-266f-5cff-c6d1c521c0df@ti.com>
 <20191212161909.GT35479@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212161909.GT35479@atomide.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [191212 16:19]:
> * Grygorii Strashko <grygorii.strashko@ti.com> [191212 10:09]:
> > Hi Tony,
> > 
> > On 27/11/2019 18:26, Grygorii Strashko wrote:
> > > 
> > > 
> > > On 27/11/2019 17:32, Grygorii Strashko wrote:
> > > > Rename davinci_mdio DT node "ethernet"->"mdio"
> > > > This fixes the following DT schemas check errors:
> > > > am3517-craneboard.dt.yaml: ethernet@5c030000: $nodename:0: 'ethernet@5c030000' does not match '^mdio(@.*)?'
> > > > 
> > > > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > > > ---
> > > 
> > > This can be for next material.
> > > 
> > > >   arch/arm/boot/dts/am3517.dtsi | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
> > > > index 76f819f4ba48..84e13778a64a 100644
> > > > --- a/arch/arm/boot/dts/am3517.dtsi
> > > > +++ b/arch/arm/boot/dts/am3517.dtsi
> > > > @@ -74,7 +74,7 @@
> > > >               clock-names = "ick";
> > > >           };
> > > > -        davinci_mdio: ethernet@5c030000 {
> > > > +        davinci_mdio: mdio@5c030000 {
> > > >               compatible = "ti,davinci_mdio";
> > > >               ti,hwmods = "davinci_mdio";
> > > >               status = "disabled";
> > > > 
> > > 
> > 
> > Any comments here?
> 
> No comments looks fine. I just have not yet gotten to applying
> patches for v5.6 merge window yet.

Applying into omap-for-v5.6/dt thanks.

Tony
