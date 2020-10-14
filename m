Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9657128E460
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 18:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388261AbgJNQ1V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 12:27:21 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59738 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbgJNQ1S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 12:27:18 -0400
Date:   Wed, 14 Oct 2020 18:27:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602692836;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iCzjYxqIDkmw4xzx1KXku7b0cbN/u38jxZbnzmQ3jN8=;
        b=L+xCqI9GxpRCoP8PngWCWAQ9wkdzpZ5WodbiV80p51AGMLkCWCgkkJouSD5NDTKKaAroqH
        bEi6bv6abvSonjh+1Y12R0IyATkDhSK/gIBIqmUccHFDatfo1IDsEiCXwj/KvxA6xcB969
        +QvmLvKCGJH+ljJRLWshZ7jhABUTtdtr7oF3r534O+65KNP+5PElTQ4ZLtbTPMG9aD58PS
        cDKitk7SPcV0bjRsHW8LaycZTd7vJ45QOKO9ZwUrJBaHGZ0duR9einY6Sx9lu0AsA6t7MA
        d8RfzgrkXilE9GPgUHUD0YyBNnf1JF+Rhl06BFTBmLBY5d1iHAlG7C7OIEDXqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602692836;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iCzjYxqIDkmw4xzx1KXku7b0cbN/u38jxZbnzmQ3jN8=;
        b=Tcm1BnHk6fiDiswRFgM+Nea81sLWNx1RNxoZwpZ/WAKUDTLpiU48x1RzsOa3CKc7I7gjpu
        NnAHKINmRZmU+DAw==
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
Message-ID: <20201014162714.ctv5earlhwsp4iqs@linutronix.de>
References: <20201014145215.518912759@linutronix.de>
 <20201014145727.338773481@linutronix.de>
 <20201014161433.GB712494@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201014161433.GB712494@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-10-14 12:14:33 [-0400], Alan Stern wrote:
> Instead, consider using the new usb_control_msg_recv() API.  But it 
> might be better to allocate the buffer once and for all.

This will still allocate and free buffer on each invocation. What about
moving the query_buf to the begin of the struct / align it?

> Alan Stern

Sebastian
