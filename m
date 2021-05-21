Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E336238C332
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 11:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235618AbhEUJei (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 05:34:38 -0400
Received: from muru.com ([72.249.23.125]:58422 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233987AbhEUJei (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 May 2021 05:34:38 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 52B6E80C0;
        Fri, 21 May 2021 09:33:20 +0000 (UTC)
Date:   Fri, 21 May 2021 12:33:12 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "Sicelo A. Mhlongo" <absicsz@gmail.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: omap2plus_defconfig: Add LP5523 LED driver
Message-ID: <YKd+WIw/LOzDqCbv@atomide.com>
References: <YHtE4KSuack3R31o@tp440p.steeds.sam>
 <YKd+HvMGsZbLB9Zf@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKd+HvMGsZbLB9Zf@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210521 09:32]:
> * Sicelo A. Mhlongo <absicsz@gmail.com> [210417 23:29]:
> > The Nokia N900 has an LP5523 driving the RGB LED and the 6 keyboard LEDS.
> > Enable support for it in omap2plus_defconfig.
> 
> Thanks applying both into omap-for-v5.14/dt.

Sorry I mean omap-for-v5.14/defconfig, not dt.

Tony
