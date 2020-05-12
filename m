Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BF01CF621
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 15:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgELNqv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 09:46:51 -0400
Received: from muru.com ([72.249.23.125]:53968 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbgELNqv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 09:46:51 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A3F128047;
        Tue, 12 May 2020 13:47:40 +0000 (UTC)
Date:   Tue, 12 May 2020 06:46:48 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org
Subject: Re: BBB with v5.7-rc5
Message-ID: <20200512134648.GD37466@atomide.com>
References: <87k11h4df0.fsf@kernel.org>
 <87eerp46h5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eerp46h5.fsf@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Felipe Balbi <balbi@kernel.org> [200512 13:41]:
> Hi,
> 
> Felipe Balbi <balbi@kernel.org> writes:
> > what's the trick to get BBB to boot recent kernels nowadays? :-p
> >
> > I'm using omap2plus_defconfig without CPSW (doesn't link otherwise) with
> > GCC 10.1.0 (I'll try an older version shortly). Cmdline is the usual
> 
> same result with 9.2. Nothing from low level debug either.

Maybe check you have a current dtb file? The older dtb files may not
have all the needed data.

Also you probably want to add "earlycon" to your your kernel cmdline
and then you have early output from CONFIG_SERIAL_EARLYCON=y as long
as there's a chosen entry for the device uart. So no need to enable
DEBUG_LL in most cases.

There's "[PATCH net v4] net: ethernet: ti: Remove TI_CPTS_MOD workaround"
being discussed too for the cpsw regression.

Regards,

Tony



