Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4B63115B8
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 23:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhBEWjd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 17:39:33 -0500
Received: from muru.com ([72.249.23.125]:57586 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230174AbhBENdu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 5 Feb 2021 08:33:50 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DBD5D8061;
        Fri,  5 Feb 2021 13:33:22 +0000 (UTC)
Date:   Fri, 5 Feb 2021 15:33:06 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Ivan Jelincic <parazyd@dyne.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: omap2plus_defconfig: Enable Netfilter
 components as modules.
Message-ID: <YB1JEu8cfcy1Ixwb@atomide.com>
References: <20210203113426.18964-1-parazyd@dyne.org>
 <72a4133f-db13-db12-0949-017054bc8265@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72a4133f-db13-db12-0949-017054bc8265@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210205 13:18]:
> On 03/02/2021 13:34, Ivan Jelincic wrote:
> > Enable the majority of the Netfilter components as loadable modules
> > in the omap2plus_defconfig file.
...
> > diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> > index f250bf1cc022..9847502d2c97 100644
> > --- a/arch/arm/configs/omap2plus_defconfig
> > +++ b/arch/arm/configs/omap2plus_defconfig
> > @@ -87,6 +87,155 @@ CONFIG_IP_PNP_DHCP=y
> >   CONFIG_IP_PNP_BOOTP=y
> >   CONFIG_IP_PNP_RARP=y
> >   CONFIG_NETFILTER=y
> > +CONFIG_NF_CONNTRACK=m
> > +CONFIG_NF_LOG_NETDEV=m
> > +CONFIG_NF_CONNTRACK_ZONES=y
> > +CONFIG_NF_CONNTRACK_EVENTS=y
> > +CONFIG_NF_CONNTRACK_TIMEOUT=y
> > +CONFIG_NF_CONNTRACK_TIMESTAMP=y
> > +CONFIG_NF_CT_NETLINK=m
> 
> [..]
> 
> Do we really want to enable all these not TI specific configs?
> The main purpose of omap2plus_defconfig is to enable TI specific HW and HW features and
> config options required to tests/demonstrate these features - like support for some networking
> HW offloads.

Well these are loadable modules. And I'd like to have omap2plus_defconfig
and multi_v7_defconfig usable as a base config for distros to use.

For built-in options I agree. We should only enable absolute minimum
for built-in optoins as otherwise things get even more bloated.

Regards,

Tony
