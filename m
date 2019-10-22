Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B73A5E079C
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 17:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732523AbfJVPkP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 11:40:15 -0400
Received: from muru.com ([72.249.23.125]:38918 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730141AbfJVPkP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 11:40:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C9B7C80FA;
        Tue, 22 Oct 2019 15:40:49 +0000 (UTC)
Date:   Tue, 22 Oct 2019 08:40:12 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch 1/9] ARM: dts: dra7: add cam clkctrl node
Message-ID: <20191022154012.GM5610@atomide.com>
References: <20191018154849.3127-1-bparrot@ti.com>
 <20191018154849.3127-2-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018154849.3127-2-bparrot@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191018 15:46]:
> Add clkctrl nodes for CAM domain.

You're missing the Linux clk folks and list from Cc, can
you please resend?

I need an ack for the clk-7xx.c changes if I'm to apply
this patch.

Probably the best way would be for tero to collect
all the drivers/clk/ti clock data changes and provide
an immutable branch with those that I can merge too.

That way the related dts changes can be applied on
top of it with things working.

Regards,

Tony
