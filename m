Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93CB919FA0
	for <lists+linux-omap@lfdr.de>; Fri, 10 May 2019 16:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfEJOyo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 May 2019 10:54:44 -0400
Received: from muru.com ([72.249.23.125]:48346 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727258AbfEJOyo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 May 2019 10:54:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 73EDA808C;
        Fri, 10 May 2019 14:55:02 +0000 (UTC)
Date:   Fri, 10 May 2019 07:54:41 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: Kernel Oops when something is executed from within the initramfs
Message-ID: <20190510145441.GU8007@atomide.com>
References: <50042d920efa281582ed8b5486ea89456ad4de65.camel@ts.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50042d920efa281582ed8b5486ea89456ad4de65.camel@ts.fujitsu.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* thilo.cestonaro@ts.fujitsu.com <thilo.cestonaro@ts.fujitsu.com> [190510 09:04]:
> Hi all!
> 
> I try to update our kernel of our AM335x based board to a newer version (4.4.179).
> The new kernel builds and boots, but as soon as something from within the initramfs is executed,
> a kernel Oops occurs, e.g. modprobe (davinci_mdio requests a module) and /init can't be executed.
> 
> The problem is, that I've no clue what's going wrong.

It could be kernel uncompress or dtb and initramfs overlap issue.
You could try booting by manually setting u-boot prompt:

setenv fdtaddr 80a00000
setenv loadaddr 80c00000
setenv rdaddr 81600000
setenv fdt_high 8c000000
setenv initrd_high ffffffff

And see if that helps. It might be worth checking the current
values used by u-boot, the above values may not be optimal.

Regards,

Tony
