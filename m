Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDBF5ABCAD
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 17:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404940AbfIFPhC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 11:37:02 -0400
Received: from muru.com ([72.249.23.125]:59944 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404930AbfIFPhC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Sep 2019 11:37:02 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7BB3880CC;
        Fri,  6 Sep 2019 15:37:31 +0000 (UTC)
Date:   Fri, 6 Sep 2019 08:36:58 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Subject: Re: [PATCHv4 01/10] dt-bindings: omap: add new binding for PRM
 instances
Message-ID: <20190906153658.GB52127@atomide.com>
References: <20190830121816.30034-2-t-kristo@ti.com>
 <20190906103558.17694-1-t-kristo@ti.com>
 <CAL_JsqLHTsEz6RJSi3rZ9AKyTBc00abyAxqwG8B9zAqL6cnv+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLHTsEz6RJSi3rZ9AKyTBc00abyAxqwG8B9zAqL6cnv+w@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh+dt@kernel.org> [190906 12:57]:
> On Fri, Sep 6, 2019 at 11:36 AM Tero Kristo <t-kristo@ti.com> wrote:
> >
> > Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
> > of these will act as a power domain controller and potentially as a reset
> > provider.
> >
> > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > ---
> > v4:
> > - renamed nodes as power-controller
> > - added documentation about hierarchy
> >
> >  .../devicetree/bindings/arm/omap/prm-inst.txt | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Looks good to me too:

Reviewed-by: Tony Lindgren <tony@atomide.com>
