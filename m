Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A681FAE8A
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 12:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbgFPKuf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 06:50:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53246 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgFPKuf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Jun 2020 06:50:35 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1318F1C0C0A; Tue, 16 Jun 2020 12:50:33 +0200 (CEST)
Date:   Tue, 16 Jun 2020 12:50:02 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Beno??t Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mattias Jacobsson <2pi@mok.nu>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:OMAP DEVICE TREE SUPPORT" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>
Subject: Re: [PATCH 0/2] Add SW_MACHINE_COVER key
Message-ID: <20200616105002.GA1718@bug>
References: <20200612125402.18393-1-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612125402.18393-1-merlijn@wizzup.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri 2020-06-12 14:53:57, Merlijn Wajer wrote:
> this series adds the sw_machine_cover key, and changes the nokia n900 dts to
> expose the key via gpio-keys.
> 
> before, this gpio was used as card detect gpio, causing the card not to show up
> if the phone was booted without cover, see this thread on linux-omap:
> 
>     n900: remove mmc1 "safety feature"? (was: re: mmc0 on nokia n900 on linux 5.4.18)
> 
> since there is no realistic use for using this gpio as card detect, instead
> expose it to userspace via gpio-keys. there are no event type for machine covers
> yet, so add that first.
> 
> the key should be 1 when the cover is closed, and 0 when the cover is open.
> 
> starting the nokia n900 with the cover removed, putting the cover in place:
> 
>     event: time 1581684523.415296, type 5 (ev_sw), code 16 (?), value 1
> 
> removing the cover again, exposing mmc1 and the battery:
> 
>     event: time 1581684529.413706, type 5 (ev_sw), code 16 (?), value 0

Looks good to me.

Acked-by: Pavel Machek <pavel@ucw.cz>

									Pavel


-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
