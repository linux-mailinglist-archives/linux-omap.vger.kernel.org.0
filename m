Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54F71BEA11
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 23:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgD2ViV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 17:38:21 -0400
Received: from muru.com ([72.249.23.125]:51722 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2ViV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Apr 2020 17:38:21 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8507F810A;
        Wed, 29 Apr 2020 21:39:08 +0000 (UTC)
Date:   Wed, 29 Apr 2020 14:38:17 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20200429213817.GU37466@atomide.com>
References: <20200421180220.GB37466@atomide.com>
 <70F19A6E-7B36-4873-9364-F284A14EE3A0@goldelico.com>
 <20200421182017.GC37466@atomide.com>
 <D3E40A6A-39B8-4F3F-9ABC-28EAE8D623A6@goldelico.com>
 <20200422120418.49a40c75@aktux>
 <6E3A50D9-0F15-4A56-8C5E-7CDC63E8AF9F@goldelico.com>
 <A2AC3E81-49B2-4CF2-A7CF-6075AEB1B72D@goldelico.com>
 <44AD9673-AE02-498F-A5CC-48499DF226E3@goldelico.com>
 <E8575FE4-4BC2-41B7-B574-339C58D9CB5E@goldelico.com>
 <891CBD28-3F91-493D-AD80-6575608846A4@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <891CBD28-3F91-493D-AD80-6575608846A4@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200429 21:35]:
> I have reworked the way the spinlocks, setting and resetting
> of the hdq_irqstatus bits are done and now it works right from
> start of boot. Without any timeouts or delays.
> 
> I am not exactly sure what went wrong, but it seems as if
> the read is already done when the write interrupt status
> bit is processed. Then, the old logic did wipe out both
> bits by hdq_reset_irqstatus() and the read code did timeout
> because it did not notice that the data had already been
> available. This may depend on other system activities so
> that it can explain why other tests didn't reveal it.
> 
> omap_hdq_runtime_resume() and omap_hdq_runtime_suspend()
> also behave fine.
> 
> Before I can post something I need to clean up my hacks
> and add similar fixes to omap_hdq_break() and omap_w1_triplet()
> where I hope that I don't break those...

OK good to hear you were able to figure out what is
going on here.

Regards,

Tony
