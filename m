Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 770FBD2C94
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 16:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfJJObh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 10:31:37 -0400
Received: from muru.com ([72.249.23.125]:36934 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfJJObh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Oct 2019 10:31:37 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5B12180BB;
        Thu, 10 Oct 2019 14:32:10 +0000 (UTC)
Date:   Thu, 10 Oct 2019 07:31:33 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>, Stephen Boyd <swboyd@chromium.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        s-anna@ti.com
Subject: Re: [PATCH 0/5] ARM: dts: omap4+: Add PRM nodes for reset support
Message-ID: <20191010143133.GW5610@atomide.com>
References: <20191010082108.15448-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010082108.15448-1-t-kristo@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191010 01:21]:
> Hi Tony,
> 
> This series adds the OMAP PRM nodes for reset support for am3, am4,
> omap4, omap5 and dra7 SoCs. The driver support has been queued up by
> Santosh [1].

OK planning on applying these into omap-for-v5.5/prm on top of
Santosh's immutable branch.

But I'm wondering if we should also have an immutable branch for the
clkctrl changes that I can merge in too?

Then with the prm driver changes, clkctrl changes and these, we
have things working for applying some rstctrl using device patches
like the old am335x sgx ti-sysc patch?

Regards,

Tony

> [1] https://patchwork.kernel.org/cover/11179573/
