Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB8941A8FD
	for <lists+linux-omap@lfdr.de>; Tue, 28 Sep 2021 08:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238902AbhI1GdH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Sep 2021 02:33:07 -0400
Received: from muru.com ([72.249.23.125]:38178 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234207AbhI1GdH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 Sep 2021 02:33:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 96F7C809F;
        Tue, 28 Sep 2021 06:31:56 +0000 (UTC)
Date:   Tue, 28 Sep 2021 09:31:26 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     soc@kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: move omap15xx local bus handling to usb.c
Message-ID: <YVK2vnOQHCH2zwHh@atomide.com>
References: <20210927144118.2464881-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927144118.2464881-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@kernel.org> [210927 14:41]:
> From: Arnd Bergmann <arnd@arndb.de>
> If there are no objections, I'd apply this to the soc tree for
> 5.16, or let Tony pick it up into his tree. This was originally
> part of a longer series to bring omap1 closer to an allmodconfig
> build. If I manage to find some time, I'll also try to resurrect
> the rest of that series.

Looks good to me, it should not conflict with anything else so please
feel free to apply:

Acked-by: Tony Lindgren <tony@atomide.com>
