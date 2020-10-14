Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2A028E48E
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 18:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731107AbgJNQe0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 12:34:26 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46581 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1731064AbgJNQe0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 12:34:26 -0400
Received: (qmail 719817 invoked by uid 1000); 14 Oct 2020 12:34:25 -0400
Date:   Wed, 14 Oct 2020 12:34:25 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
Message-ID: <20201014163425.GF712494@rowland.harvard.edu>
References: <20201014145215.518912759@linutronix.de>
 <20201014145727.338773481@linutronix.de>
 <20201014161433.GB712494@rowland.harvard.edu>
 <20201014162714.ctv5earlhwsp4iqs@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014162714.ctv5earlhwsp4iqs@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 14, 2020 at 06:27:14PM +0200, Sebastian Andrzej Siewior wrote:
> On 2020-10-14 12:14:33 [-0400], Alan Stern wrote:
> > Instead, consider using the new usb_control_msg_recv() API.  But it 
> > might be better to allocate the buffer once and for all.
> 
> This will still allocate and free buffer on each invocation. What about

Yes.  That's why I suggesting doing a single buffer allocation at the 
start and using it for each I/O transfer.  (But I'm not familiar with 
this code, and I don't know if there might be multiple transfers going 
on concurrently.)

> moving the query_buf to the begin of the struct / align it?

No, thank won't work either.  The key to the issue is that while some 
memory is mapped for DMA, the CPU must not touch it or anything else in 
the same cache line.  If a field is a member of a data structure, the 
CPU might very well access a neighboring member while this one is 
mapped, thereby messing up the cache line.

Alan Stern
