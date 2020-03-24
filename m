Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF230191696
	for <lists+linux-omap@lfdr.de>; Tue, 24 Mar 2020 17:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgCXQhQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Mar 2020 12:37:16 -0400
Received: from muru.com ([72.249.23.125]:33086 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727768AbgCXQhP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Mar 2020 12:37:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 63E6C8198;
        Tue, 24 Mar 2020 16:38:01 +0000 (UTC)
Date:   Tue, 24 Mar 2020 09:37:11 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Jiri Slaby <jslaby@suse.cz>, Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: mfd: motmdm: Add binding for
 motorola-mdm
Message-ID: <20200324163711.GA37466@atomide.com>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-4-tony@atomide.com>
 <20200324115852.GB442973@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324115852.GB442973@dell>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lee Jones <lee.jones@linaro.org> [200324 11:58]:
> > Add a binding document for Motorola modems controllable by
> > TS 27.010 UART line discipline using serdev drivers.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > [tony@atomide.com: moved to live under bindings/serdev]
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  .../serdev/motorola,mapphone-mdm6600.yaml     | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml
> 
> Nit: subject line is out of date.

Thanks for spotting that, will change it to use the following:

dt-bindings: serdev: motmdm: Add binding for motorola-mdm

Regards,

Tony
