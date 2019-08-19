Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41000922B3
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 13:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfHSLqO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 07:46:14 -0400
Received: from muru.com ([72.249.23.125]:58228 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726703AbfHSLqO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 19 Aug 2019 07:46:14 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2507A8043;
        Mon, 19 Aug 2019 11:46:41 +0000 (UTC)
Date:   Mon, 19 Aug 2019 04:46:09 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, bencoh@notk.org
Subject: Re: Charging voltage for droid4 battery
Message-ID: <20190819114609.GL52127@atomide.com>
References: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
 <20190818183459.GA29779@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190818183459.GA29779@amd>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [190818 18:35]:
> Hi!
> 
> > Recently my Droid4 battery seems to be swelling up quite a bit. It could
> > be of old age, but bencoh (CC) suggested that he changed the driver code
> > in his kernel to charge until 4.2v, instead of the 4.35v that mainline
> > currently seems to use. (After one of his batteries started to swell up too)
> > 
> > I assume the 4.35v value was taken from Android?

Yes the values we have been using are the values dumped from Android.

So far I have not seen anything changing the values when left connected
to a charger, so I was assuming/hoping that the charger hardware might
drop the voltage automatically.. But it seems that's not the case.

I too have seen at least two swollen batteries and at least one that
seemed to happen with Cyanogenmod or LineageOS few years ago. I suspect
it happens if left connected to a charger for a longer period of time
like several weeks at a time.

> You can let stock android charge the battery, then read voltage from
> mainline kernel. It seems stock uses 4.35V:
> 
> https://forums.lenovo.com/t5/Moto-Z/MOTO-Z-EXTREME-BATTERY-DRAIN/m-p/4435636
> 
> ...but maybe we should not.

OK so sounds like Motorola always keeps the voltage at 4.35V
and there's no need to try to dump out any more charger related
values from Android.

> https://batteryuniversity.com/learn/article/how_to_prolong_lithium_based_batteries

Pavel, care to send out a minimal fix to lower the charge
voltage to 4.2V since you have the related changes already?

Then later on we may want to optionally consider implementing
support for 4.35V charge voltages assuming we scale down the
charge voltage to 4.2V after reaching full charge.

Regards,

Tony
