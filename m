Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFD39B91D9
	for <lists+linux-omap@lfdr.de>; Fri, 20 Sep 2019 16:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388972AbfITO0S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Sep 2019 10:26:18 -0400
Received: from muru.com ([72.249.23.125]:34020 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388962AbfITO0S (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 20 Sep 2019 10:26:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1B04780AA;
        Fri, 20 Sep 2019 14:26:49 +0000 (UTC)
Date:   Fri, 20 Sep 2019 07:26:14 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-omap <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Subject: Re: [PATCHv6 01/10] dt-bindings: omap: add new binding for PRM
 instances
Message-ID: <20190920142614.GQ5610@atomide.com>
References: <20190917174817.GA27938@bogus>
 <20190919123001.23081-1-t-kristo@ti.com>
 <CAL_Jsq+x93K9=L4s6ZdmsDb__==kP36WbM_WY1pB-_QNPOhsGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+x93K9=L4s6ZdmsDb__==kP36WbM_WY1pB-_QNPOhsGw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh+dt@kernel.org> [190919 19:55]:
> On Thu, Sep 19, 2019 at 7:30 AM Tero Kristo <t-kristo@ti.com> wrote:
> >
> > Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
> > of these will act as a power domain controller and potentially as a reset
> > provider.
> >
> > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > ---
> > v6: added common compatible as per request from Tony Lindgren. This is
> >     to simplify the support code in patch #10 of the series slightly
> >
> >  .../devicetree/bindings/arm/omap/prm-inst.txt | 30 +++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Looks good to me too:

Reviewed-by: Tony Lindgren <tony@atomide.com>
