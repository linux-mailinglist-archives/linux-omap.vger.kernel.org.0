Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297687E11D1
	for <lists+linux-omap@lfdr.de>; Sun,  5 Nov 2023 00:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjKDXxb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Nov 2023 19:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjKDXxb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 4 Nov 2023 19:53:31 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1830D69
        for <linux-omap@vger.kernel.org>; Sat,  4 Nov 2023 16:53:27 -0700 (PDT)
Received: from p200300ccff1c1900cbc3f566d864085c.dip0.t-ipconnect.de ([2003:cc:ff1c:1900:cbc3:f566:d864:85c] helo=akair)
        by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1qzQSC-005qeB-US; Sun, 05 Nov 2023 00:53:25 +0100
Date:   Sun, 5 Nov 2023 00:53:23 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: ti-sysc: probe of 4a318000.target-module failed with error -16
Message-ID: <20231105005323.0238c461@akair>
In-Reply-To: <20231031070708.GA44202@atomide.com>
References: <20231029101249.2cc84607@akair>
        <20231031070708.GA44202@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am Tue, 31 Oct 2023 09:07:08 +0200
schrieb Tony Lindgren <tony@atomide.com>:

> * Andreas Kemnade <andreas@kemnade.info> [231029 09:13]:
> > I am seeing the error message from $subject on omap4 devices
> > regularly, on omap4430-panda and on the epson bt200 (omap4460).
> > While not having the timer seems not critical in itself. I am
> > wondering whether something nasty is behind it which might cause
> > more severe problems.
> > Is this really seen everywhere?  
> 
> That should be for gptimer1 that is used as a clocksource by the
> drivers/clocksource/timer-ti-dm-systimer.c driver, and ti-sysc will
> ignore it.
> 
hmm, it is about this I think:

       timer1_target: target-module@8000 {     /* 0x4a318000, ap 9 1c.0
       */ compatible = "ti,sysc-omap2-timer", "ti,sysc";

but I see no ti,no-reset-on-init or ti,no-idle as checked by
sysc_check_active_timer(). It is a bit strange. Well, we have some
alwon below. 
It sysc-omap2-timer here right instead of sysc-omap4-timer?

> Maybe we should not show the error for timers, or change it to
> dev_info if EBUSY and timer?
> 
Well, I am not sure yet whether I understand that 
-ENXIO vs. -EBUSY business there fully.
I want to really have a checkmark behind that issue in my head...

Regards,
Andreas
