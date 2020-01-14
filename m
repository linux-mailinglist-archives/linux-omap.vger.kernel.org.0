Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B428513B0A6
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2020 18:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgANRQj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jan 2020 12:16:39 -0500
Received: from muru.com ([72.249.23.125]:50950 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbgANRQj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Jan 2020 12:16:39 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A61F9816C;
        Tue, 14 Jan 2020 17:17:19 +0000 (UTC)
Date:   Tue, 14 Jan 2020 09:16:34 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] ARM: dts: Configure omap5 AESS
Message-ID: <20200114171634.GS5885@atomide.com>
References: <20200114150937.18304-1-tony@atomide.com>
 <52905C15-A2D1-4372-9781-D602D0B274B6@goldelico.com>
 <20200114164613.GR5885@atomide.com>
 <D51230C4-2642-4388-959F-313A3382AB99@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D51230C4-2642-4388-959F-313A3382AB99@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200114 17:05]:
> > Am 14.01.2020 um 17:46 schrieb Tony Lindgren <tony@atomide.com>:
> > Care to clarify what you have in mind? The module is generic, aess
> > device will be the child node.
> 
> The existing driver is hooked into the sound root-node and looks for a
> ti,aess = <&aess>; link:
> 
> / {
> 	sound: sound {
> 		compatible = "ti,abe-twl6040";
> 		ti,model = "omap5-uevm";
> 
> 		ti,jack-detection;
> 		ti,mclk-freq = <19200000>;
> 
> 		ti,mcpdm = <&mcpdm>;
> 		ti,mcbsp1 = <&mcbsp1>;
> 		ti,mcbsp2 = <&mcbsp2>;
> 		ti,mcbsp3 = <&mcbsp3>;
> 
> 		ti,twl6040 = <&twl6040>;
> 		ti,aess = <&aess>;
> 
> 		...
> 	};
> };
> 
> Well, this could be simply wrong... I.e. the aess node should request
> all the phandles to mcpdm and mcbsps because it is connected to.

The aess label above should be in the child aess node, not in the
target-module.

> Or it is right to use the sound node to "connect" all subsystems.

Sounds like that's all taken care of nowadays with the generic
graph binding:

Documentation/devicetree/bindings/graph.txt

See also snd-soc-audio-graph-card and various users for it:

Documentation/devicetree/bindings/sound/audio-graph-card.txt

> Then the "aess" core could also become the child node of the target-module:
> 
> target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
> 	...
> 	aess: aess {
> 		compatible = "ti,aess";
> 		status = "disabled";
> 	};
> };

Yeah this is how it should be :)

> Although it looks better this way, it may make it even one step
> more difficult to resurrect the old code...

Well the old phandles and properties should work the same, just put them
into the child aess node. No need to stuff anything else there at the
target-module level AFAIK.

> And DT maintainers are not happy with otherwise undefined compatible
> definitions.
> 
> So maybe:
> 
> target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
> 	...
> 
> 	aess: aess {
> 		/* revisit
> 		compatible = "ti,aess";
> 		status = "disabled";
> 		*/
> 	};
> };

But we have no binding and no driver for the aess at this point..
If and when the aess driver work the child node can be just added :)

Regards,

Tony
