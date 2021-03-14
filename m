Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E3933A6D1
	for <lists+linux-omap@lfdr.de>; Sun, 14 Mar 2021 17:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbhCNQrf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 12:47:35 -0400
Received: from muru.com ([72.249.23.125]:43130 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233726AbhCNQrO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 12:47:14 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1804580B4;
        Sun, 14 Mar 2021 16:48:00 +0000 (UTC)
Date:   Sun, 14 Mar 2021 18:47:10 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Carl Philipp Klemm <philipp@uvos.xyz>,
        Ivan Jelincic <parazyd@dyne.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: OMAP4: Fix cpu_pm handling for HS/EMU interrupt save
Message-ID: <YE4+Dj15ge0+Xh3D@atomide.com>
References: <20210225121612.18818-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225121612.18818-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210225 14:22]:
> Since commit 55be2f50336f ("ARM: OMAP2+: Handle errors for cpu_pm") we
> allow the drivers to block deeper idle states with cpu_pm notifiers.
> Turns out this change causes random hangs on a mostly idle droid4.
> 
> The hang seems to be caused by reconfiguring the MPUSS domain registers
> after we have already called irq_save_secure_context(). This happens
> on the cpu_pm notifier error path if a driver is busy and returns
> NOTIFY_BAD in CPU_CLUSTER_PM_ENTER handling to block the deeper idle
> states. Note that this issue does not exist for the GP SoCs, for them
> we just save and restore the context in the cpu_pm notifier.
> 
> Let's fix the issue by calling omap4_irq_save_secure_context() later on
> after the cpu_pm notifiers are done. And since we have omap-secure.c,
> let's move omap4_irq_save_secure_context() there.

FYI, this is not the right fix and won't really help it turns out. Based
on testing for about a week on two devices, looks like the right fix is:

[PATCH] ARM: OMAP4: PM: update ROM return address for OSWR and OFF

Regards,

Tony
