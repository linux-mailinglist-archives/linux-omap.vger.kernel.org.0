Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5B55F8180
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2019 21:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKKUqB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 15:46:01 -0500
Received: from muru.com ([72.249.23.125]:41686 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726877AbfKKUqA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Nov 2019 15:46:00 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F21F68047;
        Mon, 11 Nov 2019 20:46:36 +0000 (UTC)
Date:   Mon, 11 Nov 2019 12:45:57 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] OMAP2: remove unused wakeup_cpu
Message-ID: <20191111204557.GY5610@atomide.com>
References: <20191106120605.11571-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191106120605.11571-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Ben Dooks (Codethink) <ben.dooks@codethink.co.uk> [191106 04:06]:
> The wakeup_cpu variable in omap4_enter_lowpower() is set
> but then is not used after this. Remove it to fix
> the compiler warning:
> 
> arch/arm/mach-omap2/omap-mpuss-lowpower.c: In function âomap4_enter_lowpowerâ:
> arch/arm/mach-omap2/omap-mpuss-lowpower.c:230:15: warning: variable âwakeup_cpuâ set but not used [-Wunused-but-set-variable]

I have already queued up an earlier similar patch:

5395b5557acb ("ARM: OMAP2+: Remove unused wakeup_cpu")

Thanks,

Tony
