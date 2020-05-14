Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBEA1D3493
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 17:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgENPJp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 11:09:45 -0400
Received: from muru.com ([72.249.23.125]:54474 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbgENPJp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 11:09:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8C18B80C0;
        Thu, 14 May 2020 15:10:33 +0000 (UTC)
Date:   Thu, 14 May 2020 08:09:41 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: omap: Update PRM binding for genpd
Message-ID: <20200514150941.GN37466@atomide.com>
References: <20200512203852.29499-1-tony@atomide.com>
 <20200512203852.29499-2-tony@atomide.com>
 <352b8c4d-1233-e208-63ce-c116632546a9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <352b8c4d-1233-e208-63ce-c116632546a9@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200514 07:40]:
> On 12/05/2020 23:38, Tony Lindgren wrote:
> > The PRM (Power and Reset Module) has registers to enable and disable
> > power domains, so let's update the binding for that.
> > 
> > Cc: devicetree@vger.kernel.org
> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >   Documentation/devicetree/bindings/arm/omap/prm-inst.txt | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> > --- a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> > +++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> > @@ -18,12 +18,16 @@ Required properties:
> >   		(base address and length)
> >   Optional properties:
> > +- #power-domain-cells:	Should be 0 if the PRM instance is a power domain.
> >   - #reset-cells:	Should be 1 if the PRM instance in question supports resets.
> > +- clocks: Functional and interface clocks managed by the power domain
> > +- clock-names: Names for the clocks using "fck" and "ick" naming
> 
> Whats the purpose of the clocks for PRM? It looks like you are using this
> with ABE domain on omap4/omap5, but why is this needed?

Hmm good point, seems to be just confusion at my end on what should
handle the clocks for the interconnect instances. We can just leave
out the clocks here probably.

Regards,

Tony
