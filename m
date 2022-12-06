Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70EFB643CF6
	for <lists+linux-omap@lfdr.de>; Tue,  6 Dec 2022 07:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbiLFGCT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Dec 2022 01:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbiLFGCQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Dec 2022 01:02:16 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE9C52714D;
        Mon,  5 Dec 2022 22:02:14 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C0685809F;
        Tue,  6 Dec 2022 06:02:13 +0000 (UTC)
Date:   Tue, 6 Dec 2022 08:02:12 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: Re: [PATCH] serial: 8250: omap: Fix missing PM runtime calls for
 omap8250_set_mctrl()
Message-ID: <Y47a5ElSui3Xovnf@atomide.com>
References: <20221024063613.25943-1-tony@atomide.com>
 <a9466cd9-2a75-6b53-3d57-6a6cdabd1b05@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9466cd9-2a75-6b53-3d57-6a6cdabd1b05@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Romain Naour <romain.naour@smile.fr> [221203 15:17]:
> Le 24/10/2022 à 08:36, Tony Lindgren a écrit :
> > Let's fix the issue by adding missing PM runtime calls to
> > omap8250_set_mctrl(). To do this, we need to add __omap8250_set_mctrl()
> > that can be called from both omap8250_set_mctrl(), and from runtime PM
> > resume path when restoring the registers.
> 
> Sorry, I'm late but I confirm that this patch fixes my issue [1].
> 
> I checked without this patch applied with the 5.10.153-rt76+ kernel and I can
> reproduce the issue.

OK good to hear, I was wondering about that.

Regards,

Tony
