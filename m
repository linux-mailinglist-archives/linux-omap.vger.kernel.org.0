Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54074361CC
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 14:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhJUMjv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 08:39:51 -0400
Received: from muru.com ([72.249.23.125]:46996 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231704AbhJUMjt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 21 Oct 2021 08:39:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 738A080FC;
        Thu, 21 Oct 2021 12:38:05 +0000 (UTC)
Date:   Thu, 21 Oct 2021 15:37:30 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        linux-arm-kernel@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
        linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
Message-ID: <YXFfCg4iiI0P5JgJ@atomide.com>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Amit Pundir <amit.pundir@linaro.org> [211021 11:22]:
> Hi Saravana,
> 
> This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.

Also, I noticed we now end up with simple-pm-bus.c that does no PM
for the legacy which was the whole idea of the driver in the first
place :)

Saravana, could you consider just adding a new simple-bus.c driver
in addition to simple-pm-bus.c for the cases that do not call
pm_runtime_enable()?

Thanks,

Tony
