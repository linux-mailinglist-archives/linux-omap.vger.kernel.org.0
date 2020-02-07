Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDD1155C34
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2020 17:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgBGQxs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Feb 2020 11:53:48 -0500
Received: from muru.com ([72.249.23.125]:53256 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727005AbgBGQxs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 7 Feb 2020 11:53:48 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8E9188047;
        Fri,  7 Feb 2020 16:54:31 +0000 (UTC)
Date:   Fri, 7 Feb 2020 08:53:44 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-omap <linux-omap@vger.kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        "Arthur D." <spinal.by@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: Nokia N900 on 5.4 and 5.5
Message-ID: <20200207165344.GB64767@atomide.com>
References: <79b91017-b52a-8aff-4b9c-913ae655f7bf@wizzup.org>
 <185CD173-C13C-4D56-B3DE-9A8D7784963C@goldelico.com>
 <20200207163623.GA64767@atomide.com>
 <da14d6bb-f241-2dd4-8e94-886217a40ed7@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da14d6bb-f241-2dd4-8e94-886217a40ed7@wizzup.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Merlijn Wajer <merlijn@wizzup.org> [200207 16:47]:
> On 07/02/2020 17:36, Tony Lindgren wrote:
> > 
> > Looks like there's a regression in general for appended dtb booting that
> > was caused by commit 9f671e58159a ("security: Create "kernel hardening"
> > config area"). With that change we now get STACKPROTECTOR_PER_TASK
> > selected by default with Kconfig.
> > 
> > Merlijn, care to try to disable STACKPROTECTOR_PER_TASK in your
> > .config to see if that helps?
> 
> Yes, this makes the kernel boot.

OK good to hear. My guess is that having STACKPROTECTOR_PER_TASK
selected causes changes to include/generated/asm-offsets.h that
appended dtb booting does not like. But let's see what others
think.

Regards,

Tony


