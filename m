Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99DCF1C1F81
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 23:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgEAVZI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 17:25:08 -0400
Received: from muru.com ([72.249.23.125]:52574 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgEAVZI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 May 2020 17:25:08 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 623CB810E;
        Fri,  1 May 2020 21:25:55 +0000 (UTC)
Date:   Fri, 1 May 2020 14:25:04 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: gnss: Add binding for Motorola Mapphone
 MDM6600 GNSS
Message-ID: <20200501212504.GE37466@atomide.com>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-5-tony@atomide.com>
 <20200501211924.GB6222@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501211924.GB6222@bogus>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh@kernel.org> [200501 21:20]:
> On Thu, Apr 30, 2020 at 10:46:13AM -0700, Tony Lindgren wrote:
> > Add a binding document for Motorola Mapphone MDM6600 GNSS driver that
> > can be used with phones such as droid4.
> > 
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  .../devicetree/bindings/gnss/motmdm.yaml      | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gnss/motmdm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gnss/motmdm.yaml b/Documentation/devicetree/bindings/gnss/motmdm.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gnss/motmdm.yaml
> > @@ -0,0 +1,29 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gnss/motmdm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Motorola Mapphone MDM6600 GNSS binding
> > +
> > +maintainers:
> > +  - Tony Lindgren <tony@atomide.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: motorola,mapphone-mdm6600-gnss
> > +
> > +  reg:
> > +    items:
> > +      description: TS 27.010 channel the GNSS device is using
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    gnss@4 {
> 
> This is a child of what's in patch 2? I think I'd just combine this 
> schema into it.

Yes it's a child node for patch 2 in this series. I'll combine them
into a single binding.

> Or you can leave it, but better to have complete examples (which will 
> help fix what my bot reports). Examples have a default 
> #address/size-cells of 1.

OK. In this case we have just #size-cells = <0>.

Regards,

Tony
