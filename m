Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 480B31309D9
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2020 21:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgAEUYy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jan 2020 15:24:54 -0500
Received: from muru.com ([72.249.23.125]:50196 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbgAEUYy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 5 Jan 2020 15:24:54 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 53A9A80E2;
        Sun,  5 Jan 2020 20:25:33 +0000 (UTC)
Date:   Sun, 5 Jan 2020 12:24:49 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        agx@sigxcpu.org, lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com, jjhiblot@ti.com
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200105202449.GC5885@atomide.com>
References: <20200105183202.GA17784@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105183202.GA17784@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200105 18:32]:
> Hi!
> 
> It would be good to get LED backlight to work in clean way for 5.6
> kernel.

I agree, this is badly needed for many devices.

> [If you have an idea what else is needed, it would be welcome; it
> works for me in development tree but not in tree I'd like to
> upstream.]

I have some version of these patches working with modified dts in my
droid4-pending-v5.4 branch git branch, maybe try to diff against that.

Regards,

Tony


