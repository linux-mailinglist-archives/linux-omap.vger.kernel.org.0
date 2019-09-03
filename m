Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8DDA69C0
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 15:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbfICNZh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 09:25:37 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43919 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729484AbfICNZh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Sep 2019 09:25:37 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i58oM-0005Ht-6s; Tue, 03 Sep 2019 15:25:30 +0200
Message-ID: <1567517129.5229.9.camel@pengutronix.de>
Subject: Re: [PATCHv3 01/10] dt-bindings: omap: add new binding for PRM
 instances
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Tue, 03 Sep 2019 15:25:29 +0200
In-Reply-To: <20190903131632.GL52127@atomide.com>
References: <20190830121816.30034-1-t-kristo@ti.com>
         <20190830121816.30034-2-t-kristo@ti.com> <20190902042631.GA22055@bogus>
         <e8d700cd-8f3c-5cea-a022-b20a595fc1e1@ti.com>
         <CAL_Jsq+AJj1bgOQYG=c86A5HC_g2UZph387oVEKZyP4M18kURw@mail.gmail.com>
         <7c2c8a4d-d24e-ceec-afc1-04cdc4d5d952@ti.com>
         <20190903131632.GL52127@atomide.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Tue, 2019-09-03 at 06:16 -0700, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [190903 08:15]:
> > On 03/09/2019 11:10, Rob Herring wrote:
> > > I prefer that bindings be complete as possible even if driver support
> > > is not there yet. Adding power domain support may only mean adding
> > > '#power-domain-cells'.
> > > 
> > > The location is fine then.
> > 
> > Yeah, I assume just adding power-domain-cells should be enough. I am not too
> > sure before I start trying this out though so did not want to add it yet.
> 
> Should we call the device tree node name power-controller instead of
> reset controller though? Most of the PRM instances do not have a
> separate rstctrl reset control functionality.
> 
> Anybody got better any better naming in mind?

power-controller seems fine to me, that is their primary function.

regards
Philipp
