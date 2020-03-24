Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6281917C0
	for <lists+linux-omap@lfdr.de>; Tue, 24 Mar 2020 18:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgCXRhE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Mar 2020 13:37:04 -0400
Received: from muru.com ([72.249.23.125]:33152 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727223AbgCXRhE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Mar 2020 13:37:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9904781CA;
        Tue, 24 Mar 2020 17:37:49 +0000 (UTC)
Date:   Tue, 24 Mar 2020 10:36:59 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        Peter Hurley <peter@hurleysoftware.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Droid 4 in -next -- still no backlight was Re: [PATCH 1/4] tty:
 n_gsm: Add support for serdev drivers
Message-ID: <20200324173659.GC37466@atomide.com>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-2-tony@atomide.com>
 <20200322224230.GB28082@amd>
 <20200324170110.GB37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324170110.GB37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200324 17:02]:
> * Pavel Machek <pavel@denx.de> [200322 22:43]:
> > Before I start debugging, does screen work for you in -next, or do you
> > have some fixes I could try?
> 
> Yes the backlight works for me now just fine with current v5.6-rc.
> 
> But yeah, looks like LCD is again broken in current Linux next,
> maybe Laurent and Sebastian have some clues?

Oh it's just that now display-connector needs to be loaded instead
of the old omap specific hdmi connector :)

See commit e7e67d9a2f1d ("drm/omap: Switch the HDMI and VENC outputs
to drm_bridge") and check that you have the .config options enabled
in that patch also in your custom .config.

Regards,

Tony
