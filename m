Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5633D185073
	for <lists+linux-omap@lfdr.de>; Fri, 13 Mar 2020 21:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCMUmH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Mar 2020 16:42:07 -0400
Received: from muru.com ([72.249.23.125]:60118 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbgCMUmH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Mar 2020 16:42:07 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 71EB88087;
        Fri, 13 Mar 2020 20:42:53 +0000 (UTC)
Date:   Fri, 13 Mar 2020 13:42:04 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ti-sysc fix for v5.6
Message-ID: <20200313204204.GF37466@atomide.com>
References: <pull-1584132028-918607@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1584132028-918607@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200313 20:41]:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit b2745d92bb015cc4454d4195c4ce6e2852db397e:
> 
>   bus: ti-sysc: Add support for PRUSS SYSC type (2020-03-04 07:54:57 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.7/ti-sysc-fix-signed
> 
> for you to fetch changes up to aef067e8e95d856bc09557a91e740b2d6a81a6ae:
> 
>   Merge branch 'fix-lcdc-quirk' into omap-for-v5.7/ti-sysc (2020-03-10 09:06:02 -0700)
> 
> ----------------------------------------------------------------
> Fix for ti-sysc suspend/resume issue on am335x for v5.7 merge window
> 
> Just merge in a ti-sysc fix for am335x lcdc suspend/resume issue, and
> resolve merge conflict.

Oops sorry this one is for v5.7 merge window, not for v5.6 like the
subject says.

Regards,

Tony

> ----------------------------------------------------------------
> Tony Lindgren (2):
>       bus: ti-sysc: Fix quirk flags for lcdc on am335x
>       Merge branch 'fix-lcdc-quirk' into omap-for-v5.7/ti-sysc
> 
>  drivers/bus/ti-sysc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
