Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E44347DB7
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 17:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbhCXQaB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 12:30:01 -0400
Received: from muru.com ([72.249.23.125]:46692 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235295AbhCXQ3j (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 12:29:39 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B8F0C8057;
        Wed, 24 Mar 2021 16:30:34 +0000 (UTC)
Date:   Wed, 24 Mar 2021 18:29:34 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/5] ARM: dts: add battery phandle to cpcap_charger
Message-ID: <YFto7rMfamV+p5wO@atomide.com>
References: <20210117224502.0f9a0e80dfd4841ad26a9914@uvos.xyz>
 <YFsoWjUYhhzo5Tdo@atomide.com>
 <20210324154219.m4xwm3bayzlele6e@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324154219.m4xwm3bayzlele6e@earth.universe>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Sebastian Reichel <sre@kernel.org> [210324 15:43]:
> On Wed, Mar 24, 2021 at 01:54:02PM +0200, Tony Lindgren wrote:
> > * Carl Philipp Klemm <philipp@uvos.xyz> [210117 23:45]:
> > > --- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
> > > +++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
> > > @@ -61,6 +61,7 @@ &cpcap_adc 2 &cpcap_adc 5
> > >  			io-channel-names = "battdetb", "battp",
> > >  					   "vbus", "chg_isense",
> > >  					   "batti";
> > > +			battery = <&cpcap_battery>;
> > >  		};
> > 
> > This seems like good standard stuff to have, picking up this patch into
> > omap-for-v5.13/dt thanks.
> 
> This was btw. one of the patches that finally made me convert all
> the binding files to YAML. This patch will now result in warning
> being printed when you run 'make dtbs_check', since the binding has
> not been updated.
> 
> I did not yet have time to review the patchset properly, so I have
> not yet replied (partely, because of being busy with the YAML
> stuff).
> 
> I think the patch is also wrong, since the information is already
> described in DT - just the other way around: The battery references
> the charger. This provides all required information to the kernel
> for a 1:1 link.

OK, I will drop this patch.

Regards,

Tony
