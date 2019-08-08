Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F9685AF9
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 08:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfHHGmi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 02:42:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:42420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726359AbfHHGmi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 8 Aug 2019 02:42:38 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF2DD20880;
        Thu,  8 Aug 2019 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565246557;
        bh=QkRNK9YOfVlVjw60w9/iF0cccnbeZTBNkhlnMmoHZSo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TEEQWuy6TSpOEZMwvSr5bheEo6c0goUwfwhY6u81BONopHxyVvbgi4ZhzicU1UCZU
         QXbtoqaRmyPdA18atxTjX/YtfT5T8mPLvFzvbzRdeu4qtSO+eZw4b0Gf4W97UvfZSm
         L8jVUt4qJ/cpM3lWvFw3sZyg80FMbtaTWDY/b8Qo=
Date:   Thu, 8 Aug 2019 08:42:35 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tejun Heo <tj@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Andrea Arcangeli <aarcange@redhat.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] kernfs: fix memleak in kernel_ops_readdir()
Message-ID: <20190808064235.GC26197@kroah.com>
References: <20190805173404.GF136335@devbig004.ftw2.facebook.com>
 <20190807132928.GD5443@atomide.com>
 <20190807184518.GP136335@devbig004.ftw2.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807184518.GP136335@devbig004.ftw2.facebook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 07, 2019 at 11:45:18AM -0700, Tejun Heo wrote:
> Hello,
> 
> On Wed, Aug 07, 2019 at 06:29:28AM -0700, Tony Lindgren wrote:
> > Hi,
> > 
> > * Tejun Heo <tj@kernel.org> [691231 23:00]:
> > > From: Andrea Arcangeli <aarcange@redhat.com>
> > > 
> > > If getdents64 is killed or hits on segfault, it'll leave cgroups
> > > directories in sysfs pinned leaking memory because the kernfs node
> > > won't be freed on rmdir and the parent neither.
> > 
> > Somehow this causes a regression in Linux next for me where I'm seeing
> > lots of sysfs entries now missing under /sys/bus/platform/devices.
> > 
> > For example, I now only see one .serial entry show up in sysfs.
> > Things work again if I revert commit cc798c83898e ("kernfs: fix memleak
> > inkernel_ops_readdir()"). Any ideas why that would be?
> > 
> > Below is a diff -u of ls /sys/bus/platform/devices for reference
> > showing the missing entries with cc798c83898e.
> 
> Ugh, you're right.  It can get double-put cuz ctx->pos is put by
> release too.  Greg, sorry about the noise but can you please revert
> the patch?  I'll look into why this looked like memory leak from
> slabinfo side.

Now reverted, thanks.

greg k-h
