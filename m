Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E014E428673
	for <lists+linux-omap@lfdr.de>; Mon, 11 Oct 2021 07:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbhJKFw7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Oct 2021 01:52:59 -0400
Received: from muru.com ([72.249.23.125]:43220 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229986AbhJKFw7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Oct 2021 01:52:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A3E78805F;
        Mon, 11 Oct 2021 05:51:30 +0000 (UTC)
Date:   Mon, 11 Oct 2021 08:50:57 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        Suman Anna <s-anna@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH 3/3] dt-bindings: bus: ti-sysc: Update to use yaml binding
Message-ID: <YWPQwVd9+qvmoD6O@atomide.com>
References: <20211007124858.44011-1-tony@atomide.com>
 <20211007124858.44011-4-tony@atomide.com>
 <YWCsdFWzXEpPyYAI@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWCsdFWzXEpPyYAI@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Rob Herring <robh@kernel.org> [211008 20:39]:
> On Thu, Oct 07, 2021 at 03:48:58PM +0300, Tony Lindgren wrote:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +        - enum:
> > +            - ti,sysc-omap2
> > +            - ti,sysc-omap2
> > +            - ti,sysc-omap4
> > +            - ti,sysc-omap4-simple
> > +            - ti,sysc-omap2-timer
> > +            - ti,sysc-omap4-timer
> > +            - ti,sysc-omap3430-sr
> > +            - ti,sysc-omap3630-sr
> > +            - ti,sysc-omap4-sr
> > +            - ti,sysc-omap3-sham
> > +            - ti,sysc-omap-aes
> > +            - ti,sysc-mcasp
> > +            - ti,sysc-dra7-mcasp
> > +            - ti,sysc-usb-host-fs
> > +            - ti,sysc-dra7-mcan
> > +            - ti,sysc-pruss
> > +        - const: ti,sysc
> > +      - items:
> > +        - const: ti,sysc
> 
> This doesn't really match what the old doc said nor the old example. 
> Fine to fix in the conversion if wrong, but just highlight that in the 
> commit msg.

OK yes we currently always need "ti,sysc" as the clockdomain autoidle
handling still relies on auxdata.

> > +
> > +  reg: true
> 
> Any number of register areas is valid?

Yes the number of registers is known, I'll update to use max three reg.

> > +
> > +  reg-names: true
> 
> You've thrown out the names defined before.

Yup these are known too.

> > +
> > +  clocks: true
> 
> Any number of clocks is valid? 

I think 8 clocks is the highest seen :)

> > +  clock-names: true
> 
> You've thrown out the names defined before.

Hmm fck and ick can be named, the rest are device specific though.

> > +
> > +  power-domains: true
> 
> How many?

Just one should be enough here.

> > +additionalProperties: true
> 
> This can be restricted to child nodes only? If so:
> 
> additionalProperties:
>   type: object

OK great, this can be limited to child nodes only.

Regards,

Tony
