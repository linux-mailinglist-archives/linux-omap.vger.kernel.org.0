Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B479A245C9B
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 08:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHQGkj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 02:40:39 -0400
Received: from muru.com ([72.249.23.125]:40428 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgHQGkj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Aug 2020 02:40:39 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8C4F480A3;
        Mon, 17 Aug 2020 06:40:39 +0000 (UTC)
Date:   Mon, 17 Aug 2020 09:41:06 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Resyncing omap2plus_defconfig
Message-ID: <20200817064106.GB2994@atomide.com>
References: <CAHCN7xLvaSBoN4Qs8zG2koBmZEuNxiZkm4m0etqKu32AsvVJcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLvaSBoN4Qs8zG2koBmZEuNxiZkm4m0etqKu32AsvVJcA@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Adam Ford <aford173@gmail.com> [200811 12:18]:
> Tony,
> 
> What is the rule on re-syncing omap2plus_defconfig?  I want to add a
> config option, but the act of 'make savedefconfig' changes the order
> of a bunch of stuff.  Can I submit a patch to re-sync
> omap2plus_defconfig, or is that something you need to do?  If you want
> me to do it, please let me know which tree and branch I should use as
> the basis.

Sure, you can do patches for it. If some options get removed, describe
why those are no longer relevant to avoid regressions. Then do a another
patch for options that got moved around.

Regards,

Tony
