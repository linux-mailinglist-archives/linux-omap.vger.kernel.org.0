Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32CE0130A2A
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2020 23:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgAEWSh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jan 2020 17:18:37 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35900 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgAEWSh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jan 2020 17:18:37 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 92E991C2453; Sun,  5 Jan 2020 23:18:35 +0100 (CET)
Date:   Sun, 5 Jan 2020 23:18:35 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        agx@sigxcpu.org, lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com, jjhiblot@ti.com
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200105221835.iwwv6byysbj74ead@ucw.cz>
References: <20200105183202.GA17784@duo.ucw.cz>
 <20200105202449.GC5885@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105202449.GC5885@atomide.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi!

> > It would be good to get LED backlight to work in clean way for 5.6
> > kernel.
> 
> I agree, this is badly needed for many devices.
> 
> > [If you have an idea what else is needed, it would be welcome; it
> > works for me in development tree but not in tree I'd like to
> > upstream.]
> 
> I have some version of these patches working with modified dts in my
> droid4-pending-v5.4 branch git branch, maybe try to diff against that.

Thanks a lot. I was missing 7dc08cb9ac7baff1601f65f66c4c611f841abc64.

Best regards,
								Pavel
> 
