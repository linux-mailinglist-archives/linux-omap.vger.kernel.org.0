Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F006742377E
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 07:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhJFFbC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 01:31:02 -0400
Received: from muru.com ([72.249.23.125]:41228 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhJFFbC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 01:31:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7B37080E1;
        Wed,  6 Oct 2021 05:29:40 +0000 (UTC)
Date:   Wed, 6 Oct 2021 08:29:08 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/2] Fix simple-bus issues with fw_devlink
Message-ID: <YV00JD31EPD6WqlB@atomide.com>
References: <20210929000735.585237-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929000735.585237-1-saravanak@google.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Saravana Kannan <saravanak@google.com> [210929 03:08]:
> Ulf reported an issue[1] with fw_devlink. This series tries to fix that
> issue.
> 
> I replicated a similar set up on my end and I confirmed:
> - A simple-bus only device is probed.
> - Another device listing simple-bus as a 2nd compatible string isn't
>   probed.
> 
> v1->v2:
> - Switched to probing the simple-bus device instead of marking it as
>   NEVER_PROBES.
> 
> v2->v3:
> - Moved all the code into the simple-pm-bus driver
> - Addressed Ulf's comment about the remove() code missing a check.
> 
> v3->v4:
> - Added support for driver_override to accommodate the case where new
>   transparent bus compatible strings are added to DT, but the kernel hasn't
>   been updated yet.
> - Added/updated comments to give more details.
> - Adding Ulf's Tested-by that he have for v3 (v4 didn't change by much).

Works for me:

Tested-by: Tony Lindgren <tony@atomide.com>
