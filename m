Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629F428E4B6
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 18:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731204AbgJNQor (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 12:44:47 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59924 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgJNQor (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 12:44:47 -0400
Date:   Wed, 14 Oct 2020 18:44:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602693885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zAjTF2tvsD0V9R0iboON9J/WHaKQyttRthc3o5MCNUM=;
        b=NIoUc/R+XCVqOSwu2oDnlmcFuWxwi0qBJR10Ewtfv8G4TtgfP8C39TvFwo51kSOInNdMzP
        KwSQDMQLFLu4dI8IWdVbGSnhMxqtirL/r7Erh/kj3V3V+ThAPHQBb9ZxlFjLifxlxW+XTv
        U98DppwGDyHnqtqPnW/d7lxfWuuBqmVLH9pHKUXUd/31AjbdyB3uobhw2EBJGbpTUvw/oO
        P9Gsq6MixUwHewHE82UCkO16XGixQTABWWxS4Cz8BKGEopVsywJ8Z2dvhptFac8h7p/7bf
        ZFDNScC8xX4I3O9L1ipViKHMheIsbKTqajZWzO4V+W6daFjTIvFqPaVAFEwsdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602693885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zAjTF2tvsD0V9R0iboON9J/WHaKQyttRthc3o5MCNUM=;
        b=gcXKnbuqKZQ4iJNiXtOhVGCmWuPiMl04f5Bgy+IfD5qIYdOK5klQFW+0bC6IE+MdVjmTOf
        u6e56ZwwSwgVkfBw==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-omap@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch 03/12] USB: serial: keyspan_pda: Consolidate room query
Message-ID: <20201014164443.husmibyqb4ukw5xg@linutronix.de>
References: <20201014145215.518912759@linutronix.de>
 <20201014145727.338773481@linutronix.de>
 <20201014161433.GB712494@rowland.harvard.edu>
 <20201014162714.ctv5earlhwsp4iqs@linutronix.de>
 <20201014163425.GF712494@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201014163425.GF712494@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-10-14 12:34:25 [-0400], Alan Stern wrote:
> On Wed, Oct 14, 2020 at 06:27:14PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2020-10-14 12:14:33 [-0400], Alan Stern wrote:
> > > Instead, consider using the new usb_control_msg_recv() API.  But it 
> > > might be better to allocate the buffer once and for all.
> > 
> > This will still allocate and free buffer on each invocation. What about
> 
> Yes.  That's why I suggesting doing a single buffer allocation at the 
> start and using it for each I/O transfer.  (But I'm not familiar with 
> this code, and I don't know if there might be multiple transfers going 
> on concurrently.)

There are no concurrent transfer. There is a bit used as a lock. The
first one does the transfer, the other wait.

> > moving the query_buf to the begin of the struct / align it?
> 
> No, thank won't work either.  The key to the issue is that while some 
> memory is mapped for DMA, the CPU must not touch it or anything else in 
> the same cache line.  If a field is a member of a data structure, the 
> CPU might very well access a neighboring member while this one is 
> mapped, thereby messing up the cache line.

that is unfortunately true. Let me do the single buffer.

> Alan Stern

Sebastian
