Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D11D95D1
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 17:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404934AbfJPPjU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Oct 2019 11:39:20 -0400
Received: from muru.com ([72.249.23.125]:37556 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726796AbfJPPjU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Oct 2019 11:39:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 974FC8107;
        Wed, 16 Oct 2019 15:39:53 +0000 (UTC)
Date:   Wed, 16 Oct 2019 08:39:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 2/7] usb: musb: omap2430: Wait on enable to avoid babble
Message-ID: <20191016153916.GF5610@atomide.com>
References: <20191009212145.28495-1-tony@atomide.com>
 <20191009212145.28495-3-tony@atomide.com>
 <d3693c4d-bf22-ce0a-cfc8-f2e55bb0c257@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3693c4d-bf22-ce0a-cfc8-f2e55bb0c257@cogentembedded.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> [191010 09:46]:
> Hello!
> 
> On 10.10.2019 0:21, Tony Lindgren wrote:
> 
> > We can babble interrupt if we attempt to switch to USB host mode too
>         ^ verb missing?

Thanks for catching it, it should say "We can get babble...".

Bin, do you need a resend of the whole series if no
other comments?

Regards,

Tony
