Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB581CC1F1
	for <lists+linux-omap@lfdr.de>; Sat,  9 May 2020 15:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgEIN5p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 May 2020 09:57:45 -0400
Received: from muru.com ([72.249.23.125]:53662 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgEIN5o (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 9 May 2020 09:57:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 86121809C;
        Sat,  9 May 2020 13:58:33 +0000 (UTC)
Date:   Sat, 9 May 2020 06:57:42 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: ofono for d4: less hcked and more working version was Re: USB
 networking news, ofono for d4: less hacked version
Message-ID: <20200509135742.GA37466@atomide.com>
References: <20200506101125.GA7490@amd>
 <20200506144338.GT37466@atomide.com>
 <20200506230525.GA22354@amd>
 <20200507140732.GU37466@atomide.com>
 <20200508100211.GA19646@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508100211.GA19646@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200508 10:03]:
> Hi!
> 
> > > But I might be confused. I recall some audio patches were needed for
> > > basic phone calls (setting up mixers to connect gsm<->audio), but
> > > those worked before gsmux support was enabled. (Maybe some hardcoded
> > > commands were needed to be sent to gsmmux somewhere).
> > 
> > We're currently reconfiguring the TDM transport that based on the
> > unsolicited messages on dlci1. I still need to figure out how to add
> > that back while keeping the serdev-ngsm driver generic.
> 
> Is it really neccessary? I believe I was simply configuring codecs for
> voice call and left them like that.

Yes something needs to call set_tdm_slot() for voice calls. AFAIK we have
only the dlci1 messages indicating a voice call is happening.

So I got that added directly into the snd-soc-motmdm driver where it now
listens to notifications on dlci1 while we still have /dev/gsmtty1 for
userspace. Looks like I still need to fix the mixer controls before I can
test voice calls again though.. Will post the patches as soon as I get
that done.

I'm not yet sure what's the preferred way to do notifications with ALSA,
but based on the earlier comments the piece of code calling set_tdm_slot()
should not be the codec driver. Instead, it should be called by either
snd-soc-audio-graph-card or a custom card driver for the device.

> I pushed new version of ofono: I'm still not sure about those incoming
> sms (but _some_ sms are received). Rest should be better.

OK

Regards,

Tony
