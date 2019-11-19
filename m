Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF41A102BE0
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 19:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfKSSqg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 13:46:36 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:49720 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727124AbfKSSqg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Nov 2019 13:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vcCURScca5q+E26er1wwSs3sdbFMPQz0U/MLgTCv6xg=; b=c4Nik4fD2ICEryqmGjuw6MNMSA
        PnXgpWWQfdfMelcWUljwehjaF7PXp6YcpfFfm9NDviPtPRYLjYjUn1dPKC3AdJtUbBdjNR3P9qQ6D
        REfIQyWRTnQxDvOfeWRn6zt84vu419IbdDDFzw8MNrxTOBBZI0BGSlNXsx9tJzajnk+g=;
Received: from p200300ccff1223001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff12:2300:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iX8WD-0001Sp-G9; Tue, 19 Nov 2019 19:46:29 +0100
Date:   Tue, 19 Nov 2019 19:46:28 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel@collabora.com>
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Message-ID: <20191119194628.7709b1fe@aktux>
In-Reply-To: <46aba805-1d3a-2efc-23f6-d957bf6a44c3@ti.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
        <20191117024028.2233-34-sebastian.reichel@collabora.com>
        <20191118230535.GG35479@atomide.com>
        <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
        <20191119143243.GH35479@atomide.com>
        <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
        <20191119150643.GI35479@atomide.com>
        <46aba805-1d3a-2efc-23f6-d957bf6a44c3@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 19 Nov 2019 17:55:57 +0200
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> On 19/11/2019 17:06, Tony Lindgren wrote:
> 
> >> The userspace apps need to do this. If they're using single-buffering, then
> >> using the dirtyfb ioctl should do the trick, after the SGX has finished
> >> drawing.  
> > 
> > Sounds like that's not happening.
> > 
> > But why would the userspace app need to know this might be needed for
> > a DSI command mode display and that it's not needed for HDMI?  
> 
> When double-buffering, the userspace doesn't need to care, as the 
> page-flip ioctl explicitly tells that the buffer is ready.
> 
> When single buffering, either the userspace has to tell that the buffer 
> is now ready, or the kernel has to guess based on something. But afaics, 
> the latter is always a guess, and may not be a good guess.
> 
> The kernel could trigger a delayed update based on, say, page fault if 
> drawing with CPU. But how much delayed... And with this scenario, we 
> would somehow need to find a way to catch the writes from any IP to the 
> buffer, and afaik there's no such thing.
> 
> >> It's probably somewhat difficult if EGL is controlling the display, as,
> >> afaik, SGX EGL is closed source, and that's probably where it should be
> >> done.
> >>
> >> But adding back the hacky omap gem sync stuff, and then somehow guessing
> >> from the sync finish that some display needs to be updated... It just does
> >> not sound right to me.  
> > 
> > Right it's ugly. Still sounds like we need something in the kernel
> > that knows "this is a DSI command mode LCD and needs to be updated".  
> 
well, if we look broader around and not only at the remaining displays
to be converted from omapdrm to generic and look at more displays, there
are also EPDs.

> I think one option is to refresh the command mode display all the time. 
> Either using a timer, or trigger updates based on the previous update 
> being finished.
> 
> Of course, that's kind of against the whole point of manual update 
> display, but then it should effectively behave like a conventional 
> always-updating display (except your HW is more expensive and consumes 
> more power than a conventional display).
> 
And again as an extreme example about power consumption: EPDs.
So I guess we need a generic interface for userspace-triggered
refreshes anyways. And in that case that are only partly refreshes.

Regards,
Andreas
