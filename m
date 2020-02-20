Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389F4166709
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 20:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgBTTUX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 14:20:23 -0500
Received: from muru.com ([72.249.23.125]:56468 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728111AbgBTTUX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 14:20:23 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F058F8080;
        Thu, 20 Feb 2020 19:21:05 +0000 (UTC)
Date:   Thu, 20 Feb 2020 11:20:18 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Jiri Slaby <jslaby@suse.cz>, Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: mfd: motmdm: Add binding for
 motorola-mdm
Message-ID: <20200220192018.GS37466@atomide.com>
References: <20200210040107.10306-1-tony@atomide.com>
 <20200210040107.10306-4-tony@atomide.com>
 <20200219221310.GA26624@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219221310.GA26624@bogus>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh@kernel.org> [200219 14:14]:
> On Sun, Feb 09, 2020 at 08:01:05PM -0800, Tony Lindgren wrote:
> > Add a binding document for Motorola modems controllable by
> > TS 27.010 UART line discipline using serdev drivers.
> > 
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  .../mfd/motorola,mapphone-mdm6600.yaml        | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml b/Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml
> > @@ -0,0 +1,37 @@
> > +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license new bindings please:
> 
> (GPL-2.0-only OR BSD-2-Clause)

OK

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/motorola,mapphone-mdm6600.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Motorola Mapphone MDM6600 Modem
> > +
> > +maintainers:
> > +  - Tony Lindgren <tony@atomide.com>
> > +
> > +allOf:
> > +  - $ref: "motorola,mapphone-mdm6600.yaml#"
> 
> Huh? A recursive include? I'm not sure how that didn't blow up.

Oops sorry about that, I'll just drop that one.

Regards,

Tony
